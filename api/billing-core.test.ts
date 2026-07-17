import { describe, expect, it } from "vitest"
import {
  INCLUDED_SEATS,
  addonPriceEnv,
  extraKids,
  includedSeats,
  isAddonPriceId,
  isBillingPeriod,
  isPlanId,
  paidSeats,
  planForPriceId,
  planPriceEnv,
  type BillingPeriod,
  type PlanId,
} from "./billing-core.js"

const PLANS: PlanId[] = ["elementary", "middle", "high"]
const PERIODS: BillingPeriod[] = ["monthly", "annual"]

// A synthetic env mapping every plan/period (and the add-on) to a fake price id,
// mirroring how Vercel holds the real STRIPE_PRICE_* values.
function fakeEnv(): Record<string, string> {
  const env: Record<string, string> = {}
  for (const plan of PLANS) {
    for (const period of PERIODS) {
      env[planPriceEnv(plan, period)] = `price_${plan}_${period}`
    }
  }
  env[addonPriceEnv("monthly")] = "price_addon_monthly"
  env[addonPriceEnv("annual")] = "price_addon_annual"
  return env
}

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

describe("paidSeats = includedSeats(plan) + max(0, extraKids)", () => {
  it("is the included count when there are no extra kids", () => {
    expect(paidSeats("elementary", 0)).toBe(1)
    expect(paidSeats("middle", 0)).toBe(2)
    expect(paidSeats("high", 0)).toBe(2)
  })

  it("adds each extra kid on top of the included seats", () => {
    expect(paidSeats("elementary", 2)).toBe(3)
    expect(paidSeats("middle", 1)).toBe(3)
    expect(paidSeats("high", 3)).toBe(5)
  })

  it("never subtracts for negative/NaN extra kids", () => {
    expect(paidSeats("middle", -4)).toBe(2)
    expect(paidSeats("high", Number.NaN)).toBe(2)
  })

  it("round-trips with extraKids for a total child count", () => {
    for (const plan of PLANS) {
      for (const total of [1, 2, 3, 5]) {
        expect(paidSeats(plan, extraKids(plan, total))).toBe(Math.max(INCLUDED_SEATS[plan], total))
      }
    }
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

describe("planForPriceId — reverse map a Stripe price id to plan + period", () => {
  const env = fakeEnv()

  it("maps every plan + period base price id back to the right plan and period", () => {
    for (const plan of PLANS) {
      for (const period of PERIODS) {
        const priceId = env[planPriceEnv(plan, period)]
        expect(planForPriceId(priceId, env)).toEqual({ plan, period })
      }
    }
  })

  it("returns null for the add-on price id (not a base plan)", () => {
    expect(planForPriceId(env[addonPriceEnv("monthly")], env)).toBeNull()
    expect(planForPriceId(env[addonPriceEnv("annual")], env)).toBeNull()
  })

  it("returns null for an unknown / unconfigured price id", () => {
    expect(planForPriceId("price_does_not_exist", env)).toBeNull()
    expect(planForPriceId("", env)).toBeNull()
    expect(planForPriceId(null, env)).toBeNull()
    expect(planForPriceId(undefined, env)).toBeNull()
  })

  it("does not match when the env var for that plan is unset", () => {
    const partial = { ...env }
    delete partial[planPriceEnv("middle", "annual")]
    expect(planForPriceId("price_middle_annual", partial)).toBeNull()
    // Other plans still resolve.
    expect(planForPriceId(env[planPriceEnv("high", "monthly")], partial)).toEqual({
      plan: "high",
      period: "monthly",
    })
  })
})

describe("isAddonPriceId — recognize the per-child add-on price", () => {
  const env = fakeEnv()

  it("is true for either interval's add-on price id", () => {
    expect(isAddonPriceId(env[addonPriceEnv("monthly")], env)).toBe(true)
    expect(isAddonPriceId(env[addonPriceEnv("annual")], env)).toBe(true)
  })

  it("is false for base plan price ids and unknown / empty ids", () => {
    expect(isAddonPriceId(env[planPriceEnv("elementary", "monthly")], env)).toBe(false)
    expect(isAddonPriceId("price_does_not_exist", env)).toBe(false)
    expect(isAddonPriceId("", env)).toBe(false)
    expect(isAddonPriceId(null, env)).toBe(false)
    expect(isAddonPriceId(undefined, env)).toBe(false)
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
