import { useEffect, useState, type ReactNode } from 'react'
import { useAuth } from '@/context/AuthContext'
import { isSchoolCovered } from '@/lib/schoolSession'
import { getSubscription, type Subscription } from '@/lib/profile'
import { listStudents, type Student } from '@/lib/students'
import { hasLearningAccess } from '@/lib/accessGate'
import { PlanPicker } from '@/components/PlanPicker'
import { TopMenu } from '@/components/TopMenu'
import '@/styles/app-screens.css'

/**
 * Route guard for learning sessions + homework help. Blocks entry for the whole
 * account once the app-managed free trial has ended and there's no active
 * subscription — showing a parent-facing subscribe prompt (with the plan picker)
 * instead of the learning surface. No data is deleted or hidden; only the session
 * is locked.
 *
 * ORDER MATTERS: school-covered students bypass entirely and are checked FIRST,
 * before any trial state is read (isSchoolCovered() short-circuits below). This
 * is the same covered-student bypass the Billing card uses.
 */
export function SubscriptionGate({ children }: { children: ReactNode }) {
  const { user } = useAuth()
  const covered = isSchoolCovered()
  const [sub, setSub] = useState<Subscription | null>(null)
  const [students, setStudents] = useState<Student[]>([])
  // Snapshot the clock once at mount — a stable render-time value for the gate.
  const [now] = useState(() => Date.now())

  useEffect(() => {
    // Covered students never touch billing state; an unauthenticated view (no
    // parent to check) is left to the pages' own handling. Either way, skip —
    // the render short-circuits to children before the loading gate below.
    if (covered || !user) return
    let active = true
    Promise.all([getSubscription(user.id), listStudents(user.id)]).then(([s, kids]) => {
      if (!active) return
      setSub(s)
      setStudents(kids)
    })
    return () => {
      active = false
    }
  }, [covered, user])

  // Covered → straight through. No user → preserve existing (ungated) behavior.
  if (covered || !user) return <>{children}</>

  // Still fetching (sub not yet loaded) — hold rather than flash the lock screen.
  if (!sub) {
    return (
      <div className="kid-screen">
        <div className="shell">
          <p className="muted">Loading…</p>
        </div>
      </div>
    )
  }

  if (hasLearningAccess(sub, now, covered)) return <>{children}</>

  // Locked: parent-facing subscribe prompt with the plan picker.
  return (
    <div className="kid-screen">
      <div className="shell">
        <TopMenu />
        <h1 className="greet" style={{ marginTop: 18 }}>
          Your free trial has ended
        </h1>
        <p className="muted">
          Subscribe to unlock learning sessions and homework help for your children again. Nothing has been
          deleted — every child’s saved progress is right where they left it.
        </p>
        <div className="panel" style={{ marginTop: 20, padding: '16px 18px' }}>
          <PlanPicker students={students} userId={user.id} email={user.email ?? ''} ctaLabel="Subscribe now" />
        </div>
      </div>
    </div>
  )
}
