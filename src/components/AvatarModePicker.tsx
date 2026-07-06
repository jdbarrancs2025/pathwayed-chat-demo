import type { ReactNode } from 'react'
import { NikkiFace } from '@/components/NikkiFace'
import type { AvatarMode } from '@/lib/students'

interface AvatarModePickerProps {
  value: AvatarMode
  onChange: (mode: AvatarMode) => void
  /** Heading above the options. */
  label?: string
}

// Presentation for the three modes. Values stay video/orb/voice; only the option
// UI is visual now (a preview per option). A STILL poster is used for the video
// option — never a playing <video> — so the picker stays light when it repeats
// per child in Settings.
const PREVIEW_SIZE = 60
const OPTIONS: { id: AvatarMode; label: string; preview: ReactNode }[] = [
  {
    id: 'video',
    label: 'Nikki',
    preview: (
      <img
        src="/nikki-poster.jpg"
        alt=""
        aria-hidden
        style={{ width: PREVIEW_SIZE, height: PREVIEW_SIZE, objectFit: 'cover', borderRadius: 12, display: 'block' }}
      />
    ),
  },
  { id: 'orb', label: 'Orb', preview: <NikkiFace mode="orb" size={PREVIEW_SIZE} /> },
  { id: 'voice', label: 'Nikki Voice Only', preview: <NikkiFace mode="voice" size={PREVIEW_SIZE} /> },
]

/**
 * "How should Nikki appear?" — the shared Nikki / Orb / Voice-only picker used by
 * the add/edit child form and Settings. Each option shows a visual preview so all
 * three places present the modes identically. Controlled: reads `value`, calls
 * `onChange`; the caller persists to avatar_mode.
 */
export function AvatarModePicker({ value, onChange, label = 'How should Nikki appear?' }: AvatarModePickerProps) {
  return (
    <div style={{ margin: '16px 0', textAlign: 'left' }}>
      <label style={{ display: 'block', fontWeight: 600, fontSize: 14, marginBottom: 7 }}>{label}</label>
      <div style={{ display: 'flex', gap: 10 }}>
        {OPTIONS.map((opt) => {
          const on = value === opt.id
          return (
            <button
              key={opt.id}
              type="button"
              onClick={() => onChange(opt.id)}
              aria-pressed={on}
              style={{
                flex: 1,
                minWidth: 0,
                display: 'flex',
                flexDirection: 'column',
                alignItems: 'center',
                gap: 8,
                padding: '12px 8px',
                border: on ? '1.6px solid #CC543C' : '1.6px solid #ECE4D8',
                borderRadius: 14,
                background: on ? '#FBEEE9' : '#fff',
                cursor: 'pointer',
              }}
            >
              <div
                style={{
                  width: PREVIEW_SIZE,
                  height: PREVIEW_SIZE,
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'center',
                }}
              >
                {opt.preview}
              </div>
              <div style={{ fontWeight: 700, fontSize: 13, color: '#1C2230', textAlign: 'center', lineHeight: 1.2 }}>
                {opt.label}
              </div>
            </button>
          )
        })}
      </div>
    </div>
  )
}
