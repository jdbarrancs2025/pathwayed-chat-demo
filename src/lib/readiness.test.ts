import { describe, it, expect } from 'vitest'
import { computePathwayScore, type ReadinessSkillRow } from './readiness'

// Fixed "now" so recency weighting is deterministic.
const NOW = 1_700_000_000_000
const daysAgo = (d: number) => new Date(NOW - d * 86_400_000).toISOString()

function row(over: Partial<ReadinessSkillRow> & { slug: string }): ReadinessSkillRow {
  return {
    name: over.slug,
    subject: 'math',
    mastery_percentage: 50,
    attempts: 3,
    last_practiced: daysAgo(0),
    ...over,
  }
}

describe('computePathwayScore', () => {
  it('empty input -> zeroed result', () => {
    const r = computePathwayScore([], NOW)
    expect(r.pathway.score).toBe(0)
    expect(r.pathway.strengths).toEqual([])
    expect(r.pathway.gaps).toEqual([])
    expect(r.pathway.nextSkillSlug).toBeNull()
    expect(r.bySubject).toEqual({})
  })

  it('single fully-weighted skill -> score equals its mastery', () => {
    const r = computePathwayScore(
      [row({ slug: 'fractions', mastery_percentage: 80, attempts: 3, last_practiced: daysAgo(0) })],
      NOW,
    )
    expect(r.pathway.score).toBe(80)
    expect(r.bySubject.math?.score).toBe(80)
    expect(r.pathway.strengths.map((s) => s.slug)).toEqual(['fractions'])
    expect(r.pathway.nextSkillSlug).toBe('fractions')
  })

  it('confidence-weights mastery by attempts and recency', () => {
    // A: mastery 90, attempts 3 (weight 1), today (recency 1) -> w = 1
    // B: mastery 30, attempts 1 (weight 1/3), 60 days ago (recency 0.25) -> w = 0.08333
    // score = (90*1 + 30*0.08333) / (1 + 0.08333) = 92.5 / 1.08333 = 85.38 -> 85
    const r = computePathwayScore(
      [
        row({ slug: 'a', mastery_percentage: 90, attempts: 3, last_practiced: daysAgo(0) }),
        row({ slug: 'b', mastery_percentage: 30, attempts: 1, last_practiced: daysAgo(60) }),
      ],
      NOW,
    )
    expect(r.pathway.score).toBe(85)
    // strongest first, weakest first
    expect(r.pathway.strengths.map((s) => s.slug)).toEqual(['a', 'b'])
    expect(r.pathway.gaps.map((s) => s.slug)).toEqual(['b', 'a'])
    // next skill = weakest
    expect(r.pathway.nextSkillSlug).toBe('b')
  })

  it('computes per-subject sub-scores and an overall score across subjects', () => {
    const r = computePathwayScore(
      [
        row({ slug: 'm', subject: 'math', mastery_percentage: 90, attempts: 3, last_practiced: daysAgo(0) }),
        row({ slug: 'r', subject: 'reading', mastery_percentage: 50, attempts: 2, last_practiced: daysAgo(0) }),
      ],
      NOW,
    )
    expect(r.bySubject.math?.score).toBe(90)
    expect(r.bySubject.reading?.score).toBe(50)
    expect(r.bySubject.writing).toBeUndefined() // no writing rows
    // overall = (90*1 + 50*(2/3)) / (1 + 2/3) = 123.333 / 1.6667 = 74
    expect(r.pathway.score).toBe(74)
    expect(r.pathway.nextSkillSlug).toBe('r') // reading is the weaker
  })

  it('caps strengths/gaps at the top 3', () => {
    const rows = ['s1', 's2', 's3', 's4', 's5'].map((slug, i) =>
      row({ slug, mastery_percentage: (i + 1) * 15 }),
    )
    const r = computePathwayScore(rows, NOW)
    expect(r.pathway.strengths).toHaveLength(3)
    expect(r.pathway.gaps).toHaveLength(3)
    expect(r.pathway.strengths[0].slug).toBe('s5') // highest mastery (75)
    expect(r.pathway.gaps[0].slug).toBe('s1') // lowest mastery (15)
  })
})
