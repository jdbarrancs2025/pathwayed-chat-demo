import Stripe from "stripe"
import { createClient, type SupabaseClient } from "@supabase/supabase-js"
import type { VercelRequest, VercelResponse } from "@vercel/node"
import { isPrepModuleId, parsePrepStudentIds, prepPriceEnv, prepStudentsMetaKey } from "./prep-core.js"

interface CancelPrepRequest {
  userId?: string
  moduleId?: string
  /** Children to remove. Omit or pass every current id to cancel the whole module. */
  studentIds?: string[]
}

// Subscriptions we can mutate — the same set update-seats and purchase-prep use.
const BILLABLE_STATUSES = new Set(["active", "trialing", "past_due"])

/** Read the current period end (subscription- or item-level; see the webhook). */
function readCurrentPeriodEnd(sub: Stripe.Subscription): number | null {
  const s = sub as unknown as {
    current_period_end?: number | null
    items?: { data?: Array<{ current_period_end?: number | null }> }
  }
  if (typeof s.current_period_end === "number") return s.current_period_end
  const item = s.items?.data?.[0]
  return typeof item?.current_period_end === "number" ? item.current_period_end : null
}

/** Mark the given children's entitlement for a module canceled as of `endsAt`. */
async function markCanceled(
  supabase: SupabaseClient,
  studentIds: string[],
  moduleId: string,
  endsAt: string | null,
): Promise<void> {
  if (studentIds.length === 0) return
  const { error } = await supabase
    .from("prep_entitlements")
    .update({ status: "canceled", ends_at: endsAt })
    .eq("module_id", moduleId)
    .in("student_id", studentIds)
  if (error) throw new Error(`prep_entitlements cancel failed for '${moduleId}': ${error.message}`)
}

/**
 * Cancel a test-prep module for some or all of the children it covers.
 *
 * Removing SOME children: reduce the prep item quantity to the remaining count
 * (prorated, like update-seats) and rewrite prep_<module>_students to the
 * remaining ids; the removed children's entitlements go canceled.
 *
 * Removing ALL children: delete the prep item entirely ({ id, deleted: true }),
 * unless it is the only item on a prep-only subscription — Stripe rejects deleting
 * the last item, so we cancel the whole subscription at period end instead (the
 * webhook then keeps access until that date and cancels on the deleted event).
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
    const { userId, moduleId, studentIds } = req.body as CancelPrepRequest
    if (!userId) {
      return res.status(400).json({ error: "userId is required" })
    }
    if (!isPrepModuleId(moduleId)) {
      return res.status(400).json({ error: "Unknown prep module" })
    }
    const requested =
      Array.isArray(studentIds) && studentIds.length > 0
        ? studentIds.filter((s) => typeof s === "string" && s.length > 0)
        : null // null = cancel all for the module

    const priceId = process.env[prepPriceEnv(moduleId)]
    if (!priceId) {
      return res.status(500).json({ error: "Prep module price is not configured" })
    }

    const supabase = createClient(supabaseUrl, serviceKey)
    const { data: profile } = await supabase
      .from("profiles")
      .select("stripe_customer_id, subscription_status")
      .eq("id", userId)
      .maybeSingle()

    const customerId = profile?.stripe_customer_id as string | null | undefined
    const status = profile?.subscription_status as string | null | undefined

    const stripe = new Stripe(secretKey)
    const metaKey = prepStudentsMetaKey(moduleId)

    // No billable subscription to change. If entitlement rows somehow linger,
    // cancel the requested ones so the UI reflects reality, then report done.
    if (!customerId || !status || !BILLABLE_STATUSES.has(status)) {
      if (requested) await markCanceled(supabase, requested, moduleId, new Date().toISOString())
      return res.status(200).json({ canceled: true, note: "no active subscription" })
    }

    const subs = await stripe.subscriptions.list({ customer: customerId, status: "all", limit: 20 })
    const sub = subs.data.find((s) => BILLABLE_STATUSES.has(s.status))
    if (!sub) {
      if (requested) await markCanceled(supabase, requested, moduleId, new Date().toISOString())
      return res.status(200).json({ canceled: true, note: "no active subscription found" })
    }

    const item = sub.items.data.find((it) => it.price?.id === priceId)
    if (!item) {
      // Module not on the subscription — just reconcile the DB.
      if (requested) await markCanceled(supabase, requested, moduleId, new Date().toISOString())
      return res.status(200).json({ canceled: true, note: "module not on subscription" })
    }

    const currentIds = parsePrepStudentIds(sub.metadata?.[metaKey])
    const toRemove = requested ? requested.filter((id) => currentIds.includes(id)) : currentIds
    const remaining = currentIds.filter((id) => !toRemove.includes(id))
    const periodEndIso = readCurrentPeriodEnd(sub) ? new Date(readCurrentPeriodEnd(sub)! * 1000).toISOString() : null

    // Some children remain → reduce quantity + rewrite metadata to the survivors.
    if (remaining.length > 0) {
      await stripe.subscriptions.update(sub.id, {
        items: [{ id: item.id, quantity: remaining.length }],
        proration_behavior: "create_prorations",
        metadata: { [metaKey]: remaining.join(",") },
      })
      await markCanceled(supabase, toRemove, moduleId, periodEndIso)
      return res.status(200).json({ removed: toRemove.length, remaining: remaining.length })
    }

    // Removing every child for this module. If other items remain on the
    // subscription (a plan, or another prep module), drop just this item.
    const otherItems = sub.items.data.filter((it) => it.id !== item.id)
    if (otherItems.length > 0) {
      await stripe.subscriptions.update(sub.id, {
        items: [{ id: item.id, deleted: true }],
        proration_behavior: "create_prorations",
        metadata: { [metaKey]: "" },
      })
      await markCanceled(supabase, toRemove, moduleId, periodEndIso)
      return res.status(200).json({ removed: toRemove.length, itemDeleted: true })
    }

    // This prep item is the subscription's only item (prep-only account). Stripe
    // rejects deleting the last item, so cancel the whole subscription at period
    // end. The webhook (cancel_at_period_end) keeps access until then and marks
    // the entitlements canceled on the subscription.deleted event.
    await stripe.subscriptions.update(sub.id, { cancel_at_period_end: true })
    return res.status(200).json({ removed: toRemove.length, scheduledCancelAt: periodEndIso })
  } catch (error) {
    console.error("cancel-prep error:", error)
    return res.status(500).json({ error: "Could not cancel the prep module" })
  }
}
