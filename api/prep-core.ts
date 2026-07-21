// Pure prep-module billing helpers, shared by the prep purchase endpoint and the
// Stripe webhook. Mirrors billing-core.ts, but for the test-prep add-on prices.
//
// Module ids come from the prep config registry (the single source of truth), and
// each module's Stripe price env var name is DERIVED from the module id, so there
// are no prep price strings hardcoded or scattered around.
import { PREP_MODULES, getPrepModule } from "../src/lib/prep/registry.js"
import type { PrepModule } from "../src/lib/prep/types.js"

export type PrepModuleId = PrepModule["id"]

/**
 * Env var holding the monthly Stripe price id for a module, derived from the
 * module id: hspt -> STRIPE_PRICE_HSPT_PREP_MONTHLY,
 * isee -> STRIPE_PRICE_ISEE_PREP_MONTHLY.
 */
export function prepPriceEnv(moduleId: string): string {
  return `STRIPE_PRICE_${moduleId.toUpperCase()}_PREP_MONTHLY`
}

/** True when the value is a configured prep module id (present in the registry). */
export function isPrepModuleId(value: unknown): value is PrepModuleId {
  return typeof value === "string" && getPrepModule(value as PrepModuleId) !== undefined
}

/**
 * Reverse-map a Stripe price id back to its prep module id by matching it against
 * the configured STRIPE_PRICE_<MODULE>_PREP_MONTHLY env values. Returns null when
 * the id is not a configured prep price. This is how the webhook turns a
 * subscription line item into a module id.
 */
export function moduleForPrepPriceId(
  priceId: string | null | undefined,
  env: Record<string, string | undefined>,
): PrepModuleId | null {
  if (!priceId) return null
  for (const m of PREP_MODULES) {
    if (env[prepPriceEnv(m.id)] === priceId) return m.id
  }
  return null
}

/** True if a Stripe price id is one of the configured prep module prices. */
export function isPrepPriceId(
  priceId: string | null | undefined,
  env: Record<string, string | undefined>,
): boolean {
  return moduleForPrepPriceId(priceId, env) !== null
}

/**
 * Subscription-metadata key carrying the selected student ids for a module, e.g.
 * prep_hspt_students = "uuid,uuid". One key per module so several modules can
 * coexist on a single subscription without colliding.
 */
export function prepStudentsMetaKey(moduleId: string): string {
  return `prep_${moduleId}_students`
}

/** Parse a comma-separated student-id metadata value into a clean id list. */
export function parsePrepStudentIds(value: string | null | undefined): string[] {
  if (!value) return []
  return value
    .split(",")
    .map((s) => s.trim())
    .filter(Boolean)
}
