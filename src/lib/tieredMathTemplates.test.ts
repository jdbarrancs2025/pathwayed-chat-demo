import { describe, it, expect } from 'vitest'
import { TIERED_MATH_TEMPLATES, TIER_COUNTS, TIERED_SKILL_SLUGS } from './tieredMathTemplates'
import { generateQuestionDebug } from './questionGen'
import { MATH_TEMPLATES } from './mathTemplates'

/** Generate a spread of items for a template, the way the seed script does. */
function sample(t: (typeof TIERED_MATH_TEMPLATES)[number], n = 40) {
  const out: { stem: string; slots: Record<string, number>; choices: { text: string; is_correct: boolean; misconception_token?: string }[]; correct: string }[] = []
  for (let i = 1; i <= n; i++) {
    const seed = Math.imul(i, 0x9e3779b1) >>> 0
    const { question, slots } = generateQuestionDebug(t.generationSpec, t.distractorSpec, seed)
    out.push({ stem: question.stem, slots, choices: question.choices, correct: question.correct_answer })
  }
  return out
}

const byTier = (skill: string, difficulty: string) =>
  TIERED_MATH_TEMPLATES.find((t) => t.skillSlug === skill && t.difficulty === difficulty)!

describe('shape of the tiered set', () => {
  it('covers exactly the four step-1 skills at three tiers each', () => {
    expect(TIERED_MATH_TEMPLATES).toHaveLength(12)
    for (const slug of TIERED_SKILL_SLUGS) {
      const tiers = TIERED_MATH_TEMPLATES.filter((t) => t.skillSlug === slug).map((t) => t.difficulty)
      expect(tiers.sort()).toEqual(['easy', 'hard', 'medium'])
    }
  })

  it('totals 48 per skill, split 16 / 20 / 12', () => {
    expect(TIER_COUNTS).toEqual({ easy: 16, medium: 20, hard: 12 })
    for (const slug of TIERED_SKILL_SLUGS) {
      const total = TIERED_MATH_TEMPLATES.filter((t) => t.skillSlug === slug).reduce((a, t) => a + t.count, 0)
      expect(total).toBe(48)
    }
  })

  it('uses a NEW code namespace, so no id can collide with the live v1 pool', () => {
    const existing = new Set(MATH_TEMPLATES.map((t) => t.code))
    for (const t of TIERED_MATH_TEMPLATES) {
      expect(existing.has(t.code)).toBe(false)
      expect(t.code.endsWith('-v2')).toBe(true)
    }
    // And the codes are unique among themselves.
    expect(new Set(TIERED_MATH_TEMPLATES.map((t) => t.code)).size).toBe(12)
  })

  it('cites a grade standard for every tier', () => {
    for (const t of TIERED_MATH_TEMPLATES) expect(t.standard.length).toBeGreaterThan(10)
  })
})

describe('every tier can actually produce its item count', () => {
  it.each(TIERED_MATH_TEMPLATES.map((t) => [t.code, t] as const))(
    '%s yields enough DISTINCT stems',
    (_code, t) => {
      const stems = new Set<string>()
      for (let i = 1; i <= 20000 && stems.size < t.count; i++) {
        const seed = Math.imul(i, 0x9e3779b1) >>> 0
        stems.add(generateQuestionDebug(t.generationSpec, t.distractorSpec, seed).question.stem)
      }
      expect(stems.size).toBeGreaterThanOrEqual(t.count)
    },
  )
})

describe('item quality guards', () => {
  it.each(TIERED_MATH_TEMPLATES.map((t) => [t.code, t] as const))(
    '%s: 4 choices, exactly one correct, all distinct',
    (_code, t) => {
      for (const item of sample(t)) {
        expect(item.choices).toHaveLength(4)
        expect(item.choices.filter((c) => c.is_correct)).toHaveLength(1)
        expect(new Set(item.choices.map((c) => c.text)).size).toBe(4)
      }
    },
  )

  it.each(TIERED_MATH_TEMPLATES.map((t) => [t.code, t] as const))(
    '%s: every distractor carries a DISTINCT misconception token',
    (_code, t) => {
      for (const item of sample(t)) {
        const tokens = item.choices.filter((c) => !c.is_correct).map((c) => c.misconception_token)
        expect(tokens.every(Boolean)).toBe(true)
        expect(new Set(tokens).size).toBe(tokens.length)
      }
    },
  )

  it.each(TIERED_MATH_TEMPLATES.map((t) => [t.code, t] as const))(
    '%s: no distractor is zero or negative',
    (_code, t) => {
      // A zero option is a giveaway and is not a real mistake a child makes.
      for (const item of sample(t)) {
        for (const c of item.choices) expect(Number(c.text)).toBeGreaterThan(0)
      }
    },
  )

  it.each(TIERED_MATH_TEMPLATES.map((t) => [t.code, t] as const))(
    '%s: the answer is never the largest or smallest option every time',
    (_code, t) => {
      // Guards against a magnitude ladder that makes the answer pickable by size.
      let alwaysExtreme = 0
      const items = sample(t)
      for (const item of items) {
        const vals = item.choices.map((c) => Number(c.text))
        const answer = Number(item.correct)
        if (answer === Math.max(...vals) || answer === Math.min(...vals)) alwaysExtreme++
      }
      expect(alwaysExtreme).toBeLessThan(items.length)
    },
  )
})

describe('GRADE ANCHORING — harder must not mean a later grade', () => {
  it('grade 3 multiplication keeps single-digit factors and products within 100', () => {
    for (const tier of ['easy', 'medium', 'hard'] as const) {
      for (const item of sample(byTier('multiplication', tier))) {
        const { a, b } = item.slots
        expect(a).toBeLessThanOrEqual(9)
        expect(b).toBeLessThanOrEqual(10)
        expect(a * b).toBeLessThanOrEqual(100)
      }
    }
  })

  it('grade 3 multiplication HARD is a harder TASK, not bigger numbers', () => {
    const easy = sample(byTier('multiplication', 'easy'))
    const hard = sample(byTier('multiplication', 'hard'))
    const maxProduct = (rows: typeof easy) => Math.max(...rows.map((r) => r.slots.a * r.slots.b))
    // The hard tier does not escalate magnitude beyond the medium tier's range...
    expect(maxProduct(hard)).toBeLessThanOrEqual(100)
    // ...it changes the question: the unknown is a factor, not the product.
    expect(hard.every((r) => r.stem.includes('\\square'))).toBe(true)
    expect(easy.every((r) => !r.stem.includes('\\square'))).toBe(true)
  })

  it('grade 3 fractions keep small denominators and whole numbers at every tier', () => {
    for (const tier of ['easy', 'medium', 'hard'] as const) {
      for (const item of sample(byTier('fractions', tier))) {
        // n is DERIVED (b * k), so it is not among the drawn slots.
        const n = item.slots.b * item.slots.k
        expect(item.slots.b).toBeLessThanOrEqual(6)
        expect(n).toBeLessThanOrEqual(60)
      }
    }
  })

  it('grade 3 fractions HARD reverses the question rather than enlarging it', () => {
    const hard = sample(byTier('fractions', 'hard'))
    expect(hard.every((r) => r.stem.includes('of a number is'))).toBe(true)
  })

  it('grade 6 percentages stay whole-number percents of whole numbers', () => {
    for (const tier of ['easy', 'medium', 'hard'] as const) {
      for (const item of sample(byTier('percentages', tier))) {
        expect(Number.isInteger(item.slots.p)).toBe(true)
        expect(item.slots.n).toBeLessThanOrEqual(200)
      }
    }
  })

  it('grade 6 percentages HARD asks for the whole, given a part', () => {
    const hard = sample(byTier('percentages', 'hard'))
    expect(hard.every((r) => r.stem.includes('of what number'))).toBe(true)
  })

  it('grade 6 data analysis HARD works backwards from the mean', () => {
    const hard = sample(byTier('data-analysis', 'hard'))
    expect(hard.every((r) => r.stem.includes('last game'))).toBe(true)
    // The points already scored must be a sensible positive total.
    for (const item of hard) expect(item.slots.n * item.slots.q - item.slots.last).toBeGreaterThan(0)
  })
})

describe('tier separation is real', () => {
  it('multiplication medium uses harder facts than easy', () => {
    const easyMax = Math.max(...sample(byTier('multiplication', 'easy')).map((r) => r.slots.a))
    const mediumMin = Math.min(...sample(byTier('multiplication', 'medium')).map((r) => r.slots.a))
    expect(mediumMin).toBeGreaterThan(easyMax)
  })

  it('percentages easy uses benchmark percents only', () => {
    for (const item of sample(byTier('percentages', 'easy'))) {
      expect([25, 50, 75]).toContain(item.slots.p)
    }
  })

  it('percentages medium goes beyond the benchmarks', () => {
    const ps = new Set(sample(byTier('percentages', 'medium')).map((r) => r.slots.p))
    expect([...ps].some((p) => p % 25 !== 0)).toBe(true)
  })

  it('fractions easy is unit fractions only', () => {
    for (const item of sample(byTier('fractions', 'easy'))) {
      expect(item.stem).toContain('\\frac{1}')
    }
  })
})
