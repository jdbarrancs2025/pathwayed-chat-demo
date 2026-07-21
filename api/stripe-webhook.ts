import Stripe from "stripe"
import { createClient, type SupabaseClient } from "@supabase/supabase-js"
import type { VercelRequest, VercelResponse } from "@vercel/node"
import {
  isAddonPriceId,
  isPlanId,
  paidSeats as computePaidSeats,
  planForPriceId,
  type BillingPeriod,
  type PlanId,
} from "./billing-core.js"
import {
  isPrepPriceId,
  moduleForPrepPriceId,
  parsePrepStudentIds,
  prepStudentsMetaKey,
} from "./prep-core.js"

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
  paid_seats?: number
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

  // A prep-only checkout carries no learning plan (md.plan is absent). Do not let
  // it flip the account's learning subscription_status/plan — the
  // customer.subscription.created event stores the customer id and reconciles the
  // prep entitlements. Persist the customer id here too so the portal keeps
  // working even if that event is delayed or reordered.
  if (!isPlanId(md.plan)) {
    if (customerId) {
      await updateProfile(supabase, { userId: md.user_id, customerId }, { stripe_customer_id: customerId })
    }
    return
  }

  let status: string | undefined
  let trialEnd: string | undefined
  let periodEnd: string | undefined
  if (typeof session.subscription === "string") {
    const sub = await stripe.subscriptions.retrieve(session.subscription)
    // Pay-now checkout means Stripe returns 'active' here. We keep reading the
    // real status (and trial_end) so the one pre-existing 'trialing' live
    // subscription is still handled correctly if it ever re-fires.
    status = sub.status
    trialEnd = unixToIso(readTrialEnd(sub))
    periodEnd = unixToIso(readCurrentPeriodEnd(sub))
  }

  // Seat cap once paid = included plan seats + the Additional Child quantity we
  // put in checkout metadata. Only trustworthy when the plan is one we recognize.
  const extraKids = md.extra_kids !== undefined ? Number(md.extra_kids) : undefined
  const paidSeats =
    isPlanId(md.plan) && extraKids !== undefined ? computePaidSeats(md.plan, extraKids) : undefined

  console.log("[stripe-webhook] checkout.session.completed", {
    user_id: md.user_id,
    customerId,
    plan: md.plan,
    billing_period: md.billing_period,
    status: status ?? "active",
    paid_seats: paidSeats,
  })

  await updateProfile(
    supabase,
    { userId: md.user_id, customerId },
    {
      subscription_status: status ?? "active",
      plan: md.plan,
      billing_period: md.billing_period,
      stripe_customer_id: customerId,
      extra_kids: extraKids,
      paid_seats: paidSeats,
      trial_end: trialEnd,
      current_period_end: periodEnd,
    },
  )
}

interface DerivedPlan {
  plan?: PlanId
  billingPeriod?: BillingPeriod
  extraKids?: number
}

/**
 * Derive the real plan, billing period, and extra-kid count from a
 * subscription's actual line items — the source of truth. The base plan item's
 * price id reverse-maps to plan + period; the add-on item's quantity is the
 * extra-kid count. This is what keeps the stored plan correct after a customer
 * switches plans in the Stripe portal (metadata alone goes stale).
 *
 * Returns only the fields it could positively determine. If no base plan price
 * matches our env (e.g. unrecognized/unconfigured price), plan/period are left
 * undefined so the caller leaves the stored values untouched rather than writing
 * garbage. extraKids is set to 0 only when a base plan was identified and no
 * add-on line is present (a genuine "no extra kids"), never on a failed match.
 */
function derivePlanFromLineItems(sub: Stripe.Subscription, env: NodeJS.ProcessEnv): DerivedPlan {
  let plan: PlanId | undefined
  let billingPeriod: BillingPeriod | undefined
  let addonQuantity: number | undefined
  const unmatched: string[] = []

  for (const item of sub.items?.data ?? []) {
    const priceId = item.price?.id
    if (!priceId) continue
    const match = planForPriceId(priceId, env)
    if (match) {
      plan = match.plan
      billingPeriod = match.period
    } else if (isAddonPriceId(priceId, env)) {
      addonQuantity = item.quantity ?? 0
    } else if (isPrepPriceId(priceId, env)) {
      // A configured prep add-on price — handled by reconcilePrepEntitlements, not
      // a base plan or seat line, so it is neither a match nor "unmatched garbage".
    } else {
      unmatched.push(priceId)
    }
  }

  if (unmatched.length > 0) {
    console.warn(
      `[stripe-webhook] subscription ${sub.id}: unrecognized price id(s) [${unmatched.join(", ")}] ` +
        `did not match any configured STRIPE_PRICE_* env — leaving stored plan/period unchanged for these`,
    )
  }
  if (!plan) {
    console.warn(
      `[stripe-webhook] subscription ${sub.id}: no base plan price matched a configured env var; ` +
        `leaving stored plan, billing_period and extra_kids untouched`,
    )
  }

  // Only trust an extra-kid count once we've identified the base plan. With a
  // known plan and no add-on line, the count is genuinely 0.
  const extraKids = plan ? (addonQuantity ?? 0) : undefined

  return { plan, billingPeriod, extraKids }
}

async function handleSubscriptionEvent(
  supabase: SupabaseClient,
  sub: Stripe.Subscription,
  eventType: string,
  env: NodeJS.ProcessEnv,
): Promise<void> {
  const customerId = typeof sub.customer === "string" ? sub.customer : sub.customer.id
  const md = sub.metadata ?? {}
  const status = eventType === "customer.subscription.deleted" ? "canceled" : sub.status

  // Source of truth = the subscription's line items, not metadata (which goes
  // stale on a portal-driven plan switch). Fall back to nothing — if a field
  // can't be derived it stays undefined and updateProfile leaves it as-is.
  const derived = derivePlanFromLineItems(sub, env)

  const hasPrep = (sub.items?.data ?? []).some((it) => isPrepPriceId(it.price?.id ?? null, env))
  const prepOnly = derived.plan === undefined && hasPrep

  if (prepOnly) {
    // A prep-only subscription (a family bought a prep module without a learning
    // plan). Its status is NOT the learning subscription_status, so leave
    // subscription_status/plan/paid_seats alone and only persist the customer id
    // (so the portal + future prep purchases can find it). Entitlements below.
    console.log(`[stripe-webhook] ${eventType} (prep-only subscription)`, {
      user_id: md.user_id,
      customerId,
      status,
    })
    await updateProfile(supabase, { userId: md.user_id, customerId }, { stripe_customer_id: customerId })
    await reconcilePrepEntitlements(supabase, sub, eventType, env)
    return
  }

  // Seat cap = included plan seats + the add-on quantity, but only once we've
  // positively identified the base plan (extraKids is undefined on a failed match,
  // so paid_seats is left untouched rather than written as a bare included count).
  const paidSeats =
    derived.plan && derived.extraKids !== undefined
      ? computePaidSeats(derived.plan, derived.extraKids)
      : undefined

  console.log(`[stripe-webhook] ${eventType}`, {
    user_id: md.user_id,
    customerId,
    plan: derived.plan,
    billing_period: derived.billingPeriod,
    extra_kids: derived.extraKids,
    paid_seats: paidSeats,
    status,
  })

  await updateProfile(
    supabase,
    { userId: md.user_id, customerId },
    {
      subscription_status: status,
      plan: derived.plan,
      billing_period: derived.billingPeriod,
      stripe_customer_id: customerId,
      extra_kids: derived.extraKids,
      paid_seats: paidSeats,
      trial_end: unixToIso(readTrialEnd(sub)),
      current_period_end: unixToIso(readCurrentPeriodEnd(sub)),
    },
  )

  // A learning subscription can also carry prep items (a family added prep to
  // their existing plan). Reconcile those too.
  await reconcilePrepEntitlements(supabase, sub, eventType, env)
}

/**
 * Upsert prep_entitlements from a subscription's line items. For each prep price
 * item, the covered children come from the subscription metadata
 * (prep_<module>_students), and one entitlement row is upserted per child.
 *
 * Status + ends_at semantics (access checks MUST key on status; see the note in
 * src/lib/prep/entitlements.ts):
 *   - 'active' while the subscription is active/trialing. ends_at is null when it
 *     renews, or the period end when the subscription is set to cancel at period
 *     end (a SCHEDULED end — still entitled, the card shows "ends [date]").
 *   - 'past_due' when the subscription is past_due.
 *   - 'canceled' on delete/cancel/expiry. ends_at records WHEN access ended,
 *     preferring ended_at/canceled_at (an immediate cancel ends now) over the
 *     period end. Access is gone regardless of that date.
 *
 * The subscription item quantity should equal the number of student ids; a
 * mismatch is logged but the metadata list wins, since it names the exact
 * children. Writes run as the service role (this webhook), which bypasses RLS.
 */
async function reconcilePrepEntitlements(
  supabase: SupabaseClient,
  sub: Stripe.Subscription,
  eventType: string,
  env: NodeJS.ProcessEnv,
): Promise<void> {
  const md = sub.metadata ?? {}
  const canceledEvent = eventType === "customer.subscription.deleted"
  const periodEndIso = unixToIso(readCurrentPeriodEnd(sub))

  for (const item of sub.items?.data ?? []) {
    const moduleId = moduleForPrepPriceId(item.price?.id ?? null, env)
    if (!moduleId) continue

    const studentIds = parsePrepStudentIds(md[prepStudentsMetaKey(moduleId)])
    if (studentIds.length === 0) {
      console.warn(
        `[stripe-webhook] subscription ${sub.id}: prep item for '${moduleId}' has no ` +
          `student ids in metadata (${prepStudentsMetaKey(moduleId)}); skipping entitlement upsert`,
      )
      continue
    }
    if (typeof item.quantity === "number" && item.quantity !== studentIds.length) {
      console.warn(
        `[stripe-webhook] subscription ${sub.id}: prep '${moduleId}' quantity ${item.quantity} ` +
          `!= ${studentIds.length} student ids in metadata`,
      )
    }

    let status: "active" | "past_due" | "canceled"
    if (canceledEvent || ["canceled", "unpaid", "incomplete_expired"].includes(sub.status)) {
      status = "canceled"
    } else if (sub.status === "past_due") {
      status = "past_due"
    } else {
      status = "active"
    }

    let endsAt: string | null
    if (status === "canceled") {
      // When access actually ended: an immediate cancel carries ended_at /
      // canceled_at; only fall back to the period end when neither is set.
      endsAt =
        unixToIso(sub.ended_at ?? sub.canceled_at ?? readCurrentPeriodEnd(sub)) ??
        new Date().toISOString()
    } else if (status === "active" && sub.cancel_at_period_end === true) {
      // Scheduled to end: keep access, record the end so the card shows "ends …".
      endsAt = periodEndIso ?? null
    } else {
      // Active and renewing — clear any previously scheduled end.
      endsAt = null
    }

    const rows = studentIds.map((studentId) => ({
      student_id: studentId,
      module_id: moduleId,
      status,
      stripe_subscription_item_id: item.id,
      ends_at: endsAt,
    }))

    const { error } = await supabase
      .from("prep_entitlements")
      .upsert(rows, { onConflict: "student_id,module_id" })
    if (error) {
      throw new Error(`prep_entitlements upsert failed for '${moduleId}': ${error.message}`)
    }
  }
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
        await handleSubscriptionEvent(
          supabase,
          event.data.object as Stripe.Subscription,
          event.type,
          process.env,
        )
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
