import { describe, it, expect } from 'vitest'
import { formatRelativeDay } from './format'

const NOW = 1_700_000_000_000 // fixed reference
const ago = (days: number) => new Date(NOW - days * 86_400_000).toISOString()

describe('formatRelativeDay', () => {
  it('handles no/invalid timestamp', () => {
    expect(formatRelativeDay(null, NOW)).toBe('No sessions yet')
    expect(formatRelativeDay('not-a-date', NOW)).toBe('No sessions yet')
  })

  it('labels recent days', () => {
    expect(formatRelativeDay(ago(0), NOW)).toBe('Today')
    expect(formatRelativeDay(ago(1), NOW)).toBe('Yesterday')
    expect(formatRelativeDay(ago(3), NOW)).toBe('3 days ago')
  })

  it('labels weeks and months', () => {
    expect(formatRelativeDay(ago(10), NOW)).toBe('1 week ago')
    expect(formatRelativeDay(ago(21), NOW)).toBe('3 weeks ago')
    expect(formatRelativeDay(ago(75), NOW)).toBe('2 months ago')
  })
})
