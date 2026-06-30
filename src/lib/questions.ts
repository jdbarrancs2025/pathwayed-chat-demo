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
}

/**
 * Record one answered question (append-only). Best-effort and fire-and-forget:
 * callers `void` this so a mid-session quit still persists what was answered, and
 * a failure never blocks the kid's flow. RLS (owns_student) scopes the insert to
 * the signed-in parent's own child.
 */
export async function recordQuestionAttempt(a: QuestionAttemptInput): Promise<void> {
  const timeMs = a.shownAtMs == null ? null : Math.max(0, Date.now() - a.shownAtMs)
  const { error } = await supabase.from('question_attempts').insert({
    student_id: a.studentId,
    generated_question_id: a.generatedQuestionId,
    skill_id: a.skillId,
    sat_alignment: a.satAlignment,
    is_correct: a.isCorrect,
    chosen_choice_index: a.chosenChoiceIndex,
    chosen_misconception_token: a.chosenMisconceptionToken,
    time_ms: timeMs,
  })
  if (error) console.error('question_attempt insert failed', error)
}
