import { useAuth } from '@/context/AuthContext'

/**
 * Placeholder consent route. The full parent-attestation form (parent name +
 * checkbox) is the next step: it will insert a row into `consents` for the auth
 * user and write the parent name to `profiles.display_name`. This placeholder
 * exists so the post-sign-in routing has a real destination.
 */
export function Consent() {
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
        <p
          style={{
            color: '#CC543C',
            fontWeight: 700,
            fontSize: 12,
            letterSpacing: '.1em',
            textTransform: 'uppercase',
          }}
        >
          For a parent or guardian
        </p>
        <h1
          style={{
            fontFamily: '"Baloo 2", "Trebuchet MS", system-ui, sans-serif',
            color: '#003078',
            fontSize: 22,
            fontWeight: 700,
            margin: '5px 0 10px',
          }}
        >
          Before your child starts
        </h1>
        <p style={{ color: '#5A6172', fontSize: 14.5, margin: 0 }}>
          Parent consent is collected here. The attestation form is the next step.
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
