import { describe, it, expect } from 'vitest'
import { scoreChoice, summarizeAttempts, type PracticeChoice } from './questions'

const choices: PracticeChoice[] = [
  { text: '56', is_correct: true },
  { text: '48', is_correct: false, misconception_token: 'skip-count-error' },
  { text: '63', is_correct: false, misconception_token: 'off-by-one-factor' },
  { text: '15', is_correct: false, misconception_token: 'added-instead-of-multiplied' },
]

describe('scoreChoice', () => {
  it('correct choice -> isCorrect true, no token', () => {
    expect(scoreChoice(choices, 0)).toEqual({ isCorrect: true, misconceptionToken: null })
  })
  it('wrong choice -> isCorrect false with its misconception token', () => {
    expect(scoreChoice(choices, 1)).toEqual({ isCorrect: false, misconceptionToken: 'skip-count-error' })
  })
  it('out-of-range index -> safe false/null (never throws)', () => {
    expect(scoreChoice(choices, 9)).toEqual({ isCorrect: false, misconceptionToken: null })
    expect(scoreChoice(choices, -1)).toEqual({ isCorrect: false, misconceptionToken: null })
  })
})

describe('summarizeAttempts', () => {
  it('counts correct and rounds accuracy', () => {
    expect(summarizeAttempts([{ isCorrect: true }, { isCorrect: true }, { isCorrect: false }])).toEqual({
      total: 3,
      correct: 2,
      accuracy: 67, // round(66.67)
    })
  })
  it('all correct -> 100', () => {
    expect(summarizeAttempts([{ isCorrect: true }, { isCorrect: true }]).accuracy).toBe(100)
  })
  it('all wrong -> 0', () => {
    expect(summarizeAttempts([{ isCorrect: false }, { isCorrect: false }]).accuracy).toBe(0)
  })
  it('0-question edge -> total 0, accuracy 0', () => {
    expect(summarizeAttempts([])).toEqual({ total: 0, correct: 0, accuracy: 0 })
  })
})
