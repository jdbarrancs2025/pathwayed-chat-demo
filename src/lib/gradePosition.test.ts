import { describe, it, expect } from 'vitest'
import {
  buildGradePosition,
  buildSubjectPosition,
  positionCopy,
  CLEARED_FOR_GRADE,
  type GradeSkill,
} from './gradePosition'
import type { SkillEvidence } from './pickNextSkill'

const skill = (id: string, subject: string, grade: number | null): GradeSkill => ({
  skill_id: id,
  subject,
  ccss_grade_num: grade,
})

const cleared = (): SkillEvidence => ({ status: 'advanced', evidence_accuracy: 80, attempts_counted: 6 })
const practicing = (): SkillEvidence => ({ status: 'practicing', evidence_accuracy: 40, attempts_counted: 5 })

/** n published math skills at `grade`, the first `clearedCount` of them cleared. */
function grade(gradeNum: number, published: number, clearedCount: number, subject = 'math') {
  const skills: GradeSkill[] = []
  const ev = new Map<string, SkillEvidence>()
  for (let i = 0; i < published; i++) {
    const id = `${subject}-${gradeNum}-${i}`
    skills.push(skill(id, subject, gradeNum))
    if (i < clearedCount) ev.set(id, cleared())
  }
  return { skills, ev }
}

function merge(...parts: { skills: GradeSkill[]; ev: Map<string, SkillEvidence> }[]) {
  const skills = parts.flatMap((p) => p.skills)
  const ev = new Map<string, SkillEvidence>()
  for (const p of parts) for (const [k, v] of p.ev) ev.set(k, v)
  return { skills, ev }
}

describe('the 3-cleared rule', () => {
  it('names a grade at exactly 3 cleared, not at 2', () => {
    expect(CLEARED_FOR_GRADE).toBe(3)
    const two = grade(6, 8, 2)
    expect(buildSubjectPosition('math', 6, two.skills, two.ev).workingGrade).toBeNull()
    const three = grade(6, 8, 3)
    expect(buildSubjectPosition('math', 6, three.skills, three.ev).workingGrade).toBe(6)
  })

  it('takes the HIGHEST qualifying grade, not the lowest', () => {
    const { skills, ev } = merge(grade(5, 8, 8), grade(6, 8, 4), grade(7, 8, 2))
    const p = buildSubjectPosition('math', 5, skills, ev)
    expect(p.workingGrade).toBe(6) // grade 7 has only 2 cleared
    expect(p.atWorkingGrade).toEqual({ grade: 6, cleared: 4, published: 8 })
  })

  it('only counts advanced or mastered as cleared', () => {
    const { skills } = grade(6, 8, 0)
    const ev = new Map<string, SkillEvidence>()
    skills.slice(0, 5).forEach((s) => ev.set(s.skill_id, practicing()))
    expect(buildSubjectPosition('math', 6, skills, ev).workingGrade).toBeNull()
  })

  it('keeps subjects separate', () => {
    const { skills, ev } = merge(grade(6, 8, 4, 'math'), grade(3, 4, 4, 'reading'))
    expect(buildSubjectPosition('math', 6, skills, ev).workingGrade).toBe(6)
    expect(buildSubjectPosition('reading', 6, skills, ev).workingGrade).toBe(3)
  })

  it('ignores skills with no grade tag', () => {
    const skills = [skill('a', 'math', null), skill('b', 'math', null), skill('c', 'math', null)]
    const ev = new Map(skills.map((s) => [s.skill_id, cleared()]))
    expect(buildSubjectPosition('math', 6, skills, ev).workingGrade).toBeNull()
  })

  it('omits a subject that publishes no graded skills', () => {
    const { skills, ev } = grade(6, 8, 4, 'math')
    const out = buildGradePosition({ grade: '6', subjects: ['math', 'science'], skills, evidence: ev })
    expect(out.map((p) => p.subject)).toEqual(['math'])
  })
})

describe('copy - a grade is established', () => {
  it('states the count, never a level or an equivalent', () => {
    const { skills, ev } = merge(grade(7, 6, 4), grade(8, 6, 0))
    const c = positionCopy(buildSubjectPosition('math', 6, skills, ev), 'Peyton', 'Math')
    expect(c.headline).toBe('Peyton has cleared 4 of the 6 grade 7 math skills.')
    expect(c.context).toBe('That is a grade above grade 6, where Peyton is enrolled.')
    expect(c.next).toBe('Next up is grade 8 math, with 6 skills to work through.')
    // No grade-equivalent language anywhere.
    const all = [c.headline, c.context, c.next].join(' ')
    expect(all).not.toMatch(/level|equivalent|\d\.\d/)
  })

  it('says plainly when the child is at their enrolled grade', () => {
    const { skills, ev } = grade(6, 8, 3)
    const c = positionCopy(buildSubjectPosition('math', 6, skills, ev), 'Peyton', 'Math')
    expect(c.context).toBe('That is the grade Peyton is enrolled in.')
  })

  it('never frames a lower grade as being behind', () => {
    const { skills, ev } = grade(4, 6, 3)
    const c = positionCopy(buildSubjectPosition('math', 8, skills, ev), 'Peyton', 'Math')
    expect(c.context).toBe(
      'Peyton is enrolled in grade 8. This is the highest grade where we have enough evidence so far.',
    )
    expect(c.context).not.toMatch(/behind|below|struggl|failing/i)
  })

  it('counts multiple grades ahead correctly', () => {
    const { skills, ev } = grade(8, 6, 3)
    const c = positionCopy(buildSubjectPosition('math', 6, skills, ev), 'Peyton', 'Math')
    expect(c.context).toBe('That is 2 grades above grade 6, where Peyton is enrolled.')
  })

  it('reports partial progress at the next grade', () => {
    const { skills, ev } = merge(grade(7, 6, 4), grade(8, 6, 2))
    const c = positionCopy(buildSubjectPosition('math', 7, skills, ev), 'Peyton', 'Math')
    expect(c.next).toBe('Peyton has also cleared 2 of the 6 grade 8 math skills.')
  })

  it('BLAMES US, not the child, for a hole in the ladder', () => {
    // Reading publishes nothing at grades 4 to 8 in production.
    const { skills, ev } = grade(3, 4, 3, 'reading')
    const c = positionCopy(buildSubjectPosition('reading', 6, skills, ev), 'Peyton', 'Reading')
    expect(c.next).toBe(
      'We do not publish grade 4 reading skills yet, so there is nothing to clear there.',
    )
    expect(c.next).not.toMatch(/Peyton/)
  })

  it('says kindergarten rather than grade 0', () => {
    const { skills, ev } = grade(0, 4, 3)
    const c = positionCopy(buildSubjectPosition('math', 1, skills, ev), 'Peyton', 'Math')
    expect(c.headline).toBe('Peyton has cleared 3 of the 4 kindergarten math skills.')
  })
})

describe('copy - not enough yet', () => {
  it('names no grade, and says how close they are', () => {
    const { skills, ev } = grade(6, 8, 2)
    const c = positionCopy(buildSubjectPosition('math', 6, skills, ev), 'Peyton', 'Math')
    expect(c.headline).toBe('Not enough yet in math.')
    expect(c.context).toBe(
      'Peyton has cleared 2 of the 8 grade 6 math skills. 1 more at one grade and we will name it.',
    )
    expect(c.next).toBeNull()
  })

  it('handles a child who has cleared nothing at all', () => {
    const { skills, ev } = grade(6, 8, 0)
    const c = positionCopy(buildSubjectPosition('math', 6, skills, ev), 'Peyton', 'Math')
    expect(c.headline).toBe('Not enough yet in math.')
    expect(c.context).toBe(
      'Once Peyton has cleared 3 skills at the same grade, we will show which grade those skills come from.',
    )
  })

  it('never implies failure', () => {
    const { skills, ev } = grade(6, 8, 1)
    const c = positionCopy(buildSubjectPosition('math', 6, skills, ev), 'Peyton', 'Math')
    const all = [c.headline, c.context].join(' ')
    expect(all).not.toMatch(/behind|below|fail|struggl|weak|poor/i)
  })
})

describe('copy hygiene', () => {
  it('contains no dash characters anywhere', () => {
    const cases = [grade(7, 6, 4), grade(6, 8, 2), grade(6, 8, 0)]
    for (const { skills, ev } of cases) {
      const c = positionCopy(buildSubjectPosition('math', 6, skills, ev), 'Peyton', 'Math')
      expect([c.headline, c.context, c.next].join(' ')).not.toMatch(/[–—]/)
    }
  })
})
