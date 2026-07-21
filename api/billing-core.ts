// Pure billing math shared by create-checkout. Kept dependency-free so it can
// be unit-tested directly without Stripe, env vars, or the request handler.

export type PlanId = "elementary" | "middle" | "high"
export type BillingPeriod = "monthly" | "annual"

/** Seats included in each plan before the per-child add-on applies. */
export const INCLUDED_SEATS: Record<PlanId, number> = {
  elementary: 1,
  middle: 2,
  high: 2,
}

// Env var names for the base price of each plan + interval — never hardcoded ids.
const PLAN_PRICE_ENV: Record<PlanId, Record<BillingPeriod, string>> = {
  elementary: { monthly: "STRIPE_PRICE_ELEMENTARY_MONTHLY", annual: "STRIPE_PRICE_ELEMENTARY_ANNUAL" },
  middle: { monthly: "STRIPE_PRICE_MIDDLE_MONTHLY", annual: "STRIPE_PRICE_MIDDLE_ANNUAL" },
  high: { monthly: "STRIPE_PRICE_HIGH_MONTHLY", annual: "STRIPE_PRICE_HIGH_ANNUAL" },
}

const ADDON_PRICE_ENV: Record<BillingPeriod, string> = {
  monthly: "STRIPE_PRICE_ADDON_KID_MONTHLY",
  annual: "STRIPE_PRICE_ADDON_KID_ANNUAL",
}

/** All plan ids and billing periods, for exhaustive iteration. */
export const PLAN_IDS: readonly PlanId[] = ["elementary", "middle", "high"]
export const BILLING_PERIODS: readonly BillingPeriod[] = ["monthly", "annual"]

export function isPlanId(value: unknown): value is PlanId {
  return value === "elementary" || value === "middle" || value === "high"
}

export function isBillingPeriod(value: unknown): value is BillingPeriod {
  return value === "monthly" || value === "annual"
}

export function includedSeats(plan: PlanId): number {
  return INCLUDED_SEATS[plan]
}

/** Grade coverage per plan tier (Elementary K-5, Middle 6-8, High 9-12). The
 *  single source for which plans qualify for a prep module's grade band. */
export const PLAN_GRADES: Record<PlanId, [number, number]> = {
  elementary: [0, 5],
  middle: [6, 8],
  high: [9, 12],
}

/**
 * Whether the account may purchase a prep module for the given grade band: the
 * subscription must be active or trialing, and the plan's coverage must reach the
 * band (its top grade >= the band's first grade). Elementary is excluded for a 6-8
 * module; Middle and High qualify. Coverage is derived from PLAN_GRADES.
 */
export function planQualifiesForBand(
  status: string | null | undefined,
  plan: string | null | undefined,
  band: [number, number],
): boolean {
  if (status !== "active" && status !== "trialing") return false
  if (!isPlanId(plan)) return false
  return PLAN_GRADES[plan][1] >= band[0]
}

/** Billable extra children = max(0, totalKids - included seats for the plan). */
export function extraKids(plan: PlanId, totalKids: number): number {
  return Math.max(0, (Number(totalKids) || 0) - INCLUDED_SEATS[plan])
}

/**
 * Paid seat cap for a subscribed account = the plan's included seats plus the
 * Additional Child add-on quantity. This is what the webhook stores in
 * profiles.paid_seats so the app can cap active children without re-reading Stripe.
 */
export function paidSeats(plan: PlanId, extraKidCount: number): number {
  return INCLUDED_SEATS[plan] + Math.max(0, Number(extraKidCount) || 0)
}

/** Env var name holding the base price id for this plan + interval. */
export function planPriceEnv(plan: PlanId, period: BillingPeriod): string {
  return PLAN_PRICE_ENV[plan][period]
}

/** Env var name holding the add-on price id — same interval as the plan. */
export function addonPriceEnv(period: BillingPeriod): string {
  return ADDON_PRICE_ENV[period]
}

/** A base plan resolved from a Stripe price id. */
export interface PlanPeriod {
  plan: PlanId
  period: BillingPeriod
}

/**
 * Reverse-map a Stripe base price id back to its plan + billing period by
 * matching it against the configured STRIPE_PRICE_<PLAN>_<PERIOD> env values.
 * This is the source-of-truth mapping the webhook uses to sync the stored plan
 * when a customer switches plans in the Stripe portal.
 *
 * `env` is the price-id-bearing environment (process.env in production; a stub
 * in tests). Returns null if the id matches no known base plan — e.g. it's the
 * add-on price, or a price that isn't configured here — so callers can warn and
 * leave the stored value untouched rather than writing garbage.
 */
export function planForPriceId(
  priceId: string | null | undefined,
  env: Record<string, string | undefined>,
): PlanPeriod | null {
  if (!priceId) return null
  for (const plan of PLAN_IDS) {
    for (const period of BILLING_PERIODS) {
      if (env[planPriceEnv(plan, period)] === priceId) {
        return { plan, period }
      }
    }
  }
  return null
}

/**
 * True if a Stripe price id is the per-child add-on price (either interval).
 * Used to read the extra-kid quantity from a subscription's line items.
 */
export function isAddonPriceId(
  priceId: string | null | undefined,
  env: Record<string, string | undefined>,
): boolean {
  if (!priceId) return false
  return BILLING_PERIODS.some((period) => env[addonPriceEnv(period)] === priceId)
}
