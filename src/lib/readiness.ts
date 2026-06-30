import { supabase } from '@/lib/supabase'
import type { Json } from '@/lib/database.types'

/**
 * Academic OS Phase 2 — readiness / Pathway Score engine.
 *
 * `computePathwayScore` is a PURE, documented, NO-ML function: a confidence-
 * weighted average of per-skill mastery, plus per-subject sub-scores, strengths,
 * gaps, and the next skill to practice. `recordReadiness` is the thin DB wrapper
 * that reads the student's mastery, computes, and upserts readiness_scores
 * (client-side under RLS, Option A) — called best-effort after a session.
 *
 * IMPORTANT — what this rests on: the underlying mastery signal is SOFT. Skills
 * practiced are detected by keyword matching over the transcript, and accuracy is
 * proxied by the child's end-of-session self-rating (confidence/sentiment), not
 * graded answers. So the Pathway Score is DIRECTIONALLY USEFUL (it moves the
 * right way as a student practices and improves) but is NOT yet school-grade
 * precise. Treat it as a coaching signal, not an assessment.
 */

// Per-skill confidence weight = attemptsWeight x recencyWeight. A skill counts
// fully only once it's been practiced a few times and recently; a single, stale
// practice barely moves the score.
const CONFIDENCE_ATTEMPTS = 3 // attempts for full attempts-weight (tunable)
const RECENCY_HALFLIFE_DAYS = 30 // mastery weight halves every ~month of no practice
const RECENCY_FLOOR = 0.25 // old practice still counts a little, never zero
const TOP_N = 3 // strengths / gaps list size
const DAY_MS = 86_400_000

// Subjects we publish a per-subject sub-score for (seeded subjects). The overall
// Pathway Score still aggregates ALL practiced skills regardless of subject.
const SUBJECTS = ['math', 'reading', 'writing'] as const

export interface ReadinessSkillRow {
  slug: string
  name: string
  subject: string
  mastery_percentage: number
  attempts: number
  last_practiced: string | null
}

export interface SkillRef {
  slug: string
  name: string
  subject: string
  mastery: number
}

export interface ReadinessBreakdown {
  score: number // 0..100, confidence-weighted average of mastery
  strengths: SkillRef[] // strongest skills (highest mastery)
  gaps: SkillRef[] // weakest skills (lowest mastery)
  nextSkillSlug: string | null // highest-leverage weak skill to practice next
}

export interface PathwayResult {
  /** Overall readiness across every practiced skill. */
  pathway: ReadinessBreakdown
  /** Per-subject readiness, only for subjects that have practiced skills. */
  bySubject: Partial<Record<(typeof SUBJECTS)[number], ReadinessBreakdown>>
}

function clamp(n: number, lo: number, hi: number): number {
  return Math.max(lo, Math.min(hi, n))
}

/** More attempts -> more confident the mastery number is real. */
function attemptsWeight(attempts: number): number {
  return clamp(attempts / CONFIDENCE_ATTEMPTS, 0, 1)
}

/** Recent practice counts more; weight decays with a 30-day half-life, floored. */
function recencyWeight(lastPracticed: string | null, now: number): number {
  if (!lastPracticed) return RECENCY_FLOOR
  const t = Date.parse(lastPracticed)
  if (Number.isNaN(t)) return RECENCY_FLOOR
  const days = Math.max(0, (now - t) / DAY_MS)
  return clamp(Math.pow(0.5, days / RECENCY_HALFLIFE_DAYS), RECENCY_FLOOR, 1)
}

function toRef(r: ReadinessSkillRow): SkillRef {
  return { slug: r.slug, name: r.name, subject: r.subject, mastery: Math.round(r.mastery_percentage) }
}

/**
 * Readiness for a set of skill rows: confidence-weighted mean of mastery, plus
 * the strongest/weakest skills and the next one to practice.
 *   score = sum(mastery_i * w_i) / sum(w_i),  w_i = attemptsWeight x recencyWeight
 */
function computeBreakdown(rows: ReadinessSkillRow[], now: number): ReadinessBreakdown {
  let weighted = 0
  let totalWeight = 0
  for (const r of rows) {
    const w = attemptsWeight(r.attempts) * recencyWeight(r.last_practiced, now)
    weighted += r.mastery_percentage * w
    totalWeight += w
  }
  const score = totalWeight > 0 ? clamp(Math.round(weighted / totalWeight), 0, 100) : 0

  const strongFirst = [...rows].sort(
    (a, b) => b.mastery_percentage - a.mastery_percentage || a.name.localeCompare(b.name),
  )
  // Weakest first; tie-break toward MORE attempts (a persistent weakness is
  // higher-leverage to target than a brand-new skill).
  const weakFirst = [...rows].sort(
    (a, b) =>
      a.mastery_percentage - b.mastery_percentage ||
      b.attempts - a.attempts ||
      a.name.localeCompare(b.name),
  )

  return {
    score,
    strengths: strongFirst.slice(0, TOP_N).map(toRef),
    gaps: weakFirst.slice(0, TOP_N).map(toRef),
    nextSkillSlug: weakFirst[0]?.slug ?? null,
  }
}

/**
 * Pure: compute overall + per-subject readiness from the student's mastery rows.
 * `now` (epoch ms) is passed in so the recency weighting is deterministic/testable.
 */
export function computePathwayScore(rows: ReadinessSkillRow[], now: number): PathwayResult {
  const bySubject: PathwayResult['bySubject'] = {}
  for (const subject of SUBJECTS) {
    const subjectRows = rows.filter((r) => r.subject === subject)
    if (subjectRows.length) bySubject[subject] = computeBreakdown(subjectRows, now)
  }
  return { pathway: computeBreakdown(rows, now), bySubject }
}

// ---------------------------------------------------------------------------
// DB orchestration (client-side under RLS). Not pure; not unit-tested.
// ---------------------------------------------------------------------------

function readinessRow(studentId: string, readinessType: string, b: ReadinessBreakdown) {
  return {
    student_id: studentId,
    readiness_type: readinessType,
    score: b.score,
    strengths: b.strengths as unknown as Json,
    gaps: b.gaps as unknown as Json,
    next_skill_slug: b.nextSkillSlug,
    // Reserved for the future AI Coach; the engine does not populate it yet.
    recommendations: [] as unknown as Json,
  }
}

/**
 * Recompute and persist a student's readiness from a FRESH read of all their
 * student_skill_mastery rows (joined to skills), so the score reflects the
 * just-completed session. Upserts one row per readiness_type ('pathway' +
 * each subject). Best-effort: callers wrap this in try/catch — it must never
 * block the student's flow.
 */
export async function recordReadiness(studentId: string): Promise<void> {
  const { data: masteryRows } = await supabase
    .from('student_skill_mastery')
    .select('skill_id, mastery_percentage, attempts, last_practiced')
    .eq('student_id', studentId)
  if (!masteryRows || !masteryRows.length) return

  const { data: skillRows } = await supabase
    .from('skills')
    .select('id, name, subject, slug')
    .in(
      'id',
      masteryRows.map((r) => r.skill_id),
    )
  const skillById = new Map((skillRows ?? []).map((s) => [s.id, s]))

  const rows: ReadinessSkillRow[] = []
  for (const m of masteryRows) {
    const s = skillById.get(m.skill_id)
    if (!s || !s.slug) continue // only skill-level rows (with a slug) feed readiness
    rows.push({
      slug: s.slug,
      name: s.name,
      subject: s.subject,
      mastery_percentage: Number(m.mastery_percentage),
      attempts: m.attempts,
      last_practiced: m.last_practiced,
    })
  }
  if (!rows.length) return

  const result = computePathwayScore(rows, Date.now())
  const upserts = [
    readinessRow(studentId, 'pathway', result.pathway),
    ...Object.entries(result.bySubject).map(([subject, b]) => readinessRow(studentId, subject, b)),
  ]

  const { error } = await supabase
    .from('readiness_scores')
    .upsert(upserts, { onConflict: 'student_id,readiness_type' })
  if (error) console.error('readiness_scores upsert failed', error)
}
