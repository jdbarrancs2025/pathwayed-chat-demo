import { describe, it, expect } from 'vitest'
import {
  buildCoachMessage,
  buildTodaysPlan,
  type ReadinessRecord,
  type ReadinessView,
  type SkillRef,
} from './readiness'

const ref = (slug: string, name: string, subject: string, mastery: number): SkillRef => ({
  slug,
  name,
  subject,
  mastery,
})

const rec = (over: Partial<ReadinessRecord>): ReadinessRecord => ({
  score: 50,
  strengths: [],
  gaps: [],
  nextSkillSlug: null,
  measuredSkills: 3,
  ...over,
})

const EMOJI = /\p{Extended_Pictographic}/u

describe('buildCoachMessage', () => {
  it('no data -> friendly start prompt, no emoji', () => {
    const msg = buildCoachMessage({ pathway: null, bySubject: {}, hasAny: false, loadFailed: false })
    expect(msg.toLowerCase()).toContain('start')
    expect(msg).not.toMatch(EMOJI)
  })

  it('focus: a mid score with a gap names the weakest skill', () => {
    const view: ReadinessView = {
      hasAny: true,
    loadFailed: false,
      pathway: rec({
        score: 55,
        strengths: [ref('mult', 'Multiplication', 'math', 70)],
        gaps: [ref('frac', 'Understanding Fractions', 'math', 30)],
        nextSkillSlug: 'frac',
      }),
      bySubject: { math: rec({ score: 55 }) },
    }
    const msg = buildCoachMessage(view)
    expect(msg).toContain('Understanding Fractions')
    expect(msg).not.toMatch(EMOJI)
  })

  it('celebrate: a strong score names a strength', () => {
    const view: ReadinessView = {
      hasAny: true,
    loadFailed: false,
      pathway: rec({
        score: 88,
        strengths: [ref('mi', 'Main Idea', 'reading', 90)],
        gaps: [],
        nextSkillSlug: 'mi',
      }),
      bySubject: { reading: rec({ score: 88 }) },
    }
    const msg = buildCoachMessage(view)
    expect(msg).toContain('Main Idea')
    expect(msg).not.toMatch(EMOJI)
  })

  it('encourage: a just-beginning student with no gaps gets encouragement', () => {
    const view: ReadinessView = {
      hasAny: true,
    loadFailed: false,
      pathway: rec({ score: 15, strengths: [ref('a', 'A', 'math', 15)], gaps: [] }),
      bySubject: { math: rec({ score: 15 }) },
    }
    const msg = buildCoachMessage(view)
    expect(msg.length).toBeGreaterThan(0)
    expect(msg).not.toMatch(EMOJI)
    // not a focus/celebrate message (no skill placeholder leaked)
    expect(msg).not.toContain('{skill}')
  })

  it('is deterministic for the same input', () => {
    const view: ReadinessView = {
      hasAny: true,
    loadFailed: false,
      pathway: rec({ score: 55, gaps: [ref('frac', 'Fractions', 'math', 30)] }),
      bySubject: { math: rec({ score: 55 }) },
    }
    expect(buildCoachMessage(view)).toBe(buildCoachMessage(view))
  })
})

describe('buildTodaysPlan', () => {
  it('no data -> empty plan', () => {
    expect(buildTodaysPlan({ pathway: null, bySubject: {}, hasAny: false, loadFailed: false })).toEqual([])
  })

  it('derives 2-4 deduped items that deep-link to real subjects', () => {
    const view: ReadinessView = {
      hasAny: true,
    loadFailed: false,
      pathway: rec({
        score: 50,
        strengths: [ref('mi', 'Main Idea', 'reading', 80)],
        gaps: [ref('frac', 'Understanding Fractions', 'math', 25)],
        nextSkillSlug: 'frac',
      }),
      bySubject: { math: rec({ score: 30 }), reading: rec({ score: 70 }) },
    }
    const plan = buildTodaysPlan(view)
    expect(plan.length).toBeGreaterThanOrEqual(2)
    expect(plan.length).toBeLessThanOrEqual(4)
    // weakest skill review is first
    expect(plan[0].label).toBe('Review Understanding Fractions')
    // every item links to a known subject
    for (const item of plan) {
      expect(['math', 'reading', 'writing']).toContain(item.subject)
    }
    // no duplicate labels
    expect(new Set(plan.map((p) => p.label)).size).toBe(plan.length)
  })

  it('still produces a plan when there is only one practiced skill', () => {
    const view: ReadinessView = {
      hasAny: true,
    loadFailed: false,
      pathway: rec({
        score: 60,
        strengths: [ref('frac', 'Fractions', 'math', 60)],
        gaps: [],
        nextSkillSlug: 'frac',
      }),
      bySubject: { math: rec({ score: 60 }) },
    }
    const plan = buildTodaysPlan(view)
    expect(plan.length).toBeGreaterThanOrEqual(1)
    for (const item of plan) expect(item.subject).toBe('math')
    expect(new Set(plan.map((p) => p.label)).size).toBe(plan.length)
  })
})
