import { describe, it, expect } from 'vitest'
import {
  CONTENT_AGE_CEILING_OFFSET,
  bandFloorGrade,
  canPromoteToNextBand,
  canWiden,
  contentAgeCeiling,
  eligibleSkills,
  gradeNum,
  isAgePinned,
  nextBand,
  shouldRaiseWorkingGrade,
  skillCeiling,
  strandClearedAtWorkingGrade,
  workingGradeNum,
  type LadderSkill,
  type LadderStudent,
} from './gradeLadder'
import type { SkillEvidence } from './pickNextSkill'

const student = (over: Partial<LadderStudent> = {}): LadderStudent => ({
  grade: '9',
  working_grade: null,
  above_grade_ok: false,
  ...over,
})

const skill = (over: Partial<LadderSkill> & { skill_id: string }): LadderSkill => ({
  slug: over.skill_id,
  name: over.skill_id,
  subject: 'math',
  ccss_grade_num: 9,
  has_passages: false,
  prerequisite_skills: null,
  ...over,
})

const cleared = (): SkillEvidence => ({ status: 'advanced', evidence_accuracy: 88, attempts_counted: 16 })
const open = (): SkillEvidence => ({ status: 'practicing', evidence_accuracy: 40, attempts_counted: 5 })
const ev = (pairs: [string, SkillEvidence][]) => new Map(pairs)

describe('gradeNum / workingGradeNum', () => {
  it('maps K to 0 and numeric grades to themselves', () => {
    expect(gradeNum('K')).toBe(0)
    expect(gradeNum('7')).toBe(7)
    expect(gradeNum('12')).toBe(12)
  })

  it('treats an unknown grade as the youngest, matching gradeBand', () => {
    expect(gradeNum(undefined)).toBe(0)
    expect(gradeNum('')).toBe(0)
    expect(gradeNum('senior')).toBe(0)
  })

  it('clamps out-of-range grades into K..12', () => {
    expect(gradeNum('99')).toBe(12)
    expect(gradeNum('-3')).toBe(0)
  })

  it('defaults working grade to the chronological grade when null', () => {
    expect(workingGradeNum(student({ grade: '5', working_grade: null }))).toBe(5)
    expect(workingGradeNum(student({ grade: '5', working_grade: 7 }))).toBe(7)
  })
})

describe('content age ceiling (age safety)', () => {
  it('is pinned at the chronological grade, offset zero', () => {
    expect(CONTENT_AGE_CEILING_OFFSET).toBe(0)
    expect(contentAgeCeiling(student({ grade: '2', working_grade: 8 }))).toBe(2)
  })

  it('does not move when the working grade runs ahead', () => {
    const s = student({ grade: '1', working_grade: 11 })
    expect(workingGradeNum(s)).toBe(11)
    expect(contentAgeCeiling(s)).toBe(1)
  })

  it('flags reading and any passage-backed skill as age-carrying', () => {
    expect(isAgePinned(skill({ skill_id: 'r', subject: 'reading' }))).toBe(true)
    expect(isAgePinned(skill({ skill_id: 'w', subject: 'writing', has_passages: true }))).toBe(true)
    expect(isAgePinned(skill({ skill_id: 'm', subject: 'math' }))).toBe(false)
  })

  it('caps an age-carrying skill at the real grade even when widened', () => {
    // A grade 2 child decoding at a grade 8 level: the SKILL ceiling follows their
    // working grade, the READING ceiling does not.
    const s = student({ grade: '2', working_grade: 8, above_grade_ok: true })
    expect(skillCeiling(s, skill({ skill_id: 'm', subject: 'math' }), true)).toBe(9)
    expect(skillCeiling(s, skill({ skill_id: 'r', subject: 'reading' }), true)).toBe(2)
    expect(skillCeiling(s, skill({ skill_id: 'p', subject: 'writing', has_passages: true }), true)).toBe(2)
  })
})

describe('the widening rule', () => {
  const atGrade = [
    skill({ skill_id: 'a', ccss_grade_num: 9 }),
    skill({ skill_id: 'b', ccss_grade_num: 9 }),
  ]

  it('widens when the parent has opted in, without any evidence', () => {
    expect(canWiden(student({ above_grade_ok: true }), atGrade, ev([]), 'math')).toBe(true)
  })

  it('widens when every skill at the working grade in that strand is cleared', () => {
    const evidence = ev([
      ['a', cleared()],
      ['b', cleared()],
    ])
    expect(canWiden(student(), atGrade, evidence, 'math')).toBe(true)
  })

  it('does NOT widen while one skill at the working grade is still open', () => {
    const evidence = ev([
      ['a', cleared()],
      ['b', open()],
    ])
    expect(canWiden(student(), atGrade, evidence, 'math')).toBe(false)
  })

  it('does not widen on a vacuous truth when the strand has no content at that grade', () => {
    // Reading has no published skills at grades 4 through 8 in production.
    const readingSkills = [skill({ skill_id: 'r3', subject: 'reading', ccss_grade_num: 3 })]
    expect(strandClearedAtWorkingGrade(student({ grade: '6' }), readingSkills, ev([]), 'reading')).toBe(false)
    expect(canWiden(student({ grade: '6' }), readingSkills, ev([]), 'reading')).toBe(false)
  })

  it('is evaluated per strand, not globally', () => {
    const skills = [
      skill({ skill_id: 'm9', subject: 'math', ccss_grade_num: 9 }),
      skill({ skill_id: 'w9', subject: 'writing', ccss_grade_num: 9 }),
    ]
    const evidence = ev([['m9', cleared()]])
    expect(canWiden(student(), skills, evidence, 'math')).toBe(true)
    expect(canWiden(student(), skills, evidence, 'writing')).toBe(false)
  })

  it('widens by exactly one grade, never two', () => {
    const s = student({ grade: '9', above_grade_ok: true })
    const m = skill({ skill_id: 'm', subject: 'math' })
    expect(skillCeiling(s, m, true)).toBe(10)
    expect(skillCeiling(s, m, false)).toBe(9)
  })

  it('never lets the ceiling exceed grade 12', () => {
    const s = student({ grade: '12', above_grade_ok: true })
    expect(skillCeiling(s, skill({ skill_id: 'm' }), true)).toBe(12)
  })
})

describe('eligibleSkills — ceiling, no floor', () => {
  it('drops skills the student has already cleared', () => {
    const skills = [
      skill({ skill_id: 'done', ccss_grade_num: 9 }),
      skill({ skill_id: 'todo', ccss_grade_num: 9 }),
    ]
    const out = eligibleSkills({ student: student(), skills, evidence: ev([['done', cleared()]]) })
    expect(out.map((s) => s.skill_id)).toEqual(['todo'])
  })

  it('excludes above-ceiling skills until the widening is earned', () => {
    const skills = [
      skill({ skill_id: 'g9', ccss_grade_num: 9 }),
      skill({ skill_id: 'g10', ccss_grade_num: 10 }),
      skill({ skill_id: 'g11', ccss_grade_num: 11 }),
    ]
    const notYet = eligibleSkills({ student: student(), skills, evidence: ev([]) })
    expect(notYet.map((s) => s.skill_id)).toEqual(['g9'])

    // Clear grade 9, and grade 10 opens up. Grade 11 stays shut.
    const earned = eligibleSkills({
      student: student(),
      skills,
      evidence: ev([['g9', cleared()]]),
    })
    expect(earned.map((s) => s.skill_id)).toEqual(['g10'])
  })

  it('keeps below-band skills OUT by default', () => {
    const skills = [
      skill({ skill_id: 'g9', ccss_grade_num: 9 }),
      skill({ skill_id: 'g3', ccss_grade_num: 3 }),
    ]
    const out = eligibleSkills({ student: student(), skills, evidence: ev([]) })
    expect(out.map((s) => s.skill_id)).toEqual(['g9'])
  })

  it('admits a below-band skill with an unresolved focus row', () => {
    const skills = [
      skill({ skill_id: 'g9', ccss_grade_num: 9 }),
      skill({ skill_id: 'g3', ccss_grade_num: 3 }),
    ]
    const out = eligibleSkills({
      student: student(),
      skills,
      evidence: ev([]),
      focusSkillIds: new Set(['g3']),
    })
    expect(out.map((s) => s.skill_id).sort()).toEqual(['g3', 'g9'])
  })

  it('admits a below-band skill the student has previously got wrong', () => {
    const skills = [
      skill({ skill_id: 'g9', ccss_grade_num: 9 }),
      skill({ skill_id: 'g3', ccss_grade_num: 3 }),
    ]
    const out = eligibleSkills({
      student: student(),
      skills,
      evidence: ev([]),
      missedSkillIds: new Set(['g3']),
    })
    expect(out.map((s) => s.skill_id).sort()).toEqual(['g3', 'g9'])
  })

  it('admits a below-band skill that is an unmet prerequisite of an in-band skill', () => {
    const skills = [
      skill({ skill_id: 'g9', ccss_grade_num: 9, prerequisite_skills: ['mult'] }),
      skill({ skill_id: 'mult', slug: 'mult', ccss_grade_num: 3 }),
      skill({ skill_id: 'g3other', slug: 'g3other', ccss_grade_num: 3 }),
    ]
    const out = eligibleSkills({ student: student(), skills, evidence: ev([]) })
    expect(out.map((s) => s.skill_id).sort()).toEqual(['g9', 'mult'])
  })

  it('does not admit a prerequisite the student has already cleared', () => {
    const skills = [
      skill({ skill_id: 'g9', ccss_grade_num: 9, prerequisite_skills: ['mult'] }),
      skill({ skill_id: 'mult', slug: 'mult', ccss_grade_num: 3 }),
    ]
    const out = eligibleSkills({ student: student(), skills, evidence: ev([['mult', cleared()]]) })
    expect(out.map((s) => s.skill_id)).toEqual(['g9'])
  })

  it('falls back per strand rather than handing back an empty subject', () => {
    // Grade 6 student: reading is published only at grades 0-3, all below band.
    // No focus, no misses, no prerequisites — but reading must not come back empty.
    const skills = [
      skill({ skill_id: 'm6', subject: 'math', ccss_grade_num: 6 }),
      skill({ skill_id: 'r3', subject: 'reading', ccss_grade_num: 3 }),
      skill({ skill_id: 'r2', subject: 'reading', ccss_grade_num: 2 }),
    ]
    const out = eligibleSkills({ student: student({ grade: '6' }), skills, evidence: ev([]) })
    expect(out.map((s) => s.skill_id).sort()).toEqual(['m6', 'r2', 'r3'])
  })

  it('keeps untagged skills rather than silently dropping content', () => {
    const skills = [skill({ skill_id: 'untagged', ccss_grade_num: null })]
    const out = eligibleSkills({ student: student(), skills, evidence: ev([]) })
    expect(out.map((s) => s.skill_id)).toEqual(['untagged'])
  })

  it('never serves a young child above-age reading, however far ahead their skill is', () => {
    const skills = [
      skill({ skill_id: 'r2', subject: 'reading', ccss_grade_num: 2 }),
      skill({ skill_id: 'r9', subject: 'reading', ccss_grade_num: 9 }),
      skill({ skill_id: 'm9', subject: 'math', ccss_grade_num: 9 }),
    ]
    const s = student({ grade: '2', working_grade: 9, above_grade_ok: true })
    const out = eligibleSkills({ student: s, skills, evidence: ev([]) })
    expect(out.map((x) => x.skill_id).sort()).toEqual(['m9', 'r2'])
  })
})

describe('the ceiling rule (working grade promotion)', () => {
  const g9 = [
    skill({ skill_id: 'a', ccss_grade_num: 9 }),
    skill({ skill_id: 'b', ccss_grade_num: 9 }),
  ]

  it('raises by exactly one when a strand at the working grade is cleared', () => {
    const raise = shouldRaiseWorkingGrade(student(), g9, ev([['a', cleared()], ['b', cleared()]]))
    expect(raise).toEqual({ from: 9, to: 10, reason: 'cleared every grade 9 math skill' })
  })

  it('does not raise while a skill at the working grade is still open', () => {
    expect(shouldRaiseWorkingGrade(student(), g9, ev([['a', cleared()], ['b', open()]]))).toBeNull()
  })

  it('does not raise on no evidence at all', () => {
    expect(shouldRaiseWorkingGrade(student(), g9, ev([]))).toBeNull()
  })

  it('starts from the working grade once set, not the chronological grade', () => {
    const s = student({ grade: '9', working_grade: 10 })
    const g10 = [skill({ skill_id: 'c', ccss_grade_num: 10 })]
    expect(shouldRaiseWorkingGrade(s, g10, ev([['c', cleared()]]))).toEqual({
      from: 10,
      to: 11,
      reason: 'cleared every grade 10 math skill',
    })
  })

  it('names kindergarten rather than "grade 0"', () => {
    const s = student({ grade: 'K' })
    const k = [skill({ skill_id: 'k1', ccss_grade_num: 0 })]
    expect(shouldRaiseWorkingGrade(s, k, ev([['k1', cleared()]]))?.reason).toBe(
      'cleared every kindergarten math skill',
    )
  })

  it('stops at grade 12', () => {
    const s = student({ grade: '12', working_grade: 12 })
    const g12 = [skill({ skill_id: 'z', ccss_grade_num: 12 })]
    expect(shouldRaiseWorkingGrade(s, g12, ev([['z', cleared()]]))).toBeNull()
  })

  it('ignores prep-only strands', () => {
    const skills = [skill({ skill_id: 'p', subject: 'prep-verbal', ccss_grade_num: 9 })]
    expect(shouldRaiseWorkingGrade(student(), skills, ev([['p', cleared()]]))).toBeNull()
  })

  it('never proposes a decrease', () => {
    const s = student({ grade: '9', working_grade: 11 })
    const raise = shouldRaiseWorkingGrade(s, [skill({ skill_id: 'x', ccss_grade_num: 11 })], ev([['x', cleared()]]))
    expect(raise!.to).toBeGreaterThan(raise!.from)
  })
})

describe('band promotion (the track dead end)', () => {
  it('maps bands to floors and successors', () => {
    expect(bandFloorGrade('k-2')).toBe(0)
    expect(bandFloorGrade('3-5')).toBe(3)
    expect(bandFloorGrade('6-8')).toBe(6)
    expect(bandFloorGrade('9-12')).toBe(9)
    expect(nextBand('6-8')).toBe('9-12')
    expect(nextBand('9-12')).toBeNull()
  })

  it('promotes a grade 8 student into 9-12 once the widening is earned', () => {
    const s = student({ grade: '8' })
    const skills = [skill({ skill_id: 'm8', ccss_grade_num: 8 })]
    expect(canPromoteToNextBand(s, '6-8', 'math', skills, ev([['m8', cleared()]]))).toBe('9-12')
  })

  it('refuses the crossing while the widening is unearned', () => {
    const s = student({ grade: '8' })
    const skills = [skill({ skill_id: 'm8', ccss_grade_num: 8 })]
    expect(canPromoteToNextBand(s, '6-8', 'math', skills, ev([['m8', open()]]))).toBeNull()
  })

  it('never promotes past the top band', () => {
    const s = student({ grade: '12', above_grade_ok: true })
    expect(canPromoteToNextBand(s, '9-12', 'math', [], ev([]))).toBeNull()
  })

  it('will not promote reading past the chronological grade', () => {
    // Grade 2 child, working grade 8, consent given. Math would cross; reading
    // must not, because reading carries age-bearing material.
    const s = student({ grade: '2', working_grade: 8, above_grade_ok: true })
    expect(canPromoteToNextBand(s, 'k-2', 'math', [], ev([]))).toBe('3-5')
    expect(canPromoteToNextBand(s, 'k-2', 'reading', [], ev([]))).toBeNull()
  })
})
