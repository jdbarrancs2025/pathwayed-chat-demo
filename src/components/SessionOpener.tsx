import type { ReactNode } from 'react'
import { useNavigate } from 'react-router'
import { HOMEWORK } from '@/lib/subjects'
import type { PracticeableSkill } from '@/lib/questions'
import type { StudentLevel } from '@/lib/students'
import { openerOrder, type OpenerActionKey } from '@/lib/opener'

/**
 * Session opener — the "meet them where they are" daily entry branch. Presents
 * both paths, ALWAYS available:
 *   - Homework help (promotes the existing homework flow to the entry point).
 *   - Keep going where you left off — the coach's next weakest practiceable skill,
 *     from seeded/earned mastery, so it picks up at the child's real level.
 * Re-checking their level (the diagnostic) is always reachable too — mastery is
 * truth, the kid is never trapped.
 *
 * Order/emphasis follows the child's onboarding challenge level via openerOrder()
 * (getting-ahead/advanced lead with "keep going"; on-grade leads with homework).
 * Both cards always render — order only. openerOrder() is the seam where a
 * usage-history override can slot in later without touching this component.
 */
export function SessionOpener({
  studentId,
  studentName,
  level,
  nextSkill,
}: {
  studentId: string
  studentName: string
  level: StudentLevel
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

  // Order decided by openerOrder() (the seam); both cards always render.
  const cards: Record<OpenerActionKey, ReactNode | null> = { homework, keepgoing: keepGoing }
  const actions = openerOrder(level)
    .map((key) => cards[key])
    .filter(Boolean)

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
