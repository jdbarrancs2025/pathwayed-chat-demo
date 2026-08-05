import { describe, it, expect, vi } from "vitest"
import type { VercelRequest, VercelResponse } from "@vercel/node"
import { bearerToken, ownsStudent, requireOwnedStudent } from "./require-auth.js"

const req = (headers: Record<string, string>) => ({ headers }) as unknown as VercelRequest

function fakeRes() {
  const sent: { status?: number; body?: unknown } = {}
  const res = {
    status(code: number) {
      sent.status = code
      return this
    },
    json(body: unknown) {
      sent.body = body
      return this
    },
  } as unknown as VercelResponse
  return { res, sent }
}

/** Minimal stand-in for the students-table read ownsStudent performs. */
function fakeSvc(result: { data: unknown; error: unknown }) {
  const maybeSingle = vi.fn().mockResolvedValue(result)
  const eq2 = vi.fn().mockReturnValue({ maybeSingle })
  const eq1 = vi.fn().mockReturnValue({ eq: eq2 })
  const select = vi.fn().mockReturnValue({ eq: eq1 })
  const from = vi.fn().mockReturnValue({ select })
  return { client: { from } as never, from, select, eq1, eq2 }
}

describe("bearerToken", () => {
  it("reads a bearer token", () => {
    expect(bearerToken(req({ authorization: "Bearer abc.def.ghi" }))).toBe("abc.def.ghi")
  })

  it("is case insensitive on the scheme", () => {
    expect(bearerToken(req({ authorization: "bearer tok" }))).toBe("tok")
    expect(bearerToken(req({ authorization: "BEARER tok" }))).toBe("tok")
  })

  it("returns empty for a missing or non-bearer header", () => {
    expect(bearerToken(req({}))).toBe("")
    expect(bearerToken(req({ authorization: "Basic abc" }))).toBe("")
  })
})

describe("ownsStudent", () => {
  it("filters on BOTH the student id and the owning uid", async () => {
    const svc = fakeSvc({ data: { id: "stu-1" }, error: null })
    expect(await ownsStudent(svc.client, "uid-1", "stu-1")).toBe(true)
    expect(svc.from).toHaveBeenCalledWith("students")
    expect(svc.eq1).toHaveBeenCalledWith("id", "stu-1")
    // The uid filter is the whole point: without it any authenticated caller
    // could name any child.
    expect(svc.eq2).toHaveBeenCalledWith("parent_id", "uid-1")
  })

  it("is false when the child belongs to someone else", async () => {
    const svc = fakeSvc({ data: null, error: null })
    expect(await ownsStudent(svc.client, "uid-1", "someone-elses")).toBe(false)
  })

  it("fails closed on a read error", async () => {
    const svc = fakeSvc({ data: null, error: { message: "boom" } })
    expect(await ownsStudent(svc.client, "uid-1", "stu-1")).toBe(false)
  })

  it("is false for an empty student id without querying", async () => {
    const svc = fakeSvc({ data: { id: "x" }, error: null })
    expect(await ownsStudent(svc.client, "uid-1", "")).toBe(false)
    expect(svc.from).not.toHaveBeenCalled()
  })
})

describe("requireOwnedStudent", () => {
  it("400s when no student id is supplied", async () => {
    const { res, sent } = fakeRes()
    const svc = fakeSvc({ data: null, error: null })
    const ok = await requireOwnedStudent(res, { userId: "u", email: "parent@example.com", svc: svc.client }, undefined)
    expect(ok).toBe(false)
    expect(sent.status).toBe(400)
    expect(sent.body).toEqual({ error: "student_id_required" })
  })

  it("403s for another user's child, and does not leak whether it exists", async () => {
    const { res, sent } = fakeRes()
    const svc = fakeSvc({ data: null, error: null })
    const ok = await requireOwnedStudent(res, { userId: "u", email: "parent@example.com", svc: svc.client }, "stu-9")
    expect(ok).toBe(false)
    expect(sent.status).toBe(403)
    expect(sent.body).toEqual({ error: "not_your_student" })
  })

  it("passes for the caller's own child", async () => {
    const { res, sent } = fakeRes()
    const svc = fakeSvc({ data: { id: "stu-1" }, error: null })
    const ok = await requireOwnedStudent(res, { userId: "u", email: "parent@example.com", svc: svc.client }, "stu-1")
    expect(ok).toBe(true)
    expect(sent.status).toBeUndefined()
  })

  it("rejects a non-string student id", async () => {
    const { res, sent } = fakeRes()
    const svc = fakeSvc({ data: null, error: null })
    expect(await requireOwnedStudent(res, { userId: "u", email: "parent@example.com", svc: svc.client }, 42)).toBe(false)
    expect(sent.status).toBe(400)
  })
})
