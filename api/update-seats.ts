import Stripe from "stripe"
import { createClient } from "@supabase/supabase-js"
import type { VercelRequest, VercelResponse } from "@vercel/node"
import {
  addonPriceEnv,
  extraKids as computeExtraKids,
  isBillingPeriod,
  isPlanId,
} from "./billing-core.js"

interface UpdateSeatsRequest {
  userId?: string
  totalKids?: number
}

// Subscriptions we're willing to mutate seats on. A child added while the
// parent has one of these must be billed.
const BILLABLE_STATUSES = new Set(["active", "trialing", "past_due"])

/**
 * Increase (or decrease) the per-child add-on quantity on a parent's existing
 * subscription so it matches a new total child count, prorating the change.
 *
 * The add-on quantity is set to max(0, totalKids - includedSeats(plan)). We also
 * write the new count to the subscription metadata (`extra_kids`) so the
 * customer.subscription.updated webhook keeps profiles.extra_kids in sync —
 * the webhook reads extra_kids from metadata, not from the line-item quantity.
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
    const { userId, totalKids } = req.body as UpdateSeatsRequest
    if (!userId || typeof totalKids !== "number" || !Number.isFinite(totalKids)) {
      return res.status(400).json({ error: "userId and a numeric totalKids are required" })
    }

    // Service client (sb_secret_ key) — look up the parent's billing state.
    const supabase = createClient(supabaseUrl, serviceKey)
    const { data: profile } = await supabase
      .from("profiles")
      .select("stripe_customer_id, plan, billing_period, subscription_status")
      .eq("id", userId)
      .maybeSingle()

    const customerId = profile?.stripe_customer_id as string | null | undefined
    const plan = profile?.plan
    const billingPeriod = profile?.billing_period
    const status = profile?.subscription_status as string | null | undefined

    // No subscription on file → caller should just add the child for free.
    if (!customerId || !status || !BILLABLE_STATUSES.has(status)) {
      return res.status(400).json({ error: "No active subscription to update" })
    }
    if (!isPlanId(plan) || !isBillingPeriod(billingPeriod)) {
      return res.status(500).json({ error: "Subscription plan is not recognized" })
    }

    const desiredExtra = computeExtraKids(plan, totalKids)
    const addonPriceId = process.env[addonPriceEnv(billingPeriod)]
    if (!addonPriceId) {
      return res.status(500).json({ error: "Add-on price is not configured" })
    }

    const stripe = new Stripe(secretKey)

    // We don't store the subscription id, so find the customer's live one.
    const subs = await stripe.subscriptions.list({ customer: customerId, status: "all", limit: 20 })
    const sub = subs.data.find((s) => BILLABLE_STATUSES.has(s.status))
    if (!sub) {
      return res.status(400).json({ error: "No active subscription found" })
    }

    const addonItem = sub.items.data.find((it) => it.price?.id === addonPriceId)

    // Already at the desired quantity — nothing to charge (guards double-submits).
    if (desiredExtra > 0 && addonItem && addonItem.quantity === desiredExtra) {
      return res.status(200).json({ extraKids: desiredExtra, changed: false })
    }
    if (desiredExtra === 0 && !addonItem) {
      return res.status(200).json({ extraKids: 0, changed: false })
    }

    const items: Stripe.SubscriptionUpdateParams.Item[] = []
    if (desiredExtra > 0) {
      items.push(addonItem ? { id: addonItem.id, quantity: desiredExtra } : { price: addonPriceId, quantity: desiredExtra })
    } else if (addonItem) {
      // Back down to included seats: drop the add-on line entirely.
      items.push({ id: addonItem.id, deleted: true })
    }

    const updated = await stripe.subscriptions.update(sub.id, {
      items,
      // Prorate for the remaining period, the same way a plan change does.
      proration_behavior: "create_prorations",
      // Merged into existing metadata so the webhook syncs extra_kids; plan,
      // billing_period and user_id are preserved.
      metadata: { extra_kids: String(desiredExtra) },
    })

    return res.status(200).json({ extraKids: desiredExtra, changed: true, status: updated.status })
  } catch (error) {
    console.error("update-seats error:", error)
    return res.status(500).json({ error: "Could not update your subscription" })
  }
}
