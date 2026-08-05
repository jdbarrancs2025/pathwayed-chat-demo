import { useCallback, useEffect, useRef, useState } from 'react'
import type { Student } from '@/lib/students'
import { recordQuestionAttempt, scoreChoice, type PracticeQuestion } from '@/lib/questions'
import { explainMisconception } from '@/lib/misconceptions'
import { fetchCheckQuestion, shouldServeCheck } from '@/lib/checkQuestion'
import { checkAnswerSummary } from '@/lib/checkQuestionCopy'

/**
 * Drives one check question through its whole life: decide, fetch, show, grade,
 * record, hand back to the conversation.
 *
 * WHERE THE WRITE HAPPENS, AND WHY HERE. The attempt is recorded from the BROWSER
 * through the existing recordQuestionAttempt, under the same owns_student RLS
 * policy, with the same shape Practice writes. No new server credential is
 * introduced. api/chat.ts stays a stateless proxy with no database access at all:
 * it has no authentication today, so attaching the service role to it would let any
 * caller fabricate graded attempts for any student_id, which is precisely the
 * evidence the parent and school dashboards now depend on.
 */
export interface UseCheckQuestionOptions {
  student: Student
  focusSlug: string | null
  checkRequested: boolean
  clearCheckRequest: () => void
  assistantTurns: number
  isLoading: boolean
  /** Called once the child answers, with the nudge to thread and the turn to send. */
  onAnswered: (result: { nudge: string | null; summary: string }) => void
}

export interface CheckQuestionState {
  question: PracticeQuestion | null
  selectedIndex: number | null
  pick: (index: number) => void
}

export function useCheckQuestion(opts: UseCheckQuestionOptions): CheckQuestionState {
  const { student, focusSlug, checkRequested, clearCheckRequest, assistantTurns, isLoading } = opts

  const [question, setQuestion] = useState<PracticeQuestion | null>(null)
  const [selectedIndex, setSelectedIndex] = useState<number | null>(null)
  const [checksServed, setChecksServed] = useState(0)
  const [turnOfLastCheck, setTurnOfLastCheck] = useState<number | null>(null)
  const shownAtRef = useRef(0)
  // Latest-callback ref: kept current in an effect (never during render) so `pick`
  // can stay stable without going stale on the caller's closure.
  const onAnsweredRef = useRef(opts.onAnswered)
  useEffect(() => {
    onAnsweredRef.current = opts.onAnswered
  }, [opts.onAnswered])

  useEffect(() => {
    if (!checkRequested) return
    // Wait for the turn to finish streaming, and never stack a second card on an
    // unanswered one.
    if (isLoading || question) return

    const allowed = shouldServeCheck({ assistantTurns, checksServed, turnOfLastCheck }, true)
    // Consume the request either way: a check Nikki asked for and did not get is
    // dropped, not queued. Queuing would fire it several turns later, out of
    // context, which is worse than not checking.
    clearCheckRequest()
    if (!allowed) return

    let active = true
    void (async () => {
      const q = await fetchCheckQuestion(student, focusSlug)
      if (!active || !q) return
      setQuestion(q)
      setSelectedIndex(null)
      shownAtRef.current = Date.now()
      setChecksServed((n) => n + 1)
      setTurnOfLastCheck(assistantTurns)
    })()
    return () => {
      active = false
    }
  }, [
    checkRequested,
    isLoading,
    question,
    assistantTurns,
    checksServed,
    turnOfLastCheck,
    clearCheckRequest,
    student,
    focusSlug,
  ])

  const pick = useCallback(
    (index: number) => {
      if (!question || selectedIndex !== null) return
      setSelectedIndex(index)
      const { isCorrect, misconceptionToken } = scoreChoice(question.choices, index)

      // Identical to the Practice write path, so generated_question_id is populated
      // and the per-question time median keeps filtering guesses.
      void recordQuestionAttempt({
        studentId: student.id,
        generatedQuestionId: question.id,
        skillId: question.skill_id,
        satAlignment: question.sat_alignment,
        isCorrect,
        chosenChoiceIndex: index,
        chosenMisconceptionToken: misconceptionToken,
        shownAtMs: shownAtRef.current || null,
      })

      const nudge = isCorrect ? null : explainMisconception(misconceptionToken)
      const summary = checkAnswerSummary({
        chosenText: question.choices[index]?.text ?? '',
        isCorrect,
      })
      // Clear the card so the conversation moves on; the answered state has already
      // been recorded and Nikki responds to it in her next turn.
      setQuestion(null)
      setSelectedIndex(null)
      onAnsweredRef.current({ nudge, summary })
    },
    [question, selectedIndex, student.id],
  )

  return { question, selectedIndex, pick }
}
