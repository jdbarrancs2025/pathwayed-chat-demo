import { describe, it, expect, beforeEach } from "vitest"
import { rateLimit, resetRateLimits, CHAT_LIMIT, CHAT_WINDOW_MS } from "./rate-limit.js"

describe("rateLimit", () => {
  beforeEach(() => resetRateLimits())

  it("allows up to the limit and blocks the next call", () => {
    const t = 1_000_000
    for (let i = 0; i < CHAT_LIMIT; i++) {
      expect(rateLimit("u1", CHAT_LIMIT, CHAT_WINDOW_MS, t).allowed).toBe(true)
    }
    expect(rateLimit("u1", CHAT_LIMIT, CHAT_WINDOW_MS, t).allowed).toBe(false)
  })

  it("counts each user separately", () => {
    const t = 1_000_000
    for (let i = 0; i < CHAT_LIMIT; i++) rateLimit("u1", CHAT_LIMIT, CHAT_WINDOW_MS, t)
    expect(rateLimit("u1", CHAT_LIMIT, CHAT_WINDOW_MS, t).allowed).toBe(false)
    // A different user is unaffected by the first one hitting the cap.
    expect(rateLimit("u2", CHAT_LIMIT, CHAT_WINDOW_MS, t).allowed).toBe(true)
  })

  it("opens a fresh window once the old one expires", () => {
    const t = 1_000_000
    for (let i = 0; i < CHAT_LIMIT; i++) rateLimit("u1", CHAT_LIMIT, CHAT_WINDOW_MS, t)
    expect(rateLimit("u1", CHAT_LIMIT, CHAT_WINDOW_MS, t).allowed).toBe(false)
    expect(rateLimit("u1", CHAT_LIMIT, CHAT_WINDOW_MS, t + CHAT_WINDOW_MS + 1).allowed).toBe(true)
  })

  it("reports a usable Retry-After", () => {
    const t = 1_000_000
    for (let i = 0; i < CHAT_LIMIT; i++) rateLimit("u1", CHAT_LIMIT, CHAT_WINDOW_MS, t)
    const blocked = rateLimit("u1", CHAT_LIMIT, CHAT_WINDOW_MS, t + 10_000)
    expect(blocked.allowed).toBe(false)
    expect(blocked.retryAfterSec).toBeGreaterThan(0)
    expect(blocked.retryAfterSec).toBeLessThanOrEqual(CHAT_WINDOW_MS / 1000)
  })

  it("counts down remaining", () => {
    const t = 1_000_000
    expect(rateLimit("u1", 3, CHAT_WINDOW_MS, t).remaining).toBe(2)
    expect(rateLimit("u1", 3, CHAT_WINDOW_MS, t).remaining).toBe(1)
    expect(rateLimit("u1", 3, CHAT_WINDOW_MS, t).remaining).toBe(0)
    expect(rateLimit("u1", 3, CHAT_WINDOW_MS, t).allowed).toBe(false)
  })

  it("a normal tutoring pace never trips the limit", () => {
    // One turn every 4 seconds for five minutes.
    let blocked = 0
    for (let i = 0; i < 75; i++) {
      if (!rateLimit("kid", CHAT_LIMIT, CHAT_WINDOW_MS, 1_000_000 + i * 4000).allowed) blocked++
    }
    expect(blocked).toBe(0)
  })
})
