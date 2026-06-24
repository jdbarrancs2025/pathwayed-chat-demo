import { describe, expect, it } from "vitest"
import {
  INCLUDED_SEATS,
  addonPriceEnv,
  extraKids,
  includedSeats,
  isBillingPeriod,
  isPlanId,
  planPriceEnv,
  type BillingPeriod,
  type PlanId,
} from "./billing-core"

const PLANS: PlanId[] = ["elementary", "middle", "high"]
const PERIODS: BillingPeriod[] = ["monthly", "annual"]

describe("includedSeats", () => {
  it("matches the documented seat counts (1 / 2 / 2)", () => {
    expect(includedSeats("elementary")).toBe(1)
    expect(includedSeats("middle")).toBe(2)
    expect(includedSeats("high")).toBe(2)
  })
})

describe("extraKids = max(0, totalKids - includedSeats)", () => {
  it("is zero when totalKids is below or at the included seats (at-limit case)", () => {
    for (const plan of PLANS) {
      const included = INCLUDED_SEATS[plan]
      expect(extraKids(plan, 0)).toBe(0) // zero kids
      expect(extraKids(plan, 1)).toBe(Math.max(0, 1 - included)) // below or at limit
      expect(extraKids(plan, included)).toBe(0) // exactly at the limit
    }
  })

  it("counts each child beyond the included seats (multiple case)", () => {
    expect(extraKids("elementary", 2)).toBe(1)
    expect(extraKids("elementary", 4)).toBe(3)
    expect(extraKids("middle", 3)).toBe(1)
    expect(extraKids("middle", 5)).toBe(3)
    expect(extraKids("high", 3)).toBe(1)
    expect(extraKids("high", 5)).toBe(3)
  })

  it("never goes negative", () => {
    expect(extraKids("middle", 0)).toBe(0)
    expect(extraKids("high", -2)).toBe(0)
  })

  it("coerces a non-numeric totalKids to zero extras", () => {
    expect(extraKids("elementary", Number.NaN)).toBe(0)
    expect(extraKids("middle", undefined as unknown as number)).toBe(0)
  })
})

describe("price env mapping — add-on interval matches the plan interval", () => {
  it("uses an env key carrying the right interval for every plan", () => {
    for (const plan of PLANS) {
      expect(planPriceEnv(plan, "monthly")).toContain("MONTHLY")
      expect(planPriceEnv(plan, "annual")).toContain("ANNUAL")
    }
  })

  it("selects an add-on env key whose interval matches the chosen period", () => {
    for (const period of PERIODS) {
      const marker = period === "monthly" ? "MONTHLY" : "ANNUAL"
      const other = period === "monthly" ? "ANNUAL" : "MONTHLY"
      const addon = addonPriceEnv(period)
      expect(addon).toContain(marker)
      expect(addon).not.toContain(other)
      // The base plan price for the same period carries the same interval marker.
      for (const plan of PLANS) {
        expect(planPriceEnv(plan, period)).toContain(marker)
      }
    }
  })

  it("maps to the documented Stripe env var names", () => {
    expect(planPriceEnv("elementary", "monthly")).toBe("STRIPE_PRICE_ELEMENTARY_MONTHLY")
    expect(planPriceEnv("high", "annual")).toBe("STRIPE_PRICE_HIGH_ANNUAL")
    expect(addonPriceEnv("monthly")).toBe("STRIPE_PRICE_ADDON_KID_MONTHLY")
    expect(addonPriceEnv("annual")).toBe("STRIPE_PRICE_ADDON_KID_ANNUAL")
  })
})

describe("input guards", () => {
  it("accepts only the three known plan ids", () => {
    expect(isPlanId("elementary")).toBe(true)
    expect(isPlanId("middle")).toBe(true)
    expect(isPlanId("high")).toBe(true)
    expect(isPlanId("college")).toBe(false)
    expect(isPlanId(undefined)).toBe(false)
  })

  it("accepts only the two known billing periods", () => {
    expect(isBillingPeriod("monthly")).toBe(true)
    expect(isBillingPeriod("annual")).toBe(true)
    expect(isBillingPeriod("weekly")).toBe(false)
  })
})
