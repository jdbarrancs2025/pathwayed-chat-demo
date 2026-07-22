/**
 * Display prices for the test-prep module add-ons (UI copy only — each must match
 * the configured Stripe prep price STRIPE_PRICE_<MODULE>_PREP_MONTHLY, the same way
 * billing.ts PLANS mirrors the plan prices).
 *
 *   HSPT / ISEE — $19 / student / month (Middle-tier admissions tests).
 *   SAT         — $29 / student / month (premium, High-tier; NOT the $19 constant).
 */
export const PREP_PRICE_MONTHLY = 19
export const SAT_PREP_PRICE_MONTHLY = 29

/** Monthly price for a given prep module id. SAT is priced above HSPT/ISEE. */
export function prepPriceFor(moduleId: string): number {
  return moduleId === 'sat' ? SAT_PREP_PRICE_MONTHLY : PREP_PRICE_MONTHLY
}
