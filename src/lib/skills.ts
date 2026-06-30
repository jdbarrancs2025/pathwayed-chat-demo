import { supabase } from '@/lib/supabase'
import { focusAreasByGrade } from '@/lib/focusAreas'
import { gradeBand, type GradeBand } from '../../api/teaching-cycle'
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
// 4-band type (api/teaching-cycle.ts — the single source of truth the rest of
// the app uses) to the bands that actually have focus areas / seeded skills.
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

// There is no graded-answer signal yet, so the child's end-of-session self-rating
// ("how did that go?": great/ok/confusing) stands in for accuracy. Documented
// placeholder — Phase 2 should replace it with graded practice / assessment.
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

// Weight on the latest session in the running average. Higher = more reactive to
// the most recent practice; lower = smoother / more history-weighted.
const RECENCY_WEIGHT = 0.4

export interface MasteryComputation {
  accuracy: number // most recent session accuracy (0..100)
  mastery_percentage: number // recency-weighted running accuracy (0..100)
  attempts: number
}

function clamp(n: number): number {
  return Math.max(0, Math.min(100, Math.round(n)))
}

/**
 * Phase-1 mastery update. `accuracy` stores the most recent session's accuracy;
 * `mastery_percentage` is a recency-weighted running average (EWMA) that weights
 * the latest session at RECENCY_WEIGHT and prior mastery at the rest, so recent
 * practice moves the needle without erasing history. The first-ever practice
 * seeds mastery to the session accuracy. No ML.
 */
export function nextMastery(
  prior: { mastery_percentage: number; attempts: number } | null,
  sessionAccuracy: number,
): MasteryComputation {
  const attempts = (prior?.attempts ?? 0) + 1
  const mastery = prior
    ? prior.mastery_percentage * (1 - RECENCY_WEIGHT) + sessionAccuracy * RECENCY_WEIGHT
    : sessionAccuracy
  return { accuracy: clamp(sessionAccuracy), mastery_percentage: clamp(mastery), attempts }
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

  // Prior mastery for these skills in one round-trip, to compute the recency
  // update. (RLS scopes this to the parent's own children.)
  const { data: priorRows } = await supabase
    .from('student_skill_mastery')
    .select('skill_id, mastery_percentage, attempts')
    .eq('student_id', studentId)
    .in('skill_id', skillIds)
  const priorById = new Map<string, { mastery_percentage: number; attempts: number }>()
  for (const r of priorRows ?? []) {
    priorById.set(r.skill_id, { mastery_percentage: Number(r.mastery_percentage), attempts: r.attempts })
  }

  const sessionAccuracy = ratingToAccuracy(rating)
  const now = new Date().toISOString()

  const updates: MasteryUpdate[] = []
  const rows = [...idBySlug].map(([slug, skill_id]) => {
    const comp = nextMastery(priorById.get(skill_id) ?? null, sessionAccuracy)
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
