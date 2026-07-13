// The "school-covered" student session for licensed schools. It is materialized
// from the Dean-authoritative resolve-student result (covered + grade) and held
// in sessionStorage for the tab. This is the single flag the app reads to BYPASS
// Stripe/billing for a covered student, and `grade` here is authoritative for the
// content band + gating (do not re-derive or ask the student).
//
// Hard rule: the PIN is NEVER stored here (or anywhere client-side). Only the
// RESULT of a resolve is kept.

const KEY = "pathwayed.schoolSession"

export interface SchoolSession {
  school_id: string
  student_id: string
  first_name: string
  grade: string // authoritative, a STRING e.g. "10"
  covered: true
}

export function getSchoolSession(): SchoolSession | null {
  try {
    const raw = sessionStorage.getItem(KEY)
    return raw ? (JSON.parse(raw) as SchoolSession) : null
  } catch {
    return null
  }
}

export function setSchoolSession(session: SchoolSession): void {
  try {
    sessionStorage.setItem(KEY, JSON.stringify(session))
  } catch {
    /* private mode / storage full — the covered flag is a session nicety, ignore */
  }
}

export function clearSchoolSession(): void {
  try {
    sessionStorage.removeItem(KEY)
  } catch {
    /* ignore */
  }
}

/** True when the active session is a license-covered school student → bypass Stripe. */
export function isSchoolCovered(): boolean {
  return getSchoolSession()?.covered === true
}
