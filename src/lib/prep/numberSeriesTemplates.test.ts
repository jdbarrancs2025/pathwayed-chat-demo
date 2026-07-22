import { describe, expect, it } from 'vitest'
import {
  NUMBER_SERIES_MISCONCEPTIONS,
  PREP_NUMBER_SERIES_SKILLS,
  buildPrepQuestion,
  seedForSlot,
} from './numberSeriesTemplates'

const DIFFICULTIES = new Set(['easy', 'medium', 'hard'])

describe('prep number series templates', () => {
  for (const skill of PREP_NUMBER_SERIES_SKILLS) {
    describe(`${skill.slug} (${skill.items.length} items)`, () => {
      it('has items and a 6-8 grade band in the prep-quant subject', () => {
        expect(skill.items.length).toBeGreaterThan(0)
        expect(skill.gradeBand).toBe('6-8')
        expect(skill.subject).toBe('prep-quant')
      })

      it('every item: 4 distinct choices, exactly one correct, 3 distinct mapped tokens, valid difficulty', () => {
        const slots = new Set<number>()
        for (const item of skill.items) {
          expect(slots.has(item.slot)).toBe(false)
          slots.add(item.slot)
          expect(DIFFICULTIES.has(item.difficulty)).toBe(true)

          expect(item.choices).toHaveLength(4)
          const texts = item.choices.map((c) => c.text)
          expect(new Set(texts).size).toBe(4) // no duplicate choice text

          const correct = item.choices.filter((c) => c.is_correct)
          expect(correct).toHaveLength(1)

          const wrong = item.choices.filter((c) => !c.is_correct)
          expect(wrong).toHaveLength(3)
          const tokens = wrong.map((c) => c.misconception_token)
          expect(tokens.every((t): t is string => !!t)).toBe(true)
          expect(new Set(tokens).size).toBe(3) // three DISTINCT tokens
          for (const tok of tokens) {
            // misconceptions.ts does not carry these tokens yet, so assert the
            // module's own record covers every token used (self-contained).
            expect(NUMBER_SERIES_MISCONCEPTIONS[tok as string]).toBeTruthy()
          }
          // no distractor equals the correct answer
          expect(wrong.some((w) => w.text === correct[0].text)).toBe(false)
        }
      })

      it('every item: all 4 choices are numeric and distinct, correct choice carries no token', () => {
        for (const item of skill.items) {
          const values = item.choices.map((c) => Number(c.text))
          for (const v of values) {
            expect(Number.isFinite(v)).toBe(true)
            expect(Number.isNaN(v)).toBe(false)
          }
          expect(new Set(values).size).toBe(4) // four distinct numbers
          const correct = item.choices.find((c) => c.is_correct)!
          expect(correct.misconception_token).toBeUndefined()
        }
      })

      it('buildPrepQuestion: correct_answer matches the is_correct choice', () => {
        for (const item of skill.items) {
          const q = buildPrepQuestion(item, seedForSlot(item.slot))
          const built = q.choices.find((c) => c.is_correct)!
          const source = item.choices.find((c) => c.is_correct)!
          expect(q.correct_answer).toBe(source.text)
          expect(built.text).toBe(source.text)
        }
      })

      it('answer positions are balanced across the four slots (no positional tell)', () => {
        const counts = [0, 0, 0, 0]
        for (const item of skill.items) {
          const q = buildPrepQuestion(item, seedForSlot(item.slot))
          const pos = q.choices.findIndex((c) => c.is_correct)
          expect(pos).toBeGreaterThanOrEqual(0)
          counts[pos]++
          expect(q.choices).toHaveLength(4)
          expect(q.choices[pos].text).toBe(q.correct_answer)
        }
        // every position is used, and none dominates (within a slot of the mean).
        const mean = skill.items.length / 4
        for (const c of counts) {
          expect(c).toBeGreaterThan(0)
          expect(Math.abs(c - mean)).toBeLessThanOrEqual(1)
        }
      })

      it('correct answer is not a length outlier (no "longest answer" strategy)', () => {
        let longestCorrect = 0
        for (const item of skill.items) {
          const correct = item.choices.find((c) => c.is_correct)!
          const maxLen = Math.max(...item.choices.map((c) => c.text.length))
          if (correct.text.length === maxLen && item.choices.filter((c) => c.text.length === maxLen).length === 1) {
            longestCorrect++
          }
        }
        // The correct answer being the uniquely-longest choice should be rare, not a tell.
        expect(longestCorrect / skill.items.length).toBeLessThan(0.4)
      })
    })
  }
})
