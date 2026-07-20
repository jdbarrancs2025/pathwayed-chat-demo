import { describe, it, expect } from 'vitest'
import {
  studentGradeNum,
  availableGrades,
  startGrade,
  rungAccuracy,
  nextRung,
  settledGrade,
  placementSeeds,
  PLACEMENT_MIN_QUESTIONS,
  type DiagnosticResult,
} from './diagnostic'

const r = (gradeNum: number, isCorrect: boolean): DiagnosticResult => ({ skillId: `s${gradeNum}`, gradeNum, isCorrect })

describe('studentGradeNum', () => {
  it('maps K to 0 and numeric grades through', () => {
    expect(studentGradeNum('K')).toBe(0)
    expect(studentGradeNum('1')).toBe(1)
    expect(studentGradeNum('12')).toBe(12)
  })
  it('clamps and defaults unknowns to 0', () => {
    expect(studentGradeNum('')).toBe(0)
    expect(studentGradeNum('99')).toBe(12)
  })
})

describe('availableGrades', () => {
  it('returns distinct grades ascending', () => {
    expect(availableGrades([3, 0, 3, 8, 0])).toEqual([0, 3, 8])
  })
})

describe('startGrade', () => {
  const avail = [0, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
  it('starts at the exact grade when it has content', () => {
    expect(startGrade(5, avail)).toBe(5)
  })
  it('degrades to the nearest available grade at-or-below when the grade has a content gap', () => {
    expect(startGrade(1, avail)).toBe(0) // grade 1 has no content today → K
    expect(startGrade(2, avail)).toBe(0)
  })
  it('falls back to the lowest available when nothing at-or-below exists', () => {
    expect(startGrade(1, [3, 4, 5])).toBe(3)
  })
  it('returns null when there is no content at all', () => {
    expect(startGrade(5, [])).toBeNull()
  })
})

describe('rungAccuracy', () => {
  it('is the fraction correct within that grade, null when the grade was not served', () => {
    const res = [r(3, true), r(3, false), r(3, true), r(4, false)]
    expect(rungAccuracy(res, 3)).toBeCloseTo(2 / 3)
    expect(rungAccuracy(res, 4)).toBe(0)
    expect(rungAccuracy(res, 9)).toBeNull()
  })
})

describe('placementSeeds — minimum question floor', () => {
  it('rejects a run below the floor (the thin-bank 2-question junk case)', () => {
    expect(placementSeeds(0)).toBe(false)
    expect(placementSeeds(2)).toBe(false)
    expect(placementSeeds(PLACEMENT_MIN_QUESTIONS - 1)).toBe(false)
  })
  it('accepts a run at or above the floor', () => {
    expect(placementSeeds(PLACEMENT_MIN_QUESTIONS)).toBe(true)
    expect(placementSeeds(PLACEMENT_MIN_QUESTIONS + 3)).toBe(true)
  })
})

describe('nextRung — start decision', () => {
  const available = [0, 3, 4, 5, 6]
  it('probes UP when the start rung is strong', () => {
    expect(nextRung({ currentGrade: 4, accuracy: 0.8, available, visited: [4], direction: 'none', stepsTaken: 0 })).toEqual({
      grade: 5,
      direction: 'up',
    })
  })
  it('drops DOWN when the start rung is weak', () => {
    expect(nextRung({ currentGrade: 4, accuracy: 0.25, available, visited: [4], direction: 'none', stepsTaken: 0 })).toEqual({
      grade: 3,
      direction: 'down',
    })
  })
  it('settles when the start rung is middling', () => {
    expect(nextRung({ currentGrade: 4, accuracy: 0.6, available, visited: [4], direction: 'none', stepsTaken: 0 })).toEqual({
      grade: null,
      direction: 'none',
    })
  })
})

describe('nextRung — bounds & no oscillation', () => {
  const available = [0, 3, 4, 5, 6]
  it('keeps climbing while strong, then stops when a higher rung falters', () => {
    expect(nextRung({ currentGrade: 5, accuracy: 0.9, available, visited: [4, 5], direction: 'up', stepsTaken: 1 }).grade).toBe(6)
    expect(nextRung({ currentGrade: 6, accuracy: 0.5, available, visited: [4, 5, 6], direction: 'up', stepsTaken: 2 }).grade).toBeNull()
  })
  it('keeps descending until a rung is handled', () => {
    expect(nextRung({ currentGrade: 4, accuracy: 0.2, available, visited: [5, 4], direction: 'down', stepsTaken: 1 }).grade).toBe(3)
    expect(nextRung({ currentGrade: 3, accuracy: 0.6, available, visited: [5, 4, 3], direction: 'down', stepsTaken: 2 }).grade).toBeNull()
  })
  it('stops at MAX_STEPS even if still strong', () => {
    expect(nextRung({ currentGrade: 6, accuracy: 1, available, visited: [3, 4, 5, 6], direction: 'up', stepsTaken: 3 }).grade).toBeNull()
  })
  it('never revisits a grade or runs past the available range', () => {
    expect(nextRung({ currentGrade: 6, accuracy: 1, available, visited: [4, 5, 6], direction: 'up', stepsTaken: 2 }).grade).toBeNull()
    expect(nextRung({ currentGrade: 0, accuracy: 0, available, visited: [3, 0], direction: 'down', stepsTaken: 1 }).grade).toBeNull()
  })
})

describe('settledGrade', () => {
  it('is the highest grade passed when the student climbed', () => {
    const res = [...Array(4)].map(() => r(5, true)).concat([...Array(4)].map(() => r(6, true)), [r(7, false)])
    expect(settledGrade(res, 5)).toBe(6) // passed 5 & 6, faltered at 7
  })
  it('is the highest handled grade when the student descended', () => {
    const res = [r(6, false), r(6, false), r(5, false), r(4, true), r(4, true)]
    expect(settledGrade(res, 6)).toBe(4)
  })
  it('falls back to the lowest attempted grade when nothing was handled', () => {
    const res = [r(6, false), r(5, false), r(3, false)]
    expect(settledGrade(res, 6)).toBe(3)
  })
})
