import { describe, it, expect } from 'vitest'
import { isReadinessStale, ENGINE_VERSION } from './readiness'

const T0 = '2026-06-01T00:00:00.000Z' // older
const T1 = '2026-06-02T00:00:00.000Z' // newer

describe('isReadinessStale', () => {
  it('fresh: readiness current, same engine version, sat row present, no newer mastery -> NOT stale', () => {
    expect(
      isReadinessStale({
        readiness: [
          { readiness_type: 'pathway', updated_at: T1, engine_version: ENGINE_VERSION },
          { readiness_type: 'sat', updated_at: T1, engine_version: ENGINE_VERSION },
        ],
        masteryUpdatedAt: [T0],
        currentEngineVersion: ENGINE_VERSION,
      }),
    ).toBe(false)
  })

  it('(a) no readiness row but mastery exists -> stale', () => {
    expect(
      isReadinessStale({
        readiness: [],
        masteryUpdatedAt: [T0],
        currentEngineVersion: ENGINE_VERSION,
      }),
    ).toBe(true)
  })

  it('(b) a mastery row is newer than the readiness -> stale', () => {
    expect(
      isReadinessStale({
        readiness: [
          { readiness_type: 'pathway', updated_at: T0, engine_version: ENGINE_VERSION },
          { readiness_type: 'sat', updated_at: T0, engine_version: ENGINE_VERSION },
        ],
        masteryUpdatedAt: [T1], // practiced after last compute
        currentEngineVersion: ENGINE_VERSION,
      }),
    ).toBe(true)
  })

  it('(c) stored engine_version behind current -> stale', () => {
    expect(
      isReadinessStale({
        readiness: [{ readiness_type: 'sat', updated_at: T1, engine_version: ENGINE_VERSION - 1 }],
        masteryUpdatedAt: [T0],
        currentEngineVersion: ENGINE_VERSION,
      }),
    ).toBe(true)
  })

  it('(d) mastery exists and rows are current, but NO sat row -> stale (self-heal v3 students)', () => {
    expect(
      isReadinessStale({
        // pathway + math already recomputed at the current version, but the
        // SAT row was never written — must still recompute.
        readiness: [
          { readiness_type: 'pathway', updated_at: T1, engine_version: ENGINE_VERSION },
          { readiness_type: 'math', updated_at: T1, engine_version: ENGINE_VERSION },
        ],
        masteryUpdatedAt: [T0],
        currentEngineVersion: ENGINE_VERSION,
      }),
    ).toBe(true)
  })

  it('no mastery at all -> nothing to compute, NOT stale', () => {
    expect(
      isReadinessStale({
        readiness: [],
        masteryUpdatedAt: [],
        currentEngineVersion: ENGINE_VERSION,
      }),
    ).toBe(false)
  })
})
