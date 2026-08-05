import { describe, it, expect } from 'vitest'
import { explainMisconception } from './misconceptions'
import { MATH_TEMPLATES } from './mathTemplates'
import { TIERED_MATH_TEMPLATES } from './tieredMathTemplates'

describe('explainMisconception', () => {
  // Every misconception token any template can produce must have a targeted
  // explanation, so a wrong answer never falls back to the generic verdict.
  // Covers the tiered Phase-3 templates too: a drafted question must not reach
  // review with an unexplainable distractor.
  const templateTokens = [
    ...new Set([
      ...MATH_TEMPLATES.flatMap((t) => t.distractorSpec.map((d) => d.misconception_token)),
      ...TIERED_MATH_TEMPLATES.flatMap((t) => t.distractorSpec.map((d) => d.misconception_token)),
    ]),
  ]

  it.each(templateTokens)('has a non-empty explanation for template token %s', (token) => {
    const text = explainMisconception(token)
    expect(text).toBeTruthy()
    expect(text!.length).toBeGreaterThan(10)
  })

  it('returns null for an unknown or absent token (caller falls back)', () => {
    expect(explainMisconception('not-a-real-token')).toBeNull()
    expect(explainMisconception(null)).toBeNull()
    expect(explainMisconception(undefined)).toBeNull()
    expect(explainMisconception('')).toBeNull()
  })
})
