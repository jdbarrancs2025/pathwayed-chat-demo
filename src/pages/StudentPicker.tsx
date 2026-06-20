import { useAuth } from '@/context/AuthContext'

/**
 * Placeholder student picker. The full "choose / add a child" experience is a
 * later step; this exists so the post-sign-in routing has a real destination
 * for parents who already have consent on record.
 */
export function StudentPicker() {
  const { signOut } = useAuth()

  return (
    <div
      style={{
        minHeight: '100dvh',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        padding: '26px 22px',
        background: '#FBF8F3',
        color: '#1C2230',
      }}
    >
      <div
        style={{
          background: '#FFFFFF',
          border: '1px solid #ECE4D8',
          borderRadius: 20,
          boxShadow: '0 1px 2px rgba(28,34,48,.04),0 10px 30px rgba(28,34,48,.07)',
          width: '100%',
          maxWidth: 480,
          padding: 34,
        }}
      >
        <h1
          style={{
            fontFamily: '"Baloo 2", "Trebuchet MS", system-ui, sans-serif',
            color: '#003078',
            fontSize: 22,
            fontWeight: 700,
            margin: '0 0 10px',
          }}
        >
          Choose a student
        </h1>
        <p style={{ color: '#5A6172', fontSize: 14.5, margin: 0 }}>
          The student picker is the next step.
        </p>
        <button
          type="button"
          onClick={() => signOut()}
          style={{
            marginTop: 20,
            background: 'none',
            color: '#003078',
            fontWeight: 700,
            fontSize: 14.5,
            textDecoration: 'underline',
            textUnderlineOffset: 3,
            cursor: 'pointer',
          }}
        >
          Sign out
        </button>
      </div>
    </div>
  )
}
