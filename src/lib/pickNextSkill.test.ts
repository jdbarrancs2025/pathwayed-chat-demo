import { describe, it, expect } from 'vitest'
import { isCleared, rankSkills, pickNextSkill, type SkillEvidence } from './pickNextSkill'

const skill = (skill_id: string, name: string, ccss_grade_num: number | null = 3) => ({
  skill_id,
  name,
  ccss_grade_num,
})

const ev = (
  status: SkillEvidence['status'],
  evidence_accuracy: number | null,
  attempts_counted: number,
): SkillEvidence => ({ status, evidence_accuracy, attempts_counted })

describe('isCleared', () => {
  it('treats advanced and mastered as cleared', () => {
    expect(isCleared(ev('advanced', 88, 16))).toBe(true)
    expect(isCleared(ev('mastered', 95, 20))).toBe(true)
  })

  it('treats practicing, not_started, and a missing row as not cleared', () => {
    expect(isCleared(ev('practicing', 40, 6))).toBe(false)
    expect(isCleared(ev('not_started', null, 0))).toBe(false)
    expect(isCleared(undefined)).toBe(false)
  })
})

describe('rankSkills — the production loop', () => {
  it('never returns a skill the student has already advanced past', () => {
    // The exact production row: grade 9 student, grade 3 Multiplication, 16 graded
    // attempts at 87.5%, status advanced, mastery_percentage stuck at 25.
    const skills = [skill('s-mult', 'Multiplication', 3), skill('s-pct', 'Percentages', 6)]
    const evidence = new Map([
      ['s-mult', ev('advanced', 87.5, 16)],
      ['s-pct', ev('practicing', 28.6, 7)],
    ])
    const ranked = rankSkills(skills, evidence)
    expect(ranked.map((s) => s.skill_id)).toEqual(['s-pct'])
    expect(pickNextSkill(skills, evidence)?.skill_id).toBe('s-pct')
  })

  it('ignores mastery_percentage entirely — evidence decides', () => {
    // s-low would win on the OLD mastery_percentage ranking (it is the legacy
    // low scorer) but it is cleared on evidence, so it must not be picked.
    const skills = [skill('s-low', 'Cleared but low legacy score', 3), skill('s-weak', 'Real gap', 3)]
    const evidence = new Map([
      ['s-low', ev('advanced', 90, 12)],
      ['s-weak', ev('practicing', 55, 5)],
    ])
    expect(pickNextSkill(skills, evidence)?.skill_id).toBe('s-weak')
  })
})

describe('rankSkills — ordering', () => {
  it('puts the weakest evidence first', () => {
    const skills = [skill('a', 'A'), skill('b', 'B'), skill('c', 'C')]
    const evidence = new Map([
      ['a', ev('practicing', 65, 5)],
      ['b', ev('practicing', 20, 5)],
      ['c', ev('practicing', 45, 5)],
    ])
    expect(rankSkills(skills, evidence).map((s) => s.skill_id)).toEqual(['b', 'c', 'a'])
  })

  it('breaks an accuracy tie toward the skill with fewer attempts', () => {
    const skills = [skill('ground', 'Ground'), skill('fresh', 'Fresh')]
    const evidence = new Map([
      ['ground', ev('practicing', 40, 22)],
      ['fresh', ev('practicing', 40, 3)],
    ])
    expect(pickNextSkill(skills, evidence)?.skill_id).toBe('fresh')
  })

  it('ranks skills with evidence ahead of untouched skills', () => {
    const skills = [skill('new', 'Untouched', 3), skill('gap', 'Known gap', 3)]
    const evidence = new Map([['gap', ev('practicing', 50, 6)]])
    expect(rankSkills(skills, evidence).map((s) => s.skill_id)).toEqual(['gap', 'new'])
  })

  it('orders untouched skills by grade then name', () => {
    const skills = [skill('g6', 'Zebra', 6), skill('g3b', 'Beta', 3), skill('g3a', 'Alpha', 3)]
    expect(rankSkills(skills, new Map()).map((s) => s.skill_id)).toEqual(['g3a', 'g3b', 'g6'])
  })

  it('sorts untagged skills last instead of first', () => {
    const skills = [skill('untagged', 'Untagged', null), skill('g5', 'Grade five', 5)]
    expect(rankSkills(skills, new Map()).map((s) => s.skill_id)).toEqual(['g5', 'untagged'])
  })

  it('counts a zero-attempt row as untouched, not as 0% evidence', () => {
    const skills = [skill('seeded', 'Seeded row', 3), skill('real', 'Real gap', 3)]
    const evidence = new Map([
      ['seeded', ev('not_started', null, 0)],
      ['real', ev('practicing', 70, 5)],
    ])
    expect(rankSkills(skills, evidence).map((s) => s.skill_id)).toEqual(['real', 'seeded'])
  })
})

describe('pickNextSkill — edges', () => {
  it('returns null when every skill is cleared', () => {
    const skills = [skill('a', 'A'), skill('b', 'B')]
    const evidence = new Map([
      ['a', ev('advanced', 80, 8)],
      ['b', ev('mastered', 92, 14)],
    ])
    expect(pickNextSkill(skills, evidence)).toBeNull()
  })

  it('returns null for an empty skill list', () => {
    expect(pickNextSkill([], new Map())).toBeNull()
  })

  it('does not mutate its input', () => {
    const skills = [skill('b', 'B'), skill('a', 'A')]
    const before = skills.map((s) => s.skill_id)
    rankSkills(skills, new Map())
    expect(skills.map((s) => s.skill_id)).toEqual(before)
  })
})
