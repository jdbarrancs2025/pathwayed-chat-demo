import {
  fetchRampedQuestions,
  fetchSeenQuestionIds,
  listEligibleSkills,
  type LadderStudentRow,
  type PracticeQuestion,
} from '@/lib/questions'

/**
 * CHECK QUESTIONS — Nikki asking a real, published bank question mid-conversation.
 *
 * WHY. The evidence engine only ever sees question_attempts, and only Practice and
 * the placement diagnostic write those. A student who does their work in tutoring
 * sessions therefore reads as "not enough yet" on the parent dashboard however well
 * they are actually doing. That is a measurement gap, not their standing.
 *
 * RETRIEVAL ONLY, AND THAT IS THE WHOLE POINT. Nikki never authors an item. She
 * chooses WHEN to check; the app chooses WHICH question, from the same published
 * bank Practice serves, and grades it against the stored key. An LLM opinion never
 * becomes a mastery claim that reaches a parent or a principal. Because the item is
 * a real generated_questions row, the attempt carries a generated_question_id, so
 * the per-question time median in recompute_skill_mastery keeps filtering guesses
 * exactly as it does for Practice.
 */

/**
 * The token Nikki emits when she judges a check is warranted. Stripped before the
 * text is displayed, persisted, or sent back to the model, so it never leaks into
 * the transcript and never teaches her to echo it.
 */
export const CHECK_MARKER = '[[check]]'

/** Assistant turns that must pass before the FIRST check. Teach, then check. */
export const CHECK_MIN_ASSISTANT_TURNS = 4
/** Assistant turns that must pass between checks. */
export const CHECK_COOLDOWN_TURNS = 6
/** Hard cap per session. */
export const CHECK_MAX_PER_SESSION = 3
/** How many ramped candidates to draw before picking the one to ask. */
export const CHECK_POOL_SIZE = 5

const MARKER_RX = /\[\[\s*check\s*\]\]/gi

/**
 * Remove every check marker from a chunk of Nikki's text, reporting whether one was
 * there. Tolerates whitespace and case because the model will not be perfectly
 * consistent, and collapses the whitespace the removal leaves behind.
 */
export function stripCheckMarker(text: string): { text: string; requested: boolean } {
  if (!MARKER_RX.test(text)) {
    MARKER_RX.lastIndex = 0
    return { text, requested: false }
  }
  MARKER_RX.lastIndex = 0
  const stripped = text
    .replace(MARKER_RX, '')
    .replace(/[ \t]{2,}/g, ' ')
    .replace(/\n{3,}/g, '\n\n')
    .trim()
  return { text: stripped, requested: true }
}

/** Every prefix of the marker, longest first, for hiding a half-streamed token. */
const PARTIAL_PREFIXES = Array.from({ length: CHECK_MARKER.length - 1 }, (_, i) =>
  CHECK_MARKER.slice(0, CHECK_MARKER.length - 1 - i),
)

/**
 * Display-time strip, applied on every streamed tick. Removes complete markers AND
 * a trailing PARTIAL one, so the child never sees "[[che" appear and vanish at the
 * end of Nikki's message while it is still arriving.
 */
export function stripStreamingCheckMarker(text: string): string {
  const base = text.replace(MARKER_RX, '')
  MARKER_RX.lastIndex = 0
  for (const p of PARTIAL_PREFIXES) {
    if (base.endsWith(p)) return base.slice(0, base.length - p.length).trimEnd()
  }
  // trimEnd on every tick is safe: `shown` is re-derived from the full accumulator
  // each time, so the next token simply re-extends the trimmed text.
  return base.trimEnd()
}

export interface CheckCadenceState {
  /** Assistant turns completed in this session. */
  assistantTurns: number
  /** Checks already served in this session. */
  checksServed: number
  /** assistantTurns value when the last check was served, or null for none yet. */
  turnOfLastCheck: number | null
}

/**
 * May a check be served right now?
 *
 * CADENCE, AND WHY THESE NUMBERS. A check only ever fires when Nikki asks for one
 * AND all three gates pass, so a struggling or quiet stretch produces none at all.
 *
 *   Teach first (4 turns). A check inside the opening exchange turns a lesson into
 *   an entrance exam. Four assistant turns is roughly "she has explained something
 *   and the student has responded to it twice".
 *
 *   Cooldown (6 turns). Long enough that a check reads as a natural pause rather
 *   than a quiz rhythm the student starts anticipating.
 *
 *   Cap (3 per session). This is the number that keeps tutoring from becoming
 *   testing. A typical session runs 20 to 30 assistant turns, so three checks is
 *   about one turn in eight, leaving roughly 90% of the conversation as teaching.
 *   It is also enough to matter: the ADVANCE bar needs 5 graded attempts, so a
 *   student who only ever works in chat reaches it in two sessions, and the
 *   8-attempt MASTERED floor in three. Slower than Practice, which is correct,
 *   because tutoring evidence should accumulate as a by-product of learning rather
 *   than replace the thing it measures.
 */
export function shouldServeCheck(state: CheckCadenceState, requested: boolean): boolean {
  if (!requested) return false
  if (state.checksServed >= CHECK_MAX_PER_SESSION) return false
  if (state.assistantTurns < CHECK_MIN_ASSISTANT_TURNS) return false
  if (state.turnOfLastCheck != null && state.assistantTurns - state.turnOfLastCheck < CHECK_COOLDOWN_TURNS) {
    return false
  }
  return true
}

/**
 * Choose which question to ask: prefer one the student has never seen, so a check
 * measures understanding rather than recall of this exact item. Falls back to the
 * seen pool only when every question for the skill has been used, which is the
 * honest choice over refusing to check at all. Phase 2 owns proper no-repeat
 * cycling; this is the same intent at a smaller scale.
 */
export function chooseCheckQuestion(
  questions: PracticeQuestion[],
  seenIds: Set<string>,
  pick: (n: number) => number = (n) => Math.floor(Math.random() * n),
): PracticeQuestion | null {
  if (!questions.length) return null
  const unseen = questions.filter((q) => !seenIds.has(q.id))
  const pool = unseen.length ? unseen : questions
  return pool[Math.min(pool.length - 1, Math.max(0, pick(pool.length)))] ?? null
}

/**
 * The question to ask, or null when a check is not appropriate.
 *
 * GUARDS, IDENTICAL TO THE PICKER. The lesson's focus skill must still be in the
 * student's eligible set, which means: not already at 'advanced' or 'mastered',
 * inside the grade-ladder ceiling, and inside the content age pin for age-carrying
 * material. If the student has cleared the skill they are not checked on it again,
 * and a skill they may not be served is never smuggled in through the chat.
 *
 * Best-effort throughout: any failure returns null and the conversation simply
 * carries on without a check.
 */
export async function fetchCheckQuestion(
  student: LadderStudentRow,
  focusSlug: string | null,
): Promise<PracticeQuestion | null> {
  if (!focusSlug) return null
  try {
    const eligible = await listEligibleSkills(student)
    const skill = eligible.find((s) => s.slug === focusSlug)
    if (!skill) return null // cleared, above the ceiling, or age-pinned out

    // Ramped like a practice set, so a check question tracks the same rolling
    // performance the practice flow does. Ask for a handful rather than one, then
    // pick within them, so the unseen preference still has room to work.
    const [ramped, seen] = await Promise.all([
      fetchRampedQuestions(focusSlug, CHECK_POOL_SIZE, student.id),
      fetchSeenQuestionIds(student.id, skill.skill_id),
    ])
    return chooseCheckQuestion(ramped.questions, seen)
  } catch (err) {
    console.error('fetchCheckQuestion threw', { err, focusSlug })
    return null
  }
}
