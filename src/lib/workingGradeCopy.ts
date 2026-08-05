import { gradeNum, workingGradeNum, type LadderStudent } from '@/lib/gradeLadder'

/**
 * Parent-facing copy for a child who has moved up the skill ladder.
 *
 * CONSENT GOVERNS FRAMING, NOT SERVING. The child is served material they have
 * earned either way; above_grade_ok only decides whether the parent dashboard
 * LEADS with the above-grade fact. This mirrors placementCopy() in
 * subjectPlacement.ts and showKidSatFraming() in satFraming.ts, which soften
 * above-grade results to on-grade language when the parent has not opted in.
 *
 * Without consent the line stays truthful but grade-neutral: the parent is told
 * their child finished their grade's skills and moved on to new material, without
 * the next grade being named or emphasized.
 */

export interface WorkingGradeNotice {
  /** The headline sentence for the parent dashboard. */
  headline: string
  /** The stored reason for the promotion, or null when none was recorded. */
  detail: string | null
}

function gradeWord(n: number): string {
  return n === 0 ? 'kindergarten' : `grade ${n}`
}

/** Sentence-case the stored reason so it reads as its own line. */
function asSentence(reason: string): string {
  const trimmed = reason.trim()
  if (!trimmed) return ''
  const body = trimmed.charAt(0).toUpperCase() + trimmed.slice(1)
  return /[.!?]$/.test(body) ? body : `${body}.`
}

/**
 * The dashboard notice, or null when there is nothing to say: the child has not
 * been promoted, or their working grade has not yet overtaken their real grade.
 */
export function workingGradeNotice(
  student: LadderStudent & { first_name: string; working_grade_reason?: string | null },
): WorkingGradeNotice | null {
  if (student.working_grade == null) return null
  const from = gradeNum(student.grade)
  const to = workingGradeNum(student)
  if (to <= from) return null

  const name = student.first_name
  const detail = student.working_grade_reason ? asSentence(student.working_grade_reason) : null

  if (!student.above_grade_ok) {
    return {
      headline: `${name} has finished the ${gradeWord(from)} skills and is moving on to new material.`,
      detail,
    }
  }
  return {
    headline: `${name} has finished the ${gradeWord(from)} skills and is now working on ${gradeWord(to)} material.`,
    detail,
  }
}
