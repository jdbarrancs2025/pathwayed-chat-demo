/**
 * Should the KID see SAT framing? Single source of truth for the kid-facing SAT
 * threshold + parent override. (The PARENT still sees SAT readiness per the
 * consent gate at any grade — this function is only for the kid's view.)
 *
 * Rule (exact order):
 *   1. above_grade_ok = false -> OFF, regardless of grade (no consent).
 *   2. above_grade_ok = true AND grade >= 9 -> ON.
 *   3. above_grade_ok = true AND grade < 9 -> OFF by default. SEAM: an explicit
 *      parent "start SAT early" opt-in would flip this on (not built yet).
 * Below the threshold the kid sees skill-focused language only.
 */
export const SAT_FRAMING_GRADE = 9

export function showKidSatFraming({
  grade,
  above_grade_ok,
}: {
  grade: string
  above_grade_ok: boolean
}): boolean {
  if (!above_grade_ok) return false // (1) no consent
  const n = parseInt(grade, 10) // 'K'/unknown -> NaN -> treated as below threshold
  if (!Number.isNaN(n) && n >= SAT_FRAMING_GRADE) return true // (2)
  // (3) consent but below grade 9: off by default; SEAM for a future
  // parent "start SAT early" opt-in to turn it on here.
  return false
}

/**
 * Pacing tone for the SAT-readiness message. "Ready by 11th" is a TARGET, not a
 * gate: readiness comes from mastering the material, so a strong-mastery student
 * is ready early. This picks which honest message to show, from the same mastery-
 * driven readiness estimate the engine already computes (no recompute, no shown
 * numbers): a strong estimate reads as "ahead of pace", otherwise "building".
 */
export const SAT_AHEAD_PCT = 70

export function satPacingTone(overallPct: number | null): 'ahead' | 'building' {
  return overallPct != null && overallPct >= SAT_AHEAD_PCT ? 'ahead' : 'building'
}
