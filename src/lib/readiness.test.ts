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

  it('single strong skill (>= STRENGTH_MIN) is a strength, not a gap', () => {
    const r = computePathwayScore(
      [row({ slug: 'fractions', mastery_percentage: 80, attempts: 3, last_practiced: daysAgo(0) })],
      NOW,
    )
    expect(r.pathway.score).toBe(80)
    expect(r.bySubject.math?.score).toBe(80)
    expect(r.pathway.strengths.map((s) => s.slug)).toEqual(['fractions'])
    expect(r.pathway.gaps).toEqual([]) // 80 is not below GAP_MAX
    expect(r.pathway.nextSkillSlug).toBeNull() // no gap to target
  })

  it('a 44% skill is a GAP, not a strength — even if it is the best skill', () => {
    const r = computePathwayScore([row({ slug: 'division', mastery_percentage: 44, attempts: 4 })], NOW)
    expect(r.pathway.strengths).toEqual([]) // 44 < STRENGTH_MIN(70)
    expect(r.pathway.gaps.map((s) => s.slug)).toEqual(['division']) // 44 < GAP_MAX(60)
    expect(r.pathway.nextSkillSlug).toBe('division')
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
    // a (90) clears STRENGTH_MIN; b (30) is below GAP_MAX -> one each, no overlap.
    expect(r.pathway.strengths.map((s) => s.slug)).toEqual(['a'])
    expect(r.pathway.gaps.map((s) => s.slug)).toEqual(['b'])
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

  it('caps strengths/gaps at the top 3, and the neutral band is neither', () => {
    // 4 strengths (>=70), 1 neutral (65), 4 gaps (<60).
    const rows = [
      row({ slug: 'g1', mastery_percentage: 10 }),
      row({ slug: 'g2', mastery_percentage: 20 }),
      row({ slug: 'g3', mastery_percentage: 30 }),
      row({ slug: 'g4', mastery_percentage: 40 }),
      row({ slug: 'n1', mastery_percentage: 65 }), // neutral: not a strength, not a gap
      row({ slug: 's1', mastery_percentage: 75 }),
      row({ slug: 's2', mastery_percentage: 80 }),
      row({ slug: 's3', mastery_percentage: 85 }),
      row({ slug: 's4', mastery_percentage: 90 }),
    ]
    const r = computePathwayScore(rows, NOW)
    expect(r.pathway.strengths).toHaveLength(3)
    expect(r.pathway.gaps).toHaveLength(3)
    expect(r.pathway.strengths[0].slug).toBe('s4') // highest (90)
    expect(r.pathway.gaps[0].slug).toBe('g1') // lowest (10)
    const allSlugs = [...r.pathway.strengths, ...r.pathway.gaps].map((s) => s.slug)
    expect(allSlugs).not.toContain('n1') // neutral band excluded from both
    const overlap = r.pathway.strengths.filter((s) =>
      r.pathway.gaps.some((g) => g.slug === s.slug),
    )
    expect(overlap).toEqual([]) // never both
  })

  it('two weak skills (both < GAP_MAX) -> empty strengths, both are gaps', () => {
    const r = computePathwayScore(
      [
        row({ slug: 'div', name: 'Division', mastery_percentage: 44 }),
        row({ slug: 'mult', name: 'Multiplication', mastery_percentage: 50 }),
      ],
      NOW,
    )
    expect(r.pathway.strengths).toEqual([]) // neither clears STRENGTH_MIN
    expect(r.pathway.gaps.map((s) => s.slug)).toEqual(['div', 'mult']) // weakest first
    expect(r.pathway.nextSkillSlug).toBe('div')
  })
})
