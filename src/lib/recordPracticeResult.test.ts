import { describe, it, expect, vi, beforeEach } from 'vitest'

// Shared mutable state for the supabase mock (hoisted above the vi.mock factory).
const state = vi.hoisted(() => ({
  prior: [] as { skill_id: string; accuracy: number; attempts: number }[],
  captured: null as Record<string, unknown>[] | null,
}))

// recordReadiness is the downstream recompute — stub it (asserted elsewhere).
vi.mock('@/lib/readiness', () => ({ recordReadiness: vi.fn().mockResolvedValue(undefined) }))

// Minimal chainable supabase: the prior read resolves to state.prior; upsert
// captures the rows it was given.
vi.mock('@/lib/supabase', () => {
  const builder = {
    select: () => builder,
    eq: () => builder,
    in: () => Promise.resolve({ data: state.prior }),
    upsert: (rows: Record<string, unknown>[]) => {
      state.captured = rows
      return Promise.resolve({ error: null })
    },
  }
  return { supabase: { from: () => builder } }
})

import { recordPracticeResult, nextMastery } from '@/lib/skills'

beforeEach(() => {
  state.prior = []
  state.captured = null
})

describe('recordPracticeResult — accuracy flows through nextMastery', () => {
  it('first practice (no prior): stores scored accuracy + ramped mastery, one attempt', async () => {
    state.prior = []
    const update = await recordPracticeResult('stu-1', 'skill-mult', 30)
    const expected = nextMastery(null, 30)

    expect(state.captured).toHaveLength(1)
    expect(state.captured![0]).toMatchObject({
      student_id: 'stu-1',
      skill_id: 'skill-mult',
      accuracy: expected.accuracy,
      mastery_percentage: expected.mastery_percentage,
      attempts: 1,
    })
    expect(update).toMatchObject({ skill_id: 'skill-mult', accuracy: expected.accuracy, attempts: 1 })
  })

  it('a genuinely poor session LOWERS mastery from a strong prior (the point of Stage 3)', async () => {
    state.prior = [{ skill_id: 'skill-mult', accuracy: 90, attempts: 4 }]
    await recordPracticeResult('stu-1', 'skill-mult', 30)
    const expected = nextMastery({ accuracy: 90, attempts: 4 }, 30)

    expect(state.captured![0].accuracy).toBe(expected.accuracy) // 90*0.6 + 30*0.4 = 66
    expect(state.captured![0].mastery_percentage).toBe(expected.mastery_percentage)
    expect(expected.accuracy).toBeLessThan(90) // dropped
    expect(state.captured![0].attempts).toBe(5) // exactly one increment per practice session
  })

  it('clamps out-of-range accuracy before feeding nextMastery', async () => {
    state.prior = []
    await recordPracticeResult('stu-1', 'skill-mult', 130)
    expect(state.captured![0].accuracy).toBe(nextMastery(null, 100).accuracy) // clamped to 100
  })
})
