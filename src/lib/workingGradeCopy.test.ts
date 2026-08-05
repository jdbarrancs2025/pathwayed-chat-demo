import { describe, it, expect } from 'vitest'
import { workingGradeNotice } from './workingGradeCopy'

const child = (over: Partial<Parameters<typeof workingGradeNotice>[0]> = {}) => ({
  first_name: 'Peyton',
  grade: '9',
  working_grade: 10 as number | null,
  above_grade_ok: true,
  working_grade_reason: 'cleared every grade 9 math skill',
  ...over,
})

describe('workingGradeNotice', () => {
  it('names the next grade when the parent has consented to above-grade framing', () => {
    expect(workingGradeNotice(child())).toEqual({
      headline: 'Peyton has finished the grade 9 skills and is now working on grade 10 material.',
      detail: 'Cleared every grade 9 math skill.',
    })
  })

  it('stays grade-neutral without consent, without hiding the progress', () => {
    const notice = workingGradeNotice(child({ above_grade_ok: false }))
    expect(notice?.headline).toBe(
      'Peyton has finished the grade 9 skills and is moving on to new material.',
    )
    expect(notice?.headline).not.toContain('grade 10')
    // Consent governs framing, not serving: the promotion is still reported.
    expect(notice?.detail).toBe('Cleared every grade 9 math skill.')
  })

  it('says nothing when the child has never been promoted', () => {
    expect(workingGradeNotice(child({ working_grade: null }))).toBeNull()
  })

  it('says nothing while the working grade has not overtaken the real grade', () => {
    expect(workingGradeNotice(child({ grade: '9', working_grade: 9 }))).toBeNull()
    expect(workingGradeNotice(child({ grade: '10', working_grade: 9 }))).toBeNull()
  })

  it('says kindergarten rather than grade 0', () => {
    const notice = workingGradeNotice(child({ grade: 'K', working_grade: 1 }))
    expect(notice?.headline).toBe(
      'Peyton has finished the kindergarten skills and is now working on grade 1 material.',
    )
  })

  it('tolerates a missing reason', () => {
    const notice = workingGradeNotice(child({ working_grade_reason: null }))
    expect(notice?.detail).toBeNull()
    expect(notice?.headline).toContain('grade 10 material')
  })

  it('contains no em-dashes', () => {
    const notice = workingGradeNotice(child())!
    expect(notice.headline).not.toContain('—')
    expect(notice.detail).not.toContain('—')
  })
})
