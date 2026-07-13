import { useEffect, useRef } from "react"
import { useNavigate } from "react-router"
import { useAuth } from "@/context/AuthContext"
import { schoolLogin } from "@/lib/schoolBridge"
import { getSchoolSession, setSchoolSession } from "@/lib/schoolSession"

/**
 * After any SSO login, ask our server whether this verified email is a covered
 * school student (domain -> school_id map + Dean resolve, all server-side). If so,
 * establish the school session (Stripe bypass + authoritative grade) and route the
 * student to their learning home. Unknown domains / B2C logins fall through — this
 * NEVER blocks the normal consumer flow. Renders nothing.
 */
export function SchoolLoginGate() {
  const { session, loading } = useAuth()
  const navigate = useNavigate()
  const checkedFor = useRef<string | null>(null)

  useEffect(() => {
    if (loading) return
    const token = session?.access_token
    const uid = session?.user?.id
    if (!token || !uid) return
    if (getSchoolSession()) return // already covered this tab
    if (checkedFor.current === uid) return // one check per signed-in user per mount
    checkedFor.current = uid

    let active = true
    void schoolLogin(token).then((r) => {
      if (!active || !r.covered || !r.student_id) return
      setSchoolSession({
        school_id: r.school_id ?? "",
        student_id: r.student_id,
        first_name: r.first_name ?? "",
        grade: r.grade ?? "",
        covered: true,
      })
      navigate(`/students/${r.student_id}`, { replace: true })
    })
    return () => {
      active = false
    }
  }, [session, loading, navigate])

  return null
}
