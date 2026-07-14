import { schoolLogin, type SchoolLoginResult } from '@/lib/schoolBridge'
import { getSchoolSession, setSchoolSession } from '@/lib/schoolSession'

// Post-SSO school check, run at most ONCE per signed-in user and memoized so the
// SchoolLoginGate and the Welcome redirect share one result instead of racing.
//
// The 9-12 SSO bug this fixes: after a school Google login the student lands on
// Welcome, whose redirect effect sees no `consents` row and fires the parent
// consent redirect BEFORE the async school check resolves — stranding a covered
// student on /consent (permanently, if their domain isn't mapped). Now BOTH the
// gate and Welcome await this single check: the gate routes covered students to
// their tutoring home; Welcome only runs the consumer redirect when NOT covered.

let cachedUid: string | null = null
let cached: Promise<SchoolLoginResult> | null = null

/**
 * Resolve whether the signed-in user is a covered school student. On covered:true
 * it establishes the school session (Stripe bypass + Dean-authoritative grade).
 * Memoized per uid; safe to call from multiple places on the same login.
 */
export function ensureSchoolCheck(uid: string, accessToken: string): Promise<SchoolLoginResult> {
  // Already established this tab — no need to re-check.
  const existing = getSchoolSession()
  if (existing) {
    return Promise.resolve({
      covered: true,
      student_id: existing.student_id,
      first_name: existing.first_name,
      grade: existing.grade,
      school_id: existing.school_id,
    })
  }
  if (cachedUid === uid && cached) return cached

  cachedUid = uid
  cached = schoolLogin(accessToken).then((r) => {
    if (r.covered && r.student_id) {
      setSchoolSession({
        school_id: r.school_id ?? '',
        student_id: r.student_id,
        first_name: r.first_name ?? '',
        grade: r.grade ?? '',
        covered: true,
      })
    }
    return r
  })
  return cached
}
