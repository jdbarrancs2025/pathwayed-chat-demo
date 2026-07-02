import { useNavigate } from 'react-router'
import { HOMEWORK } from '@/lib/subjects'
import type { PracticeableSkill } from '@/lib/questions'

/**
 * Session opener — the "meet them where they are" daily entry branch. Presents
 * both paths, ALWAYS available:
 *   - Homework help (promotes the existing homework flow to the entry point).
 *   - Keep going where you left off — the coach's next weakest practiceable skill,
 *     from seeded/earned mastery, so it picks up at the child's real level.
 * Re-checking their level (the diagnostic) is always reachable too — mastery is
 * truth, the kid is never trapped.
 *
 * Phase A renders a FIXED order (homework first). The `actions` array is the seam
 * Phase B uses to lead with the level-appropriate option; a usage-history
 * override can slot into the same ordering step later without rework.
 */
export function SessionOpener({
  studentId,
  studentName,
  nextSkill,
}: {
  studentId: string
  studentName: string
  nextSkill: PracticeableSkill | null
}) {
  const navigate = useNavigate()

  const homework = (
    <button
      key="homework"
      className="bigcard"
      onClick={() => navigate(`/students/${studentId}/session/homework`)}
    >
      <div
        className="ico"
        style={{ background: HOMEWORK.accent }}
        dangerouslySetInnerHTML={{ __html: HOMEWORK.icon }}
      />
      <div>
        <h3>Homework help</h3>
        <p>Have homework today? Upload a photo or PDF and work through it with Nikki.</p>
      </div>
    </button>
  )

  const keepGoing = nextSkill ? (
    <button
      key="keepgoing"
      className="bigcard"
      onClick={() => navigate(`/students/${studentId}/practice/${nextSkill.slug}`)}
    >
      <div className="ico" style={{ background: 'var(--grow)', color: '#fff', fontSize: 22 }}>
        ✦
      </div>
      <div>
        <h3>Keep going where you left off</h3>
        <p>Pick up at your level with {nextSkill.name}.</p>
      </div>
    </button>
  ) : null

  // SEAM: Phase A order is fixed (homework first). Phase B reorders this array by
  // the child's challenge level; a usage-history override can hook in here later.
  const actions = [homework, keepGoing].filter(Boolean)

  return (
    <section className="opener">
      {actions}
      <button
        type="button"
        className="opener-reassess"
        onClick={() => navigate(`/students/${studentId}/diagnostic`)}
      >
        Not quite right? Re-check {studentName}’s level
      </button>
    </section>
  )
}
