import { describe, it, expect } from 'vitest'
import { detectPracticedSlugs, nextMastery, ratingToAccuracy } from './skills'
import type { StoredMessage } from './sessions'

const msg = (content: string): StoredMessage => ({ role: 'assistant', content })

describe('ratingToAccuracy', () => {
  it('maps the three end-of-session ratings', () => {
    expect(ratingToAccuracy('great')).toBe(100)
    expect(ratingToAccuracy('ok')).toBe(70)
    expect(ratingToAccuracy('confusing')).toBe(40)
  })
  it('falls back to a neutral value for unknown ratings', () => {
    expect(ratingToAccuracy('whatever')).toBe(60)
  })
})

describe('nextMastery (recency-weighted accuracy, attempts-ramped mastery)', () => {
  it('one great session => accuracy 100, attempts 1, mastery 25 (ramp = 1/4)', () => {
    expect(nextMastery(null, 100)).toEqual({ accuracy: 100, mastery_percentage: 25, attempts: 1 })
  })

  it('four consecutive great sessions ramp mastery to 100', () => {
    let r = nextMastery(null, 100)
    for (let i = 0; i < 3; i++) r = nextMastery({ accuracy: r.accuracy, attempts: r.attempts }, 100)
    expect(r.attempts).toBe(4)
    expect(r.accuracy).toBe(100)
    expect(r.mastery_percentage).toBe(100) // 100 * min(1, 4/4)
  })

  it('great then confusing => accuracy ~76, mastery ~38 at attempts 2', () => {
    const first = nextMastery(null, 100)
    const r = nextMastery({ accuracy: first.accuracy, attempts: first.attempts }, 40)
    expect(r.attempts).toBe(2)
    expect(r.accuracy).toBe(76) // 100*0.6 + 40*0.4
    expect(r.mastery_percentage).toBe(38) // round(76 * min(1, 2/4)) = round(38)
  })
})

describe('detectPracticedSlugs', () => {
  it('detects a math focus area from transcript keywords (scoped to subject+band)', () => {
    const transcript = [
      msg('Let us compare these two fractions. What is the numerator here?'),
      msg('Nice — so 1/2 is bigger.'),
    ]
    expect(detectPracticedSlugs('math', '4', transcript)).toEqual(['fractions'])
  })

  it('can detect multiple reading focus areas in one session', () => {
    const transcript = [msg('What is the main idea of the passage we just read?')]
    const found = detectPracticedSlugs('reading', '4', transcript)
    expect(found).toContain('main-idea')
    expect(found).toContain('reading-comprehension')
  })

  it('returns [] for the k-2 band (no seeded skills) and for non-focus subjects', () => {
    const transcript = [msg('fractions and multiplication')]
    expect(detectPracticedSlugs('math', 'K', transcript)).toEqual([])
    expect(detectPracticedSlugs('homework', '4', transcript)).toEqual([])
  })

  it('returns [] when nothing recognizable was practiced', () => {
    const transcript = [msg('Hi Nikki! I am not sure what to do today.')]
    expect(detectPracticedSlugs('math', '4', transcript)).toEqual([])
  })
})
