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

export function isPlanId(value: unknown): value is PlanId {
  return value === "elementary" || value === "middle" || value === "high"
}

export function isBillingPeriod(value: unknown): value is BillingPeriod {
  return value === "monthly" || value === "annual"
}

export function includedSeats(plan: PlanId): number {
  return INCLUDED_SEATS[plan]
}

/** Billable extra children = max(0, totalKids - included seats for the plan). */
export function extraKids(plan: PlanId, totalKids: number): number {
  return Math.max(0, (Number(totalKids) || 0) - INCLUDED_SEATS[plan])
}

/** Env var name holding the base price id for this plan + interval. */
export function planPriceEnv(plan: PlanId, period: BillingPeriod): string {
  return PLAN_PRICE_ENV[plan][period]
}

/** Env var name holding the add-on price id — same interval as the plan. */
export function addonPriceEnv(period: BillingPeriod): string {
  return ADDON_PRICE_ENV[period]
}
