/**
 * Placement diagnostic — pure logic (no DB, unit-tested). GRADE-ANCHORED: the
 * assessment starts at the student's ACTUAL grade (CCSS grade) and adapts UP or
 * DOWN one grade at a time to locate their true working level — rather than
 * anchoring to a coarse grade BAND. The fetch/seed live in Diagnostic.tsx and
 * skills.ts; keeping this pure makes the placement rules inspectable and tested.
 */

export interface DiagnosticResult {
  skillId: string
  gradeNum: number // the served skill's true CCSS grade (K=0 .. 12)
  isCorrect: boolean
}

/** Answer a rung at/above this fraction correct and we probe UP a grade. */
export const UP_THRESHOLD = 0.7
/** Answer a rung below this and we drop DOWN a grade. In between = settle here. */
export const DOWN_THRESHOLD = 0.5
/** Never probe more than this many grades from the enrolled grade in one
 *  direction — a child rarely places more than a few grades off, and it bounds
 *  the assessment length. */
export const MAX_STEPS = 3

export type LadderDirection = 'none' | 'up' | 'down'

/**
 * Minimum questions a grades-3-12 run must answer before it counts as a real
 * placement and is allowed to seed mastery. A grade rung serves one question per
 * published skill, so a thin grade (e.g. only two skills published) can settle
 * the ladder after just two answers — far too few to place from. Below this
 * floor the run is discarded (no seeding), never marked complete; the child is
 * offered placement again rather than being pinned by junk mastery.
 */
export const PLACEMENT_MIN_QUESTIONS = 4

/** Whether a finished grades-3-12 run answered enough to seed a real placement. */
export function placementSeeds(resultCount: number): boolean {
  return resultCount >= PLACEMENT_MIN_QUESTIONS
}

/** Student grade string ('K','1'..'12') → numeric CCSS grade (K=0). Unknown → 0. */
export function studentGradeNum(grade: string): number {
  if (grade === 'K') return 0
  const n = parseInt(grade, 10)
  return Number.isNaN(n) ? 0 : Math.max(0, Math.min(12, n))
}

/** Distinct grade numbers that actually have content, ascending. */
export function availableGrades(gradeNums: number[]): number[] {
  return [...new Set(gradeNums)].sort((a, b) => a - b)
}

/**
 * Where to START: the student's own grade if it has content; otherwise the
 * nearest available grade at-or-below (so a grade with a content gap — e.g. 1/2
 * today — degrades to the closest lower rung rather than showing nothing);
 * failing that, the lowest available grade. null when nothing is available.
 */
export function startGrade(studentGrade: number, available: number[]): number | null {
  if (!available.length) return null
  if (available.includes(studentGrade)) return studentGrade
  const atOrBelow = available.filter((g) => g <= studentGrade)
  if (atOrBelow.length) return Math.max(...atOrBelow)
  return Math.min(...available)
}

/** Fraction correct on the questions served for one grade rung (null if none). */
export function rungAccuracy(results: DiagnosticResult[], gradeNum: number): number | null {
  const rung = results.filter((r) => r.gradeNum === gradeNum)
  if (!rung.length) return null
  return rung.filter((r) => r.isCorrect).length / rung.length
}

export interface NextRungInput {
  currentGrade: number
  accuracy: number // fraction correct on the rung just finished
  available: number[]
  visited: number[]
  direction: LadderDirection
  stepsTaken: number
}

/**
 * The adaptive step after finishing a rung. Climbs while the student is strong,
 * descends while they struggle, and SETTLES (returns grade: null) once the level
 * is bracketed — bounded by MAX_STEPS, the available grades, and never revisiting
 * a grade. Direction is locked in at the first (start-rung) decision so the walk
 * can't oscillate.
 */
export function nextRung(input: NextRungInput): { grade: number | null; direction: LadderDirection } {
  const { currentGrade, accuracy, available, visited, direction, stepsTaken } = input
  const nextUp = available.filter((g) => g > currentGrade && !visited.includes(g)).sort((a, b) => a - b)[0]
  const nextDown = available.filter((g) => g < currentGrade && !visited.includes(g)).sort((a, b) => b - a)[0]

  // First decision (at the start rung): pick a direction from performance.
  if (direction === 'none') {
    if (accuracy >= UP_THRESHOLD && nextUp != null) return { grade: nextUp, direction: 'up' }
    if (accuracy < DOWN_THRESHOLD && nextDown != null) return { grade: nextDown, direction: 'down' }
    return { grade: null, direction: 'none' } // settled at the start grade
  }

  // Keep climbing only while the student is still strong.
  if (direction === 'up') {
    if (accuracy >= UP_THRESHOLD && nextUp != null && stepsTaken < MAX_STEPS) return { grade: nextUp, direction: 'up' }
    return { grade: null, direction: 'up' } // stop; true level = highest rung passed
  }

  // Keep descending until the student can handle a rung (>= DOWN_THRESHOLD).
  if (accuracy < DOWN_THRESHOLD && nextDown != null && stepsTaken < MAX_STEPS) return { grade: nextDown, direction: 'down' }
  return { grade: null, direction: 'down' } // stop; settle at the first handled rung
}

/**
 * The student's settled working grade from the answered rungs: if they climbed,
 * the highest grade they still passed (>= UP_THRESHOLD); if they descended, the
 * highest grade they could handle (>= DOWN_THRESHOLD); otherwise the lowest grade
 * attempted (or the start grade). Display/observability only — the real placement
 * is the seeded per-skill mastery.
 */
export function settledGrade(results: DiagnosticResult[], startGradeNum: number): number {
  const grades = availableGrades(results.map((r) => r.gradeNum))
  const passedUp = grades.filter((g) => (rungAccuracy(results, g) ?? 0) >= UP_THRESHOLD)
  if (passedUp.length) return Math.max(...passedUp)
  const handled = grades.filter((g) => (rungAccuracy(results, g) ?? 0) >= DOWN_THRESHOLD)
  if (handled.length) return Math.max(...handled)
  return grades.length ? Math.min(...grades) : startGradeNum
}
