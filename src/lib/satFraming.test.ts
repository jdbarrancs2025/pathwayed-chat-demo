import { describe, it, expect } from 'vitest'
import { showKidSatFraming, satPacingTone } from './satFraming'

describe('showKidSatFraming', () => {
  it('is ON for a consented kid at grade 9+', () => {
    expect(showKidSatFraming({ grade: '9', above_grade_ok: true })).toBe(true)
    expect(showKidSatFraming({ grade: '11', above_grade_ok: true })).toBe(true)
    expect(showKidSatFraming({ grade: '12', above_grade_ok: true })).toBe(true)
  })

  it('is OFF for a consented kid below grade 9 (parent still sees readiness elsewhere)', () => {
    expect(showKidSatFraming({ grade: '6', above_grade_ok: true })).toBe(false)
    expect(showKidSatFraming({ grade: '8', above_grade_ok: true })).toBe(false)
    expect(showKidSatFraming({ grade: 'K', above_grade_ok: true })).toBe(false)
  })

  it('is OFF whenever consent is declined, regardless of grade', () => {
    expect(showKidSatFraming({ grade: '11', above_grade_ok: false })).toBe(false)
    expect(showKidSatFraming({ grade: '9', above_grade_ok: false })).toBe(false)
    expect(showKidSatFraming({ grade: '6', above_grade_ok: false })).toBe(false)
  })
})

describe('satPacingTone', () => {
  it('reads a strong mastery estimate as ahead of pace', () => {
    expect(satPacingTone(85)).toBe('ahead')
    expect(satPacingTone(70)).toBe('ahead')
  })

  it('reads a modest / absent estimate as still building', () => {
    expect(satPacingTone(69)).toBe('building')
    expect(satPacingTone(40)).toBe('building')
    expect(satPacingTone(0)).toBe('building')
    expect(satPacingTone(null)).toBe('building')
  })
})
