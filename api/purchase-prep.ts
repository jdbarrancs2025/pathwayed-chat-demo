import Stripe from "stripe"
import { createClient } from "@supabase/supabase-js"
import type { VercelRequest, VercelResponse } from "@vercel/node"
import { isPrepModuleId, prepPriceEnv, prepStudentsMetaKey } from "./prep-core.js"
import { planQualifiesForBand } from "./billing-core.js"
import { getPrepModule } from "../src/lib/prep/registry.js"

interface PurchasePrepRequest {
  userId?: string
  moduleId?: string
  studentIds?: string[]
  email?: string
}

// Subscriptions we can add a prep item to — the same set update-seats mutates.
const BILLABLE_STATUSES = new Set(["active", "trialing", "past_due"])

/**
 * Buy a test-prep module for one or more children. The subscription item quantity
 * equals the number of chosen children, and their ids ride along in subscription
 * metadata (prep_<module>_students) so the webhook knows exactly which children to
 * entitle.
 *
 * If the family already has a billable subscription we ADD the prep price as an
 * item on it (prorated), exactly like the per-child seat add-on (update-seats) —
 * never a second subscription. Only when there is no subscription to add to do we
 * open a Checkout session (which creates a prep-only subscription; the webhook is
 * careful not to let that flip the learning subscription_status).
 */
export default async function handler(req: VercelRequest, res: VercelResponse) {
  if (req.method !== "POST") {
    return res.status(405).json({ error: "Method not allowed" })
  }

  const secretKey = process.env.STRIPE_SECRET_KEY
  const supabaseUrl = process.env.SUPABASE_URL ?? process.env.VITE_SUPABASE_URL
  const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY
  if (!secretKey || !supabaseUrl || !serviceKey) {
    return res.status(500).json({ error: "Billing is not configured" })
  }

  try {
    const { userId, moduleId, studentIds, email } = req.body as PurchasePrepRequest
    if (!userId) {
      return res.status(400).json({ error: "userId is required" })
    }
    if (!isPrepModuleId(moduleId)) {
      return res.status(400).json({ error: "Unknown prep module" })
    }
    if (
      !Array.isArray(studentIds) ||
      studentIds.length === 0 ||
      !studentIds.every((s) => typeof s === "string" && s.length > 0)
    ) {
      return res.status(400).json({ error: "studentIds must be a non-empty array" })
    }
    const ids = Array.from(new Set(studentIds))

    const priceId = process.env[prepPriceEnv(moduleId)]
    if (!priceId) {
      return res.status(500).json({ error: "Prep module price is not configured" })
    }

    // Service client (sb_secret_ key) — look up the parent's billing state.
    const supabase = createClient(supabaseUrl, serviceKey)
    const { data: profile } = await supabase
      .from("profiles")
      .select("stripe_customer_id, subscription_status, plan")
      .eq("id", userId)
      .maybeSingle()

    const customerId = profile?.stripe_customer_id as string | null | undefined
    const status = profile?.subscription_status as string | null | undefined
    const plan = profile?.plan as string | null | undefined

    // Eligibility (enforced here, not just in the UI): the account needs an active
    // or trialing learning plan whose grade coverage reaches the module's band —
    // Elementary is excluded for a 6-8 module; Middle and High qualify.
    const mod = getPrepModule(moduleId)
    if (!mod || !planQualifiesForBand(status, plan, mod.gradeBand)) {
      return res
        .status(403)
        .json({ error: "Admissions Prep requires an active Middle or High School plan." })
    }

    const stripe = new Stripe(secretKey)
    const metaKey = prepStudentsMetaKey(moduleId)
    const idsCsv = ids.join(",")

    // Existing billable subscription → add (or resize) the prep item on it.
    if (customerId && status && BILLABLE_STATUSES.has(status)) {
      const subs = await stripe.subscriptions.list({ customer: customerId, status: "all", limit: 20 })
      const sub = subs.data.find((s) => BILLABLE_STATUSES.has(s.status))
      if (sub) {
        const existing = sub.items.data.find((it) => it.price?.id === priceId)
        const item: Stripe.SubscriptionUpdateParams.Item = existing
          ? { id: existing.id, quantity: ids.length }
          : { price: priceId, quantity: ids.length }
        await stripe.subscriptions.update(sub.id, {
          items: [item],
          proration_behavior: "create_prorations",
          // Merged into existing metadata (Stripe merges per key), so the webhook
          // learns which children this module covers without disturbing the plan
          // metadata (plan, billing_period, user_id, extra_kids).
          metadata: { [metaKey]: idsCsv },
        })
        return res.status(200).json({ added: true })
      }
      // Had a customer id but no live subscription — fall through to Checkout.
    }

    // No subscription to add to → Checkout for the prep price. Creates a prep-only
    // subscription; the webhook stores the customer id and the entitlements
    // without touching the learning subscription_status/plan.
    const origin = req.headers.origin || `https://${req.headers.host}`
    const metadata: Record<string, string> = {
      user_id: userId,
      purchase_type: "prep",
      prep_module: moduleId,
      [metaKey]: idsCsv,
    }
    const session = await stripe.checkout.sessions.create({
      mode: "subscription",
      line_items: [{ price: priceId, quantity: ids.length }],
      customer: customerId ?? undefined,
      customer_email: customerId ? undefined : email,
      subscription_data: { metadata },
      metadata,
      success_url: `${origin}/settings?billing=success`,
      cancel_url: `${origin}/settings?billing=cancel`,
    })

    return res.status(200).json({ url: session.url })
  } catch (error) {
    console.error("purchase-prep error:", error)
    return res.status(500).json({ error: "Could not start the prep purchase" })
  }
}
