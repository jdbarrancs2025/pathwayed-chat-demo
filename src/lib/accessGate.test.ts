import { describe, expect, it } from 'vitest'
import {
  PAID_STATUSES,
  TRIAL_SEAT_CAP,
  billingPhase,
  hasLearningAccess,
  includedSeatsForPlan,
  isTrialActive,
  seatCap,
  trialDaysLeft,
} from './accessGate'
import type { Subscription } from './profile'

const NOW = Date.parse('2026-07-17T12:00:00Z')
const DAY = 24 * 60 * 60 * 1000
const iso = (offsetMs: number) => new Date(NOW + offsetMs).toISOString()

function sub(overrides: Partial<Subscription> = {}): Subscription {
  return {
    status: null,
    plan: null,
    billingPeriod: null,
    extraKids: 0,
    trialEnd: null,
    currentPeriodEnd: null,
    hasTrialed: false,
    paidSeats: null,
    ...overrides,
  }
}

describe('isTrialActive', () => {
  it('is true only while trial_end is in the future', () => {
    expect(isTrialActive(sub({ trialEnd: iso(3 * DAY) }), NOW)).toBe(true)
    expect(isTrialActive(sub({ trialEnd: iso(-1) }), NOW)).toBe(false)
    expect(isTrialActive(sub({ trialEnd: null }), NOW)).toBe(false)
    expect(isTrialActive(sub({ trialEnd: 'not-a-date' }), NOW)).toBe(false)
  })
})

describe('hasLearningAccess', () => {
  it('lets a school-covered student in regardless of trial state (checked first)', () => {
    expect(hasLearningAccess(sub({ status: 'expired', trialEnd: iso(-10 * DAY) }), NOW, true)).toBe(true)
    expect(hasLearningAccess(sub({ status: null, trialEnd: null }), NOW, true)).toBe(true)
  })

  it('allows every paid status', () => {
    for (const status of PAID_STATUSES) {
      expect(hasLearningAccess(sub({ status, trialEnd: iso(-30 * DAY) }), NOW, false)).toBe(true)
    }
  })

  it('allows an in-window free trial and blocks an expired one', () => {
    expect(hasLearningAccess(sub({ status: 'free_trial', trialEnd: iso(2 * DAY) }), NOW, false)).toBe(true)
    expect(hasLearningAccess(sub({ status: 'free_trial', trialEnd: iso(-1) }), NOW, false)).toBe(false)
  })

  it('blocks expired / canceled accounts', () => {
    expect(hasLearningAccess(sub({ status: 'expired', trialEnd: iso(-1) }), NOW, false)).toBe(false)
    expect(hasLearningAccess(sub({ status: 'canceled', trialEnd: iso(-1) }), NOW, false)).toBe(false)
  })
})

describe('trialDaysLeft', () => {
  it('rounds up whole days remaining and never goes negative', () => {
    expect(trialDaysLeft(sub({ trialEnd: iso(2 * DAY) }), NOW)).toBe(2)
    expect(trialDaysLeft(sub({ trialEnd: iso(DAY + 1000) }), NOW)).toBe(2)
    expect(trialDaysLeft(sub({ trialEnd: iso(-5 * DAY) }), NOW)).toBe(0)
    expect(trialDaysLeft(sub({ trialEnd: null }), NOW)).toBe(0)
  })
})

describe('billingPhase', () => {
  it('is active for any paid status', () => {
    expect(billingPhase(sub({ status: 'active' }), NOW)).toBe('active')
    expect(billingPhase(sub({ status: 'trialing' }), NOW)).toBe('active')
    expect(billingPhase(sub({ status: 'past_due' }), NOW)).toBe('active')
  })

  it('is trial while the free trial is in window, expired after', () => {
    expect(billingPhase(sub({ status: 'free_trial', trialEnd: iso(3 * DAY) }), NOW)).toBe('trial')
    expect(billingPhase(sub({ status: 'free_trial', trialEnd: iso(-1) }), NOW)).toBe('expired')
    expect(billingPhase(sub({ status: 'expired', trialEnd: iso(-1) }), NOW)).toBe('expired')
  })
})

describe('seatCap', () => {
  it('uses paid_seats when subscribed', () => {
    expect(seatCap(sub({ status: 'active', plan: 'elementary', paidSeats: 4 }))).toBe(4)
  })

  it('falls back to the plan included seats when paid_seats is unset', () => {
    expect(seatCap(sub({ status: 'active', plan: 'middle', paidSeats: null }))).toBe(2)
    expect(seatCap(sub({ status: 'active', plan: 'elementary', paidSeats: 0 }))).toBe(1)
  })

  it('is the trial cap during free trial and after expiry', () => {
    expect(seatCap(sub({ status: 'free_trial', trialEnd: iso(2 * DAY) }))).toBe(TRIAL_SEAT_CAP)
    expect(seatCap(sub({ status: 'expired' }))).toBe(TRIAL_SEAT_CAP)
    expect(TRIAL_SEAT_CAP).toBe(2)
  })
})

describe('includedSeatsForPlan', () => {
  it('matches the plan table (1 / 2 / 2) and defaults unknown plans to 1', () => {
    expect(includedSeatsForPlan('elementary')).toBe(1)
    expect(includedSeatsForPlan('middle')).toBe(2)
    expect(includedSeatsForPlan('high')).toBe(2)
    expect(includedSeatsForPlan(null)).toBe(1)
    expect(includedSeatsForPlan('college')).toBe(1)
  })
})
