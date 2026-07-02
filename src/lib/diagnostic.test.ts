import { describe, it, expect } from 'vitest'
import { diagnosticBands, shouldExtend, placement, type DiagnosticResult } from './diagnostic'

describe('diagnosticBands', () => {
  it('samples the band below + at-grade, and extends to the band above', () => {
    expect(diagnosticBands('8')).toEqual({ initial: ['3-5', '6-8'], extension: ['9-12'] })
    expect(diagnosticBands('4')).toEqual({ initial: ['k-2', '3-5'], extension: ['6-8'] })
    expect(diagnosticBands('11')).toEqual({ initial: ['6-8', '9-12'], extension: [] }) // nothing above 9-12
    expect(diagnosticBands('K')).toEqual({ initial: ['k-2'], extension: ['3-5'] }) // nothing below k-2
  })
})

describe('shouldExtend', () => {
  const r = (band: string, isCorrect: boolean, i = 0): DiagnosticResult => ({ skillId: `${band}-${i}`, band, isCorrect })

  it('extends only when at-grade correctness meets the threshold', () => {
    // 3 of 4 at-grade correct = 0.75 >= 0.7 -> extend
    const strong = [r('6-8', true, 1), r('6-8', true, 2), r('6-8', true, 3), r('6-8', false, 4), r('3-5', false, 5)]
    expect(shouldExtend(strong, '6-8')).toBe(true)
    // 1 of 4 at-grade correct = 0.25 -> no extend
    const weak = [r('6-8', true, 1), r('6-8', false, 2), r('6-8', false, 3), r('6-8', false, 4)]
    expect(shouldExtend(weak, '6-8')).toBe(false)
  })

  it('does not extend with no at-grade evidence', () => {
    expect(shouldExtend([r('3-5', true), r('3-5', true)], '6-8')).toBe(false)
    expect(shouldExtend([], '6-8')).toBe(false)
  })
})

describe('placement', () => {
  const r = (band: string, isCorrect: boolean, i = 0): DiagnosticResult => ({ skillId: `${band}-${i}`, band, isCorrect })

  it('counts correct/total and labels by evidence', () => {
    const aboveStrong = [r('6-8', true, 1), r('6-8', true, 2), r('9-12', true, 3), r('9-12', true, 4)]
    expect(placement(aboveStrong, '6-8')).toEqual({
      label: "You're ready for some above-grade challenges.",
      aboveGrade: true,
      correct: 4,
      total: 4,
    })

    const onGrade = [r('6-8', true, 1), r('6-8', true, 2), r('6-8', true, 3), r('3-5', false, 4)]
    expect(placement(onGrade, '6-8').label).toBe("You're right on grade level.")
    expect(placement(onGrade, '6-8').aboveGrade).toBe(false)

    const foundations = [r('6-8', false, 1), r('6-8', false, 2), r('3-5', true, 3), r('3-5', true, 4)]
    expect(placement(foundations, '6-8').label).toBe("We'll build up your grade-level foundations.")

    const basics = [r('6-8', false, 1), r('6-8', false, 2), r('3-5', false, 3), r('3-5', false, 4)]
    expect(placement(basics, '6-8').label).toBe("We'll start with the core basics.")
  })
})
