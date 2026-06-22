import Stripe from "stripe"
import { createClient } from "@supabase/supabase-js"
import type { VercelRequest, VercelResponse } from "@vercel/node"

interface PortalRequest {
  userId?: string
}

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
    const { userId } = req.body as PortalRequest
    if (!userId) {
      return res.status(400).json({ error: "userId is required" })
    }

    // Service client (sb_secret_ key) — look up the parent's Stripe customer id.
    const supabase = createClient(supabaseUrl, serviceKey)
    const { data } = await supabase
      .from("profiles")
      .select("stripe_customer_id")
      .eq("id", userId)
      .maybeSingle()

    const customerId = data?.stripe_customer_id as string | null | undefined
    if (!customerId) {
      return res.status(400).json({ error: "No subscription on file yet" })
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
