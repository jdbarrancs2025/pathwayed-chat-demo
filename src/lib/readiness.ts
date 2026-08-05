import { supabase } from '@/lib/supabase'
import { subjectDisplayName } from '@/lib/subjects'
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
// A skill is a STRENGTH only at/above STRENGTH_MIN and a GAP only below GAP_MAX.
// STRENGTH_MIN > GAP_MAX, so the two lists can never overlap and a weak "best
// skill" (e.g. 44%) is correctly a gap, never a strength. The band between them
// is a neutral "developing" range.
const STRENGTH_MIN = 70
const GAP_MAX = 60

// Bumped whenever the scoring/classification logic changes. Stored on each
// readiness_scores row so a row computed by an older engine is detected as stale
// and recomputed on next view. (v2 = the threshold-based strengths/gaps fix;
// v3 = adds the SAT readiness projection — existing rows self-heal on next view.)
export const ENGINE_VERSION = 3
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

  // Strengths: only skills at/above STRENGTH_MIN, strongest first. If nothing
  // clears the bar, strengths is empty (the UI shows "building toward strengths"
  // rather than promoting a weak skill).
  const strengths = [...rows]
    .filter((r) => r.mastery_percentage >= STRENGTH_MIN)
    .sort((a, b) => b.mastery_percentage - a.mastery_percentage || a.name.localeCompare(b.name))
    .slice(0, TOP_N)
    .map(toRef)

  // Gaps: only skills below GAP_MAX, weakest first; tie-break toward MORE
  // attempts (a persistent weakness is higher-leverage than a brand-new skill).
  const gaps = [...rows]
    .filter((r) => r.mastery_percentage < GAP_MAX)
    .sort(
      (a, b) =>
        a.mastery_percentage - b.mastery_percentage ||
        b.attempts - a.attempts ||
        a.name.localeCompare(b.name),
    )
    .slice(0, TOP_N)
    .map(toRef)

  return {
    score,
    strengths,
    gaps,
    // Next skill to practice = the weakest gap (none if nothing is below GAP_MAX).
    nextSkillSlug: gaps[0]?.slug ?? null,
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

// ===========================================================================
// SAT readiness engine (pure, NO-ML). Extends the Pathway engine: it reads the
// same confidence-weighted mastery signal but groups by SAT taxonomy
// (sat_alignment domain token -> SAT section) and projects a transparent,
// LABELED-ESTIMATE score range. It is NOT a calibrated SAT predictor.
// ===========================================================================

export type SatSection = 'math' | 'reading-writing'

/** A practiced-or-untouched SAT-aligned skill row fed to the SAT engine. */
export interface SatSkillRow extends ReadinessSkillRow {
  /** SAT domain token from skills.sat_alignment (e.g. 'algebra'). */
  sat_alignment: string | null
}

export interface SatBand {
  low: number
  high: number
}

export interface SatDomainScore {
  token: string
  label: string
  section: SatSection
  /** Confidence-weighted mastery %, or null when the domain has no evidence. */
  pct: number | null
  attemptedSkills: number
}

export interface SatSectionPayload {
  pct: number | null
  /** 200-800 band; null when the low-data gate is closed. */
  today: SatBand | null
  trajectory: SatBand | null
  domains: SatDomainScore[]
}

export interface SatProjectionPayload {
  schemaVersion: number
  gate: 'ok' | 'insufficient'
  attemptedSatSkills: number
  /** Blended overall SAT-readiness %, or null with no evidence. */
  overallPct: number | null
  sections: Record<SatSection, SatSectionPayload>
  /** Combined 400-1600 range TODAY; null when the gate is closed. */
  today: SatBand | null
  /** Combined 400-1600 junior-year CEILING; null when the gate is closed. */
  trajectory: SatBand | null
  missingBySection: Record<SatSection, SkillRef[]>
  nextSkillSlug: string | null
  timeline: string
}

/** What the SAT engine returns: the stored payload plus the row scalars. */
export interface SatEngineResult {
  payload: SatProjectionPayload
  /** 0..100 blended % for the readiness_scores.score column. */
  score: number
  strengths: SkillRef[]
  gaps: SkillRef[]
  nextSkillSlug: string | null
}

// The 8 digital-SAT domains -> section. Mirrors the domain rows seeded in
// seeds/0002_taxonomy_sat_6-12.sql (their `description` carries the section
// token). Static because the digital-SAT domain set is fixed.
export const SAT_DOMAINS: { token: string; label: string; section: SatSection }[] = [
  { token: 'algebra', label: 'Algebra', section: 'math' },
  { token: 'advanced-math', label: 'Advanced Math', section: 'math' },
  { token: 'problem-solving-data-analysis', label: 'Problem-Solving & Data Analysis', section: 'math' },
  { token: 'geometry-trigonometry', label: 'Geometry & Trigonometry', section: 'math' },
  { token: 'information-and-ideas', label: 'Information & Ideas', section: 'reading-writing' },
  { token: 'craft-and-structure', label: 'Craft & Structure', section: 'reading-writing' },
  { token: 'expression-of-ideas', label: 'Expression of Ideas', section: 'reading-writing' },
  { token: 'standard-english-conventions', label: 'Standard English Conventions', section: 'reading-writing' },
]
const SECTION_BY_DOMAIN = new Map(SAT_DOMAINS.map((d) => [d.token, d.section] as const))
const SAT_SECTIONS: SatSection[] = ['math', 'reading-writing']

export const SAT_SCHEMA_VERSION = 1
// Trajectory target: the mastery we assume weak/untouched SAT skills reach.
const SAT_TARGET_MASTERY = 85
// Low-data gate: need at least this many SAT-aligned skills with a real attempt
// before we emit any projected range. Below it -> gate:'insufficient', no range.
const SAT_MIN_SKILLS_FOR_PROJECTION = 4
// Today-range half-width (per section, in SAT points) decays from MAX toward MIN
// as evidence (summed confidence weight) grows: little data -> wide, lots -> tight.
const SAT_HALF_WIDTH_MIN = 40
const SAT_HALF_WIDTH_MAX = 130
const SAT_EVIDENCE_SCALE = 3
// Trajectory is hypothetical (a target, no evidence), so it uses a fixed,
// deliberately rough half-width rather than the data-driven one.
const SAT_TRAJ_HALF_WIDTH = 60
const SAT_GAPS_CAP = 6
const SAT_TIMELINE_NOTE =
  'Projected ranges are transparent estimates from current mastery, a coaching signal, not a calibrated SAT predictor. The trajectory is a junior-year ceiling: where you could land if you bring weak and untouched SAT-aligned skills to about 85% mastery (not a trend from past scores, there is no score history).'

/** Confidence-weighted mastery % over rows, or null when there's no evidence. */
function weightedPct(rows: ReadinessSkillRow[], now: number): { pct: number | null; evidence: number } {
  let weighted = 0
  let totalWeight = 0
  for (const r of rows) {
    const w = attemptsWeight(r.attempts) * recencyWeight(r.last_practiced, now)
    weighted += r.mastery_percentage * w
    totalWeight += w
  }
  if (totalWeight <= 0) return { pct: null, evidence: 0 }
  return { pct: clamp(Math.round(weighted / totalWeight), 0, 100), evidence: totalWeight }
}

/**
 * Ceiling %: the equal-weighted mean of each skill's mastery RAISED to at least
 * the target. Equal-weighted (not confidence-weighted) because this is a
 * hypothetical "fully practiced & mastered" state, not current evidence; an
 * untouched skill (mastery 0) lifts to the target here. Null if no skills.
 */
function ceilingPct(rows: SatSkillRow[]): number | null {
  if (!rows.length) return null
  let sum = 0
  for (const r of rows) sum += Math.max(r.mastery_percentage, SAT_TARGET_MASTERY)
  return clamp(Math.round(sum / rows.length), 0, 100)
}

/** Map a section % (0..100, or null=neutral) to a 200-800 band of given half-width. */
function sectionBand(pct: number | null, halfWidth: number): SatBand {
  const center = 200 + (clamp(pct ?? 50, 0, 100) / 100) * 600
  return {
    low: clamp(Math.round(center - halfWidth), 200, 800),
    high: clamp(Math.round(center + halfWidth), 200, 800),
  }
}

function todayHalfWidth(evidence: number): number {
  return SAT_HALF_WIDTH_MIN + (SAT_HALF_WIDTH_MAX - SAT_HALF_WIDTH_MIN) * Math.exp(-evidence / SAT_EVIDENCE_SCALE)
}

const round10 = (n: number) => Math.round(n / 10) * 10

/** Combine two section bands into a 400-1600 range, rounded to 10s. */
function combineBands(a: SatBand, b: SatBand): SatBand {
  return {
    low: clamp(round10(a.low + b.low), 400, 1600),
    high: clamp(round10(a.high + b.high), 400, 1600),
  }
}

// Missing-skill ordering = highest leverage first: practiced weaknesses before
// untouched skills, then weakest mastery, then most attempts (persistent).
function missingCompare(a: SatSkillRow, b: SatSkillRow): number {
  const ap = a.attempts > 0 ? 0 : 1
  const bp = b.attempts > 0 ? 0 : 1
  if (ap !== bp) return ap - bp
  if (a.mastery_percentage !== b.mastery_percentage) return a.mastery_percentage - b.mastery_percentage
  if (a.attempts !== b.attempts) return b.attempts - a.attempts
  return a.name.localeCompare(b.name)
}

/**
 * Pure SAT projection. `rows` should be every SAT-aligned skill the student
 * could practice (the catalog), with mastery/attempts/last_practiced filled —
 * untouched skills present with attempts:0. `now` (epoch ms) makes recency
 * deterministic/testable. Rows whose sat_alignment isn't a known SAT domain are
 * ignored.
 *
 *   today      = each section % -> 200-800 band (widened when data is thin) ->
 *                summed to a 400-1600 RANGE. Heuristic, labeled estimate.
 *   trajectory = the same, but each section lifted to its CEILING (weak/untouched
 *                skills assumed at ~85%). This is a potential ceiling, NOT a trend
 *                extrapolation — we have no score history.
 *   gate       = 'insufficient' (and no ranges) until enough SAT skills have real
 *                attempts; we never fabricate a range from almost no data.
 */
export function computeSatProjection(rows: SatSkillRow[], now: number): SatEngineResult {
  const satRows = rows.filter((r) => r.sat_alignment && SECTION_BY_DOMAIN.has(r.sat_alignment))

  const attemptedSatSkills = satRows.filter((r) => r.attempts >= 1).length
  const gate: 'ok' | 'insufficient' =
    attemptedSatSkills >= SAT_MIN_SKILLS_FOR_PROJECTION ? 'ok' : 'insufficient'

  // 8 domain %s (today-style, confidence-weighted). Empty domains -> pct null.
  const domainScores: SatDomainScore[] = SAT_DOMAINS.map((d) => {
    const drows = satRows.filter((r) => r.sat_alignment === d.token)
    return {
      token: d.token,
      label: d.label,
      section: d.section,
      pct: weightedPct(drows, now).pct,
      attemptedSkills: drows.filter((r) => r.attempts >= 1).length,
    }
  })

  // 2 section payloads. R/W blends only its domains that have evidence, so an
  // empty domain (e.g. standard-english-conventions) never divides by zero.
  const sections = {} as Record<SatSection, SatSectionPayload>
  for (const section of SAT_SECTIONS) {
    const srows = satRows.filter((r) => SECTION_BY_DOMAIN.get(r.sat_alignment as string) === section)
    const { pct, evidence } = weightedPct(srows, now)
    sections[section] = {
      pct,
      today: gate === 'ok' ? sectionBand(pct, todayHalfWidth(evidence)) : null,
      trajectory: gate === 'ok' ? sectionBand(ceilingPct(srows), SAT_TRAJ_HALF_WIDTH) : null,
      domains: domainScores.filter((d) => d.section === section),
    }
  }

  const overall = weightedPct(satRows, now)
  const today =
    gate === 'ok' ? combineBands(sections.math.today as SatBand, sections['reading-writing'].today as SatBand) : null
  let trajectory =
    gate === 'ok'
      ? combineBands(sections.math.trajectory as SatBand, sections['reading-writing'].trajectory as SatBand)
      : null
  // A ceiling is never below the current estimate: floor the trajectory at
  // today's range. (Matters only when a whole section has no evidence and its
  // wide neutral "today" band would otherwise exceed the narrow neutral ceiling.)
  if (today && trajectory) {
    trajectory = { low: Math.max(trajectory.low, today.low), high: Math.max(trajectory.high, today.high) }
  }

  // Missing = weak (below GAP_MAX) OR untouched (no attempts), grouped by section.
  const missing = satRows.filter((r) => r.attempts === 0 || r.mastery_percentage < GAP_MAX).sort(missingCompare)
  const missingBySection: Record<SatSection, SkillRef[]> = { math: [], 'reading-writing': [] }
  for (const r of missing) {
    const sec = SECTION_BY_DOMAIN.get(r.sat_alignment as string) as SatSection
    missingBySection[sec].push(toRef(r))
  }

  const strengths = [...satRows]
    .filter((r) => r.mastery_percentage >= STRENGTH_MIN)
    .sort((a, b) => b.mastery_percentage - a.mastery_percentage || a.name.localeCompare(b.name))
    .slice(0, TOP_N)
    .map(toRef)

  const nextSkillSlug = missing[0]?.slug ?? null

  const payload: SatProjectionPayload = {
    schemaVersion: SAT_SCHEMA_VERSION,
    gate,
    attemptedSatSkills,
    overallPct: overall.pct,
    sections,
    today,
    trajectory,
    missingBySection,
    nextSkillSlug,
    timeline: SAT_TIMELINE_NOTE,
  }

  return {
    payload,
    score: overall.pct ?? 0,
    strengths,
    gaps: missing.slice(0, SAT_GAPS_CAP).map(toRef),
    nextSkillSlug,
  }
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
    engine_version: ENGINE_VERSION,
  }
}

/**
 * The single readiness_scores row for readiness_type='sat'. The 400-1600
 * projection and ranges don't fit numeric(5,2), so the full SAT payload lives in
 * `recommendations`; `score` holds the blended SAT-readiness % (0..100).
 */
function satReadinessRow(studentId: string, sat: SatEngineResult) {
  return {
    student_id: studentId,
    readiness_type: 'sat',
    score: sat.score,
    strengths: sat.strengths as unknown as Json,
    gaps: sat.gaps as unknown as Json,
    next_skill_slug: sat.nextSkillSlug,
    recommendations: sat.payload as unknown as Json,
    engine_version: ENGINE_VERSION,
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

  const now = Date.now()
  const result = computePathwayScore(rows, now)
  const upserts = [
    readinessRow(studentId, 'pathway', result.pathway),
    ...Object.entries(result.bySubject).map(([subject, b]) => readinessRow(studentId, subject, b)),
  ]

  // SAT readiness: project over the FULL SAT-aligned catalog (so untouched
  // skills count toward the trajectory ceiling and the missing list), left-
  // joined to this student's mastery (untouched -> attempts:0).
  const { data: satCatalog, error: satCatalogError } = await supabase
    .from('skills')
    .select('id, slug, name, subject, sat_alignment')
    .eq('level', 'skill')
    .not('sat_alignment', 'is', null)
  // Never silently swallow this read again — a failed SAT catalog read is why
  // the 'sat' row goes missing while pathway/math still upsert.
  if (satCatalogError) console.error('SAT catalog read failed', satCatalogError)

  const masteryById = new Map(masteryRows.map((m) => [m.skill_id, m]))
  const satRows: SatSkillRow[] = []
  for (const c of satCatalog ?? []) {
    if (!c.slug || !c.sat_alignment) continue
    const m = masteryById.get(c.id)
    satRows.push({
      slug: c.slug,
      name: c.name,
      subject: c.subject,
      sat_alignment: c.sat_alignment,
      mastery_percentage: m ? Number(m.mastery_percentage) : 0,
      attempts: m ? m.attempts : 0,
      last_practiced: m ? m.last_practiced : null,
    })
  }
  if (satRows.length) {
    upserts.push(satReadinessRow(studentId, computeSatProjection(satRows, now)))
  }

  const { error } = await supabase
    .from('readiness_scores')
    .upsert(upserts, { onConflict: 'student_id,readiness_type' })
  if (error) console.error('readiness_scores upsert failed', error)
}

// ---------------------------------------------------------------------------
// Dashboard read + templated (NO-LLM) Coach message and Today's Plan.
// computeXxx above is the engine; the below is read-only presentation, pure
// where possible, so the student dashboard can show "what should I do next".
// ---------------------------------------------------------------------------

export interface ReadinessRecord {
  score: number
  strengths: SkillRef[]
  gaps: SkillRef[]
  nextSkillSlug: string | null
}
export interface ReadinessView {
  pathway: ReadinessRecord | null
  bySubject: Record<string, ReadinessRecord>
  hasAny: boolean
}

/**
 * Narrow stored jsonb into SkillRefs. Written as a loop with an explicit cast
 * rather than a `x is SkillRef` predicate: TypeScript rejects that predicate
 * because SkillRef has no index signature and so is not assignable to Json, even
 * though the runtime shape check is exactly right. The behaviour is unchanged.
 */
function asRefs(v: Json | null | undefined): SkillRef[] {
  if (!Array.isArray(v)) return []
  const out: SkillRef[] = []
  for (const x of v) {
    if (!x || typeof x !== 'object' || Array.isArray(x)) continue
    if ('slug' in x && 'name' in x && 'subject' in x) out.push(x as unknown as SkillRef)
  }
  return out
}

interface ReadinessRowLite {
  readiness_type: string
  score: number
  strengths: Json
  gaps: Json
  next_skill_slug: string | null
}

// Only these readiness_type values are subjects. Other types (notably 'sat')
// must NEVER be treated as a subject — they have their own dedicated view and
// must not leak into bySubject or Today's Plan (no "Practice Sat" item).
const SUBJECT_TYPES = new Set<string>(SUBJECTS)

/** Pure: shape raw readiness_scores rows into a view. Exported for testing. */
export function buildReadinessView(rows: ReadinessRowLite[]): ReadinessView {
  if (!rows.length) return { pathway: null, bySubject: {}, hasAny: false }
  let pathway: ReadinessRecord | null = null
  const bySubject: Record<string, ReadinessRecord> = {}
  for (const r of rows) {
    const rec: ReadinessRecord = {
      score: Number(r.score),
      strengths: asRefs(r.strengths),
      gaps: asRefs(r.gaps),
      nextSkillSlug: r.next_skill_slug,
    }
    if (r.readiness_type === 'pathway') pathway = rec
    else if (SUBJECT_TYPES.has(r.readiness_type)) bySubject[r.readiness_type] = rec
    // else (e.g. 'sat'): ignored here; read directly by the SAT view.
  }
  return { pathway, bySubject, hasAny: true }
}

/** Read this student's readiness_scores (pathway + per-subject). Read-only,
 *  anon client under RLS (owns_student). Always resolves to a view. */
export async function getReadiness(studentId: string): Promise<ReadinessView> {
  const { data, error } = await supabase
    .from('readiness_scores')
    .select('readiness_type, score, strengths, gaps, next_skill_slug')
    .eq('student_id', studentId)
  if (error || !data) return { pathway: null, bySubject: {}, hasAny: false }
  return buildReadinessView(data)
}

function isBand(v: unknown): v is SatBand {
  return !!v && typeof v === 'object' && typeof (v as SatBand).low === 'number' && typeof (v as SatBand).high === 'number'
}

function isSection(v: unknown): v is SatSectionPayload {
  if (!v || typeof v !== 'object') return false
  const s = v as SatSectionPayload
  return (s.pct === null || typeof s.pct === 'number') && (s.today === null || isBand(s.today))
}

/**
 * Defensive parse of a stored 'sat' row's `recommendations` into a
 * SatProjectionPayload. Returns null on anything it doesn't fully recognise —
 * unknown/missing schemaVersion, wrong gate, or a malformed shape — so the card
 * degrades to "nothing / foundation" rather than crashing on a stale payload.
 */
function parseSatPayload(raw: Json | null | undefined): SatProjectionPayload | null {
  if (!raw || typeof raw !== 'object' || Array.isArray(raw)) return null
  const p = raw as Record<string, unknown>
  if (p.schemaVersion !== SAT_SCHEMA_VERSION) return null // only the version we know
  if (p.gate !== 'ok' && p.gate !== 'insufficient') return null
  const sections = p.sections as Record<string, unknown> | undefined
  if (!sections || !isSection(sections.math) || !isSection(sections['reading-writing'])) return null
  if (!(p.today === null || isBand(p.today))) return null
  if (!(p.trajectory === null || isBand(p.trajectory))) return null
  const missing = p.missingBySection as Record<string, unknown> | undefined
  const mathMissing = Array.isArray(missing?.math) ? (missing!.math as SkillRef[]) : []
  const rwMissing = Array.isArray(missing?.['reading-writing']) ? (missing!['reading-writing'] as SkillRef[]) : []
  return {
    schemaVersion: SAT_SCHEMA_VERSION,
    gate: p.gate,
    attemptedSatSkills: typeof p.attemptedSatSkills === 'number' ? p.attemptedSatSkills : 0,
    overallPct: typeof p.overallPct === 'number' ? p.overallPct : null,
    sections: sections as unknown as Record<SatSection, SatSectionPayload>,
    today: (p.today as SatBand | null) ?? null,
    trajectory: (p.trajectory as SatBand | null) ?? null,
    missingBySection: { math: mathMissing, 'reading-writing': rwMissing },
    nextSkillSlug: typeof p.nextSkillSlug === 'string' ? p.nextSkillSlug : null,
    timeline: typeof p.timeline === 'string' ? p.timeline : '',
  }
}

/**
 * Read-only fetch of the student's SAT projection payload (the 'sat'
 * readiness_scores row's `recommendations`). Returns null when there is no row
 * or the payload is an unrecognised shape/version. Does NOT touch the pathway/
 * subject view or Today's Plan. Call after ensureFreshReadiness so it reflects
 * any just-written recompute.
 */
export async function getSatPayload(studentId: string): Promise<SatProjectionPayload | null> {
  const { data, error } = await supabase
    .from('readiness_scores')
    .select('recommendations')
    .eq('student_id', studentId)
    .eq('readiness_type', 'sat')
    .maybeSingle()
  if (error) {
    console.error('SAT payload read failed', error)
    return null
  }
  return parseSatPayload(data?.recommendations)
}

export interface ReadinessFreshnessInput {
  /** Existing readiness rows for the student (any/all readiness_type). */
  readiness: { readiness_type: string; updated_at: string; engine_version: number }[]
  /** updated_at of every student_skill_mastery row for the student. */
  masteryUpdatedAt: string[]
  currentEngineVersion: number
}

/**
 * Pure staleness predicate. Readiness should be recomputed iff there is mastery
 * to compute from AND any of: (a) no readiness row exists, (b) some mastery row
 * is newer than the readiness, (c) the stored engine_version is behind the
 * current one, or (d) the SAT row is missing. Otherwise the stored readiness is
 * current — no write needed.
 */
export function isReadinessStale(input: ReadinessFreshnessInput): boolean {
  if (input.masteryUpdatedAt.length === 0) return false // nothing to compute from
  if (input.readiness.length === 0) return true // (a)
  if (input.readiness.some((r) => r.engine_version < input.currentEngineVersion)) return true // (c)
  // (d) SAT readiness was added after some students were last recomputed: a
  // student with mastery but no 'sat' row must recompute, independent of the
  // engine_version (those rows are already at the current version, so (c) won't
  // catch them). Self-heals existing students without another version bump.
  if (!input.readiness.some((r) => r.readiness_type === 'sat')) return true // (d)
  // (b) any mastery written after the readiness was last computed.
  const readinessTimes = input.readiness.map((r) => Date.parse(r.updated_at)).filter((n) => !Number.isNaN(n))
  const masteryTimes = input.masteryUpdatedAt.map((s) => Date.parse(s)).filter((n) => !Number.isNaN(n))
  if (!readinessTimes.length || !masteryTimes.length) return false
  return Math.max(...masteryTimes) > Math.min(...readinessTimes)
}

/**
 * Return the student's readiness, recomputing+upserting first ONLY if it's stale
 * (see isReadinessStale) — so readiness is current when viewed without writing on
 * every load. Best-effort: client-side under RLS; on any failure it falls back to
 * whatever is stored (or an empty view) and never throws.
 */
export async function ensureFreshReadiness(studentId: string): Promise<ReadinessView> {
  try {
    const [readinessRes, masteryRes] = await Promise.all([
      supabase
        .from('readiness_scores')
        .select('readiness_type, score, strengths, gaps, next_skill_slug, updated_at, engine_version')
        .eq('student_id', studentId),
      supabase.from('student_skill_mastery').select('updated_at').eq('student_id', studentId),
    ])
    // Never let an RLS denial look like "no data" — a read error is not the
    // same as an empty result (it's why mastery came back empty for a non-owner).
    if (readinessRes.error) console.error('readiness_scores read failed', readinessRes.error)
    if (masteryRes.error) console.error('student_skill_mastery read failed', masteryRes.error)

    const readinessRows = readinessRes.data ?? []
    const masteryUpdatedAt = (masteryRes.data ?? []).map((m) => m.updated_at)
    const stale = isReadinessStale({
      readiness: readinessRows.map((r) => ({
        readiness_type: r.readiness_type,
        updated_at: r.updated_at,
        engine_version: r.engine_version,
      })),
      masteryUpdatedAt,
      currentEngineVersion: ENGINE_VERSION,
    })
    if (!stale) return buildReadinessView(readinessRows)

    await recordReadiness(studentId)
    const { data: fresh } = await supabase
      .from('readiness_scores')
      .select('readiness_type, score, strengths, gaps, next_skill_slug')
      .eq('student_id', studentId)
    return buildReadinessView(fresh ?? readinessRows)
  } catch (err) {
    console.error('ensureFreshReadiness failed', err)
    return getReadiness(studentId)
  }
}

type ScoreBand = 'strong' | 'growing' | 'getting-started' | 'just-beginning'
function scoreBand(s: number): ScoreBand {
  if (s >= 80) return 'strong'
  if (s >= 50) return 'growing'
  if (s >= 20) return 'getting-started'
  return 'just-beginning'
}

/** Human band label for a Pathway/readiness score (for the dashboards). */
export function pathwayBandLabel(score: number): string {
  switch (scoreBand(score)) {
    case 'strong':
      return 'Strong'
    case 'growing':
      return 'Growing'
    case 'getting-started':
      return 'Getting started'
    case 'just-beginning':
      return 'Just beginning'
  }
}

// Deterministic pick so the same data always yields the same message (no
// per-render flicker) while different students/states get varied phrasing.
function pick(templates: string[], seed: string): string {
  let h = 5381
  for (let i = 0; i < seed.length; i++) h = ((h << 5) + h + seed.charCodeAt(i)) >>> 0
  return templates[h % templates.length]
}

// Warm, varied, plain-text templates. NO emojis (matches the chat rule).
const COACH_TEMPLATES: Record<'none' | 'encourage' | 'focus' | 'celebrate', string[]> = {
  none: ["Start a practice session and I'll build a plan just for you."],
  encourage: [
    "You're just getting started, and every session makes you stronger. Let's keep going.",
    'Great start. A little practice each day adds up fast.',
    "You're on your way. One short session today keeps the momentum going.",
  ],
  focus: [
    "Let's give {skill} some attention next. A few focused minutes there will pay off.",
    '{skill} is the best thing to practice next. You can do this.',
    "Here's a tip: spend your next session on {skill} to level it up.",
  ],
  celebrate: [
    "You're doing great. {skill} is really strong. Keep it going with a quick session.",
    "Nice work. {skill} is one of your strengths. Let's build on it.",
    '{skill} is looking strong. A short session today will keep you sharp.',
  ],
}

/**
 * Pure, templated (NO-LLM) coach message from readiness. Picks a category —
 * celebrate a strength when the student is strong, focus on the weakest gap
 * when there's one to work on, otherwise encourage — and fills the skill name.
 */
export function buildCoachMessage(readiness: ReadinessView): string {
  const p = readiness.pathway
  if (!readiness.hasAny || !p) return pick(COACH_TEMPLATES.none, 'none')

  const band = scoreBand(p.score)
  let category: keyof typeof COACH_TEMPLATES = 'encourage'
  let skill = ''
  if (band === 'strong' && p.strengths.length) {
    category = 'celebrate'
    skill = p.strengths[0].name
  } else if (p.gaps.length) {
    category = 'focus'
    skill = p.gaps[0].name
  } else {
    category = 'encourage'
  }
  return pick(COACH_TEMPLATES[category], `${category}:${skill}:${p.score}`).replace('{skill}', skill)
}

export interface PlanItem {
  label: string
  /** Subject session to deep-link into (math | reading | writing). */
  subject: string
}

/**
 * Pure: a short ordered plan (2-4 items) from readiness — review the weakest
 * skill, practice the weakest subject, and build on a strength. Empty array when
 * there's no readiness data yet (the card shows an empty state). Labels are
 * deduped so items never repeat.
 */
export function buildTodaysPlan(readiness: ReadinessView): PlanItem[] {
  const p = readiness.pathway
  if (!readiness.hasAny || !p) return []

  const items: PlanItem[] = []
  const seen = new Set<string>()
  const push = (label: string, subject: string) => {
    if (!seen.has(label)) {
      seen.add(label)
      items.push({ label, subject })
    }
  }

  // 1) Review the highest-leverage weak skill.
  const gap = p.gaps[0]
  if (gap) push(`Review ${gap.name}`, gap.subject)

  // 2) Practice the weakest subject(s).
  const subjectsByScore = Object.entries(readiness.bySubject).sort((a, b) => a[1].score - b[1].score)
  for (const [subject] of subjectsByScore) {
    if (items.length >= 3) break
    push(`Practice ${subjectDisplayName(subject)}`, subject)
  }

  // 3) End on a strength.
  const strong = p.strengths[0]
  if (strong && items.length < 4) push(`Keep building ${strong.name}`, strong.subject)

  // Guarantee at least a couple of items when there's any data.
  if (items.length < 2) {
    const anySubject = Object.keys(readiness.bySubject)[0] ?? gap?.subject ?? strong?.subject
    if (anySubject) push(`Try a new skill in ${subjectDisplayName(anySubject)}`, anySubject)
  }

  return items.slice(0, 4)
}
