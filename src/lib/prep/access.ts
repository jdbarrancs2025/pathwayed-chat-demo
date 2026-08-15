import { PREP_MODULES } from './registry.js'
import type { PrepModule } from './types.js'

/**
 * Prep access rules — which statuses count as entitled, and which modules a grade
 * qualifies for. Client-safe and DB-free (config imports only), so the browser
 * bundle and the api/ serverless functions share the SAME rules: src/lib/prep/
 * entitlements.ts re-exports from here for existing UI callers, and
 * api/school-login.ts imports it directly. entitlements.ts itself cannot be
 * imported server-side because it pulls in the browser Supabase client.
 *
 * Must NOT import any server-only or browser-only module. Same arrangement as
 * src/lib/gradeBand.ts.
 */

/**
 * Access checks MUST key on `status`, never on "canceled but still before
 * ends_at". The ends_at column is a record/scheduling hint, not an access gate:
 *   - status 'active' (with or without ends_at) = entitled. A set ends_at means a
 *     SCHEDULED end (cancel at period end) — still entitled until the webhook flips
 *     it to canceled — and the UI shows "ends [date]".
 *   - status 'canceled' = NOT entitled, regardless of ends_at (an immediate cancel
 *     writes ends_at = when it ended, which may be in the past or future).
 * These statuses are the entitled set; treat everything else as no access.
 */
export const ACTIVE_PREP_STATUSES = new Set(['active', 'past_due'])

/** The status a newly granted entitlement carries. Matches what the Stripe
 *  webhook writes for a live subscription, so a covered row reads identically. */
export const ACTIVE_PREP_STATUS = 'active'

/** Numeric grade for eligibility math: 'K' -> 0, else the parsed int (else -1). */
function gradeNumber(grade: string): number {
  if (grade === 'K') return 0
  const n = parseInt(grade, 10)
  return Number.isNaN(n) ? -1 : n
}

/** A child is eligible for a module when their grade falls inside its gradeBand. */
export function isGradeEligible(grade: string, module: PrepModule): boolean {
  const g = gradeNumber(grade)
  const [lo, hi] = module.gradeBand
  return g >= lo && g <= hi
}

/**
 * Every configured module the grade qualifies for, e.g. '12' -> [SAT], '7' ->
 * [HSPT, ISEE]. Grade drives this, not the school, so a new school needs no
 * config and a new module is picked up from the registry automatically.
 */
export function prepModulesForGrade(grade: string): PrepModule[] {
  return PREP_MODULES.filter((m) => isGradeEligible(grade, m))
}
