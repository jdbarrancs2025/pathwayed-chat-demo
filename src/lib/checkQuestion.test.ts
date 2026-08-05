import { describe, it, expect } from 'vitest'
import {
  CHECK_MARKER,
  CHECK_MAX_PER_SESSION,
  CHECK_MIN_ASSISTANT_TURNS,
  CHECK_COOLDOWN_TURNS,
  chooseCheckQuestion,
  shouldServeCheck,
  stripCheckMarker,
  stripStreamingCheckMarker,
} from './checkQuestion'
import { checkAnswerSummary } from './checkQuestionCopy'
import type { PracticeQuestion } from './questions'

const q = (id: string): PracticeQuestion => ({
  id,
  skill_id: 's1',
  sat_alignment: null,
  stem: `stem ${id}`,
  passage: null,
  choices: [
    { text: 'a', is_correct: true },
    { text: 'b', is_correct: false },
  ],
  correct_answer: 'a',
  solution: null,
  render_mode: 'text',
  prompt: null,
})

describe('stripCheckMarker', () => {
  it('reports and removes the marker', () => {
    const r = stripCheckMarker(`Nice work. Try this one.\n${CHECK_MARKER}`)
    expect(r.requested).toBe(true)
    expect(r.text).toBe('Nice work. Try this one.')
    expect(r.text).not.toContain('[[')
  })

  it('leaves ordinary text alone', () => {
    const r = stripCheckMarker('Nice work. Try this one.')
    expect(r.requested).toBe(false)
    expect(r.text).toBe('Nice work. Try this one.')
  })

  it('tolerates case and inner whitespace', () => {
    expect(stripCheckMarker('ok [[ CHECK ]]').requested).toBe(true)
    expect(stripCheckMarker('ok [[Check]]').requested).toBe(true)
  })

  it('removes every marker when the model emits more than one', () => {
    const r = stripCheckMarker(`${CHECK_MARKER} middle ${CHECK_MARKER}`)
    expect(r.text).toBe('middle')
    expect(r.requested).toBe(true)
  })

  it('is stable across repeated calls (no lastIndex leakage)', () => {
    const s = `hi ${CHECK_MARKER}`
    expect(stripCheckMarker(s).requested).toBe(true)
    expect(stripCheckMarker(s).requested).toBe(true)
    expect(stripCheckMarker(s).requested).toBe(true)
  })
})

describe('stripStreamingCheckMarker', () => {
  it('hides a half-streamed marker so it never flashes on screen', () => {
    expect(stripStreamingCheckMarker('All good. [[che')).toBe('All good.')
    expect(stripStreamingCheckMarker('All good. [[')).toBe('All good.')
    expect(stripStreamingCheckMarker('All good. [')).toBe('All good.')
  })

  it('hides the complete marker too', () => {
    expect(stripStreamingCheckMarker(`All good. ${CHECK_MARKER}`)).toBe('All good.')
  })

  it('does not eat ordinary trailing text', () => {
    expect(stripStreamingCheckMarker('What do you think?')).toBe('What do you think?')
  })
})

describe('shouldServeCheck', () => {
  const base = { assistantTurns: 10, checksServed: 0, turnOfLastCheck: null }

  it('never fires unless Nikki asked', () => {
    expect(shouldServeCheck(base, false)).toBe(false)
  })

  it('fires when asked and every gate passes', () => {
    expect(shouldServeCheck(base, true)).toBe(true)
  })

  it('teaches first: no check before the minimum turns', () => {
    expect(shouldServeCheck({ ...base, assistantTurns: CHECK_MIN_ASSISTANT_TURNS - 1 }, true)).toBe(false)
    expect(shouldServeCheck({ ...base, assistantTurns: CHECK_MIN_ASSISTANT_TURNS }, true)).toBe(true)
  })

  it('respects the cooldown between checks', () => {
    const justChecked = { assistantTurns: 10, checksServed: 1, turnOfLastCheck: 10 }
    expect(shouldServeCheck(justChecked, true)).toBe(false)
    const nearly = { assistantTurns: 10 + CHECK_COOLDOWN_TURNS - 1, checksServed: 1, turnOfLastCheck: 10 }
    expect(shouldServeCheck(nearly, true)).toBe(false)
    const due = { assistantTurns: 10 + CHECK_COOLDOWN_TURNS, checksServed: 1, turnOfLastCheck: 10 }
    expect(shouldServeCheck(due, true)).toBe(true)
  })

  it('caps the session so tutoring does not become testing', () => {
    const atCap = { assistantTurns: 100, checksServed: CHECK_MAX_PER_SESSION, turnOfLastCheck: 1 }
    expect(shouldServeCheck(atCap, true)).toBe(false)
  })

  it('lets a long session reach the cap but no further', () => {
    let served = 0
    let last: number | null = null
    for (let turn = 0; turn <= 60; turn++) {
      if (shouldServeCheck({ assistantTurns: turn, checksServed: served, turnOfLastCheck: last }, true)) {
        served++
        last = turn
      }
    }
    expect(served).toBe(CHECK_MAX_PER_SESSION)
  })
})

describe('chooseCheckQuestion', () => {
  it('prefers a question the student has not seen', () => {
    const picked = chooseCheckQuestion([q('a'), q('b'), q('c')], new Set(['a', 'b']), () => 0)
    expect(picked?.id).toBe('c')
  })

  it('falls back to the seen pool only when everything is used', () => {
    const picked = chooseCheckQuestion([q('a'), q('b')], new Set(['a', 'b']), () => 1)
    expect(picked?.id).toBe('b')
  })

  it('returns null when the skill has no published questions', () => {
    expect(chooseCheckQuestion([], new Set(), () => 0)).toBeNull()
  })

  it('stays in bounds for a misbehaving picker', () => {
    expect(chooseCheckQuestion([q('a')], new Set(), () => 99)?.id).toBe('a')
    expect(chooseCheckQuestion([q('a')], new Set(), () => -5)?.id).toBe('a')
  })
})

describe('checkAnswerSummary', () => {
  it('states the choice and the verdict from the answer key', () => {
    expect(checkAnswerSummary({ chosenText: '24', isCorrect: true })).toBe(
      'I picked "24". That one was right.',
    )
    expect(checkAnswerSummary({ chosenText: '18', isCorrect: false })).toBe(
      'I picked "18". That one was not right.',
    )
  })

  it('handles an empty choice label', () => {
    expect(checkAnswerSummary({ chosenText: '  ', isCorrect: true })).toBe(
      'I picked an answer. That one was right.',
    )
  })

  it('contains no em-dashes', () => {
    expect(checkAnswerSummary({ chosenText: '24', isCorrect: false })).not.toContain('—')
  })
})
