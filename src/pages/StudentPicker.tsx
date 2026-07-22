import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router'
import { useAuth } from '@/context/AuthContext'
import { avColor, gradeLabel, hasPin, initials, listStudents, verifyStudentPin, type Student } from '@/lib/students'
import { TopMenu } from '@/components/TopMenu'
import { PinPrompt } from '@/components/pin/PinPrompt'
import { enterKidSession } from '@/lib/kidSession'

/**
 * "Who's learning today?" picker. Lists the parent's children; tapping one
 * enters that child's home. A child with a sign-in PIN set is prompted for it
 * first (kid sign-in on a shared device); a child without one enters directly.
 */
export function StudentPicker() {
  const { user, signOut } = useAuth()
  const navigate = useNavigate()
  const [students, setStudents] = useState<Student[]>([])
  const [loading, setLoading] = useState(true)
  // The child whose PIN we're prompting for (null = no prompt open).
  const [pinFor, setPinFor] = useState<Student | null>(null)

  useEffect(() => {
    if (!user) return
    let active = true
    listStudents(user.id).then((rows) => {
      if (!active) return
      setStudents(rows)
      setLoading(false)
    })
    return () => {
      active = false
    }
  }, [user])

  // Enter a child's space: begin the kid session, then route to their home.
  const enterChild = (studentId: string) => {
    enterKidSession()
    navigate(`/students/${studentId}`)
  }

  // Tapping a child: prompt for their PIN if one is set, otherwise enter directly.
  const pickChild = (student: Student) => {
    if (hasPin(student)) setPinFor(student)
    else enterChild(student.id)
  }

  return (
    <div className="kid-screen">
      <div className="shell">
        {/* Sized up for this /students header only: ~1.5x the 34px default
            (the old 156 was sized for the square crest; the wide PathwayEd
            lockup at that height would overflow). */}
        <TopMenu logoHeight={52} />
        <h1 className="greet">Who's learning today?</h1>
        <p className="muted">Tap your name to begin.</p>

        {loading ? (
          <p className="muted" style={{ marginTop: 22 }}>Loading…</p>
        ) : (
          <>
            <div className="pickgrid">
              {students.map((student, i) => (
                <button
                  key={student.id}
                  type="button"
                  className="pickcard"
                  onClick={() => pickChild(student)}
                >
                  <div className="av" style={{ background: avColor(i) }}>
                    {initials(student.first_name)}
                  </div>
                  <div style={{ flex: 1 }}>
                    <div className="nm">{student.first_name}</div>
                    <div className="gr">{gradeLabel(student.grade)}</div>
                  </div>
                  {hasPin(student) && (
                    <span aria-label="PIN protected" title="PIN protected" style={{ fontSize: 18, opacity: 0.55 }}>
                      🔒
                    </span>
                  )}
                </button>
              ))}
            </div>

            <div className="pick-actions">
              <button type="button" className="btn btn-soft" onClick={() => navigate('/children/new')}>
                + Add a child
              </button>
              <button
                type="button"
                className="link"
                style={{ display: 'block', margin: '16px auto 0' }}
                onClick={() => signOut()}
              >
                Sign out
              </button>
            </div>
          </>
        )}
      </div>

      {pinFor && (
        <PinPrompt
          title={`Enter ${pinFor.first_name}'s PIN`}
          subtitle="Type your 4-digit PIN to start learning."
          submitLabel="Start learning"
          onCancel={() => setPinFor(null)}
          onSubmit={async (pin) => {
            const ok = await verifyStudentPin(pinFor.id, pin)
            if (ok) enterChild(pinFor.id)
            return ok
          }}
        />
      )}
    </div>
  )
}
