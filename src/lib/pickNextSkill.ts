import type { MasteryStatus } from '@/lib/mastery'

/**
 * Which skill is genuinely "next" for a student — the pure ranking behind the
 * practice picker. Split out from questions.ts so it is unit-testable without a
 * database.
 *
 * WHY THIS EXISTS. The picker used to rank on student_skill_mastery.mastery_percentage,
 * the legacy self-rating ramp (nextMastery in skills.ts), which climbs with the
 * ATTEMPT COUNT rather than with evidence. A student could sit at 88% accuracy over
 * 16 graded attempts with status 'advanced' and still hold the lowest
 * mastery_percentage in the list, so the picker handed them the same skill every
 * single day. Ranking now reads the evidence signals the DB computes from real
 * graded attempts (migration 0010): status, evidence_accuracy, attempts_counted.
 *
 * mastery_percentage is still written, and still drives the Pathway score and the
 * parent progress bars. It is no longer consulted for "what next".
 */

export interface RankableSkill {
  skill_id: string
  name: string
  /** True Common Core grade ('K'=0 .. 12), or null when the skill is untagged. */
  ccss_grade_num: number | null
}

export interface SkillEvidence {
  status: MasteryStatus
  /** Accuracy over quality attempts, or null when there is no evidence yet. */
  evidence_accuracy: number | null
  attempts_counted: number
}

/**
 * Has the student already cleared the ADVANCE bar on this skill? Advanced and
 * mastered both mean "ready for the next thing", so neither is ever "next".
 * A missing row means no evidence at all, which is NOT cleared.
 */
export function isCleared(ev: SkillEvidence | undefined | null): boolean {
  return ev?.status === 'advanced' || ev?.status === 'mastered'
}

/** Does this skill have real graded evidence behind it, or is it untouched? */
function hasEvidence(ev: SkillEvidence | undefined | null): boolean {
  return !!ev && ev.attempts_counted > 0 && ev.evidence_accuracy != null
}

/** Untagged skills sort last rather than jumping to the front of a grade order. */
function gradeKey(n: number | null): number {
  return n == null ? Number.POSITIVE_INFINITY : n
}

/**
 * Rank skills by how much the student needs them next, weakest-first, after
 * dropping everything they have already cleared.
 *
 *   Tier 0 — skills with graded evidence, ordered by evidence_accuracy ASC.
 *            The weakest real gap leads. Ties break on attempts_counted ASC so a
 *            fresh weak skill is preferred over one already ground on, which stops
 *            the picker from parking a student on a single stubborn skill.
 *   Tier 1 — skills with no evidence yet, in curriculum order (grade, then name).
 *            Forward progress once the known gaps are cleared.
 *
 * Returns a new array; the input is not mutated.
 */
export function rankSkills<T extends RankableSkill>(
  skills: T[],
  evidenceBySkillId: Map<string, SkillEvidence>,
): T[] {
  const open = skills.filter((s) => !isCleared(evidenceBySkillId.get(s.skill_id)))
  return [...open].sort((a, b) => {
    const ea = evidenceBySkillId.get(a.skill_id)
    const eb = evidenceBySkillId.get(b.skill_id)
    const ta = hasEvidence(ea) ? 0 : 1
    const tb = hasEvidence(eb) ? 0 : 1
    if (ta !== tb) return ta - tb
    if (ta === 0) {
      const accA = ea!.evidence_accuracy!
      const accB = eb!.evidence_accuracy!
      if (accA !== accB) return accA - accB
      if (ea!.attempts_counted !== eb!.attempts_counted) {
        return ea!.attempts_counted - eb!.attempts_counted
      }
    }
    return gradeKey(a.ccss_grade_num) - gradeKey(b.ccss_grade_num) || a.name.localeCompare(b.name)
  })
}

/**
 * The single next skill, or null when the student has cleared every skill offered.
 * Null is the honest answer: the caller should widen the pool or celebrate, not
 * re-serve something already at 'advanced'.
 */
export function pickNextSkill<T extends RankableSkill>(
  skills: T[],
  evidenceBySkillId: Map<string, SkillEvidence>,
): T | null {
  return rankSkills(skills, evidenceBySkillId)[0] ?? null
}
