import { listPracticeableSkills, fetchSkillEvidence, type LadderStudentRow } from '@/lib/questions'
import { shouldRaiseWorkingGrade, type WorkingGradeRaise } from '@/lib/gradeLadder'
import { raiseWorkingGrade } from '@/lib/students'

/**
 * Ceiling detection — the write side of the grade ladder. Run after a practice
 * session records its result: if that session was the one that cleared the last
 * skill at the student's working grade in a subject, move them up a rung.
 *
 * Deliberately called from the END of a session rather than from a trigger, so the
 * promotion lands on freshly recomputed evidence (recompute_skill_mastery runs on
 * every graded attempt insert) and a student sees the new rung on their next visit.
 *
 * Best-effort and non-blocking: a failure leaves the student where they are, and
 * the next completed session gets another chance.
 */
export async function checkAndRaiseWorkingGrade(
  student: LadderStudentRow,
): Promise<WorkingGradeRaise | null> {
  try {
    const [skills, evidence] = await Promise.all([
      listPracticeableSkills(),
      fetchSkillEvidence(student.id),
    ])
    const raise = shouldRaiseWorkingGrade(student, skills, evidence)
    if (!raise) return null
    const written = await raiseWorkingGrade(student.id, raise.to, raise.reason)
    return written ? raise : null
  } catch (err) {
    console.error('checkAndRaiseWorkingGrade threw', { err, studentId: student.id })
    return null
  }
}

