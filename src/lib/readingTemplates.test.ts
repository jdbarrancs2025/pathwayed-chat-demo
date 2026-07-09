import { describe, it, expect } from 'vitest'
import {
  READING_PASSAGES,
  READING_DOMAINS,
  buildReadingQuestion,
  seedForSlot,
  itemsForSkill,
  readingSkillSlugs,
} from './readingTemplates'
import { explainMisconception } from './misconceptions'

const KEBAB = /^[a-z][a-z0-9-]*$/

describe.each(READING_PASSAGES.map((p) => [p.code, p] as const))('%s — passage guarantees', (_code, passage) => {
  it('has non-empty body, a reading domain alignment, a grade band, and at least one question', () => {
    expect(passage.body.trim().length).toBeGreaterThan(0)
    expect(READING_DOMAINS).toContain(passage.satAlignment)
    expect(passage.gradeBand.length).toBeGreaterThan(0)
    expect(passage.skillSlug.length).toBeGreaterThan(0)
    expect(passage.items.length).toBeGreaterThanOrEqual(1)
  })

  it('each item: 4 distinct choices, exactly one correct, 3 DISTINCT mapped misconception tokens, valid difficulty', () => {
    for (const item of passage.items) {
      expect(['easy', 'medium', 'hard']).toContain(item.difficulty)

      expect(item.choices).toHaveLength(4)
      expect(new Set(item.choices.map((c) => c.text)).size).toBe(4) // no duplicate options
      expect(item.choices.filter((c) => c.is_correct)).toHaveLength(1)

      const wrong = item.choices.filter((c) => !c.is_correct)
      expect(wrong).toHaveLength(3)
      const tokens = wrong.map((c) => c.misconception_token)
      for (const tok of tokens) {
        expect(tok).toBeDefined()
        expect(KEBAB.test(tok!)).toBe(true)
        expect(explainMisconception(tok)).toBeTruthy() // every token has a Stage-4 explanation
      }
      expect(new Set(tokens).size).toBe(tokens.length) // distinct token per wrong option

      expect(item.stem.length).toBeGreaterThan(0)
      expect(item.solution.length).toBeGreaterThan(0)
    }
  })
})

describe.each(readingSkillSlugs().map((s) => [s] as const))('reading skill %s — bank guarantees', (skillSlug) => {
  const items = itemsForSkill(skillSlug)

  it('has unique slots across all of the skill\'s passages', () => {
    const slots = items.map((i) => i.slot)
    expect(new Set(slots).size).toBe(slots.length)
  })

  it('served questions are deterministic and vary the correct-answer position (shuffle works)', () => {
    const positions = new Set<number>()
    for (const item of items) {
      const seed = seedForSlot(item.slot)
      const a = buildReadingQuestion(item, seed)
      const b = buildReadingQuestion(item, seed)
      expect(JSON.stringify(a)).toBe(JSON.stringify(b)) // same seed -> identical
      const correct = a.choices.find((c) => c.is_correct)!
      expect(a.correct_answer).toBe(correct.text)
      positions.add(a.choices.findIndex((c) => c.is_correct))
    }
    expect(positions.size).toBeGreaterThanOrEqual(2) // not always the same slot
  })
})
