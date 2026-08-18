import { describe, it, expect } from "vitest"
import { chooseAdoptionTarget } from "./school-login.js"

/**
 * The adoption rule decides whether a covered student's EXISTING profile is linked
 * to their Dean roster row, or whether a second profile is created alongside it.
 *
 * Getting it wrong in either direction loses something. Adopting nothing when there
 * was a row to adopt orphans the student's mastery, sessions and entitlements under
 * a duplicate profile. Adopting the wrong row renames a sibling and moves them to
 * the Dean student's grade, because the console is authoritative for both fields.
 * So the rule is deliberately narrow: link only when there is exactly one candidate.
 */
describe("chooseAdoptionTarget", () => {
  it("adopts the single unlinked profile a covered student already has", () => {
    // Junia's shape: one row, created before any roster existed.
    expect(chooseAdoptionTarget([{ id: "7c80043d" }])).toBe("7c80043d")
  })

  it("adopts nothing when the account has no unlinked profile, so the caller inserts", () => {
    expect(chooseAdoptionTarget([])).toBeNull()
  })

  it("refuses to guess between siblings rather than renaming one of them", () => {
    // A real account in this product owns six children. Picking any of them would
    // overwrite that child's name and grade from the roster.
    expect(chooseAdoptionTarget([{ id: "a" }, { id: "b" }])).toBeNull()
    expect(
      chooseAdoptionTarget([
        { id: "a" },
        { id: "b" },
        { id: "c" },
        { id: "d" },
        { id: "e" },
        { id: "f" },
      ]),
    ).toBeNull()
  })
})
