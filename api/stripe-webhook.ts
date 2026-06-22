import Stripe from "stripe"
import { createClient, type SupabaseClient } from "@supabase/supabase-js"
import type { VercelRequest, VercelResponse } from "@vercel/node"

// Stripe needs the raw request body to verify the signature.
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

  if (match.userId) {
    await supabase.from("profiles").update(update).eq("id", match.userId)
  } else if (match.customerId) {
    await supabase.from("profiles").update(update).eq("stripe_customer_id", match.customerId)
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
    return res.status(500).json({ error: "Billing is not configured" })
  }

  const stripe = new Stripe(secretKey)
  const signature = req.headers["stripe-signature"]

  let event: Stripe.Event
  try {
    const raw = await readRawBody(req)
    event = stripe.webhooks.constructEvent(raw, signature as string, webhookSecret)
  } catch (error) {
    console.error("Webhook signature verification failed:", error)
    return res.status(400).json({ error: "Invalid signature" })
  }

  // Service client (sb_secret_ key, used like a service-role key) bypasses RLS for writes.
  const supabase = createClient(supabaseUrl, serviceKey)

  try {
    if (event.type === "checkout.session.completed") {
      const session = event.data.object as Stripe.Checkout.Session
      const customerId = typeof session.customer === "string" ? session.customer : session.customer?.id
      const md = session.metadata ?? {}

      let status: string | undefined
      if (typeof session.subscription === "string") {
        const sub = await stripe.subscriptions.retrieve(session.subscription)
        status = sub.status
      }

      await updateProfile(
        supabase,
        { userId: md.user_id, customerId },
        {
          subscription_status: status ?? "active",
          plan: md.plan,
          billing_period: md.billing_period,
          stripe_customer_id: customerId,
          extra_kids: md.extra_kids !== undefined ? Number(md.extra_kids) : undefined,
        },
      )
    } else if (
      event.type === "customer.subscription.created" ||
      event.type === "customer.subscription.updated" ||
      event.type === "customer.subscription.deleted"
    ) {
      const sub = event.data.object as Stripe.Subscription
      const customerId = typeof sub.customer === "string" ? sub.customer : sub.customer.id
      const md = sub.metadata ?? {}
      const status = event.type === "customer.subscription.deleted" ? "canceled" : sub.status

      await updateProfile(
        supabase,
        { userId: md.user_id, customerId },
        {
          subscription_status: status,
          plan: md.plan,
          billing_period: md.billing_period,
          stripe_customer_id: customerId,
          extra_kids: md.extra_kids !== undefined ? Number(md.extra_kids) : undefined,
        },
      )
    }

    return res.status(200).json({ received: true })
  } catch (error) {
    console.error("Webhook handler error:", error)
    return res.status(500).json({ error: "Webhook handler failed" })
  }
}
