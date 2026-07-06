import { describe, expect, it } from 'vitest'
import {
  ADDON_PRICE,
  PLANS,
  formatMoney,
  intervalSuffix,
  planPrice,
  suggestPlan,
  totalPrice,
  type PlanId,
} from './billing'

describe('suggestPlan — picks the plan for the oldest child', () => {
  it('defaults to elementary when there are no children', () => {
    expect(suggestPlan([])).toBe('elementary')
  })

  it('treats kindergarten as the youngest band', () => {
    expect(suggestPlan(['K'])).toBe('elementary')
  })

  it('maps grades 0-5 to elementary', () => {
    expect(suggestPlan(['1'])).toBe('elementary')
    expect(suggestPlan(['5'])).toBe('elementary')
  })

  it('maps grades 6-8 to middle', () => {
    expect(suggestPlan(['6'])).toBe('middle')
    expect(suggestPlan(['8'])).toBe('middle')
  })

  it('maps grades 9-12 to high', () => {
    expect(suggestPlan(['9'])).toBe('high')
    expect(suggestPlan(['12'])).toBe('high')
  })

  it('uses the oldest child when grades are mixed', () => {
    expect(suggestPlan(['K', '3', '7'])).toBe('middle')
    expect(suggestPlan(['2', '11'])).toBe('high')
    expect(suggestPlan(['K', '1', '2'])).toBe('elementary')
  })

  it('ignores unparseable grades', () => {
    expect(suggestPlan(['', 'foo'])).toBe('elementary')
    expect(suggestPlan(['foo', '10'])).toBe('high')
  })
})

describe('planPrice', () => {
  it('returns the monthly or annual price for each plan', () => {
    for (const plan of PLANS) {
      expect(planPrice(plan.id, 'monthly')).toBe(plan.monthly)
      expect(planPrice(plan.id, 'annual')).toBe(plan.annual)
    }
  })

  it('returns 0 for an unknown plan id', () => {
    expect(planPrice('nope' as PlanId, 'monthly')).toBe(0)
  })
})

describe('totalPrice — base plus per-child add-on', () => {
  it('is just the plan price with zero extra children', () => {
    expect(totalPrice('elementary', 'monthly', 0)).toBe(15)
    expect(totalPrice('high', 'annual', 0)).toBe(389)
  })

  it('adds the add-on price per extra child', () => {
    expect(totalPrice('middle', 'monthly', 2)).toBe(24 + 2 * ADDON_PRICE.monthly)
    expect(totalPrice('high', 'annual', 1)).toBe(389 + ADDON_PRICE.annual)
  })

  it('never subtracts for a negative extra count', () => {
    expect(totalPrice('elementary', 'monthly', -3)).toBe(15)
  })
})

describe('formatMoney', () => {
  it('omits cents for whole amounts', () => {
    expect(formatMoney(15)).toBe('$15')
    expect(formatMoney(389)).toBe('$389')
  })

  it('shows two decimals for fractional amounts', () => {
    expect(formatMoney(7.99)).toBe('$7.99')
    expect(formatMoney(22.99)).toBe('$22.99')
  })
})

describe('intervalSuffix', () => {
  it('maps the billing period to a short suffix', () => {
    expect(intervalSuffix('monthly')).toBe('/mo')
    expect(intervalSuffix('annual')).toBe('/yr')
  })
})
