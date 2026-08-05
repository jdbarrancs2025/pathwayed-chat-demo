import { describe, it, expect } from 'vitest'
import {
  bandFor,
  hasDifficultySpread,
  parseDifficulty,
  selectRamped,
  EASY_MAX,
  HARD_MIN,
  RAMP_MIN_ATTEMPTS,
  type Difficulty,
  type RampBand,
} from './difficultyRamp'

/** Deterministic "shuffle" so selection is testable. */
const noShuffle = <U,>(arr: U[]): U[] => [...arr]

const q = (id: string, difficulty: Difficulty | null) => ({ id, difficulty })

/** A realistic authored pool: 8 easy / 8 medium / 4 hard, the shape 60 math skills
 *  and every reading, writing, and grammar skill actually carry. */
function authoredPool() {
  return [
    ...Array.from({ length: 8 }, (_, i) => q(`e${i}`, 'easy' as const)),
    ...Array.from({ length: 8 }, (_, i) => q(`m${i}`, 'medium' as const)),
    ...Array.from({ length: 4 }, (_, i) => q(`h${i}`, 'hard' as const)),
  ]
}

/** A re-authored pool: 48 items, 16 easy / 20 medium / 12 hard, as seeded. */
function tieredPool() {
  return [
    ...Array.from({ length: 16 }, (_, i) => q(`E${i}`, 'easy' as const)),
    ...Array.from({ length: 20 }, (_, i) => q(`M${i}`, 'medium' as const)),
    ...Array.from({ length: 12 }, (_, i) => q(`H${i}`, 'hard' as const)),
  ]
}

/** The remaining legacy math skills: 20 items, all one difficulty. */
function flatPool(level: Difficulty = 'easy') {
  return Array.from({ length: 20 }, (_, i) => q(`f${i}`, level))
}

const answers = (correct: number, total: number) =>
  Array.from({ length: total }, (_, i) => i < correct)

const countBy = (picked: { difficulty: Difficulty | null }[]) => ({
  easy: picked.filter((p) => p.difficulty === 'easy').length,
  medium: picked.filter((p) => p.difficulty === 'medium').length,
  hard: picked.filter((p) => p.difficulty === 'hard').length,
})

const select = (pool: ReturnType<typeof authoredPool>, band: RampBand, limit = 10, seen = new Set<string>()) =>
  selectRamped({ questions: pool, band, seenIds: seen, limit, shuffle: noShuffle })

describe('bandFor — the four bands', () => {
  it('under 60% weights easy', () => {
    expect(bandFor({ recent: answers(5, 10) })).toBe('easy-weighted') // 50%
    expect(bandFor({ recent: answers(0, 10) })).toBe('easy-weighted')
  })

  it('60 to 79% is balanced', () => {
    expect(bandFor({ recent: answers(6, 10) })).toBe('balanced') // 60%
    expect(bandFor({ recent: answers(7, 10) })).toBe('balanced') // 70%
  })

  it('80% and above weights hard', () => {
    expect(bandFor({ recent: answers(8, 10) })).toBe('hard-weighted') // 80%
    expect(bandFor({ recent: answers(10, 10) })).toBe('hard-weighted')
  })

  it('the ADVANCE bar overrides accuracy entirely', () => {
    // A student at 'advanced' gets hard only even on a bad recent run.
    expect(bandFor({ recent: answers(1, 10), status: 'advanced' })).toBe('advanced')
    expect(bandFor({ recent: answers(1, 10), status: 'mastered' })).toBe('advanced')
  })

  it('practicing status does not override accuracy', () => {
    expect(bandFor({ recent: answers(9, 10), status: 'practicing' })).toBe('hard-weighted')
  })

  it('is exactly on the documented boundaries', () => {
    expect(EASY_MAX).toBe(60)
    expect(HARD_MIN).toBe(80)
    // Just under 60 is easy; exactly 60 is balanced.
    expect(bandFor({ recent: answers(5, 10) })).toBe('easy-weighted') // 50%
    expect(bandFor({ recent: answers(6, 10) })).toBe('balanced') // 60%
    // Just under 80 is balanced; exactly 80 is hard.
    expect(bandFor({ recent: answers(7, 10) })).toBe('balanced') // 70%
    expect(bandFor({ recent: answers(8, 10) })).toBe('hard-weighted') // 80%
  })

  it('serves balanced until there is enough signal', () => {
    for (let n = 0; n < RAMP_MIN_ATTEMPTS; n++) {
      expect(bandFor({ recent: answers(0, n) })).toBe('balanced')
      expect(bandFor({ recent: answers(n, n) })).toBe('balanced')
    }
    // One more attempt and the signal is trusted.
    expect(bandFor({ recent: answers(0, RAMP_MIN_ATTEMPTS) })).toBe('easy-weighted')
  })

  it('only looks at the last RAMP_WINDOW attempts', () => {
    // 10 recent misses followed by a long history of successes: the window is what
    // counts, so a student who has started struggling gets easier items.
    const recent = [...answers(0, 10), ...answers(30, 30)]
    expect(bandFor({ recent })).toBe('easy-weighted')
  })
})

describe('selectRamped — weighting per band', () => {
  it('easy-weighted leans easy but still serves the rest', () => {
    const c = countBy(select(authoredPool(), 'easy-weighted'))
    expect(c.easy).toBeGreaterThan(c.hard)
    expect(c.hard).toBeGreaterThan(0) // a weight, not a filter
    expect(c.easy + c.medium + c.hard).toBe(10)
  })

  it('hard-weighted leans hard but still serves the rest', () => {
    const c = countBy(select(authoredPool(), 'hard-weighted'))
    expect(c.hard).toBeGreaterThan(c.easy)
    expect(c.easy).toBeGreaterThan(0)
    expect(c.easy + c.medium + c.hard).toBe(10)
  })

  it('balanced spreads across all three', () => {
    const c = countBy(select(authoredPool(), 'balanced'))
    expect(c.easy).toBeGreaterThan(0)
    expect(c.medium).toBeGreaterThan(0)
    expect(c.hard).toBeGreaterThan(0)
  })

  it('advanced leans hardest but still varies', () => {
    const c = countBy(select(tieredPool(), 'advanced'))
    expect(c.hard).toBeGreaterThan(c.medium + c.easy)
    // The defect this replaced: six identical hard items in a row in production.
    expect(c.easy + c.medium).toBeGreaterThan(0)
    expect(c.easy + c.medium + c.hard).toBe(10)
  })

  it('hits the documented mix on a real 48-item pool', () => {
    expect(countBy(select(tieredPool(), 'hard-weighted'))).toEqual({ easy: 1, medium: 2, hard: 7 })
    expect(countBy(select(tieredPool(), 'easy-weighted'))).toEqual({ easy: 7, medium: 2, hard: 1 })
    expect(countBy(select(tieredPool(), 'balanced'))).toEqual({ easy: 3, medium: 4, hard: 3 })
    expect(countBy(select(tieredPool(), 'advanced'))).toEqual({ easy: 1, medium: 1, hard: 8 })
  })

  it('easy-weighted and hard-weighted genuinely differ on the same pool', () => {
    const easy = countBy(select(authoredPool(), 'easy-weighted'))
    const hard = countBy(select(authoredPool(), 'hard-weighted'))
    expect(hard.hard).toBeGreaterThan(easy.hard)
    expect(easy.easy).toBeGreaterThan(hard.easy)
  })
})

describe('THE VARIETY FLOOR — no session of 10 is ever single-form', () => {
  const BANDS: RampBand[] = ['easy-weighted', 'balanced', 'hard-weighted', 'advanced']

  it.each(BANDS)('%s draws at least two difficulties from a spread pool', (band) => {
    const picked = select(tieredPool(), band)
    expect(picked).toHaveLength(10)
    expect(new Set(picked.map((p) => p.difficulty)).size).toBeGreaterThanOrEqual(2)
  })

  it.each(BANDS)('%s stays varied on the thinner 8/8/4 pool too', (band) => {
    const picked = select(authoredPool(), band)
    expect(picked).toHaveLength(10)
    expect(new Set(picked.map((p) => p.difficulty)).size).toBeGreaterThanOrEqual(2)
  })

  it('a FRESH question outranks variety when the unseen pool is one difficulty', () => {
    // 40 of 48 seen, so the only unseen items are hard. Serving a repeat just to
    // mix difficulty would be the wrong trade: the student learns more from a
    // question they have not met. Variety yields here, deliberately.
    const pool = tieredPool()
    const seen = new Set(pool.slice(0, 40).map((p) => p.id))
    const picked = select(pool, 'advanced', 10, seen)
    expect(picked).toHaveLength(10)
    expect(picked.slice(0, 8).every((p) => !seen.has(p.id))).toBe(true)
    expect(picked.slice(0, 8).every((p) => p.difficulty === 'hard')).toBe(true)
  })

  it('stays varied when the unseen pool still has a spread', () => {
    const pool = tieredPool()
    const seen = new Set(pool.slice(0, 20).map((p) => p.id))
    for (const band of BANDS) {
      const picked = select(pool, band, 10, seen)
      expect(picked.every((p) => !seen.has(p.id))).toBe(true)
      expect(new Set(picked.map((p) => p.difficulty)).size).toBeGreaterThanOrEqual(2)
    }
  })

  it('does not force variety on a pool that genuinely has one difficulty', () => {
    const picked = select(flatPool('easy'), 'advanced')
    expect(new Set(picked.map((p) => p.difficulty)).size).toBe(1)
    expect(picked).toHaveLength(10)
  })
})

describe('selectRamped — the no-spread fallback', () => {
  it('serves a normal full set for a single-difficulty pool', () => {
    const picked = select(flatPool('easy'), 'hard-weighted')
    expect(picked).toHaveLength(10)
    expect(picked.every((p) => p.difficulty === 'easy')).toBe(true)
  })

  it('no-spread wins over every band: never empty, never short', () => {
    // An advanced student on a legacy 20-easy pool. Hard-only would have nothing to
    // serve; the fallback gives them the normal pool instead.
    const picked = select(flatPool('easy'), 'advanced')
    expect(picked).toHaveLength(10)
  })

  it('treats an all-hard legacy pool the same way', () => {
    const picked = select(flatPool('hard'), 'easy-weighted')
    expect(picked).toHaveLength(10)
    expect(picked.every((p) => p.difficulty === 'hard')).toBe(true)
  })

  it('handles a pool with no difficulty labels at all', () => {
    const pool = Array.from({ length: 20 }, (_, i) => q(`u${i}`, null))
    expect(select(pool, 'hard-weighted')).toHaveLength(10)
  })

  it('detects spread correctly', () => {
    expect(hasDifficultySpread(authoredPool())).toBe(true)
    expect(hasDifficultySpread(flatPool())).toBe(false)
    expect(hasDifficultySpread([q('a', null), q('b', null)])).toBe(false)
    expect(hasDifficultySpread([q('a', 'easy'), q('b', null)])).toBe(false)
  })
})

describe('selectRamped — skipping repeats', () => {
  it('prefers questions the student has not seen', () => {
    const pool = authoredPool()
    const seen = new Set(pool.slice(0, 10).map((p) => p.id))
    const picked = select(pool, 'balanced', 10, seen)
    expect(picked.every((p) => !seen.has(p.id))).toBe(true)
  })

  it('repeats ONLY once the unseen pool is exhausted', () => {
    const pool = authoredPool() // 20 items
    const seen = new Set(pool.slice(0, 15).map((p) => p.id))
    const picked = select(pool, 'balanced', 10, seen)
    expect(picked).toHaveLength(10)
    // The 5 unseen come first; the rest are the documented exhaustion fallback.
    expect(picked.slice(0, 5).every((p) => !seen.has(p.id))).toBe(true)
    expect(picked.slice(5).every((p) => seen.has(p.id))).toBe(true)
  })

  it('never serves the same question twice within one set', () => {
    const pool = authoredPool()
    const seen = new Set(pool.slice(0, 18).map((p) => p.id))
    const picked = select(pool, 'balanced', 10, seen)
    expect(new Set(picked.map((p) => p.id)).size).toBe(picked.length)
  })

  it('still applies the unseen preference on a no-spread pool', () => {
    const pool = flatPool()
    const seen = new Set(pool.slice(0, 5).map((p) => p.id))
    const picked = select(pool, 'balanced', 10, seen)
    expect(picked.every((p) => !seen.has(p.id))).toBe(true)
  })
})

describe('selectRamped — edges', () => {
  it('returns [] for an empty pool or a zero limit', () => {
    expect(select([], 'balanced')).toEqual([])
    expect(select(authoredPool(), 'balanced', 0)).toEqual([])
  })

  it('returns the whole pool when it is smaller than the limit', () => {
    const pool = authoredPool()
    expect(select(pool, 'balanced', 50)).toHaveLength(pool.length)
  })

  it('does not mutate the caller pool', () => {
    const pool = authoredPool()
    const before = pool.map((p) => p.id)
    select(pool, 'hard-weighted')
    expect(pool.map((p) => p.id)).toEqual(before)
  })
})

describe('parseDifficulty', () => {
  it('accepts the three real levels and rejects everything else', () => {
    expect(parseDifficulty('easy')).toBe('easy')
    expect(parseDifficulty('medium')).toBe('medium')
    expect(parseDifficulty('hard')).toBe('hard')
    expect(parseDifficulty(null)).toBeNull()
    expect(parseDifficulty('EASY')).toBeNull()
    expect(parseDifficulty(3)).toBeNull()
  })
})
