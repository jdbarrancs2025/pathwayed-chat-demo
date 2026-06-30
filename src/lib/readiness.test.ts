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
    // strongest first; with only 2 skills both are strengths and gaps dedups to
    // empty (no skill in both lists).
    expect(r.pathway.strengths.map((s) => s.slug)).toEqual(['a', 'b'])
    expect(r.pathway.gaps).toEqual([])
    // next skill = weakest, even though gaps is empty
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

  it('caps strengths/gaps at the top 3 with disjoint lists', () => {
    const rows = ['s1', 's2', 's3', 's4', 's5', 's6'].map((slug, i) =>
      row({ slug, mastery_percentage: (i + 1) * 12 }),
    )
    const r = computePathwayScore(rows, NOW)
    expect(r.pathway.strengths).toHaveLength(3)
    expect(r.pathway.gaps).toHaveLength(3)
    expect(r.pathway.strengths[0].slug).toBe('s6') // highest mastery (72)
    expect(r.pathway.gaps[0].slug).toBe('s1') // lowest mastery (12)
    // No skill appears in both lists.
    const overlap = r.pathway.strengths
      .map((s) => s.slug)
      .filter((slug) => r.pathway.gaps.some((g) => g.slug === slug))
    expect(overlap).toEqual([])
  })

  it('never puts a skill in BOTH strengths and gaps (2 practiced skills)', () => {
    const r = computePathwayScore(
      [
        row({ slug: 'strong', mastery_percentage: 80 }),
        row({ slug: 'weak', mastery_percentage: 40 }),
      ],
      NOW,
    )
    const strengthSlugs = r.pathway.strengths.map((s) => s.slug)
    const gapSlugs = r.pathway.gaps.map((g) => g.slug)
    // No overlap: dedup keeps both as strengths and leaves gaps empty (correct).
    expect(gapSlugs.filter((slug) => strengthSlugs.includes(slug))).toEqual([])
    expect(r.pathway.gaps).toEqual([])
    expect(strengthSlugs).toContain('strong')
    // next_skill_slug still points at the weaker skill to practice next.
    expect(r.pathway.nextSkillSlug).toBe('weak')
  })
})
