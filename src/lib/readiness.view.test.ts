import { describe, it, expect } from 'vitest'
import { readFileSync } from 'node:fs'
import { join } from 'node:path'
import { buildReadinessView } from './readiness'

/**
 * REGRESSION GUARD for the read path.
 *
 * A stored row that HAS a score and HAS measuredSkills must render that score.
 * The bug this locks down: ensureFreshReadiness had two selects on
 * readiness_scores and only one included `recommendations`, where measuredSkills
 * is stored. On the fresh path the column came back undefined, measuredSkills
 * defaulted to 0, and the dashboard showed "not measured yet" for an account whose
 * Pathway score was 65 with three real strengths.
 *
 * These tests exercise buildReadinessView directly, which is the seam every read
 * path funnels through, so a future select that drops a column fails here.
 */

const refs = (slugs: string[]) =>
  slugs.map((slug) => ({ slug, name: slug, subject: 'math', mastery: 90 }))

/** A row as PostgREST returns it. */
const row = (over: Partial<Parameters<typeof buildReadinessView>[0][number]> = {}) => ({
  readiness_type: 'pathway',
  score: 65,
  strengths: refs(['algebra-1-concepts', 'exponents-scientific-notation']),
  gaps: refs(['algebra-2']),
  next_skill_slug: 'algebra-2',
  recommendations: { measuredSkills: 8 },
  ...over,
})

describe('buildReadinessView - measuredSkills survives the read', () => {
  it('renders a SCORE, not the empty state, when the row has evidence behind it', () => {
    // The exact Demo Student row that rendered "not measured yet" in production.
    const v = buildReadinessView([row()])
    expect(v.pathway).not.toBeNull()
    expect(v.pathway!.score).toBe(65)
    expect(v.pathway!.measuredSkills).toBe(8)
    // measuredSkills > 0 is what the dashboard keys the empty state on.
    expect(v.pathway!.measuredSkills).toBeGreaterThan(0)
    expect(v.pathway!.strengths).toHaveLength(2)
  })

  it('carries measuredSkills on per-subject rows too', () => {
    const v = buildReadinessView([
      row(),
      row({ readiness_type: 'math', score: 62, recommendations: { measuredSkills: 7 } }),
      row({ readiness_type: 'reading', score: 84, recommendations: { measuredSkills: 1 } }),
    ])
    expect(v.bySubject.math.measuredSkills).toBe(7)
    expect(v.bySubject.reading.measuredSkills).toBe(1)
  })

  it('the SAT row does not disturb the pathway row', () => {
    // sat reuses `recommendations` for its projection payload and has no
    // measuredSkills key. It must not leak into, or blank out, the pathway row.
    const v = buildReadinessView([
      row(),
      row({
        readiness_type: 'sat',
        score: 65,
        recommendations: { gate: 'ok', sections: { math: { pct: 62 } } },
      }),
    ])
    expect(v.pathway!.measuredSkills).toBe(8)
    expect(v.pathway!.score).toBe(65)
  })

  it('a genuinely unmeasured row reports zero', () => {
    const v = buildReadinessView([
      row({ score: 0, strengths: [], gaps: [], recommendations: { measuredSkills: 0 } }),
    ])
    expect(v.pathway!.measuredSkills).toBe(0)
  })

  it('a legacy row written before measuredSkills existed reports zero', () => {
    // Older engines stored an empty array here. Treat it as unmeasured rather than
    // inventing a count; the version bump recomputes it on next view.
    const v = buildReadinessView([row({ recommendations: [] })])
    expect(v.pathway!.measuredSkills).toBe(0)
  })

  it('tolerates a missing recommendations column without throwing', () => {
    const withColumn = row()
    const withoutColumn = { ...withColumn, recommendations: undefined }
    const v = buildReadinessView([withoutColumn])
    expect(v.pathway!.score).toBe(65)
    expect(v.pathway!.measuredSkills).toBe(0)
  })
})

/**
 * THE TEST THAT WOULD ACTUALLY HAVE CAUGHT THE BUG.
 *
 * The defect was not in buildReadinessView, which was correct throughout. It was a
 * SELECT string that omitted a column, and no unit test on the pure function can
 * see that. ensureFreshReadiness has two selects on readiness_scores and only one
 * listed `recommendations`; whichever rows are handed to buildReadinessView must
 * carry every column it reads.
 *
 * This asserts on the source, the same shape as the no-dashes copy guard.
 */
describe('every readiness_scores select feeding the view carries its columns', () => {
  const source = readFileSync(join(process.cwd(), 'src', 'lib', 'readiness.ts'), 'utf8')

  // Selects that list readiness_type are the ones whose rows reach buildReadinessView.
  // (getSatPayload selects `recommendations` alone and is deliberately excluded.)
  const viewSelects = [...source.matchAll(/\.select\(\s*'([^']*readiness_type[^']*)'/g)].map(
    (m) => m[1],
  )

  it('finds the selects it means to check', () => {
    expect(viewSelects.length).toBeGreaterThanOrEqual(3)
  })

  it.each(['readiness_type', 'score', 'strengths', 'gaps', 'next_skill_slug', 'recommendations'])(
    'every such select includes %s',
    (column) => {
      const missing = viewSelects.filter((s) => !s.includes(column))
      expect(missing, `select(s) missing "${column}": ${missing.join(' | ')}`).toEqual([])
    },
  )
})
