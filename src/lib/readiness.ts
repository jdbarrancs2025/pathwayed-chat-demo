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

  const strengths = strongFirst.slice(0, TOP_N).map(toRef)
  // Overlap guard: a skill must never be in BOTH lists (looks broken to a
  // parent). With <= TOP_N practiced skills the top-N and bottom-N overlap, so
  // gaps excludes anything already shown as a strength — an empty gaps array is
  // the correct result for a student who only has strengths.
  const strengthSlugs = new Set(strengths.map((s) => s.slug))
  const gaps = weakFirst
    .filter((r) => !strengthSlugs.has(r.slug))
    .slice(0, TOP_N)
    .map(toRef)

  return {
    score,
    strengths,
    gaps,
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

function asRefs(v: Json | null | undefined): SkillRef[] {
  if (!Array.isArray(v)) return []
  return v.filter(
    (x): x is SkillRef =>
      !!x && typeof x === 'object' && 'slug' in x && 'name' in x && 'subject' in x,
  )
}

/** Read this student's readiness_scores (pathway + per-subject). Read-only,
 *  anon client under RLS (owns_student). Always resolves to a view. */
export async function getReadiness(studentId: string): Promise<ReadinessView> {
  const { data, error } = await supabase
    .from('readiness_scores')
    .select('readiness_type, score, strengths, gaps, next_skill_slug')
    .eq('student_id', studentId)
  if (error || !data || !data.length) return { pathway: null, bySubject: {}, hasAny: false }

  let pathway: ReadinessRecord | null = null
  const bySubject: Record<string, ReadinessRecord> = {}
  for (const r of data) {
    const rec: ReadinessRecord = {
      score: Number(r.score),
      strengths: asRefs(r.strengths),
      gaps: asRefs(r.gaps),
      nextSkillSlug: r.next_skill_slug,
    }
    if (r.readiness_type === 'pathway') pathway = rec
    else bySubject[r.readiness_type] = rec
  }
  return { pathway, bySubject, hasAny: true }
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
