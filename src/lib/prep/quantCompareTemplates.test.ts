import { describe, expect, it } from 'vitest'
import {
  PREP_QUANT_COMPARE_SKILLS,
  QUANT_COMPARE_MISCONCEPTIONS,
  buildPrepQuestion,
  seedForSlot,
} from './quantCompareTemplates'

const DIFFICULTIES = new Set(['easy', 'medium', 'hard'])

// The four fixed relationship options. Because every item uses exactly these four
// strings, the "distinct choice text" and "length outlier" checks hold by
// construction — there is no wording or length tell.
const RELATIONSHIP_OPTIONS = [
  'Column A is greater',
  'Column B is greater',
  'The two are equal',
  'It cannot be determined from the information given',
]

describe('prep quantitative comparison templates', () => {
  for (const skill of PREP_QUANT_COMPARE_SKILLS) {
    describe(`${skill.slug} (${skill.items.length} items)`, () => {
      it('has items and a 6-8 grade band', () => {
        expect(skill.items.length).toBeGreaterThan(0)
        expect(skill.gradeBand).toBe('6-8')
        expect(skill.subject).toBe('prep-quant')
        expect(skill.slug).toBe('prep-quantitative-comparison')
      })

      it('every item: 4 distinct choices, exactly one correct, 3 distinct mapped tokens, valid difficulty', () => {
        const slots = new Set<number>()
        for (const item of skill.items) {
          expect(slots.has(item.slot)).toBe(false)
          slots.add(item.slot)
          expect(DIFFICULTIES.has(item.difficulty)).toBe(true)

          expect(item.choices).toHaveLength(4)
          const texts = item.choices.map((c) => c.text)
          expect(new Set(texts).size).toBe(4) // no duplicate choice text (four distinct relationship sentences)
          // the four choice texts are always the fixed relationship options
          expect(new Set(texts)).toEqual(new Set(RELATIONSHIP_OPTIONS))

          const correct = item.choices.filter((c) => c.is_correct)
          expect(correct).toHaveLength(1)
          // the correct choice carries no misconception token
          expect(correct[0].misconception_token).toBeUndefined()

          const wrong = item.choices.filter((c) => !c.is_correct)
          expect(wrong).toHaveLength(3)
          const tokens = wrong.map((c) => c.misconception_token)
          expect(tokens.every((t): t is string => !!t)).toBe(true)
          expect(new Set(tokens).size).toBe(3) // three DISTINCT tokens
          for (const tok of tokens) {
            // self-contained: misconceptions.ts does not carry these tokens, so
            // assert this module's own record covers every token used.
            expect(QUANT_COMPARE_MISCONCEPTIONS[tok as string]).toBeTruthy()
          }
          // no distractor equals the correct answer
          expect(wrong.some((w) => w.text === correct[0].text)).toBe(false)
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
        // "Cannot be determined" is the longest option and is correct ~25% of the
        // time — well under the 0.4 threshold, so length is not a usable tell.
        expect(longestCorrect / skill.items.length).toBeLessThan(0.4)
      })

      it('the correct relationship is roughly evenly distributed across the four options (balance)', () => {
        const n = skill.items.length
        for (const option of RELATIONSHIP_OPTIONS) {
          const timesCorrect = skill.items.filter(
            (item) => item.choices.find((c) => c.is_correct)!.text === option,
          ).length
          const share = timesCorrect / n
          // each of the four relationships must be the correct answer for a
          // reasonable share of items (aim ~25% each; band 15%-35%).
          expect(share).toBeGreaterThanOrEqual(0.15)
          expect(share).toBeLessThanOrEqual(0.35)
        }
      })
    })
  }
})
