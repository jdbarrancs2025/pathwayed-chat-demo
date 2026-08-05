/**
 * Canonical grade-band resolver — the single source of truth for mapping a grade
 * string to one of the four teaching bands. It lives in src/lib (client-safe,
 * ZERO imports) so both the browser bundle and the api/ serverless functions use
 * the SAME logic: api/teaching-cycle.ts re-exports from here. Must NOT import any
 * server-only or browser-only module.
 *
 * Note: src/lib/types.ts has a separate, narrower `GradeBand`
 * ('3-5' | '6-8' | '9-12') used for the parent's grade-band *selection* UI. This
 * one is the 4-band runtime resolver (it includes 'k-2'); the two are
 * intentionally distinct.
 */

/** Grade bands used to select subject-module depth. */
export type GradeBand = 'k-2' | '3-5' | '6-8' | '9-12'

/**
 * Map a grade string ('K', '1'..'12') to a band. Defaults to 'k-2' for the
 * youngest/unknown so early-reader safeguards (e.g. no picture-guessing) apply
 * by default rather than being skipped.
 */
export function gradeBand(grade?: string): GradeBand {
  if (!grade) return 'k-2'
  if (grade === 'K') return 'k-2'
  const n = parseInt(grade, 10)
  if (Number.isNaN(n)) return 'k-2'
  if (n <= 2) return 'k-2'
  if (n <= 5) return '3-5'
  if (n <= 8) return '6-8'
  return '9-12'
}

/** Human label for a band, for prompts and reports. */
export function gradeBandLabel(band: GradeBand): string {
  switch (band) {
    case 'k-2':
      return 'K-2 (early reader)'
    case '3-5':
      return 'Grades 3-5'
    case '6-8':
      return 'Grades 6-8'
    case '9-12':
      return 'Grades 9-12'
  }
}
