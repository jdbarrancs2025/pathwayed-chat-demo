import { AVATAR_MODES, type AvatarMode } from '@/lib/students'

interface AvatarModePickerProps {
  value: AvatarMode
  onChange: (mode: AvatarMode) => void
  /** Heading above the options. */
  label?: string
}

/**
 * "How should Nikki appear?" — the shared Video / Orb / Voice-only picker used by
 * the add/edit child form and Settings, so all three places offer the exact same
 * options and stay consistent. Purely controlled: it reads `value` and calls
 * `onChange`; persistence (which avatar_mode field to write) is the caller's job.
 */
export function AvatarModePicker({ value, onChange, label = 'How should Nikki appear?' }: AvatarModePickerProps) {
  return (
    <div style={{ margin: '16px 0', textAlign: 'left' }}>
      <label style={{ display: 'block', fontWeight: 600, fontSize: 14, marginBottom: 7 }}>{label}</label>
      {AVATAR_MODES.map((opt) => {
        const on = value === opt.id
        return (
          <button
            key={opt.id}
            type="button"
            onClick={() => onChange(opt.id)}
            style={{
              display: 'block',
              width: '100%',
              textAlign: 'left',
              border: on ? '1.6px solid #CC543C' : '1.6px solid #ECE4D8',
              borderRadius: 14,
              padding: '14px 16px',
              marginBottom: 10,
              background: on ? '#FBEEE9' : '#fff',
              cursor: 'pointer',
            }}
          >
            <div style={{ fontWeight: 700, fontSize: 15, color: '#1C2230' }}>{opt.label}</div>
            <div style={{ fontSize: 13, color: '#5A6172', marginTop: 2 }}>{opt.desc}</div>
          </button>
        )
      })}
    </div>
  )
}
