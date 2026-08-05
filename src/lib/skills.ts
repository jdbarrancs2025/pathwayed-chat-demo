import { supabase } from '@/lib/supabase'
import { focusAreasByGrade } from '@/lib/focusAreas'
import { gradeBand, type GradeBand } from '@/lib/gradeBand'
import { recordReadiness } from '@/lib/readiness'
import { masteryDisplay, displayRank } from '@/lib/masteryDisplay'
import type { MasteryStatus } from '@/lib/mastery'
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

/**
 * The taxonomy display name for a skill slug (skills.name), or null if unknown.
 * Used so a session greeting names the skill properly ("Synonyms") instead of the
 * raw slug — the display name lives in the taxonomy, not in the client.
 */
export async function getSkillNameBySlug(slug: string): Promise<string | null> {
  if (!slug) return null
  const { data } = await supabase.from('skills').select('name').eq('slug', slug).maybeSingle()
  return data?.name ?? null
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
 * SHARED CORE for both the tutoring-session and practice paths: given a per-skill
 * 0-100 signal, recency+ramp-update each mastery row via nextMastery (ONE attempt
 * increment per skill per call), upsert on (student_id, skill_id), then recompute
 * readiness/SAT. Keeping both paths on this one function means the mastery ramp,
 * the SAT attempts gate, and readiness behave identically no matter how the
 * signal was produced (self-rating vs. real scored accuracy). Best-effort:
 * returns [] on an empty input or an upsert error, never throws into the caller.
 */
async function commitMasterySignals(
  studentId: string,
  entries: { skill_id: string; slug: string; signal: number }[],
): Promise<MasteryUpdate[]> {
  if (!entries.length) return []

  // Prior accuracy/attempts in one round-trip (RLS scopes to the parent's child).
  const { data: priorRows, error: priorError } = await supabase
    .from('student_skill_mastery')
    .select('skill_id, accuracy, attempts')
    .eq('student_id', studentId)
    .in(
      'skill_id',
      entries.map((e) => e.skill_id),
    )
  if (priorError) console.error('student_skill_mastery prior read failed', priorError)
  const priorById = new Map<string, { accuracy: number; attempts: number }>()
  for (const r of priorRows ?? []) {
    priorById.set(r.skill_id, { accuracy: Number(r.accuracy), attempts: r.attempts })
  }

  const now = new Date().toISOString()
  const updates: MasteryUpdate[] = []
  const rows = entries.map((e) => {
    // One call = one attempts increment (a session/practice run), regardless of
    // how many questions or transcript turns produced the signal.
    const comp = nextMastery(priorById.get(e.skill_id) ?? null, e.signal)
    updates.push({ skill_id: e.skill_id, slug: e.slug, attempts: comp.attempts, accuracy: comp.accuracy, mastery_percentage: comp.mastery_percentage })
    return {
      student_id: studentId,
      skill_id: e.skill_id,
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
    console.error('student_skill_mastery upsert failed', { error, rows })
    return []
  }

  // Recompute readiness / Pathway Score / SAT from the full mastery set (now
  // including this update). Best-effort — must never block the kid's flow.
  try {
    await recordReadiness(studentId)
  } catch (err) {
    console.error('readiness recompute failed', err)
  }

  return updates
}

/**
 * After a finished tutoring session: detect skills practiced, resolve them to
 * skill_ids, recency-update each mastery row, and record the summary onto the
 * session row (skills_practiced + mastery_updates). Best-effort and side-effect-
 * only — returns the updates (also used by the dashboard's recent-progress view).
 * Never throws into the caller's happy path; mastery is non-critical in Phase 1.
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
  if (!idBySlug.size) {
    await saveSessionSkills(studentId, subject, slugs, [])
    return []
  }

  // The whole session shares one self-rating signal across every practiced skill.
  const sessionSignal = ratingToAccuracy(rating)
  const entries = [...idBySlug].map(([slug, skill_id]) => ({ skill_id, slug, signal: sessionSignal }))
  const updates = await commitMasterySignals(studentId, entries)

  await saveSessionSkills(studentId, subject, slugs, updates)
  return updates
}

/**
 * Record ONE practice session's aggregate accuracy (0-100) for a SINGLE skill —
 * the Stage-3 scored path. One practice session = ONE attempts increment (same
 * as a tutoring session), so the mastery ramp and SAT gate behave consistently
 * with the existing path; the granular per-question record lives in
 * question_attempts. Reuses the exact same nextMastery + upsert + recordReadiness
 * core, so a genuinely poor session lowers mastery. Best-effort.
 */
export async function recordPracticeResult(
  studentId: string,
  skillId: string,
  accuracy: number,
): Promise<MasteryUpdate | null> {
  const signal = clamp(Math.round(accuracy))
  const updates = await commitMasterySignals(studentId, [{ skill_id: skillId, slug: '', signal }])
  return updates[0] ?? null
}

// Placement diagnostic seed (Phase 2). A single diagnostic question is a
// deliberate probe, so it seeds an initial mastery estimate DIRECTLY (not via the
// attempts-based practice ramp, which would read one correct answer as ~25%).
// Explicit, legible numbers; attempts=1 keeps it light so real practice quickly
// refines it. Correct -> 60, wrong -> 25.
const DIAGNOSTIC_CORRECT_MASTERY = 60
const DIAGNOSTIC_WRONG_MASTERY = 25

/**
 * Seed initial student_skill_mastery from a completed placement diagnostic, then
 * recompute readiness so the dashboard/path pick up at the student's real level.
 *
 * SAFETY GUARD: never clobbers real earned mastery. A skill is seeded ONLY if the
 * student has no prior NON-diagnostic attempts for it (no real practice history);
 * skills the student has actually practiced keep their earned mastery untouched.
 * So a returning student re-taking the diagnostic refreshes only their still-
 * provisional (diagnostic-only) skills. Meant to run at placement time.
 * Best-effort: returns the number of rows written, 0 on empty/guarded/error.
 */
export async function seedDiagnosticMastery(
  studentId: string,
  results: { skillId: string; isCorrect: boolean }[],
): Promise<number> {
  // Dedupe by skill (one mastery row per skill; a batch upsert can't touch the
  // same (student, skill) twice), keeping the last answer.
  const bySkill = new Map<string, boolean>()
  for (const r of results) bySkill.set(r.skillId, r.isCorrect)
  if (!bySkill.size) return 0

  // Guard: find skills with real (non-diagnostic) practice history and exclude
  // them, so seeding never resets earned mastery.
  const { data: practiced, error: practicedError } = await supabase
    .from('question_attempts')
    .select('skill_id')
    .eq('student_id', studentId)
    .eq('is_diagnostic', false)
  if (practicedError) {
    console.error('seedDiagnosticMastery: practice-history read failed', practicedError)
    return 0 // fail safe: don't seed if we can't verify practice history
  }
  const practicedSet = new Set((practiced ?? []).map((r) => r.skill_id))
  for (const skillId of [...bySkill.keys()]) {
    if (practicedSet.has(skillId)) bySkill.delete(skillId)
  }
  if (!bySkill.size) return 0

  const now = new Date().toISOString()
  const rows = [...bySkill].map(([skill_id, isCorrect]) => ({
    student_id: studentId,
    skill_id,
    mastery_percentage: isCorrect ? DIAGNOSTIC_CORRECT_MASTERY : DIAGNOSTIC_WRONG_MASTERY,
    accuracy: isCorrect ? 100 : 0,
    attempts: 1,
    last_practiced: now,
  }))

  const { error } = await supabase
    .from('student_skill_mastery')
    .upsert(rows, { onConflict: 'student_id,skill_id' })
  if (error) {
    console.error('seedDiagnosticMastery upsert failed', { error, rows })
    return 0
  }

  // Recompute readiness/Pathway/SAT from the freshly-seeded mastery.
  try {
    await recordReadiness(studentId)
  } catch (err) {
    console.error('readiness recompute after diagnostic failed', err)
  }
  return rows.length
}

/**
 * Whether a child has any mastery yet — i.e. has been placed by a completed
 * diagnostic (grades 3-12 seed mastery) or has practiced. Used to decide whether
 * to OFFER placement at the child's home. A brand-new, unplaced child has none.
 * (K-2 placement intentionally doesn't seed, so the offer is gated to 3-12 by the
 * caller.) Fails safe to `true` on error so we never nag a child on a read glitch.
 */
export async function hasAnyMastery(studentId: string): Promise<boolean> {
  const { count, error } = await supabase
    .from('student_skill_mastery')
    .select('id', { count: 'exact', head: true })
    .eq('student_id', studentId)
  if (error) {
    console.error('hasAnyMastery read failed', error)
    return true
  }
  return (count ?? 0) > 0
}

// ---------------------------------------------------------------------------
// Dashboard reads (read-only; Step 4). No writes here.
// ---------------------------------------------------------------------------

export interface SkillMasteryRow {
  skill_id: string
  name: string
  subject: string
  /** Legacy self-rating ramp. Retained for the Pathway score and history; it is
   *  NOT what the dashboard states as a mastery claim. See masteryDisplay.ts. */
  mastery_percentage: number
  attempts: number
  /** Evidence-driven signals (migration 0010) — what the dashboard presents. */
  status: MasteryStatus
  evidence_accuracy: number | null
  attempts_counted: number
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
 * Pure transform: mastery rows + their skills -> a per-subject view of ALL
 * practiced skills. We organize by mastery, not grade: every practiced skill
 * that resolves to a real skill row is shown, regardless of its grade band, so
 * (e.g.) a grade-9 student practicing 6-8 skills still sees that work instead of
 * "No progress yet." Only rows we can't resolve to a skill are dropped. Kept
 * pure so it is unit-testable without the database. `band` is still used to pick
 * the day-one fallback subjects when there's no practice yet.
 */
export function buildMasteryView(
  masteryRows: {
    skill_id: string
    mastery_percentage: number
    attempts: number
    status?: string | null
    evidence_accuracy?: number | string | null
    attempts_counted?: number | null
  }[],
  skills: { id: string; name: string; subject: string; grade_band: string | null }[],
  band: GradeBand,
): StudentMasteryView {
  const skillById = new Map(skills.map((s) => [s.id, s]))
  const rows: SkillMasteryRow[] = []
  for (const m of masteryRows) {
    const s = skillById.get(m.skill_id)
    if (!s) continue // skip rows that don't resolve to a skill (e.g. domain rows)
    rows.push({
      skill_id: m.skill_id,
      name: s.name,
      subject: s.subject,
      mastery_percentage: Number(m.mastery_percentage),
      attempts: m.attempts,
      status: (m.status as MasteryStatus) ?? 'not_started',
      evidence_accuracy: m.evidence_accuracy == null ? null : Number(m.evidence_accuracy),
      attempts_counted: m.attempts_counted ?? 0,
    })
  }

  // Ordered by the strength of the claim we can actually make: mastered, then
  // advanced, then building by accuracy, then the skills we have no evidence for.
  const bySubject: SubjectMastery[] = []
  for (const subject of SUBJECT_DISPLAY_ORDER) {
    const subjectSkills = rows
      .filter((r) => r.subject === subject)
      .sort((a, b) => {
        const da = masteryDisplay(a)
        const db = masteryDisplay(b)
        return (
          displayRank(da.state) - displayRank(db.state) ||
          (db.percent ?? -1) - (da.percent ?? -1) ||
          a.name.localeCompare(b.name)
        )
      })
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
    .select('skill_id, mastery_percentage, attempts, status, evidence_accuracy, attempts_counted')
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
