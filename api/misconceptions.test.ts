import { describe, expect, it } from "vitest"
import {
  MISCONCEPTIONS,
  getMisconceptionGuidance,
  misconceptionsFor,
} from "./misconceptions.js"

describe("misconception library", () => {
  it("every entry has a signature, a diagnostic, and a re-teach move", () => {
    for (const m of MISCONCEPTIONS) {
      expect(m.id, `id missing`).toBeTruthy()
      expect(m.signature.length, `${m.id} signature`).toBeGreaterThan(10)
      expect(m.diagnostic.length, `${m.id} diagnostic`).toBeGreaterThan(10)
      expect(m.reteach.length, `${m.id} reteach`).toBeGreaterThan(10)
    }
  })

  it("has unique ids", () => {
    const ids = MISCONCEPTIONS.map((m) => m.id)
    expect(new Set(ids).size).toBe(ids.length)
  })

  it("covers the required K-2 reading errors (b/d, vowel, first-letter guess)", () => {
    const reading = misconceptionsFor("reading", "k-2")
    const titles = reading.map((m) => m.title.toLowerCase()).join(" | ")
    expect(titles).toContain("b/d")
    expect(titles).toContain("vowel")
    expect(titles).toMatch(/first letter|three-cueing|guessing/)
    expect(reading.length).toBeGreaterThanOrEqual(4)
  })

  it("covers the required early-math errors (subtract smaller-from-larger, miscount)", () => {
    const math = misconceptionsFor("math", "k-2")
    const titles = math.map((m) => m.title.toLowerCase()).join(" | ")
    expect(titles).toMatch(/subtract/)
    expect(titles).toMatch(/miscount|counting/)
    expect(math.length).toBeGreaterThanOrEqual(3)
  })
})

describe("getMisconceptionGuidance", () => {
  it("returns a guidance block for reading k-2 mentioning diagnostics and re-teach", () => {
    const text = getMisconceptionGuidance("reading", "k-2")
    expect(text).not.toBeNull()
    expect(text).toContain("Confirm with:")
    expect(text).toContain("Re-teach:")
    expect(text).toContain("never give the final answer")
  })

  it("returns null for subjects/bands with no entries", () => {
    expect(getMisconceptionGuidance("reading", "9-12")).toBeNull()
    expect(getMisconceptionGuidance("writing", "k-2")).toBeNull()
    expect(getMisconceptionGuidance("science", "k-2")).toBeNull()
    expect(getMisconceptionGuidance("math", "9-12")).toBeNull()
  })
})
