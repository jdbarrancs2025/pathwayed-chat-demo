import { describe, it, expect } from 'vitest'
import { buildMasteryView, detectPracticedSlugs, nextMastery, ratingToAccuracy } from './skills'
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

describe('buildMasteryView (dashboard read transform)', () => {
  const skills = [
    { id: 's-frac', name: 'Understanding Fractions', subject: 'math', grade_band: '3-5' },
    { id: 's-mult', name: 'Multiplication', subject: 'math', grade_band: '3-5' },
    { id: 's-main', name: 'Main Idea', subject: 'reading', grade_band: '3-5' },
    { id: 's-alg', name: 'Algebra', subject: 'math', grade_band: '6-8' }, // out of band
  ]

  it('groups by subject (display order), sorts by mastery desc, drops out-of-band', () => {
    const mastery = [
      { skill_id: 's-frac', mastery_percentage: 25, attempts: 1 },
      { skill_id: 's-mult', mastery_percentage: 60, attempts: 3 },
      { skill_id: 's-main', mastery_percentage: 50, attempts: 2 },
      { skill_id: 's-alg', mastery_percentage: 90, attempts: 5 },
    ]
    const v = buildMasteryView(mastery, skills, '3-5')
    expect(v.hasAny).toBe(true)
    expect(v.bySubject.map((b) => b.subject)).toEqual(['math', 'reading'])
    // math sorted by mastery desc: Multiplication (60) before Fractions (25)
    expect(v.bySubject[0].skills.map((s) => s.name)).toEqual([
      'Multiplication',
      'Understanding Fractions',
    ])
    // out-of-band Algebra (6-8) is excluded for a 3-5 student
    expect(v.bySubject[0].skills.find((s) => s.name === 'Algebra')).toBeUndefined()
    expect(v.currentSubjects).toEqual(['math', 'reading'])
  })

  it('empty (day one): no rows -> hasAny false, current subjects fall back to band focus areas', () => {
    const v = buildMasteryView([], [], '3-5')
    expect(v.hasAny).toBe(false)
    expect(v.bySubject).toEqual([])
    expect(v.currentSubjects).toEqual(['math', 'reading', 'writing'])
  })

  it('k-2 has no seeded skills -> empty current subjects', () => {
    const v = buildMasteryView([], [], 'k-2')
    expect(v.hasAny).toBe(false)
    expect(v.currentSubjects).toEqual([])
  })
})
