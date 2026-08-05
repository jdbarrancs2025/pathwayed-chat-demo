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
    expect(p.masteryReadiness).toBeNull()
    expect(p.coveredSkillCount).toBe(0)
    expect(p.coveredSubjects).toEqual([])
  })

  it('mastery-only readiness + coverage for a not-yet-entitled child (no timed attempts)', () => {
    // No attempts (unentitled child can't take timed sections), only practice mastery.
    const acc = new Map<string, number | null>([
      ['prep-synonyms', 40], // reading
      ['prep-antonyms', 50], // reading
      ['prep-number-series', 60], // math
    ])
    const p = computePrepProgress(MODULE, [], acc)
    expect(p.hasAttempts).toBe(false)
    expect(p.masteryReadiness).toBe(50) // mean(40,50,60)
    expect(p.readiness).toBe(50) // blend == mastery term when no sections
    expect(p.coveredSkillCount).toBe(3)
    expect(p.coveredSubjects).toEqual(['math', 'reading']) // stable order, writing->language absent here
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

  it('does not send a student back to a skill they have cleared', () => {
    // The production shape: the prep tile kept offering a skill the student was
    // already 'advanced' on, because nothing here knew.
    const acc = new Map<string, number | null>([
      ['prep-synonyms', 82],
      ['prep-antonyms', 40],
      ['prep-number-series', 65],
    ])
    const p = computePrepProgress(MODULE, [], acc, new Set(['prep-antonyms']))
    expect(p.weakestTypes.map((t) => t.slug)).toEqual(['prep-number-series', 'prep-synonyms'])
  })

  it('leaves readiness and coverage untouched when a skill is cleared', () => {
    // The guard is presentational: it must not move the prep engine's numbers.
    const acc = new Map<string, number | null>([
      ['prep-synonyms', 82],
      ['prep-antonyms', 40],
      ['prep-number-series', 65],
    ])
    const plain = computePrepProgress(MODULE, [], acc)
    const guarded = computePrepProgress(MODULE, [], acc, new Set(['prep-antonyms']))
    expect(guarded.readiness).toBe(plain.readiness)
    expect(guarded.masteryReadiness).toBe(plain.masteryReadiness)
    expect(guarded.coveredSkillCount).toBe(plain.coveredSkillCount)
    expect(guarded.coveredSubjects).toEqual(plain.coveredSubjects)
  })

  it('offers nothing rather than a cleared skill when everything is cleared', () => {
    const acc = new Map<string, number | null>([['prep-synonyms', 82], ['prep-antonyms', 40]])
    const p = computePrepProgress(MODULE, [], acc, new Set(['prep-synonyms', 'prep-antonyms']))
    expect(p.weakestTypes).toEqual([])
    expect(p.coveredSkillCount).toBe(2)
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
