import Stripe from "stripe"
import type { VercelRequest, VercelResponse } from "@vercel/node"

type PlanId = "elementary" | "middle" | "high"
type BillingPeriod = "monthly" | "annual"

// Price ids are read from env per plan + interval — never hardcoded.
const PLANS: Record<PlanId, { included: number; monthly: string; annual: string }> = {
  elementary: { included: 1, monthly: "STRIPE_PRICE_ELEMENTARY_MONTHLY", annual: "STRIPE_PRICE_ELEMENTARY_ANNUAL" },
  middle: { included: 2, monthly: "STRIPE_PRICE_MIDDLE_MONTHLY", annual: "STRIPE_PRICE_MIDDLE_ANNUAL" },
  high: { included: 2, monthly: "STRIPE_PRICE_HIGH_MONTHLY", annual: "STRIPE_PRICE_HIGH_ANNUAL" },
}

const ADDON_ENV: Record<BillingPeriod, string> = {
  monthly: "STRIPE_PRICE_ADDON_KID_MONTHLY",
  annual: "STRIPE_PRICE_ADDON_KID_ANNUAL",
}

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

    if (!(plan in PLANS) || (billingPeriod !== "monthly" && billingPeriod !== "annual")) {
      return res.status(400).json({ error: "Invalid plan or billing period" })
    }

    const planDef = PLANS[plan]
    const basePriceId = process.env[planDef[billingPeriod]]
    if (!basePriceId) {
      return res.status(500).json({ error: "Plan price is not configured" })
    }

    const extraKids = Math.max(0, (Number(totalKids) || 0) - planDef.included)

    const lineItems: Stripe.Checkout.SessionCreateParams.LineItem[] = [{ price: basePriceId, quantity: 1 }]
    if (extraKids > 0) {
      const addonPriceId = process.env[ADDON_ENV[billingPeriod]]
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

    const session = await stripe.checkout.sessions.create({
      mode: "subscription",
      line_items: lineItems,
      customer_email: email,
      subscription_data: {
        trial_period_days: 7,
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
