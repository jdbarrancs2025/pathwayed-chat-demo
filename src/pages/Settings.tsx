import { useNavigate } from 'react-router'

/** Placeholder settings (reached from the kid-home menu). Full settings come later. */
export function Settings() {
  const navigate = useNavigate()
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
          Settings
        </h1>
        <p style={{ color: '#5A6172', fontSize: 14.5, margin: 0 }}>Settings options come next.</p>
        <button
          type="button"
          onClick={() => navigate('/students')}
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
          Back to students
        </button>
      </div>
    </div>
  )
}
