import { describe, it, expect } from 'vitest'
import { GRAMMAR_TEMPLATES, buildGrammarQuestion, seedForSlot } from './grammarTemplates'
import { explainMisconception } from './misconceptions'

const KEBAB = /^[a-z][a-z0-9-]*$/

describe.each(GRAMMAR_TEMPLATES.map((t) => [t.code, t] as const))('%s — curated item guarantees', (_code, tpl) => {
  it('is tagged as a curated pool for a real conventions skill', () => {
    expect(tpl.kind).toBe('curated_pool')
    expect(tpl.satAlignment).toBe('standard-english-conventions')
    expect(tpl.items.length).toBeGreaterThanOrEqual(4)
  })

  it('each item: 4 distinct choices, exactly one correct, 3 DISTINCT misconception tokens, valid difficulty', () => {
    const slots = new Set<number>()
    for (const item of tpl.items) {
      slots.add(item.slot)
      expect(['easy', 'medium', 'hard']).toContain(item.difficulty)

      expect(item.choices).toHaveLength(4)
      expect(new Set(item.choices.map((c) => c.text)).size).toBe(4) // no duplicate options
      expect(item.choices.filter((c) => c.is_correct)).toHaveLength(1)

      const wrong = item.choices.filter((c) => !c.is_correct)
      expect(wrong).toHaveLength(3)
      const tokens = wrong.map((c) => c.misconception_token)
      // every distractor is a tagged conventions error (nothing given away as filler)
      for (const tok of tokens) {
        expect(tok).toBeDefined()
        expect(KEBAB.test(tok!)).toBe(true)
      }
      // distinct token per wrong option
      expect(new Set(tokens).size).toBe(tokens.length)
      // every token maps to a Stage-4 explanation
      for (const tok of tokens) expect(explainMisconception(tok)).toBeTruthy()

      expect(item.stem.length).toBeGreaterThan(0)
      expect(item.solution.length).toBeGreaterThan(0)
    }
    expect(slots.size).toBe(tpl.items.length) // slots are unique (stable ids)
  })

  it('served questions are deterministic and vary the correct answer position (shuffle works)', () => {
    const positions = new Set<number>()
    for (const item of tpl.items) {
      const seed = seedForSlot(item.slot)
      const a = buildGrammarQuestion(item, seed)
      const b = buildGrammarQuestion(item, seed)
      expect(JSON.stringify(a)).toBe(JSON.stringify(b)) // same seed -> identical
      const correct = a.choices.find((c) => c.is_correct)!
      expect(a.correct_answer).toBe(correct.text)
      positions.add(a.choices.findIndex((c) => c.is_correct))
    }
    expect(positions.size).toBeGreaterThanOrEqual(2) // not always the same slot
  })
})
