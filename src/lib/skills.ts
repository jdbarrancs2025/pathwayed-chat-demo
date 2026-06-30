import { supabase } from '@/lib/supabase'
import { focusAreasByGrade } from '@/lib/focusAreas'
import { gradeBand, type GradeBand } from '@/lib/gradeBand'
import type { StoredMessage } from '@/lib/sessions'
import type { Json } from '@/lib/database.types'

/**
 * Academic OS Phase 1 — skill resolution + mastery (client-side, Option A).
 *
 * The taxonomy (migration 0001 + seed 0001) keys every Skill row by `slug`,
 * which is exactly a focusAreas value (src/lib/focusAreas.ts). So mapping a
 * focus area a student practiced to its skill_id is a clean slug join — no fuzzy
 * name matching. All writes go through the anon client under RLS, which keys on
 * students.parent_id, so a parent can only ever touch their own child's rows.
 *
 * Everything here is deliberately simple and inspectable. No ML.
 */

// focusAreas only defines the 3-5/6-8/9-12 bands (no k-2). Narrow the canonical
// 4-band type (src/lib/gradeBand — the single source of truth, also re-exported
// by api/teaching-cycle) to the bands that have focus areas / seeded skills.
type FocusBand = Extract<GradeBand, '3-5' | '6-8' | '9-12'>
type FocusSubject = 'math' | 'reading' | 'writing'

function focusBand(grade: string): FocusBand | null {
  const band = gradeBand(grade)
  return band === 'k-2' ? null : band
}

function isFocusSubject(subject: string): subject is FocusSubject {
  return subject === 'math' || subject === 'reading' || subject === 'writing'
}

// ---------------------------------------------------------------------------
// Resolver: focusAreas value -> skills.slug -> skill_id
// ---------------------------------------------------------------------------

/**
 * Resolve focusAreas slugs to skill_ids via the unique `slug` join. Unknown
 * slugs are simply absent from the returned map (never throws on a typo).
 */
export async function resolveSkillIdsBySlug(slugs: string[]): Promise<Map<string, string>> {
  const unique = [...new Set(slugs)].filter(Boolean)
  const map = new Map<string, string>()
  if (!unique.length) return map
  const { data, error } = await supabase.from('skills').select('id, slug').in('slug', unique)
  if (error || !data) return map
  for (const row of data) if (row.slug) map.set(row.slug, row.id)
  return map
}

// ---------------------------------------------------------------------------
// "Skills practiced" detection (Phase 1 heuristic)
// ---------------------------------------------------------------------------

// Which focus areas were actually practiced this session. We scan the transcript
// for transparent keyword stems per focus area. This is intentionally simple and
// inspectable (NO ML, no prompt changes); Phase 2 can replace it with an LLM /
// structured-practice signal. Keys are focusAreas values (= skill slugs).
const PRACTICE_KEYWORDS: Record<string, string[]> = {
  // Math (3-5)
  multiplication: ['multipl', 'times table', ' times ', 'product of'],
  division: ['divis', 'divid', 'quotient', 'shared equally', 'split into'],
  fractions: ['fraction', 'numerator', 'denominator'],
  geometry: ['geometr', 'perimeter', 'area of', 'angle', 'triangle', 'rectangle', 'shape'],
  // Reading (3-5)
  'main-idea': ['main idea', 'central idea', 'mostly about', 'mainly about', 'the gist'],
  vocabulary: ['vocabular', 'what does the word', 'word mean', 'definition of', 'synonym'],
  'reading-comprehension': ['comprehens', 'the passage', 'the text says', 'reread', 'what happened in the story'],
  'story-elements': ['character', 'setting', 'plot', 'story element', 'beginning, middle'],
  // Writing (3-5)
  'sentence-writing': ['sentence'],
  'short-response': ['short response', 'short answer', 'constructed response', 'cite evidence'],
  'paragraph-writing': ['paragraph', 'topic sentence'],
  'creative-writing': ['creative writing', 'narrative', 'make up a story', 'imagine a'],
}

/**
 * Focus areas evidenced in the transcript, scoped to the session's subject +
 * grade band. Returns focusAreas values (= skill slugs). Subjects without focus
 * areas (science/homework) or bands without seeded skills (k-2) return [].
 */
export function detectPracticedSlugs(subject: string, grade: string, messages: StoredMessage[]): string[] {
  const band = focusBand(grade)
  if (!band || !isFocusSubject(subject)) return []
  const subjectAreas = focusAreasByGrade[band][subject]
  const haystack = messages.map((m) => m.content).join('\n').toLowerCase()
  const found: string[] = []
  for (const { value } of subjectAreas) {
    const keywords = PRACTICE_KEYWORDS[value] ?? [value.replace(/-/g, ' ')]
    if (keywords.some((k) => haystack.includes(k))) found.push(value)
  }
  return found
}

// ---------------------------------------------------------------------------
// Mastery formula (Phase 1: recency-weighted running accuracy)
// ---------------------------------------------------------------------------

// The end-of-session self-rating ("how did that go?": great/ok/confusing) is an
// explicit CONFIDENCE / SENTIMENT proxy — NOT graded accuracy. There is no
// graded-answer signal yet, so it stands in as the per-session signal that feeds
// the running accuracy. Documented placeholder; Phase 2 should replace it with
// graded practice / assessment.
export function ratingToAccuracy(rating: string): number {
  switch (rating) {
    case 'great':
      return 100
    case 'ok':
      return 70
    case 'confusing':
      return 40
    default:
      return 60
  }
}

// Weight on the latest session signal in the running accuracy average. Higher =
// more reactive to the most recent practice; lower = smoother / more history-
// weighted.
const RECENCY_WEIGHT = 0.4

// Attempts needed before mastery can reach 100% of accuracy. Mastery ramps
// linearly with attempts up to this cap, so a single strong session never reads
// as "mastered" — practice has to accumulate. Tunable (3-5).
const MASTERY_FULL_CREDIT_ATTEMPTS = 4

export interface MasteryComputation {
  accuracy: number // recency-weighted running average of the session signal (0..100)
  mastery_percentage: number // accuracy scaled by an attempts-based ramp (0..100)
  attempts: number
}

function clamp(n: number): number {
  return Math.max(0, Math.min(100, Math.round(n)))
}

/**
 * Phase-1 mastery update. `accuracy` is a recency-weighted running average of
 * the per-session signal: the first session seeds it to the signal, later
 * sessions blend prior_accuracy*(1-RECENCY_WEIGHT) + signal*RECENCY_WEIGHT, so
 * recent practice moves the needle without erasing history. `mastery_percentage`
 * then RAMPS that accuracy with attempts — round(accuracy * min(1, attempts/K))
 * — so mastery only approaches accuracy after K sessions of practice; one strong
 * session never reads as mastered. No ML.
 */
export function nextMastery(
  prior: { accuracy: number; attempts: number } | null,
  sessionSignal: number,
): MasteryComputation {
  const attempts = (prior?.attempts ?? 0) + 1
  const accuracy = clamp(
    prior ? prior.accuracy * (1 - RECENCY_WEIGHT) + sessionSignal * RECENCY_WEIGHT : sessionSignal,
  )
  const ramp = Math.min(1, attempts / MASTERY_FULL_CREDIT_ATTEMPTS)
  return { accuracy, mastery_percentage: clamp(accuracy * ramp), attempts }
}

// ---------------------------------------------------------------------------
// Orchestration: record mastery after a finished session
// ---------------------------------------------------------------------------

export interface MasteryUpdate {
  skill_id: string
  slug: string
  attempts: number
  accuracy: number
  mastery_percentage: number
}

/** Persist the per-session summary onto the existing sessions row. */
async function saveSessionSkills(
  studentId: string,
  subject: string,
  skillsPracticed: string[],
  masteryUpdates: MasteryUpdate[],
): Promise<void> {
  await supabase
    .from('sessions')
    .update({
      skills_practiced: skillsPracticed as unknown as Json,
      mastery_updates: masteryUpdates as unknown as Json,
    })
    .eq('student_id', studentId)
    .eq('subject', subject)
}

/**
 * After a finished tutoring session: detect skills practiced, resolve them to
 * skill_ids, recency-update each mastery row (upsert on student_id,skill_id),
 * and record the summary onto the session row (skills_practiced +
 * mastery_updates). Best-effort and side-effect-only — returns the updates (also
 * used by the dashboard's recent-progress view). Never throws into the caller's
 * happy path; mastery is non-critical in Phase 1.
 */
export async function recordSessionMastery(params: {
  studentId: string
  subject: string
  grade: string
  messages: StoredMessage[]
  rating: string
}): Promise<MasteryUpdate[]> {
  const { studentId, subject, grade, messages, rating } = params

  const slugs = detectPracticedSlugs(subject, grade, messages)
  if (!slugs.length) {
    // Nothing recognizable practiced — still stamp an empty summary so the
    // session row reflects that mastery ran.
    await saveSessionSkills(studentId, subject, [], [])
    return []
  }

  const idBySlug = await resolveSkillIdsBySlug(slugs)
  const skillIds = [...idBySlug.values()]
  if (!skillIds.length) {
    await saveSessionSkills(studentId, subject, slugs, [])
    return []
  }

  // Prior accuracy/attempts for these skills in one round-trip, to compute the
  // recency + ramp update. (RLS scopes this to the parent's own children.)
  const { data: priorRows } = await supabase
    .from('student_skill_mastery')
    .select('skill_id, accuracy, attempts')
    .eq('student_id', studentId)
    .in('skill_id', skillIds)
  const priorById = new Map<string, { accuracy: number; attempts: number }>()
  for (const r of priorRows ?? []) {
    priorById.set(r.skill_id, { accuracy: Number(r.accuracy), attempts: r.attempts })
  }

  const sessionSignal = ratingToAccuracy(rating)
  const now = new Date().toISOString()

  const updates: MasteryUpdate[] = []
  const rows = [...idBySlug].map(([slug, skill_id]) => {
    const comp = nextMastery(priorById.get(skill_id) ?? null, sessionSignal)
    updates.push({ skill_id, slug, attempts: comp.attempts, accuracy: comp.accuracy, mastery_percentage: comp.mastery_percentage })
    return {
      student_id: studentId,
      skill_id,
      mastery_percentage: comp.mastery_percentage,
      accuracy: comp.accuracy,
      attempts: comp.attempts,
      last_practiced: now,
    }
  })

  const { error } = await supabase
    .from('student_skill_mastery')
    .upsert(rows, { onConflict: 'student_id,skill_id' })
  if (error) {
    console.error('student_skill_mastery upsert failed', error)
    return []
  }

  await saveSessionSkills(studentId, subject, slugs, updates)
  return updates
}

// ---------------------------------------------------------------------------
// Dashboard reads (read-only; Step 4). No writes here.
// ---------------------------------------------------------------------------

export interface SkillMasteryRow {
  skill_id: string
  name: string
  subject: string
  mastery_percentage: number
  attempts: number
}
export interface SubjectMastery {
  subject: string
  skills: SkillMasteryRow[]
}
export interface StudentMasteryView {
  /** Subjects that have in-band mastery rows, in display order. */
  bySubject: SubjectMastery[]
  /** Subjects the student is currently working (have mastery rows) or — on day
   *  one with no rows yet — the grade band's focus-area subjects. */
  currentSubjects: string[]
  /** Whether any in-band mastery exists at all (drives the empty state). */
  hasAny: boolean
}

const SUBJECT_DISPLAY_ORDER = ['math', 'reading', 'writing', 'science']

/** Subjects that have focus areas (= seedable skills) for a band. */
function bandFocusSubjects(band: GradeBand): string[] {
  if (band === 'k-2') return []
  return SUBJECT_DISPLAY_ORDER.filter((s) => s in focusAreasByGrade[band])
}

/**
 * Pure transform: mastery rows + their skills -> a per-subject, band-scoped view.
 * Rows whose skill is outside the student's grade band are dropped. Kept pure so
 * it is unit-testable without the database.
 */
export function buildMasteryView(
  masteryRows: { skill_id: string; mastery_percentage: number; attempts: number }[],
  skills: { id: string; name: string; subject: string; grade_band: string | null }[],
  band: GradeBand,
): StudentMasteryView {
  const skillById = new Map(skills.map((s) => [s.id, s]))
  const rows: SkillMasteryRow[] = []
  for (const m of masteryRows) {
    const s = skillById.get(m.skill_id)
    if (!s || s.grade_band !== band) continue // grade-band scope
    rows.push({
      skill_id: m.skill_id,
      name: s.name,
      subject: s.subject,
      mastery_percentage: Number(m.mastery_percentage),
      attempts: m.attempts,
    })
  }

  const bySubject: SubjectMastery[] = []
  for (const subject of SUBJECT_DISPLAY_ORDER) {
    const subjectSkills = rows
      .filter((r) => r.subject === subject)
      .sort((a, b) => b.mastery_percentage - a.mastery_percentage || a.name.localeCompare(b.name))
    if (subjectSkills.length) bySubject.push({ subject, skills: subjectSkills })
  }

  const currentSubjects = bySubject.length ? bySubject.map((b) => b.subject) : bandFocusSubjects(band)
  return { bySubject, currentSubjects, hasAny: rows.length > 0 }
}

/**
 * Read a student's skill mastery, grade-band-scoped (canonical gradeBand(grade)),
 * grouped by subject. Two simple selects + a JS join (no PostgREST embedding) so
 * it doesn't depend on relationship metadata. Read-only.
 */
export async function getStudentMastery(studentId: string, grade: string): Promise<StudentMasteryView> {
  const band = gradeBand(grade)
  const { data: masteryRows, error } = await supabase
    .from('student_skill_mastery')
    .select('skill_id, mastery_percentage, attempts')
    .eq('student_id', studentId)
  if (error || !masteryRows || !masteryRows.length) {
    return { bySubject: [], currentSubjects: bandFocusSubjects(band), hasAny: false }
  }
  const { data: skillRows } = await supabase
    .from('skills')
    .select('id, name, subject, grade_band')
    .in(
      'id',
      masteryRows.map((r) => r.skill_id),
    )
  return buildMasteryView(masteryRows, skillRows ?? [], band)
}
