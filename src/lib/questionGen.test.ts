import { describe, it, expect } from 'vitest'
import {
  buildFromSlots,
  evalFormula,
  generateQuestion,
  generateQuestionDebug,
  type MathDistractorSpec,
  type MathGenerationSpec,
} from './questionGen'
import { LINEAR_EQUATION_SOLVE, MULTIPLICATION_BASIC, PERCENT_OF } from './mathTemplates'

const KEBAB = /^[a-z][a-z0-9-]*$/
const seeds = (n: number) => Array.from({ length: n }, (_, i) => i + 1)

describe('evalFormula (safe arithmetic)', () => {
  it('evaluates precedence, parens, unary minus, and variables', () => {
    expect(evalFormula('a*x + b', { a: 3, x: 5, b: -4 })).toBe(11)
    expect(evalFormula('p * n / 100', { p: 15, n: 80 })).toBe(12)
    expect(evalFormula('-x', { x: 7 })).toBe(-7)
    expect(evalFormula('(c - b) / a', { c: 11, b: -4, a: 3 })).toBe(5)
  })
  it('rejects unknown variables and junk', () => {
    expect(() => evalFormula('a + z', { a: 1 })).toThrow(/unknown variable/)
    expect(() => evalFormula('2 +', {})).toThrow()
    expect(() => evalFormula('2 ; 3', {})).toThrow()
  })
})

describe('linear-equation-solve — correctness (mechanical, not asserted)', () => {
  it('the correct answer actually solves the displayed equation, for many seeds', () => {
    for (const s of seeds(60)) {
      const { question, slots } = generateQuestionDebug(
        LINEAR_EQUATION_SOLVE.generationSpec,
        LINEAR_EQUATION_SOLVE.distractorSpec,
        s,
      )
      const ans = Number(question.correct_answer)
      const { a, x, b } = slots
      const c = a * x + b // the value shown on the right-hand side
      expect(Number.isInteger(ans)).toBe(true)
      expect(a * ans + b).toBe(c) // a·ans + b == c  ⇒ ans solves the equation
    }
  })
})

describe('percent-of — correctness (mechanical, not asserted)', () => {
  it('the correct answer is exactly p% of n, an integer, for many seeds', () => {
    for (const s of seeds(60)) {
      const { question, slots } = generateQuestionDebug(
        PERCENT_OF.generationSpec,
        PERCENT_OF.distractorSpec,
        s,
      )
      const ans = Number(question.correct_answer)
      expect(Number.isInteger(ans)).toBe(true)
      expect(ans).toBe((slots.p * slots.n) / 100)
    }
  })
})

describe('multiplication-basic — correctness (mechanical, not asserted)', () => {
  it('the correct answer is exactly a*b, an integer, for many seeds', () => {
    for (const s of seeds(80)) {
      const { question, slots } = generateQuestionDebug(
        MULTIPLICATION_BASIC.generationSpec,
        MULTIPLICATION_BASIC.distractorSpec,
        s,
      )
      const ans = Number(question.correct_answer)
      expect(Number.isInteger(ans)).toBe(true)
      expect(ans).toBe(slots.a * slots.b)
    }
  })
})

describe.each([
  ['linear-equation-solve', LINEAR_EQUATION_SOLVE],
  ['percent-of', PERCENT_OF],
  ['multiplication-basic', MULTIPLICATION_BASIC],
])('%s — choices invariants', (_name, tpl) => {
  it('has exactly one correct choice and 4 distinct choices', () => {
    for (const s of seeds(50)) {
      const q = generateQuestion(tpl.generationSpec, tpl.distractorSpec, s)
      expect(q.choices).toHaveLength(4)
      expect(q.choices.filter((c) => c.is_correct)).toHaveLength(1)
      expect(new Set(q.choices.map((c) => c.text)).size).toBe(4)
    }
  })

  it('every distractor token is kebab-case and its value differs from the answer', () => {
    for (const s of seeds(50)) {
      const q = generateQuestion(tpl.generationSpec, tpl.distractorSpec, s)
      const correct = q.choices.find((c) => c.is_correct)!.text
      for (const wrong of q.choices.filter((c) => !c.is_correct)) {
        expect(wrong.misconception_token).toBeDefined()
        expect(KEBAB.test(wrong.misconception_token!)).toBe(true)
        expect(wrong.text).not.toBe(correct)
      }
    }
  })

  it('the correct answer position varies across seeds (shuffle works)', () => {
    const positions = new Set<number>()
    for (const s of seeds(40)) {
      const q = generateQuestion(tpl.generationSpec, tpl.distractorSpec, s)
      positions.add(q.choices.findIndex((c) => c.is_correct))
    }
    expect(positions.size).toBeGreaterThanOrEqual(2)
  })

  it('is deterministic by seed and varied across seeds', () => {
    const a = generateQuestion(tpl.generationSpec, tpl.distractorSpec, 7)
    const b = generateQuestion(tpl.generationSpec, tpl.distractorSpec, 7)
    expect(JSON.stringify(a)).toBe(JSON.stringify(b)) // same seed -> identical
    const stems = new Set(seeds(20).map((s) => generateQuestion(tpl.generationSpec, tpl.distractorSpec, s).stem))
    expect(stems.size).toBeGreaterThan(1) // different seeds -> varied
  })
})

describe('distractor collision -> reseed (note 1)', () => {
  const rng = () => 0.5 // shuffle is irrelevant for the null path

  it('a colliding slot assignment yields fewer than 3 distinct distractors -> null', () => {
    // a=2,x=3,b=3 -> c=9; distractors: c-b=6, -x=-3, x+b=6  (6 repeats) -> only
    // {6,-3} distinct -> cannot make 4 distinct choices -> buildFromSlots null.
    const collided = buildFromSlots(
      LINEAR_EQUATION_SOLVE.generationSpec,
      LINEAR_EQUATION_SOLVE.distractorSpec,
      { a: 2, x: 3, b: 3 },
      rng,
    )
    expect(collided).toBeNull()
  })

  it('a non-colliding slot assignment builds a full question', () => {
    const ok = buildFromSlots(
      LINEAR_EQUATION_SOLVE.generationSpec,
      LINEAR_EQUATION_SOLVE.distractorSpec,
      { a: 3, x: 5, b: -4 }, // c=11; distractors 15,-5,1 -> 4 distinct
      rng,
    )
    expect(ok).not.toBeNull()
    expect(new Set(ok!.choices.map((c) => c.text)).size).toBe(4)
  })

  it('generateQuestion always reseeds to 4 distinct choices (every seed)', () => {
    for (const s of seeds(100)) {
      const q = generateQuestion(LINEAR_EQUATION_SOLVE.generationSpec, LINEAR_EQUATION_SOLVE.distractorSpec, s)
      expect(new Set(q.choices.map((c) => c.text)).size).toBe(4)
    }
  })
})

describe('bad template fails loudly within the reseed cap', () => {
  it('throws when 3 distinct distractors are impossible', () => {
    const spec: MathGenerationSpec = {
      kind: 'template_math',
      schemaVersion: 1,
      responseType: 'multiple_choice',
      stemTemplate: 'x = {x}?',
      slots: [{ name: 'x', min: 1, max: 5 }],
      answerFormula: 'x',
      answerFormat: 'integer',
    }
    // All distractors equal the answer -> filtered out -> never 3 distinct.
    const distractors: MathDistractorSpec = [
      { formula: 'x', misconception_token: 'a' },
      { formula: 'x', misconception_token: 'b' },
      { formula: 'x', misconception_token: 'c' },
    ]
    expect(() => generateQuestion(spec, distractors, 1)).toThrow(/within 100 attempts/)
  })
})
