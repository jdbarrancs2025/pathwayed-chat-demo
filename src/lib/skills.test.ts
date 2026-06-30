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

describe('nextMastery (recency-weighted running accuracy)', () => {
  it('seeds mastery to the session accuracy on the first attempt', () => {
    expect(nextMastery(null, 100)).toEqual({ accuracy: 100, mastery_percentage: 100, attempts: 1 })
  })
  it('weights the latest session at RECENCY_WEIGHT (0.4) over prior mastery', () => {
    // 100*0.6 + 40*0.4 = 76
    expect(nextMastery({ mastery_percentage: 100, attempts: 1 }, 40)).toEqual({
      accuracy: 40,
      mastery_percentage: 76,
      attempts: 2,
    })
  })
  it('clamps and rounds into 0..100 and increments attempts', () => {
    const r = nextMastery({ mastery_percentage: 50, attempts: 3 }, 70)
    expect(r.attempts).toBe(4)
    expect(r.mastery_percentage).toBe(58) // 50*0.6 + 70*0.4 = 58
    expect(r.accuracy).toBe(70)
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
