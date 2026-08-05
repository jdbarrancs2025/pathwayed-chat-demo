import { describe, it, expect } from 'vitest'
import {
  computeSatProjection,
  buildReadinessView,
  buildTodaysPlan,
  SAT_DOMAINS,
  type SatSkillRow,
} from './readiness'

// Fixed "now" so recency weighting is deterministic.
const NOW = 1_700_000_000_000
const daysAgo = (d: number) => new Date(NOW - d * 86_400_000).toISOString()

function srow(over: Partial<SatSkillRow> & { slug: string; sat_alignment: string }): SatSkillRow {
  return {
    name: over.slug,
    subject: 'math',
    mastery_percentage: 50,
    attempts: 3,
    last_practiced: daysAgo(0),
    ...over,
  }
}

// 4 fresh, fully-weighted math skills -> clears the low-data gate (>= 4 attempted).
function fourMath(over: Partial<SatSkillRow> = {}): SatSkillRow[] {
  // Spread FIRST so slug and sat_alignment cannot be overridden: they are the
  // identity of each row, and SatSkillRow types sat_alignment as nullable, so a
  // trailing spread widened it to string | null.
  return [
    srow({ ...over, slug: 'm1', sat_alignment: 'algebra' }),
    srow({ ...over, slug: 'm2', sat_alignment: 'algebra' }),
    srow({ ...over, slug: 'm3', sat_alignment: 'advanced-math' }),
    srow({ ...over, slug: 'm4', sat_alignment: 'advanced-math' }),
  ]
}

const domain = (res: ReturnType<typeof computeSatProjection>, token: string) =>
  res.payload.sections[SAT_DOMAINS.find((d) => d.token === token)!.section].domains.find((d) => d.token === token)!

describe('computeSatProjection — domain grouping', () => {
  it('groups mastery by sat_alignment into per-domain %s; empty domains are null', () => {
    const res = computeSatProjection(
      [
        srow({ slug: 'a', sat_alignment: 'algebra', mastery_percentage: 80, attempts: 3 }),
        srow({ slug: 'b', sat_alignment: 'advanced-math', mastery_percentage: 40, attempts: 3 }),
      ],
      NOW,
    )
    expect(domain(res, 'algebra').pct).toBe(80)
    expect(domain(res, 'advanced-math').pct).toBe(40)
    expect(domain(res, 'problem-solving-data-analysis').pct).toBeNull() // no rows
    expect(domain(res, 'geometry-trigonometry').pct).toBeNull()
  })
})

describe('computeSatProjection — section blend', () => {
  it('blends domains into a section % (confidence-weighted), empty section -> null', () => {
    const res = computeSatProjection(
      [
        srow({ slug: 'a', sat_alignment: 'algebra', mastery_percentage: 80, attempts: 3 }),
        srow({ slug: 'b', sat_alignment: 'advanced-math', mastery_percentage: 40, attempts: 3 }),
      ],
      NOW,
    )
    // Equal weight (same attempts/recency) -> simple mean of 80 and 40.
    expect(res.payload.sections.math.pct).toBe(60)
    expect(res.payload.sections['reading-writing'].pct).toBeNull() // no R/W rows
  })
})

describe('computeSatProjection — today range', () => {
  it('emits a sane 400-1600 range (low<high, in-bounds, multiples of 10)', () => {
    const res = computeSatProjection(fourMath({ mastery_percentage: 70 }), NOW)
    expect(res.payload.gate).toBe('ok')
    const t = res.payload.today!
    expect(t.low).toBeLessThan(t.high)
    expect(t.low).toBeGreaterThanOrEqual(400)
    expect(t.high).toBeLessThanOrEqual(1600)
    expect(t.low % 10).toBe(0)
    expect(t.high % 10).toBe(0)
    // Section bands stay inside 200-800.
    const m = res.payload.sections.math.today!
    expect(m.low).toBeGreaterThanOrEqual(200)
    expect(m.high).toBeLessThanOrEqual(800)
  })

  it('widens the range inversely to data volume (more attempts -> tighter band)', () => {
    const thin = computeSatProjection(fourMath({ attempts: 1, mastery_percentage: 70 }), NOW)
    const thick = computeSatProjection(fourMath({ attempts: 6, mastery_percentage: 70 }), NOW)
    const wThin = thin.payload.sections.math.today!
    const wThick = thick.payload.sections.math.today!
    expect(wThick.high - wThick.low).toBeLessThan(wThin.high - wThin.low)
  })

  it('higher mastery -> higher band center', () => {
    const low = computeSatProjection(fourMath({ mastery_percentage: 30 }), NOW).payload.sections.math.today!
    const high = computeSatProjection(fourMath({ mastery_percentage: 90 }), NOW).payload.sections.math.today!
    const center = (b: { low: number; high: number }) => (b.low + b.high) / 2
    expect(center(high)).toBeGreaterThan(center(low))
  })
})

describe('computeSatProjection — trajectory range (ceiling, not a trend)', () => {
  it('lifts weak skills toward the target so the ceiling sits above today', () => {
    const res = computeSatProjection(fourMath({ mastery_percentage: 30, attempts: 3 }), NOW)
    const today = res.payload.today!
    const traj = res.payload.trajectory!
    expect(traj.high).toBeGreaterThan(today.high)
    expect(traj.low).toBeGreaterThan(today.low)
    expect(traj.low).toBeGreaterThanOrEqual(400)
    expect(traj.high).toBeLessThanOrEqual(1600)
  })

  it('a student already at/above target has a ceiling at/above today (never below)', () => {
    const res = computeSatProjection(fourMath({ mastery_percentage: 95, attempts: 3 }), NOW)
    expect(res.payload.trajectory!.high).toBeGreaterThanOrEqual(res.payload.today!.high)
  })
})

describe('computeSatProjection — empty SAT domain handled (no divide-by-zero)', () => {
  it('R/W blends only domains with evidence; the empty conventions domain is null', () => {
    // Four R/W skills, all in information-and-ideas; conventions has none.
    const rows: SatSkillRow[] = [
      srow({ slug: 'r1', sat_alignment: 'information-and-ideas', subject: 'reading', mastery_percentage: 60, attempts: 3 }),
      srow({ slug: 'r2', sat_alignment: 'information-and-ideas', subject: 'reading', mastery_percentage: 60, attempts: 3 }),
      srow({ slug: 'r3', sat_alignment: 'information-and-ideas', subject: 'reading', mastery_percentage: 60, attempts: 3 }),
      srow({ slug: 'r4', sat_alignment: 'information-and-ideas', subject: 'reading', mastery_percentage: 60, attempts: 3 }),
    ]
    const res = computeSatProjection(rows, NOW)
    expect(res.payload.sections['reading-writing'].pct).toBe(60) // not NaN
    expect(domain(res, 'standard-english-conventions').pct).toBeNull()
    const rw = res.payload.sections['reading-writing'].today!
    expect(Number.isFinite(rw.low)).toBe(true)
    expect(Number.isFinite(rw.high)).toBe(true)
  })
})

describe('computeSatProjection — low-data gate', () => {
  it('fewer than 4 attempted SAT skills -> insufficient, no projected range', () => {
    const res = computeSatProjection(
      [
        srow({ slug: 'a', sat_alignment: 'algebra', attempts: 1 }),
        srow({ slug: 'b', sat_alignment: 'algebra', attempts: 1 }),
        srow({ slug: 'c', sat_alignment: 'algebra', attempts: 1 }),
      ],
      NOW,
    )
    expect(res.payload.gate).toBe('insufficient')
    expect(res.payload.today).toBeNull()
    expect(res.payload.trajectory).toBeNull()
    expect(res.payload.attemptedSatSkills).toBe(3)
  })

  it('exactly 4 attempted SAT skills -> gate opens', () => {
    expect(computeSatProjection(fourMath({ attempts: 1 }), NOW).payload.gate).toBe('ok')
  })

  it('untouched SAT skills (no attempts) are insufficient and listed as missing', () => {
    const res = computeSatProjection(
      [
        srow({ slug: 'u1', sat_alignment: 'algebra', attempts: 0, mastery_percentage: 0, last_practiced: null }),
        srow({ slug: 'u2', sat_alignment: 'geometry-trigonometry', attempts: 0, mastery_percentage: 0, last_practiced: null }),
      ],
      NOW,
    )
    expect(res.payload.gate).toBe('insufficient')
    expect(res.payload.today).toBeNull()
    expect(res.payload.missingBySection.math.map((s) => s.slug).sort()).toEqual(['u1', 'u2'])
    expect(res.nextSkillSlug).not.toBeNull()
  })
})

describe("buildReadinessView / buildTodaysPlan — 'sat' is never a subject", () => {
  it("excludes a 'sat' row from bySubject and from Today's Plan", () => {
    const view = buildReadinessView([
      { readiness_type: 'pathway', score: 70, strengths: [], gaps: [], next_skill_slug: null },
      { readiness_type: 'math', score: 60, strengths: [], gaps: [], next_skill_slug: null },
      { readiness_type: 'sat', score: 55, strengths: [], gaps: [], next_skill_slug: null },
    ])
    expect(view.pathway?.score).toBe(70)
    expect(Object.keys(view.bySubject)).toEqual(['math'])
    expect(view.bySubject.sat).toBeUndefined()

    const plan = buildTodaysPlan(view)
    expect(plan.some((p) => p.subject === 'sat')).toBe(false)
    expect(plan.some((p) => /sat/i.test(p.label))).toBe(false)
  })
})
