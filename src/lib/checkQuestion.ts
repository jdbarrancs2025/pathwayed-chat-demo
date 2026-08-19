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
export const CHECK_COOLDOWN_TURNS = 4
/** Hard cap per lesson. */
export const CHECK_MAX_PER_SESSION = 5
/**
 * Consecutive WRONG checks after which the lesson stops checking entirely.
 *
 * A child who is not getting it should be taught, not measured. Without this, an
 * all-wrong lesson serves the full five and the child's own transcript narrates
 * five failures in their own voice, which is the most punishing shape this feature
 * can take. Two is early enough that the lesson turns back into teaching while the
 * child still has most of it ahead of them.
 *
 * It gates Nikki's requests too, not just the app's. She cannot see a streak break
 * without another check, so leaving her an override would just restore the drumbeat
 * one request at a time.
 *
 * Answering wrong on purpose to escape checks is not an exploit worth guarding:
 * every wrong answer is recorded as incorrect and drags real evidence accuracy
 * down, so the student pays for it in the only currency this system has.
 */
export const CHECK_STRUGGLE_BACKOFF = 2
/** How many ramped candidates to draw before picking the one to ask. Comfortably
 *  more than CHECK_MAX_PER_SESSION so within-lesson exclusions still leave room. */
export const CHECK_POOL_SIZE = 8

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
  /** Consecutive WRONG answers on checks so far, reset by a correct one. */
  consecutiveWrong: number
}

/**
 * Who wants the check. 'nikki' is her [[check]] marker, the better signal because
 * she can see the moment; 'app' is the cadence firing on its own so a lesson still
 * produces evidence when she never asks.
 */
export type CheckTrigger = 'nikki' | 'app'

/**
 * May a check be served right now?
 *
 * WHY THE APP ASKS TOO, NOT JUST NIKKI. This used to fire only on her [[check]]
 * marker, while the prompt told her most turns should have no check at all. Against
 * the live database the result was ZERO recorded checks, ever: one session cleared
 * every gate with 15 assistant turns and still produced none. Evidence a lesson only
 * sometimes emits is not evidence a parent dashboard can rest on, and it left
 * nextLesson permanently unable to advance. So the app runs the cadence now, and
 * Nikki's marker moves a check EARLIER, to a moment she can see and it cannot.
 *
 * CADENCE, AND WHY THESE NUMBERS.
 *
 *   Teach first (4 turns). A check inside the opening exchange turns a lesson into
 *   an entrance exam. Four assistant turns is roughly "she has explained something
 *   and the student has responded to it twice".
 *
 *   Cooldown (4 turns). Long enough to read as a natural pause, short enough that
 *   the cap is reachable: 4 + 4x4 = 20 assistant turns for five checks, and three by
 *   turn 12, which lands a typical lesson in the 3-to-5 band.
 *
 *   Cap (5 per lesson). Enough that two solid lessons clear the 5-attempt ADVANCE
 *   bar, few enough to stay a conversation: at 20 to 30 assistant turns that is
 *   about one turn in five, leaving the rest as teaching. Tutoring evidence should
 *   accumulate as a by-product of learning, not replace the thing it measures.
 *
 *   Struggle backoff (2 consecutive wrong). See CHECK_STRUGGLE_BACKOFF. This is the
 *   one gate that can take a lesson BELOW three checks, deliberately: a child who is
 *   not getting it gets taught for the rest of the lesson instead of measured.
 */
export function shouldServeCheck(state: CheckCadenceState, trigger: CheckTrigger): boolean {
  if (state.checksServed >= CHECK_MAX_PER_SESSION) return false
  if (state.assistantTurns < CHECK_MIN_ASSISTANT_TURNS) return false
  if (state.consecutiveWrong >= CHECK_STRUGGLE_BACKOFF) return false
  // Nikki's marker skips only the cooldown, never the cap, the teach-first floor or
  // the backoff. She sees the teaching moment; those three protect the child.
  if (
    trigger === 'app' &&
    state.turnOfLastCheck != null &&
    state.assistantTurns - state.turnOfLastCheck < CHECK_COOLDOWN_TURNS
  ) {
    return false
  }
  // Even for Nikki, never two checks on one turn.
  if (trigger === 'nikki' && state.turnOfLastCheck === state.assistantTurns) return false
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
  askedThisLesson: Set<string> = new Set(),
): PracticeQuestion | null {
  if (!questions.length) return null
  // HARD exclusion, unlike the seen PREFERENCE below. An item already asked in this
  // lesson is never asked again for credit, so a wrong answer is followed by a
  // different question rather than another go at the same one.
  const fresh = questions.filter((q) => !askedThisLesson.has(q.id))
  if (!fresh.length) return null
  const unseen = fresh.filter((q) => !seenIds.has(q.id))
  const pool = unseen.length ? unseen : fresh
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
  askedThisLesson: Set<string> = new Set(),
): Promise<PracticeQuestion | null> {
  if (!focusSlug) {
    console.info('[check] lesson has no focus skill, not checking')
    return null
  }
  try {
    const eligible = await listEligibleSkills(student)
    const skill = eligible.find((s) => s.slug === focusSlug)
    if (!skill) {
      // Cleared, above the ceiling, or age-pinned out. Logged because a silent null
      // here is exactly how this feature ran for weeks emitting nothing at all.
      console.info('[check] focus skill not eligible, not checking', { focusSlug })
      return null
    }

    // Ramped like a practice set, so a check question tracks the same rolling
    // performance the practice flow does. Ask for a handful rather than one, then
    // pick within them, so the unseen preference still has room to work.
    const [ramped, seen] = await Promise.all([
      fetchRampedQuestions(focusSlug, CHECK_POOL_SIZE, student.id),
      fetchSeenQuestionIds(student.id, skill.skill_id),
    ])
    const chosen = chooseCheckQuestion(ramped.questions, seen, undefined, askedThisLesson)
    if (!chosen) {
      console.info('[check] no unasked question left for this skill, not checking', {
        focusSlug,
        candidates: ramped.questions.length,
        asked: askedThisLesson.size,
      })
    }
    return chosen
  } catch (err) {
    console.error('fetchCheckQuestion threw', { err, focusSlug })
    return null
  }
}
