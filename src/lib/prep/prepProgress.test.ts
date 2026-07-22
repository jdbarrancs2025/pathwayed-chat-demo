import { describe, expect, it } from 'vitest'
import { computePrepProgress, READINESS_W_MASTERY, READINESS_W_SECTION } from './prepProgress'
import type { PrepModule } from './types'
import type { PrepAttemptLite } from './prepProgress'

// A tiny module with two timed sections whose types resolve to real prep slugs.
const MODULE: PrepModule = {
  id: 'hspt',
  name: 'HSPT',
  gradeBand: [6, 8],
  sections: [
    { id: 'verbal-skills', name: 'Verbal Skills', questionCount: 10, timeLimitSec: 600, questionTypes: ['synonyms', 'antonyms'] },
    { id: 'quantitative-skills', name: 'Quantitative Skills', questionCount: 10, timeLimitSec: 600, questionTypes: ['number_series'] },
  ],
  fullTestComposition: ['verbal-skills', 'quantitative-skills'],
}

const A = (sectionId: string, score: number, startedAt: string, status: 'submitted' | 'expired' = 'submitted'): PrepAttemptLite => ({
  sectionId,
  status,
  score,
  startedAt,
})

describe('computePrepProgress', () => {
  it('empty state: no attempts, no readiness', () => {
    const p = computePrepProgress(MODULE, [], new Map())
    expect(p.hasAttempts).toBe(false)
    expect(p.sections).toEqual([])
    expect(p.weakestTypes).toEqual([])
    expect(p.readiness).toBeNull()
  })

  it('per-section trend + personal best from timed scores', () => {
    const attempts = [
      A('verbal-skills', 0.5, '2026-07-01T10:00:00Z'),
      A('verbal-skills', 0.8, '2026-07-05T10:00:00Z'),
      A('quantitative-skills', 0.6, '2026-07-03T10:00:00Z'),
    ]
    const p = computePrepProgress(MODULE, attempts, new Map())
    expect(p.hasAttempts).toBe(true)
    // Most-recent activity first: verbal last attempt (Jul 5) beats quant (Jul 3).
    expect(p.sections[0].sectionId).toBe('verbal-skills')
    const verbal = p.sections.find((s) => s.sectionId === 'verbal-skills')!
    expect(verbal.latestScore).toBe(80)
    expect(verbal.priorScore).toBe(50)
    expect(verbal.bestScore).toBe(80)
    expect(verbal.isBest).toBe(true)
    expect(verbal.trend).toBe('up')
    const quant = p.sections.find((s) => s.sectionId === 'quantitative-skills')!
    expect(quant.trend).toBeNull() // single attempt
    expect(quant.isBest).toBe(false) // needs >=2 attempts to be a "best"
  })

  it('a later dip is not a personal best and trends down', () => {
    const attempts = [A('verbal-skills', 0.9, '2026-07-01T10:00:00Z'), A('verbal-skills', 0.7, '2026-07-02T10:00:00Z')]
    const p = computePrepProgress(MODULE, attempts, new Map())
    const verbal = p.sections[0]
    expect(verbal.latestScore).toBe(70)
    expect(verbal.bestScore).toBe(90)
    expect(verbal.isBest).toBe(false)
    expect(verbal.trend).toBe('down')
  })

  it('weakest types come from practice mastery, lowest first, deduped by skill', () => {
    // synonyms->prep-synonyms, antonyms->prep-antonyms, number_series->prep-number-series
    const acc = new Map<string, number | null>([
      ['prep-synonyms', 82],
      ['prep-antonyms', 40],
      ['prep-number-series', 65],
    ])
    const p = computePrepProgress(MODULE, [], acc)
    expect(p.weakestTypes.map((t) => t.slug)).toEqual(['prep-antonyms', 'prep-number-series', 'prep-synonyms'])
    expect(p.weakestTypes[0].accuracy).toBe(40)
    expect(p.weakestTypes[0].label).toBe('Antonyms')
  })

  it('types without graded evidence are excluded', () => {
    const acc = new Map<string, number | null>([['prep-synonyms', 70], ['prep-antonyms', null]])
    const p = computePrepProgress(MODULE, [], acc)
    expect(p.weakestTypes.map((t) => t.slug)).toEqual(['prep-synonyms'])
  })

  it('readiness blends mastery (0.6) and recent section accuracy (0.4)', () => {
    const acc = new Map<string, number | null>([['prep-synonyms', 90], ['prep-antonyms', 90], ['prep-number-series', 90]])
    const attempts = [A('verbal-skills', 0.5, '2026-07-05T10:00:00Z')] // section% = 50
    const p = computePrepProgress(MODULE, attempts, acc)
    const expected = Math.round((90 * READINESS_W_MASTERY + 50 * READINESS_W_SECTION) / (READINESS_W_MASTERY + READINESS_W_SECTION))
    expect(p.readiness).toBe(expected) // 74
  })

  it('readiness is defined from a single signal (weight renormalized)', () => {
    const masteryOnly = computePrepProgress(MODULE, [], new Map([['prep-synonyms', 80]]))
    expect(masteryOnly.readiness).toBe(80)
    const sectionOnly = computePrepProgress(MODULE, [A('verbal-skills', 0.6, '2026-07-05T10:00:00Z')], new Map())
    expect(sectionOnly.readiness).toBe(60)
  })
})
