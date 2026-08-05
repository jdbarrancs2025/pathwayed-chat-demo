import Stripe from "stripe"
import type { SupabaseClient } from "@supabase/supabase-js"
import type { VercelRequest, VercelResponse } from "@vercel/node"
import { isPrepModuleId, parsePrepStudentIds, prepPriceEnv, prepStudentsMetaKey } from "./prep-core.js"
import { requireUser, requireOwnedStudents } from "./require-auth.js"
import { rateLimit, BILLING_LIMIT } from "./rate-limit.js"

/**
 * IDENTITY COMES FROM THE SESSION. userId used to be read from the body and used
 * for a service-role profiles lookup, so an unauthenticated caller who knew a user
 * id could cancel a stranger's paid prep subscription and revoke their children's
 * entitlements. There is no userId in the request shape any more.
 *
 * studentIds, when supplied, is verified against the caller before anything is
 * revoked. Omitting it still means "cancel the whole module", which is scoped to
 * the caller's own subscription and therefore safe by construction.
 *
 * No billing arithmetic changed: same paths, same proration, same period-end logic.
 */
interface CancelPrepRequest {
  moduleId?: string
  /** Children to remove. Omit or pass every current id to cancel the whole module. */
  studentIds?: string[]
  /** When true, report which path would run + the period end WITHOUT mutating anything. */
  preview?: boolean
}

// Subscription statuses we can still mutate. This gates the SUBSCRIPTION's own
// status, NOT profiles.subscription_status — a prep-only account's learning status
// is trial/expired even though its prep subscription is live, so we find the
// subscription by the prep ITEM (see below) and never read subscription_status.
const BILLABLE_STATUSES = new Set(["active", "trialing", "past_due"])

type CancelPath = "reduce" | "delete" | "schedule" | "none"

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
 * Ordering invariant: Stripe is the source of truth and is mutated FIRST; the DB
 * is written only after the Stripe call succeeds. If Stripe throws, the catch
 * returns an error and nothing is written — so we can never land the catastrophic
 * "entitlement canceled but subscription still billing" divergence again.
 *
 * Paths:
 *   reduce   — some children remain: lower the item quantity to the survivors,
 *              rewrite prep_<module>_students; the removed children go canceled.
 *   delete   — all children removed and other items remain: drop just this item;
 *              the removed children go canceled.
 *   schedule — all children removed and this is the only item (prep-only account):
 *              cancel the whole subscription at period end. The WEBHOOK is the sole
 *              writer here (cancel_at_period_end keeps the entitlement active with
 *              ends_at set, and subscription.deleted cancels it at the boundary).
 *
 * `preview: true` returns the path + period end without mutating, so the client can
 * show accurate confirm copy (immediate credit vs. access-until-period-end).
 */
export default async function handler(req: VercelRequest, res: VercelResponse) {
  if (req.method !== "POST") {
    return res.status(405).json({ error: "Method not allowed" })
  }

  const auth = await requireUser(req, res)
  if (!auth) return

  const limited = rateLimit(`prep-cancel:${auth.userId}`, BILLING_LIMIT)
  if (!limited.allowed) {
    res.setHeader("Retry-After", String(limited.retryAfterSec))
    return res.status(429).json({ error: "rate_limited", retry_after: limited.retryAfterSec })
  }

  const secretKey = process.env.STRIPE_SECRET_KEY
  if (!secretKey) {
    return res.status(500).json({ error: "Billing is not configured" })
  }

  try {
    const { moduleId, studentIds, preview } = req.body as CancelPrepRequest
    const userId = auth.userId
    if (!isPrepModuleId(moduleId)) {
      return res.status(400).json({ error: "Unknown prep module" })
    }
    const requested =
      Array.isArray(studentIds) && studentIds.length > 0
        ? studentIds.filter((s) => typeof s === "string" && s.length > 0)
        : null // null = cancel all for the module

    // Named children must be the caller's own before any entitlement is revoked.
    // Fails closed. Omitting the list cancels the whole module on the caller's OWN
    // subscription, so there is nothing extra to verify in that branch.
    if (requested && !(await requireOwnedStudents(res, auth, requested))) return

    const priceId = process.env[prepPriceEnv(moduleId)]
    if (!priceId) {
      return res.status(500).json({ error: "Prep module price is not configured" })
    }

    const supabase = auth.svc
    const { data: profile } = await supabase
      .from("profiles")
      .select("stripe_customer_id")
      .eq("id", userId)
      .maybeSingle()
    const customerId = profile?.stripe_customer_id as string | null | undefined

    const stripe = new Stripe(secretKey)
    const metaKey = prepStudentsMetaKey(moduleId)

    // Find the subscription that actually CONTAINS this module's prep item, among
    // the customer's live subscriptions. We do NOT gate on profiles
    // .subscription_status — that broke prep-only accounts, whose learning status
    // is trial/expired while their prep subscription is active.
    let sub: Stripe.Subscription | undefined
    if (customerId) {
      const subs = await stripe.subscriptions.list({ customer: customerId, status: "all", limit: 20 })
      sub = subs.data.find(
        (s) => BILLABLE_STATUSES.has(s.status) && s.items.data.some((it) => it.price?.id === priceId),
      )
    }
    const item = sub?.items.data.find((it) => it.price?.id === priceId)

    if (!sub || !item) {
      // Nothing live to cancel on Stripe. Do NOT write the DB — writing canceled
      // here with no Stripe change is exactly the divergence being fixed.
      if (preview) return res.status(200).json({ path: "none" as CancelPath, periodEnd: null })
      return res.status(409).json({ error: "No active prep subscription for this module" })
    }

    const currentIds = parsePrepStudentIds(sub.metadata?.[metaKey])
    const toRemove = requested ? requested.filter((id) => currentIds.includes(id)) : currentIds
    const remaining = currentIds.filter((id) => !toRemove.includes(id))
    const periodEndSecs = readCurrentPeriodEnd(sub)
    const periodEndIso = periodEndSecs ? new Date(periodEndSecs * 1000).toISOString() : null
    const otherItems = sub.items.data.filter((it) => it.id !== item.id)

    const path: CancelPath =
      remaining.length > 0 ? "reduce" : otherItems.length > 0 ? "delete" : "schedule"

    if (preview) {
      return res.status(200).json({ path, periodEnd: periodEndIso })
    }

    // --- Execute. Stripe FIRST; DB only after Stripe succeeds. ---
    if (path === "reduce") {
      await stripe.subscriptions.update(sub.id, {
        items: [{ id: item.id, quantity: remaining.length }],
        proration_behavior: "create_prorations",
        metadata: { [metaKey]: remaining.join(",") },
      })
      // Immediate removal (prorated credit) — access ends now.
      await markCanceled(supabase, toRemove, moduleId, new Date().toISOString())
      return res.status(200).json({ path, removed: toRemove.length, remaining: remaining.length })
    }

    if (path === "delete") {
      await stripe.subscriptions.update(sub.id, {
        items: [{ id: item.id, deleted: true }],
        proration_behavior: "create_prorations",
        metadata: { [metaKey]: "" },
      })
      await markCanceled(supabase, toRemove, moduleId, new Date().toISOString())
      return res.status(200).json({ path, removed: toRemove.length, itemDeleted: true })
    }

    // schedule: prep-only, this is the only item. Stripe rejects deleting the last
    // item, so cancel the whole subscription at period end. No DB write here — the
    // webhook keeps access until the boundary and cancels on subscription.deleted.
    await stripe.subscriptions.update(sub.id, { cancel_at_period_end: true })
    return res.status(200).json({ path, scheduledCancelAt: periodEndIso })
  } catch (error) {
    console.error("cancel-prep error:", error)
    return res.status(500).json({ error: "Could not cancel the prep module" })
  }
}
