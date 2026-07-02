import { gradeBand, type GradeBand } from '@/lib/gradeBand'

/**
 * Placement diagnostic — Phase 2 pure logic (no DB, unit-tested). Decides which
 * grade bands to sample (adaptive), whether to extend to the band above, and a
 * plain-language placement summary. The actual fetch/seed live in questions.ts
 * and skills.ts; keeping this pure makes the placement rules inspectable.
 */

export interface DiagnosticResult {
  skillId: string
  band: string // the sampled skill's grade_band
  isCorrect: boolean
}

// A strong at-grade showing earns above-grade questions (don't trap a strong kid
// at grade pace). Tunable.
export const EXTEND_THRESHOLD = 0.7

const BAND_ORDER: GradeBand[] = ['k-2', '3-5', '6-8', '9-12']

/**
 * Bands to sample for a student: the at-grade band + the band below (current
 * level + prerequisites) as the initial set, and the band above as the adaptive
 * extension. Bands with no practiceable skills are simply absent after the caller
 * intersects with the published-question set.
 */
export function diagnosticBands(grade: string): { initial: GradeBand[]; extension: GradeBand[] } {
  const at = gradeBand(grade)
  const i = BAND_ORDER.indexOf(at)
  const below = i > 0 ? [BAND_ORDER[i - 1]] : []
  const above = i < BAND_ORDER.length - 1 ? [BAND_ORDER[i + 1]] : []
  return { initial: [...below, at], extension: above }
}

/** Fraction correct within a subset (null if the subset is empty). */
function fractionCorrect(results: DiagnosticResult[]): number | null {
  if (!results.length) return null
  return results.filter((r) => r.isCorrect).length / results.length
}

/**
 * Extend upward to the above-grade band only if the student answered the AT-GRADE
 * questions well (>= EXTEND_THRESHOLD correct). No at-grade evidence -> no extend.
 */
export function shouldExtend(results: DiagnosticResult[], atBand: string): boolean {
  const f = fractionCorrect(results.filter((r) => r.band === atBand))
  return f !== null && f >= EXTEND_THRESHOLD
}

export interface Placement {
  label: string
  correct: number
  total: number
}

/**
 * Plain-language placement summary from the answered set (display only; the real
 * placement is the seeded mastery + readiness). Uses at-grade performance first,
 * then above/below evidence to pick a friendly, non-judgmental label.
 */
export function placement(results: DiagnosticResult[], atBand: string): Placement {
  const total = results.length
  const correct = results.filter((r) => r.isCorrect).length
  const at = BAND_ORDER.indexOf(atBand as GradeBand)

  const atFrac = fractionCorrect(results.filter((r) => r.band === atBand))
  const aboveFrac = fractionCorrect(results.filter((r) => BAND_ORDER.indexOf(r.band as GradeBand) > at))
  const belowFrac = fractionCorrect(results.filter((r) => BAND_ORDER.indexOf(r.band as GradeBand) < at))

  let label: string
  if (aboveFrac !== null && aboveFrac >= 0.6) label = 'ready for above-grade challenges'
  else if (atFrac !== null && atFrac >= EXTEND_THRESHOLD) label = 'right on grade level'
  else if (belowFrac !== null && belowFrac >= 0.5) label = 'building grade-level foundations'
  else label = 'starting with the core basics'

  return { label, correct, total }
}
