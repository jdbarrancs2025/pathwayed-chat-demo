import Stripe from "stripe"
import type { VercelRequest, VercelResponse } from "@vercel/node"
import {
  addonPriceEnv,
  extraKids as computeExtraKids,
  isBillingPeriod,
  isPlanId,
  planPriceEnv,
  type BillingPeriod,
  type PlanId,
} from "./billing-core.js"

interface CheckoutRequest {
  plan: PlanId
  billingPeriod: BillingPeriod
  totalKids: number
  email?: string
  userId?: string
}

export default async function handler(req: VercelRequest, res: VercelResponse) {
  if (req.method !== "POST") {
    return res.status(405).json({ error: "Method not allowed" })
  }
  const secretKey = process.env.STRIPE_SECRET_KEY
  if (!secretKey) {
    return res.status(500).json({ error: "Stripe is not configured" })
  }
  const stripe = new Stripe(secretKey)

  try {
    const { plan, billingPeriod, totalKids, email, userId } = req.body as CheckoutRequest

    if (!isPlanId(plan) || !isBillingPeriod(billingPeriod)) {
      return res.status(400).json({ error: "Invalid plan or billing period" })
    }

    const basePriceId = process.env[planPriceEnv(plan, billingPeriod)]
    if (!basePriceId) {
      return res.status(500).json({ error: "Plan price is not configured" })
    }

    const extraKids = computeExtraKids(plan, totalKids)

    const lineItems: Stripe.Checkout.SessionCreateParams.LineItem[] = [{ price: basePriceId, quantity: 1 }]
    if (extraKids > 0) {
      const addonPriceId = process.env[addonPriceEnv(billingPeriod)]
      if (!addonPriceId) {
        return res.status(500).json({ error: "Add-on price is not configured" })
      }
      lineItems.push({ price: addonPriceId, quantity: extraKids })
    }

    const origin = req.headers.origin || `https://${req.headers.host}`
    const metadata: Record<string, string> = {
      user_id: userId ?? "",
      plan,
      billing_period: billingPeriod,
      extra_kids: String(extraKids),
    }

    // Pay-now checkout: no trial_period_days. The 7-day trial is app-managed
    // (profiles.subscription_status = 'free_trial'); subscribing here charges
    // immediately and the webhook flips the account to 'active'.
    const session = await stripe.checkout.sessions.create({
      mode: "subscription",
      line_items: lineItems,
      customer_email: email,
      subscription_data: {
        metadata,
      },
      metadata,
      success_url: `${origin}/settings?billing=success`,
      cancel_url: `${origin}/settings?billing=cancel`,
    })

    return res.status(200).json({ id: session.id, url: session.url })
  } catch (error) {
    console.error("create-checkout error:", error)
    return res.status(500).json({ error: "Could not start checkout" })
  }
}
