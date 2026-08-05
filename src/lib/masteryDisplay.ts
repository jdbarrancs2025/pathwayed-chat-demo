import type { MasteryStatus } from '@/lib/mastery'

/**
 * How a skill's standing is PRESENTED to a parent or a school.
 *
 * WHY THIS EXISTS. The dashboard used to call a skill "Mastered" at
 * mastery_percentage >= 60. That column is the legacy self-rating ramp, and a
 * single correct answer on the placement diagnostic seeds it to exactly 60. So a
 * child could be shown as having mastered a skill they had answered one question
 * about, on a screen we put in front of schools. Against the live database that
 * claim covered 61 skill rows; the evidence supported 2.
 *
 * This module maps the evidence the database actually computes (migration 0010)
 * onto plain language, and refuses to state a claim we cannot back:
 *
 *   MASTERED     status='mastered'. >= 85% over >= 8 quality attempts, confirmed
 *                by a spaced re-check at least 3 days later.
 *   ADVANCED     status='advanced'. >= 70% over >= 5 graded attempts. Ready to
 *                move on, but not a durable claim yet. Shown distinctly.
 *   BUILDING     Real evidence exists and is below the advance bar.
 *   NOT ENOUGH   No counted attempts at all. We say so, and show NO percentage,
 *                because any number here would imply a claim we have not earned.
 */

export type MasteryDisplayState = 'mastered' | 'advanced' | 'building' | 'not-enough'

export interface MasteryEvidenceRow {
  status?: MasteryStatus | null
  evidence_accuracy?: number | null
  attempts_counted?: number | null
}

export interface MasteryDisplay {
  state: MasteryDisplayState
  /** Short label for the chip. */
  label: string
  /** Accuracy to show, or null when we must not show a number. */
  percent: number | null
}

const LABELS: Record<MasteryDisplayState, string> = {
  mastered: 'Mastered',
  advanced: 'Advanced',
  building: 'Building',
  'not-enough': 'Not enough yet',
}

/** Sort key: strongest claims first, unproven skills last. */
const RANK: Record<MasteryDisplayState, number> = {
  mastered: 0,
  advanced: 1,
  building: 2,
  'not-enough': 3,
}

/**
 * The display state for one skill. A row with no counted attempts is always
 * 'not-enough', whatever its status says, so a stale or seeded status can never
 * produce a claim on its own.
 */
export function masteryDisplay(row: MasteryEvidenceRow): MasteryDisplay {
  const attempts = row.attempts_counted ?? 0
  const accuracy = row.evidence_accuracy == null ? null : Math.round(Number(row.evidence_accuracy))
  if (attempts <= 0) return { state: 'not-enough', label: LABELS['not-enough'], percent: null }
  if (row.status === 'mastered') return { state: 'mastered', label: LABELS.mastered, percent: accuracy }
  if (row.status === 'advanced') return { state: 'advanced', label: LABELS.advanced, percent: accuracy }
  return { state: 'building', label: LABELS.building, percent: accuracy }
}

export function displayRank(state: MasteryDisplayState): number {
  return RANK[state]
}

/**
 * The one-line summary on a collapsed subject header. Never reports a mastered
 * count as if it were the whole picture: 'advanced' is named separately, and a
 * subject with no evidence at all says that instead of showing "0 of 12 mastered",
 * which reads as failure when it actually means "we have not asked yet".
 */
export function subjectSummary(rows: MasteryEvidenceRow[]): string {
  const total = rows.length
  if (!total) return 'No skills yet'
  const states = rows.map((r) => masteryDisplay(r).state)
  const withEvidence = states.filter((s) => s !== 'not-enough').length
  if (withEvidence === 0) {
    return total === 1 ? '1 skill, not enough practice yet' : `${total} skills, not enough practice yet`
  }
  const mastered = states.filter((s) => s === 'mastered').length
  const advanced = states.filter((s) => s === 'advanced').length
  const parts = [`${mastered} of ${total} mastered`]
  if (advanced > 0) parts.push(`${advanced} advanced`)
  return parts.join(', ')
}
