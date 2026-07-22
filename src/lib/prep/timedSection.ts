import { supabase } from '@/lib/supabase'
import { fetchPracticeQuestions, fetchQuestionsByIds, type PracticeQuestion } from '@/lib/questions'
import type { PrepModule, PrepSection } from '@/lib/prep/types'
import { prepSkillFor } from '@/lib/prep/prepSkills'

/**
 * Client wrapper for the timed-section engine. The DATABASE owns time, transitions
 * and scoring (migration 0016): started_at is server now(), remaining time and
 * expiry are computed server-side, and score is graded from the bank in the
 * finalize RPC. This module only orchestrates and renders — it never decides time.
 */

/** Fewest questions a timed section will run with; below this we show a friendly
 *  "not enough questions yet" state rather than a stub test. */
export const MIN_QUESTIONS = 5

export interface PrepAttempt {
  id: string
  studentId: string
  moduleId: string
  sectionId: string
  mode: string
  status: 'in_progress' | 'submitted' | 'expired'
  startedAt: string | null
  submittedAt: string | null
  timeLimitSec: number | null
  questionIds: string[]
  /** questionId -> chosen choice index (into the fetched choice order). */
  answers: Record<string, number>
  score: number | null
  /** Server-authoritative remaining seconds when the RPC provided it, else null. */
  remainingSeconds: number | null
}

interface RawAttempt {
  id: string
  student_id: string
  module_id: string
  section_id: string
  mode: string
  status: string
  started_at: string | null
  submitted_at: string | null
  time_limit_sec: number | null
  question_ids: unknown
  answers: unknown
  score: number | string | null
  remaining_seconds?: number | null
}

function parseAttempt(raw: RawAttempt): PrepAttempt {
  const answers =
    raw.answers && typeof raw.answers === 'object' && !Array.isArray(raw.answers)
      ? (raw.answers as Record<string, number>)
      : {}
  return {
    id: raw.id,
    studentId: raw.student_id,
    moduleId: raw.module_id,
    sectionId: raw.section_id,
    mode: raw.mode,
    status: raw.status as PrepAttempt['status'],
    startedAt: raw.started_at ?? null,
    submittedAt: raw.submitted_at ?? null,
    timeLimitSec: raw.time_limit_sec ?? null,
    questionIds: Array.isArray(raw.question_ids) ? (raw.question_ids as string[]) : [],
    answers,
    score: raw.score != null ? Number(raw.score) : null,
    remainingSeconds: typeof raw.remaining_seconds === 'number' ? raw.remaining_seconds : null,
  }
}

function shuffle<T>(arr: T[]): T[] {
  const a = arr.slice()
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    ;[a[i], a[j]] = [a[j], a[i]]
  }
  return a
}

/**
 * Build a section's question set from the bank via the stand-in skill mapping,
 * deduped across the section's types and capped at the section's questionCount.
 */
async function selectQuestions(section: PrepSection): Promise<PracticeQuestion[]> {
  const slugs = Array.from(
    new Set(section.questionTypes.map((t) => prepSkillFor(t)?.slug).filter((s): s is string => !!s)),
  )
  const perSlug = await Promise.all(
    slugs.map((slug) => fetchPracticeQuestions(slug, section.questionCount > 0 ? section.questionCount : 20)),
  )
  const byId = new Map<string, PracticeQuestion>()
  for (const list of perSlug) for (const q of list) if (!byId.has(q.id)) byId.set(q.id, q)
  const combined = shuffle([...byId.values()])
  const cap = section.questionCount > 0 ? section.questionCount : combined.length
  return combined.slice(0, cap)
}

export interface StartResult {
  attempt: PrepAttempt
  questions: PracticeQuestion[]
}

/**
 * Start a timed section, or resume the in-progress attempt for it. Questions are
 * preselected here and FROZEN by the RPC at creation; on resume the RPC returns the
 * original attempt and we reload its frozen questions (a fresh selection is
 * ignored). Returns { notEnough } when the bank can't supply MIN_QUESTIONS.
 */
export async function startOrResumeSection(
  studentId: string,
  module: PrepModule,
  section: PrepSection,
): Promise<StartResult | { notEnough: true; available: number }> {
  const fresh = await selectQuestions(section)
  if (fresh.length < MIN_QUESTIONS) return { notEnough: true, available: fresh.length }

  const { data, error } = await supabase.rpc('prep_start_section', {
    p_student_id: studentId,
    p_module_id: module.id,
    p_section_id: section.id,
    p_time_limit_sec: section.timeLimitSec,
    p_question_ids: fresh.map((q) => q.id),
  })
  if (error || !data) throw new Error('Could not start the section')
  const attempt = parseAttempt(data as unknown as RawAttempt)
  const questions = await fetchQuestionsByIds(attempt.questionIds)
  return { attempt, questions }
}

/** Authoritative remaining seconds from the server (for the countdown's periodic
 *  re-sync). Returns null if it can't be read. */
export async function getRemaining(attemptId: string): Promise<number | null> {
  const { data, error } = await supabase.rpc('prep_remaining_seconds', { p_attempt_id: attemptId })
  if (error) return null
  return typeof data === 'number' ? data : null
}

/**
 * Persist the full answers map. The guard trigger rejects writes once the attempt
 * is finalized or past its window, so a false return means "not saved" (out of
 * time / already ended), never a silent success.
 */
export async function saveAnswers(attemptId: string, answers: Record<string, number>): Promise<boolean> {
  const { error } = await supabase.from('prep_attempts').update({ answers }).eq('id', attemptId)
  if (error) {
    console.warn('prep saveAnswers rejected:', error.message)
    return false
  }
  return true
}

/** Finalize (submit or expire) and score, server-side. Idempotent. */
export async function finalizeAttempt(attemptId: string, clientExpired: boolean): Promise<PrepAttempt> {
  const { data, error } = await supabase.rpc('prep_finalize_attempt', {
    p_attempt_id: attemptId,
    p_client_expired: clientExpired,
  })
  if (error || !data) throw new Error('Could not finalize the attempt')
  return parseAttempt(data as unknown as RawAttempt)
}

/** Find the in-progress attempt for a section, if any, without creating one (so the
 *  pre-start screen can decide whether to resume straight into the test). */
export async function findInProgressAttempt(
  studentId: string,
  moduleId: string,
  sectionId: string,
): Promise<PrepAttempt | null> {
  const { data, error } = await supabase
    .from('prep_attempts')
    .select('*')
    .eq('student_id', studentId)
    .eq('module_id', moduleId)
    .eq('section_id', sectionId)
    .eq('status', 'in_progress')
    .maybeSingle()
  if (error || !data) return null
  return parseAttempt(data as unknown as RawAttempt)
}

/** Read one attempt (for the review screen). */
export async function getAttempt(attemptId: string): Promise<PrepAttempt | null> {
  const { data, error } = await supabase.from('prep_attempts').select('*').eq('id', attemptId).maybeSingle()
  if (error || !data) return null
  return parseAttempt(data as unknown as RawAttempt)
}

/** Past attempts for a module, newest first (for the Test tab's history list). */
export async function listAttempts(studentId: string, moduleId: string): Promise<PrepAttempt[]> {
  const { data, error } = await supabase
    .from('prep_attempts')
    .select('*')
    .eq('student_id', studentId)
    .eq('module_id', moduleId)
    .order('started_at', { ascending: false })
  if (error || !data) return []
  return data.map((r) => parseAttempt(r as unknown as RawAttempt))
}
