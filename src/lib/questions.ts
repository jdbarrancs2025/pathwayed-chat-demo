import { supabase } from '@/lib/supabase'
import { resolveSkillIdsBySlug } from '@/lib/skills'
import type { Json } from '@/lib/database.types'

/**
 * Question Engine, Stage 3 — serve + score. Read-only access to PUBLISHED
 * generated_questions (RLS allows authenticated SELECT on status='published')
 * plus an append-only question_attempts writer (RLS owns_student). The pure
 * scoring/aggregation helpers are unit-tested; the DB calls are best-effort.
 */

export interface PracticeChoice {
  text: string
  is_correct: boolean
  misconception_token?: string
}

export interface PracticeQuestion {
  id: string
  skill_id: string
  sat_alignment: string | null
  stem: string
  choices: PracticeChoice[]
  correct_answer: string
  solution: string | null
}

// --- Pure scoring / aggregation (unit-tested) --------------------------------

/** Score a tapped choice: is it correct, and (if wrong) which misconception. */
export function scoreChoice(
  choices: PracticeChoice[],
  index: number,
): { isCorrect: boolean; misconceptionToken: string | null } {
  const c = choices[index]
  if (!c) return { isCorrect: false, misconceptionToken: null }
  return { isCorrect: c.is_correct === true, misconceptionToken: c.misconception_token ?? null }
}

/** Aggregate a session's answers into total / correct / accuracy (0-100). */
export function summarizeAttempts(results: { isCorrect: boolean }[]): {
  total: number
  correct: number
  accuracy: number
} {
  const total = results.length
  const correct = results.filter((r) => r.isCorrect).length
  const accuracy = total === 0 ? 0 : Math.round((100 * correct) / total)
  return { total, correct, accuracy }
}

// --- Read path: fetch published questions for a skill ------------------------

function parseChoices(raw: Json): PracticeChoice[] {
  if (!Array.isArray(raw)) return []
  const out: PracticeChoice[] = []
  for (const c of raw) {
    if (!c || typeof c !== 'object' || Array.isArray(c)) continue
    const obj = c as Record<string, unknown>
    if (typeof obj.text !== 'string' || typeof obj.is_correct !== 'boolean') continue
    out.push({
      text: obj.text,
      is_correct: obj.is_correct,
      ...(typeof obj.misconception_token === 'string' ? { misconception_token: obj.misconception_token } : {}),
    })
  }
  return out
}

function shuffle<T>(arr: T[]): T[] {
  const a = [...arr]
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    ;[a[i], a[j]] = [a[j], a[i]]
  }
  return a
}

/**
 * Fetch up to `limit` PUBLISHED questions for a skill (by slug), shuffled. The
 * full cache is tiny (~20/skill), so we fetch and pick client-side. Returns []
 * if the skill or questions can't be read (RLS/empty), never throws.
 */
export async function fetchPracticeQuestions(skillSlug: string, limit: number): Promise<PracticeQuestion[]> {
  const idBySlug = await resolveSkillIdsBySlug([skillSlug])
  const skillId = idBySlug.get(skillSlug)
  if (!skillId) return []

  const { data, error } = await supabase
    .from('generated_questions')
    .select('id, skill_id, sat_alignment, stem, choices, correct_answer, solution')
    .eq('skill_id', skillId)
    .eq('status', 'published')
  if (error) {
    console.error('fetchPracticeQuestions failed', error)
    return []
  }

  const parsed: PracticeQuestion[] = []
  for (const row of data ?? []) {
    const choices = parseChoices(row.choices)
    if (choices.length < 2) continue // skip anything malformed
    parsed.push({
      id: row.id,
      skill_id: row.skill_id,
      sat_alignment: row.sat_alignment,
      stem: row.stem,
      choices,
      correct_answer: row.correct_answer,
      solution: row.solution,
    })
  }
  return shuffle(parsed).slice(0, limit)
}

// --- Read path: which skills are practiceable (have published questions) -----

export interface PracticeableSkill {
  skill_id: string
  slug: string
  name: string
  subject: string
  grade_band: string | null
}

// Display order for grouping the practice picker by subject (mirrors the
// dashboard's SUBJECT_DISPLAY_ORDER); unknown subjects sort last, then by name.
const PRACTICE_SUBJECT_ORDER = ['math', 'reading', 'writing', 'science']

/**
 * List the skills a student can actually practice right now: every skill with at
 * least one PUBLISHED question, joined to its skill metadata and sorted by
 * subject then name. Drives the dashboard practice picker — skills without
 * questions never appear. Best-effort: returns [] on any read error, never throws.
 */
export async function listPracticeableSkills(): Promise<PracticeableSkill[]> {
  // RLS already limits the client to status='published'; the filter is explicit
  // so the intent is clear and it still holds if policies change.
  const { data: qRows, error: qError } = await supabase
    .from('generated_questions')
    .select('skill_id')
    .eq('status', 'published')
  if (qError) {
    console.error('listPracticeableSkills: questions read failed', qError)
    return []
  }
  const skillIds = [...new Set((qRows ?? []).map((r) => r.skill_id).filter(Boolean))]
  if (!skillIds.length) return []

  const { data: skillRows, error: sError } = await supabase
    .from('skills')
    .select('id, slug, name, subject, grade_band')
    .in('id', skillIds)
  if (sError) {
    console.error('listPracticeableSkills: skills read failed', sError)
    return []
  }

  const skills: PracticeableSkill[] = []
  for (const s of skillRows ?? []) {
    if (!s.slug || !s.name) continue // need a slug to route practice to
    skills.push({ skill_id: s.id, slug: s.slug, name: s.name, subject: s.subject, grade_band: s.grade_band })
  }

  const orderOf = (subject: string) => {
    const i = PRACTICE_SUBJECT_ORDER.indexOf(subject)
    return i === -1 ? PRACTICE_SUBJECT_ORDER.length : i
  }
  return skills.sort((a, b) => orderOf(a.subject) - orderOf(b.subject) || a.name.localeCompare(b.name))
}

// --- Read path: placement diagnostic set -------------------------------------

/** A diagnostic item carries its skill's grade_band so the page can score by band. */
export interface DiagnosticQuestion extends PracticeQuestion {
  grade_band: string | null
}

/**
 * Placement diagnostic set (Phase 2): one PUBLISHED question from each of the
 * given skills, each tagged with its grade_band, shuffled into a mixed order.
 * Reuses the normal per-skill serve path, so diagnostic items are exactly the
 * questions a student would practice. Returns [] for an empty skill list.
 */
export async function fetchDiagnosticQuestions(skills: PracticeableSkill[]): Promise<DiagnosticQuestion[]> {
  if (!skills.length) return []
  const sets = await Promise.all(
    skills.map(async (s) => {
      const qs = await fetchPracticeQuestions(s.slug, 1)
      return qs.map((q) => ({ ...q, grade_band: s.grade_band }))
    }),
  )
  return shuffle(sets.flat())
}

// --- Write path: append-only question_attempts -------------------------------

export interface QuestionAttemptInput {
  studentId: string
  generatedQuestionId: string
  skillId: string
  satAlignment: string | null
  isCorrect: boolean
  chosenChoiceIndex: number | null
  chosenMisconceptionToken: string | null
  /** Epoch ms when the question was shown; time_ms is computed here (null skips). */
  shownAtMs: number | null
  /** True when recorded by the placement diagnostic (kept out of practice history). */
  isDiagnostic?: boolean
}

/**
 * Record one answered question (append-only). Best-effort and fire-and-forget:
 * callers `void` this so a mid-session quit still persists what was answered, and
 * a failure never blocks the kid's flow. RLS (owns_student) scopes the insert to
 * the signed-in parent's own child.
 */
export async function recordQuestionAttempt(a: QuestionAttemptInput): Promise<void> {
  const timeMs = a.shownAtMs == null ? null : Math.max(0, Date.now() - a.shownAtMs)
  const payload = {
    student_id: a.studentId,
    generated_question_id: a.generatedQuestionId,
    skill_id: a.skillId,
    sat_alignment: a.satAlignment,
    is_correct: a.isCorrect,
    chosen_choice_index: a.chosenChoiceIndex,
    chosen_misconception_token: a.chosenMisconceptionToken,
    time_ms: timeMs,
    is_diagnostic: a.isDiagnostic ?? false,
  }
  // Surface BOTH a returned error (e.g. RLS) and a thrown rejection — the
  // fire-and-forget caller would otherwise swallow either silently.
  try {
    const { error } = await supabase.from('question_attempts').insert(payload)
    if (error) console.error('question_attempt insert failed', { error, payload })
  } catch (err) {
    console.error('question_attempt insert threw', { err, payload })
  }
}
