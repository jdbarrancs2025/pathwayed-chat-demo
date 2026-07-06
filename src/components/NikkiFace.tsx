import { NikkiOrb, type NikkiOrbState } from '@/components/NikkiOrb'
import { NikkiAvatar } from '@/components/NikkiAvatar'
import type { AvatarMode } from '@/lib/students'

interface NikkiFaceProps {
  /** Parent-chosen visual for this child. Defaults to video. */
  mode?: AvatarMode
  size?: number
  state?: NikkiOrbState
  className?: string
}

/**
 * The single Nikki visual. Renders the child's chosen avatar mode:
 *  - video: the NikkiAvatar clips (falls back to the orb if a clip fails to load)
 *  - orb:   the NikkiOrb
 *  - voice: a static nameplate — no animated face. ElevenLabs voice is unchanged.
 * All modes fill the same `size` box, so switching never shifts layout.
 */
export function NikkiFace({ mode = 'video', size = 240, state = 'idle', className = '' }: NikkiFaceProps) {
  if (mode === 'orb') return <NikkiOrb size={size} state={state} className={className} />
  if (mode === 'voice') return <NikkiNameplate size={size} className={className} />
  return <NikkiAvatar size={size} state={state} className={className} />
}

/** Static Nikki indicator for voice-only mode: a simple "N" nameplate, no motion. */
function NikkiNameplate({ size, className }: { size: number; className?: string }) {
  return (
    <div
      className={['nikki-nameplate', className].filter(Boolean).join(' ')}
      style={{ width: size, height: size, display: 'flex', alignItems: 'center', justifyContent: 'center' }}
      aria-hidden
    >
      <div
        style={{
          width: size * 0.62,
          height: size * 0.62,
          borderRadius: '50%',
          background: 'linear-gradient(135deg, #003078 0%, #2E5BB8 55%, #E8643A 130%)',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          boxShadow: '0 6px 22px rgba(0,48,120,0.28)',
        }}
      >
        <span
          style={{
            fontFamily: '"Baloo 2", "Trebuchet MS", system-ui, sans-serif',
            fontWeight: 700,
            color: '#fff',
            fontSize: size * 0.3,
            lineHeight: 1,
          }}
        >
          N
        </span>
      </div>
    </div>
  )
}
