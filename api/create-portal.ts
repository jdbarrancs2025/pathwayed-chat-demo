import Stripe from "stripe"
import type { VercelRequest, VercelResponse } from "@vercel/node"
import { requireUser } from "./require-auth.js"
import { rateLimit, BILLING_LIMIT } from "./rate-limit.js"

/**
 * Open the Stripe billing portal for the SIGNED-IN parent.
 *
 * This endpoint used to take a userId from the request body, look up that
 * profile's stripe_customer_id with the service role, and return a portal URL for
 * it. Any unauthenticated caller who knew a user id could therefore open that
 * user's billing portal: card details, invoices, billing address, and the ability
 * to cancel their subscription.
 *
 * The identity now comes from the verified session and NOTHING else. There is no
 * userId in the request shape at all, so there is nothing to spoof and no fallback
 * path to get wrong.
 */
export default async function handler(req: VercelRequest, res: VercelResponse) {
  if (req.method !== "POST") {
    return res.status(405).json({ error: "Method not allowed" })
  }

  const auth = await requireUser(req, res)
  if (!auth) return

  const limited = rateLimit(`portal:${auth.userId}`, BILLING_LIMIT)
  if (!limited.allowed) {
    res.setHeader("Retry-After", String(limited.retryAfterSec))
    return res.status(429).json({ error: "rate_limited", retry_after: limited.retryAfterSec })
  }

  const secretKey = process.env.STRIPE_SECRET_KEY
  if (!secretKey) {
    return res.status(500).json({ error: "Billing is not configured" })
  }

  try {
    // Look up the CALLER's own Stripe customer. auth.userId comes from the verified
    // token; the request body is not consulted.
    const { data, error } = await auth.svc
      .from("profiles")
      .select("stripe_customer_id")
      .eq("id", auth.userId)
      .maybeSingle()
    if (error) {
      console.error("create-portal profile read failed", error)
      return res.status(500).json({ error: "Could not open the billing portal" })
    }

    const customerId = data?.stripe_customer_id as string | null | undefined
    if (!customerId) {
      // Clean, explicit failure. No fallback to any other customer, ever.
      return res.status(404).json({ error: "no_billing_account" })
    }

    const stripe = new Stripe(secretKey)
    const origin = req.headers.origin || `https://${req.headers.host}`
    const session = await stripe.billingPortal.sessions.create({
      customer: customerId,
      return_url: `${origin}/settings`,
    })

    return res.status(200).json({ url: session.url })
  } catch (error) {
    console.error("create-portal error:", error)
    return res.status(500).json({ error: "Could not open the billing portal" })
  }
}
