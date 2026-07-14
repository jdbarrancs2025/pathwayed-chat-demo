import { describe, it, expect } from 'vitest'
import { isRecheckDue, RECHECK_DELAY_DAYS } from '@/lib/mastery'

const NOW = new Date('2026-07-14T00:00:00Z')
const daysAgo = (n: number) => new Date(NOW.getTime() - n * 86_400_000).toISOString()

describe('isRecheckDue', () => {
  it('is false when the mastered bar was never met (no first_bar_met_at)', () => {
    expect(isRecheckDue({ first_bar_met_at: null, recheck_passed_at: null }, NOW)).toBe(false)
  })

  it('is false once the re-check has already passed (mastered is durable)', () => {
    expect(
      isRecheckDue({ first_bar_met_at: daysAgo(30), recheck_passed_at: daysAgo(20) }, NOW),
    ).toBe(false)
  })

  it('is false before the spacing window elapses', () => {
    expect(
      isRecheckDue({ first_bar_met_at: daysAgo(RECHECK_DELAY_DAYS - 1), recheck_passed_at: null }, NOW),
    ).toBe(false)
  })

  it('becomes due exactly at the spacing window and after', () => {
    expect(
      isRecheckDue({ first_bar_met_at: daysAgo(RECHECK_DELAY_DAYS), recheck_passed_at: null }, NOW),
    ).toBe(true)
    expect(
      isRecheckDue({ first_bar_met_at: daysAgo(RECHECK_DELAY_DAYS + 5), recheck_passed_at: null }, NOW),
    ).toBe(true)
  })
})
