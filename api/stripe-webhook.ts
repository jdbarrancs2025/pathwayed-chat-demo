import Stripe from "stripe"
import { createClient, type SupabaseClient } from "@supabase/supabase-js"
import type { VercelRequest, VercelResponse } from "@vercel/node"

// Stripe needs the raw, unparsed request body to verify the signature.
export const config = { api: { bodyParser: false } }

function readRawBody(req: VercelRequest): Promise<Buffer> {
  return new Promise((resolve, reject) => {
    const chunks: Buffer[] = []
    req.on("data", (chunk: Buffer | string) =>
      chunks.push(typeof chunk === "string" ? Buffer.from(chunk) : chunk),
    )
    req.on("end", () => resolve(Buffer.concat(chunks)))
    req.on("error", reject)
  })
}

interface ProfileFields {
  subscription_status?: string
  plan?: string
  billing_period?: string
  stripe_customer_id?: string
  extra_kids?: number
  trial_end?: string
  current_period_end?: string
}

/** Convert a Stripe unix timestamp (seconds) to an ISO string, or undefined. */
function unixToIso(seconds: number | null | undefined): string | undefined {
  return typeof seconds === "number" ? new Date(seconds * 1000).toISOString() : undefined
}

function readTrialEnd(sub: Stripe.Subscription): number | null {
  const s = sub as unknown as { trial_end?: number | null }
  return typeof s.trial_end === "number" ? s.trial_end : null
}

/**
 * Read the current period end. Older Stripe API versions expose it on the
 * subscription; newer ones moved it onto the subscription item — handle both.
 */
function readCurrentPeriodEnd(sub: Stripe.Subscription): number | null {
  const s = sub as unknown as {
    current_period_end?: number | null
    items?: { data?: Array<{ current_period_end?: number | null }> }
  }
  if (typeof s.current_period_end === "number") return s.current_period_end
  const item = s.items?.data?.[0]
  return typeof item?.current_period_end === "number" ? item.current_period_end : null
}

async function updateProfile(
  supabase: SupabaseClient,
  match: { userId?: string; customerId?: string },
  fields: ProfileFields,
): Promise<void> {
  const update: Record<string, unknown> = {}
  for (const [key, value] of Object.entries(fields)) {
    if (value !== undefined && value !== null && value !== "") update[key] = value
  }
  if (Object.keys(update).length === 0) return

  const target = match.userId
    ? { column: "id", value: match.userId }
    : match.customerId
      ? { column: "stripe_customer_id", value: match.customerId }
      : null
  if (!target) {
    console.warn("[stripe-webhook] no user_id or customer id to match a profile; skipping update")
    return
  }

  const { error } = await supabase.from("profiles").update(update).eq(target.column, target.value)
  if (error) {
    throw new Error(`profile update failed (${target.column}=${target.value}): ${error.message}`)
  }
}

/**
 * Best-effort idempotency. Returns true if this event id was already handled.
 * Backed by the stripe_events table (see docs/webhook-schema.sql). If that table
 * is missing the check safely returns false, so the webhook keeps working — the
 * profile writes are idempotent anyway.
 */
async function alreadyProcessed(supabase: SupabaseClient, eventId: string): Promise<boolean> {
  const { data, error } = await supabase
    .from("stripe_events")
    .select("id")
    .eq("id", eventId)
    .maybeSingle()
  if (error) {
    console.warn("[stripe-webhook] idempotency check unavailable:", error.message)
    return false
  }
  return data != null
}

async function markProcessed(supabase: SupabaseClient, eventId: string, type: string): Promise<void> {
  const { error } = await supabase.from("stripe_events").insert({ id: eventId, type })
  if (error) console.warn("[stripe-webhook] could not record processed event id:", error.message)
}

async function handleCheckoutCompleted(
  stripe: Stripe,
  supabase: SupabaseClient,
  session: Stripe.Checkout.Session,
): Promise<void> {
  const customerId = typeof session.customer === "string" ? session.customer : session.customer?.id
  const md = session.metadata ?? {}

  let status: string | undefined
  let trialEnd: string | undefined
  let periodEnd: string | undefined
  if (typeof session.subscription === "string") {
    const sub = await stripe.subscriptions.retrieve(session.subscription)
    status = sub.status
    trialEnd = unixToIso(readTrialEnd(sub))
    periodEnd = unixToIso(readCurrentPeriodEnd(sub))
  }

  console.log("[stripe-webhook] checkout.session.completed", {
    user_id: md.user_id,
    customerId,
    plan: md.plan,
    billing_period: md.billing_period,
    status: status ?? "active",
  })

  await updateProfile(
    supabase,
    { userId: md.user_id, customerId },
    {
      subscription_status: status ?? "active",
      plan: md.plan,
      billing_period: md.billing_period,
      stripe_customer_id: customerId,
      extra_kids: md.extra_kids !== undefined ? Number(md.extra_kids) : undefined,
      trial_end: trialEnd,
      current_period_end: periodEnd,
    },
  )
}

async function handleSubscriptionEvent(
  supabase: SupabaseClient,
  sub: Stripe.Subscription,
  eventType: string,
): Promise<void> {
  const customerId = typeof sub.customer === "string" ? sub.customer : sub.customer.id
  const md = sub.metadata ?? {}
  const status = eventType === "customer.subscription.deleted" ? "canceled" : sub.status

  console.log(`[stripe-webhook] ${eventType}`, {
    user_id: md.user_id,
    customerId,
    plan: md.plan,
    billing_period: md.billing_period,
    status,
  })

  await updateProfile(
    supabase,
    { userId: md.user_id, customerId },
    {
      subscription_status: status,
      plan: md.plan,
      billing_period: md.billing_period,
      stripe_customer_id: customerId,
      extra_kids: md.extra_kids !== undefined ? Number(md.extra_kids) : undefined,
      trial_end: unixToIso(readTrialEnd(sub)),
      current_period_end: unixToIso(readCurrentPeriodEnd(sub)),
    },
  )
}

export default async function handler(req: VercelRequest, res: VercelResponse) {
  if (req.method !== "POST") {
    return res.status(405).json({ error: "Method not allowed" })
  }

  const secretKey = process.env.STRIPE_SECRET_KEY
  const webhookSecret = process.env.STRIPE_WEBHOOK_SECRET
  const supabaseUrl = process.env.SUPABASE_URL ?? process.env.VITE_SUPABASE_URL
  const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY
  if (!secretKey || !webhookSecret || !supabaseUrl || !serviceKey) {
    console.error("[stripe-webhook] missing configuration (Stripe and/or Supabase env vars)")
    return res.status(500).json({ error: "Billing is not configured" })
  }

  const stripe = new Stripe(secretKey)
  const signature = req.headers["stripe-signature"]
  if (!signature) {
    console.error("[stripe-webhook] missing stripe-signature header")
    return res.status(400).json({ error: "Missing stripe-signature header" })
  }

  // Verify the signature against the raw body.
  let event: Stripe.Event
  try {
    const raw = await readRawBody(req)
    event = stripe.webhooks.constructEvent(raw, signature as string, webhookSecret)
  } catch (error) {
    const message = error instanceof Error ? error.message : "unknown error"
    console.error("[stripe-webhook] signature verification failed:", message)
    return res.status(400).json({ error: "Signature verification failed", message })
  }

  // Service client (sb_secret_ key, used like a service-role key) bypasses RLS.
  const supabase = createClient(supabaseUrl, serviceKey)

  // Idempotency — ignore an event id we have already handled.
  if (await alreadyProcessed(supabase, event.id)) {
    console.log("[stripe-webhook] duplicate event ignored:", event.id, event.type)
    return res.status(200).json({ received: true, duplicate: true })
  }

  try {
    switch (event.type) {
      case "checkout.session.completed":
        await handleCheckoutCompleted(stripe, supabase, event.data.object as Stripe.Checkout.Session)
        break
      case "customer.subscription.created":
      case "customer.subscription.updated":
      case "customer.subscription.deleted":
        await handleSubscriptionEvent(supabase, event.data.object as Stripe.Subscription, event.type)
        break
      default:
        console.log("[stripe-webhook] ignoring unhandled event type:", event.type)
    }

    await markProcessed(supabase, event.id, event.type)
    return res.status(200).json({ received: true })
  } catch (error) {
    const message = error instanceof Error ? error.message : "unknown error"
    console.error(`[stripe-webhook] handler failed for ${event.type} (${event.id}):`, message)
    return res.status(500).json({ error: "Webhook handler failed", type: event.type, message })
  }
}
