import { describe, it, expect } from 'vitest'
import { GAP_MATH_SKILLS, buildGapQuestion, seedForSlot } from './gapMathTemplates'
import { explainMisconception } from './misconceptions'

const KEBAB = /^[a-z][a-z0-9-]*$/

describe.each(GAP_MATH_SKILLS.map((s) => [s.slug, s] as const))('%s — gap-math skill guarantees', (_slug, skill) => {
  it('is tagged to a single CCSS grade + code and the back-compat band', () => {
    expect(skill.subject).toBe('math')
    expect(skill.ccssGrade.length).toBeGreaterThan(0)
    expect(skill.ccssGradeNum).toBeGreaterThanOrEqual(0)
    expect(skill.ccssCode).toMatch(/^CCSS\./)
    expect(skill.gradeBand.length).toBeGreaterThan(0)
    expect(skill.satAlignment.length).toBeGreaterThan(0)
    expect(skill.items.length).toBeGreaterThanOrEqual(4)
  })

  it('each item: 4 distinct choices, exactly one correct, 3 DISTINCT mapped misconception tokens, valid difficulty', () => {
    const slots = new Set<number>()
    for (const item of skill.items) {
      slots.add(item.slot)
      expect(['easy', 'medium', 'hard']).toContain(item.difficulty)

      expect(item.choices).toHaveLength(4)
      expect(new Set(item.choices.map((c) => c.text)).size).toBe(4)
      expect(item.choices.filter((c) => c.is_correct)).toHaveLength(1)

      const wrong = item.choices.filter((c) => !c.is_correct)
      expect(wrong).toHaveLength(3)
      const tokens = wrong.map((c) => c.misconception_token)
      for (const tok of tokens) {
        expect(tok).toBeDefined()
        expect(KEBAB.test(tok!)).toBe(true)
        expect(explainMisconception(tok)).toBeTruthy()
      }
      expect(new Set(tokens).size).toBe(tokens.length)

      expect(item.stem.length).toBeGreaterThan(0)
      expect(item.solution.length).toBeGreaterThan(0)
    }
    expect(slots.size).toBe(skill.items.length)
  })

  it('difficulty is calibrated to the grade (roughly 8 easy / 8 medium / 4 hard for a 20-item skill)', () => {
    if (skill.items.length !== 20) return
    const by = { easy: 0, medium: 0, hard: 0 } as Record<string, number>
    for (const item of skill.items) by[item.difficulty]++
    expect(by).toEqual({ easy: 8, medium: 8, hard: 4 })
  })

  it('served questions are deterministic and vary the correct-answer position (shuffle works)', () => {
    const positions = new Set<number>()
    for (const item of skill.items) {
      const seed = seedForSlot(item.slot)
      const a = buildGapQuestion(item, seed)
      const b = buildGapQuestion(item, seed)
      expect(JSON.stringify(a)).toBe(JSON.stringify(b))
      const correct = a.choices.find((c) => c.is_correct)!
      expect(a.correct_answer).toBe(correct.text)
      positions.add(a.choices.findIndex((c) => c.is_correct))
    }
    expect(positions.size).toBeGreaterThanOrEqual(2)
  })
})
