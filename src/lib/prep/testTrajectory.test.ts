import { describe, it, expect } from 'vitest'
import {
  buildModuleTrajectory,
  buildTrajectories,
  directionFor,
  trajectorySummary,
  FLAT_BAND_POINTS,
  TRAJECTORY_MIN_ATTEMPTS,
} from './testTrajectory'
import type { HistoryAttemptInput } from './testReadiness'
import type { PrepModule } from './types'

const HSPT: PrepModule = {
  id: 'hspt',
  name: 'HSPT',
  gradeBand: [6, 8],
  sections: [
    { id: 'mathematics', name: 'Mathematics', questionCount: 10, timeLimitSec: 600, questionTypes: ['arithmetic'] },
    { id: 'verbal-skills', name: 'Verbal Skills', questionCount: 10, timeLimitSec: 600, questionTypes: ['synonyms'] },
  ],
  fullTestComposition: ['mathematics', 'verbal-skills'],
}

const ISEE: PrepModule = {
  id: 'isee',
  name: 'ISEE',
  gradeBand: [6, 8],
  sections: [{ id: 'quantitative', name: 'Quantitative', questionCount: 10, timeLimitSec: 600, questionTypes: ['algebra'] }],
  fullTestComposition: ['quantitative'],
}

const A = (
  over: Partial<HistoryAttemptInput> & { id: string; sectionId: string; startedAt: string },
): HistoryAttemptInput => ({
  moduleId: 'hspt',
  mode: 'section',
  status: 'submitted',
  score: 0.5,
  submittedAt: over.startedAt,
  ...over,
})

describe('directionFor', () => {
  it('calls a real rise up and a real fall down', () => {
    expect(directionFor(38, 45)).toBe('up')
    expect(directionFor(60, 40)).toBe('down')
  })

  it('treats small movement as flat, not as a trend', () => {
    expect(directionFor(50, 50 + FLAT_BAND_POINTS - 1)).toBe('flat')
    expect(directionFor(50, 50 - (FLAT_BAND_POINTS - 1))).toBe('flat')
    expect(directionFor(50, 50)).toBe('flat')
  })
})

describe('buildModuleTrajectory', () => {
  it('reproduces the production case: HSPT Mathematics 38% to 45%', () => {
    const t = buildModuleTrajectory(HSPT, [
      A({ id: '1', sectionId: 'mathematics', startedAt: '2026-07-26T10:00:00Z', score: 0.38 }),
      A({ id: '2', sectionId: 'mathematics', startedAt: '2026-07-30T10:00:00Z', score: 0.45 }),
    ])
    const m = t.sections[0]
    expect(m.sectionName).toBe('Mathematics')
    expect(m.first).toBe(38)
    expect(m.latest).toBe(45)
    expect(m.direction).toBe('up')
    expect(m.changePoints).toBe(7)
    expect(m.attempts).toBe(2)
    expect(t.hasDirection).toBe(true)
  })

  it('orders points oldest first regardless of input order', () => {
    const t = buildModuleTrajectory(HSPT, [
      A({ id: '2', sectionId: 'mathematics', startedAt: '2026-07-30T10:00:00Z', score: 0.45 }),
      A({ id: '1', sectionId: 'mathematics', startedAt: '2026-07-26T10:00:00Z', score: 0.38 }),
    ])
    expect(t.sections[0].points.map((p) => p.percent)).toEqual([38, 45])
  })

  it('shows NO direction from a single attempt', () => {
    const t = buildModuleTrajectory(HSPT, [
      A({ id: '1', sectionId: 'mathematics', startedAt: '2026-07-26T10:00:00Z', score: 0.38 }),
    ])
    const m = t.sections[0]
    expect(m.direction).toBeNull()
    expect(m.changePoints).toBeNull()
    expect(m.latest).toBe(38)
    expect(t.hasDirection).toBe(false)
    expect(TRAJECTORY_MIN_ATTEMPTS).toBe(2)
  })

  it('ignores in-progress and unscored expired runs', () => {
    const t = buildModuleTrajectory(HSPT, [
      A({ id: '1', sectionId: 'mathematics', startedAt: '2026-07-26T10:00:00Z', score: 0.38 }),
      A({ id: '2', sectionId: 'mathematics', startedAt: '2026-07-28T10:00:00Z', status: 'in_progress', score: null }),
      A({ id: '3', sectionId: 'mathematics', startedAt: '2026-07-29T10:00:00Z', status: 'expired', score: null }),
    ])
    expect(t.sections[0].attempts).toBe(1)
    expect(t.sections[0].direction).toBeNull()
  })

  it('keeps sections separate and leads with the one that has direction', () => {
    const t = buildModuleTrajectory(HSPT, [
      A({ id: '1', sectionId: 'verbal-skills', startedAt: '2026-07-26T10:00:00Z', score: 0.6 }),
      A({ id: '2', sectionId: 'mathematics', startedAt: '2026-07-26T10:00:00Z', score: 0.38 }),
      A({ id: '3', sectionId: 'mathematics', startedAt: '2026-07-30T10:00:00Z', score: 0.45 }),
    ])
    expect(t.sections.map((s) => s.sectionId)).toEqual(['mathematics', 'verbal-skills'])
    expect(t.sections[1].direction).toBeNull()
  })

  it('reports the personal best, which need not be the latest', () => {
    const t = buildModuleTrajectory(HSPT, [
      A({ id: '1', sectionId: 'mathematics', startedAt: '2026-07-01T10:00:00Z', score: 0.4 }),
      A({ id: '2', sectionId: 'mathematics', startedAt: '2026-07-05T10:00:00Z', score: 0.8 }),
      A({ id: '3', sectionId: 'mathematics', startedAt: '2026-07-09T10:00:00Z', score: 0.5 }),
    ])
    const m = t.sections[0]
    expect(m.best).toBe(80)
    expect(m.latest).toBe(50)
    expect(m.direction).toBe('up') // 40 -> 50 overall, even with a dip
  })

  it('never invents a scaled score: percent and band only', () => {
    const t = buildModuleTrajectory(HSPT, [
      A({ id: '1', sectionId: 'mathematics', startedAt: '2026-07-26T10:00:00Z', score: 0.9 }),
      A({ id: '2', sectionId: 'mathematics', startedAt: '2026-07-30T10:00:00Z', score: 0.95 }),
    ])
    const m = t.sections[0]
    expect(m.band).toBe('Strong')
    expect(Object.keys(m)).not.toContain('scaledScore')
    expect(Object.keys(m)).not.toContain('percentile')
  })
})

describe('buildTrajectories - entitlement', () => {
  const attempts = [
    A({ id: '1', sectionId: 'mathematics', startedAt: '2026-07-26T10:00:00Z', score: 0.38 }),
    A({ id: '2', moduleId: 'isee', sectionId: 'quantitative', startedAt: '2026-07-27T10:00:00Z', score: 0.6 }),
  ]

  it('shows NOTHING for a test the child is not entitled to', () => {
    const out = buildTrajectories([HSPT, ISEE], new Set(['hspt']), attempts)
    expect(out.map((t) => t.moduleId)).toEqual(['hspt'])
  })

  it('shows nothing at all when entitled to nothing', () => {
    expect(buildTrajectories([HSPT, ISEE], new Set(), attempts)).toEqual([])
  })

  it('omits an entitled module with no finished attempts', () => {
    const out = buildTrajectories([HSPT, ISEE], new Set(['hspt', 'isee']), [attempts[0]])
    expect(out.map((t) => t.moduleId)).toEqual(['hspt'])
  })
})

describe('trajectorySummary', () => {
  const base = {
    sectionId: 'mathematics',
    sectionName: 'Mathematics',
    points: [],
    best: 45,
    band: 'Developing' as const,
    attempts: 2,
  }

  it('invites a second attempt rather than drawing a trend', () => {
    const s = { ...base, first: 38, latest: 38, direction: null, changePoints: null, attempts: 1 }
    expect(trajectorySummary(s, 'Peyton')).toBe(
      'One attempt so far, at 38%. Take another to see which way it is going.',
    )
  })

  it('states a rise in points and percents', () => {
    const s = { ...base, first: 38, latest: 45, direction: 'up' as const, changePoints: 7 }
    expect(trajectorySummary(s, 'Peyton')).toBe('Up 7 points, from 38% to 45%.')
  })

  it('states a fall plainly, without alarm', () => {
    const s = { ...base, first: 60, latest: 45, direction: 'down' as const, changePoints: -15 }
    expect(trajectorySummary(s, 'Peyton')).toBe(
      'Down 15 points, from 60% to 45%. Worth a look together.',
    )
  })

  it('names the child when holding steady', () => {
    const s = { ...base, first: 45, latest: 45, direction: 'flat' as const, changePoints: 0, attempts: 3 }
    expect(trajectorySummary(s, 'Peyton')).toBe(
      'Holding steady around 45%. Peyton has taken 3 attempts.',
    )
  })

  it('contains no dash characters', () => {
    const s = { ...base, first: 38, latest: 45, direction: 'up' as const, changePoints: 7 }
    expect(trajectorySummary(s, 'Peyton')).not.toMatch(/[–—]/)
  })
})
