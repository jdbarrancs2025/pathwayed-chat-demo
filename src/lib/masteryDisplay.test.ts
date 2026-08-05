import { describe, it, expect } from 'vitest'
import { masteryDisplay, subjectSummary, displayRank } from './masteryDisplay'

describe('masteryDisplay', () => {
  it('claims mastered only at status mastered', () => {
    const d = masteryDisplay({ status: 'mastered', evidence_accuracy: 92, attempts_counted: 14 })
    expect(d).toEqual({ state: 'mastered', label: 'Mastered', percent: 92 })
  })

  it('shows advanced distinctly rather than folding it into mastered', () => {
    const d = masteryDisplay({ status: 'advanced', evidence_accuracy: 88, attempts_counted: 16 })
    expect(d.state).toBe('advanced')
    expect(d.label).toBe('Advanced')
    expect(d.state).not.toBe('mastered')
  })

  it('says so plainly, and shows NO number, when there is no evidence', () => {
    // The production shape: a placement seed of exactly 60 with zero counted
    // attempts. This used to render "Mastered 60%".
    const d = masteryDisplay({ status: 'not_started', evidence_accuracy: null, attempts_counted: 0 })
    expect(d.state).toBe('not-enough')
    expect(d.label).toBe('Not enough yet')
    expect(d.percent).toBeNull()
  })

  it('refuses a claim from status alone when no attempts are counted', () => {
    const d = masteryDisplay({ status: 'mastered', evidence_accuracy: 99, attempts_counted: 0 })
    expect(d.state).toBe('not-enough')
    expect(d.percent).toBeNull()
  })

  it('calls real evidence below the advance bar building', () => {
    const d = masteryDisplay({ status: 'practicing', evidence_accuracy: 28.6, attempts_counted: 7 })
    expect(d.state).toBe('building')
    expect(d.percent).toBe(29)
  })

  it('tolerates missing fields', () => {
    expect(masteryDisplay({}).state).toBe('not-enough')
  })

  it('ranks strongest claims first and unproven last', () => {
    expect(displayRank('mastered')).toBeLessThan(displayRank('advanced'))
    expect(displayRank('advanced')).toBeLessThan(displayRank('building'))
    expect(displayRank('building')).toBeLessThan(displayRank('not-enough'))
  })
})

describe('subjectSummary', () => {
  it('names advanced separately from mastered', () => {
    const rows = [
      { status: 'mastered' as const, evidence_accuracy: 90, attempts_counted: 10 },
      { status: 'advanced' as const, evidence_accuracy: 75, attempts_counted: 6 },
      { status: 'advanced' as const, evidence_accuracy: 72, attempts_counted: 6 },
      { status: 'practicing' as const, evidence_accuracy: 40, attempts_counted: 5 },
    ]
    expect(subjectSummary(rows)).toBe('1 of 4 mastered, 2 advanced')
  })

  it('omits the advanced clause when there are none', () => {
    const rows = [
      { status: 'mastered' as const, evidence_accuracy: 90, attempts_counted: 10 },
      { status: 'practicing' as const, evidence_accuracy: 40, attempts_counted: 5 },
    ]
    expect(subjectSummary(rows)).toBe('1 of 2 mastered')
  })

  it('does not report "0 of N mastered" when nothing has been asked yet', () => {
    const rows = [
      { status: 'not_started' as const, evidence_accuracy: null, attempts_counted: 0 },
      { status: 'not_started' as const, evidence_accuracy: null, attempts_counted: 0 },
    ]
    expect(subjectSummary(rows)).toBe('2 skills, not enough practice yet')
  })

  it('uses the singular for one unproven skill', () => {
    expect(subjectSummary([{ attempts_counted: 0 }])).toBe('1 skill, not enough practice yet')
  })

  it('handles an empty subject', () => {
    expect(subjectSummary([])).toBe('No skills yet')
  })

  it('contains no em-dashes', () => {
    expect(subjectSummary([{ status: 'mastered', evidence_accuracy: 90, attempts_counted: 9 }])).not.toContain('—')
  })
})
