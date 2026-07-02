import { describe, it, expect } from 'vitest'
import { openerOrder } from './opener'

describe('openerOrder', () => {
  it('leads with keep-going for getting-ahead and advanced', () => {
    expect(openerOrder('ahead')).toEqual(['keepgoing', 'homework'])
    expect(openerOrder('advanced')).toEqual(['keepgoing', 'homework'])
  })

  it('leads with the homework question for on-grade', () => {
    expect(openerOrder('on')).toEqual(['homework', 'keepgoing'])
  })

  it('always returns both actions regardless of level (order only)', () => {
    for (const level of ['on', 'ahead', 'advanced'] as const) {
      expect(new Set(openerOrder(level))).toEqual(new Set(['homework', 'keepgoing']))
    }
  })
})
