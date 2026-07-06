import { useEffect, useRef, useState } from 'react'
import { NikkiOrb, type NikkiOrbState } from '@/components/NikkiOrb'
import './NikkiAvatar.css'

// Filenames contain spaces and must NOT be renamed — reference them URL-encoded.
const LISTEN_SRC = '/PathwayEd%20Nikki%20Listen.mp4' // idle / waiting
const CONVERSATION_SRC = '/PathwayEd%20Nikki%20Conversation.mp4' // mouth moving while speaking

interface NikkiAvatarProps {
  /**
   * Reuses the CallStage speaking signal (Session.tsx `speaking`): the
   * Conversation clip is shown while `state === 'speaking'`, the Listen clip
   * otherwise. Also passed through to the fallback orb.
   */
  state?: NikkiOrbState
  /** Rendered box (px). Matches the orb it replaces (240 in the call stage). */
  size?: number
  className?: string
}

/**
 * Real video avatar for Nikki. Two muted, looping, always-playing clips are
 * stacked in the same box the energy orb occupied and cross-faded on the
 * speaking state — audio comes only from ElevenLabs, never these videos. If a
 * clip fails to load, we fall back to the energy orb so the box is never empty.
 */
export function NikkiAvatar({ state = 'idle', size = 240, className = '' }: NikkiAvatarProps) {
  const [failed, setFailed] = useState(false)
  const listenRef = useRef<HTMLVideoElement>(null)
  const talkRef = useRef<HTMLVideoElement>(null)
  const speaking = state === 'speaking'

  // Some browsers ignore the JSX `muted` attribute for autoplay gating; force the
  // muted property and kick playback on mount so both clips are always running.
  useEffect(() => {
    for (const v of [listenRef.current, talkRef.current]) {
      if (!v) continue
      v.muted = true
      void v.play().catch(() => {
        /* autoplay may defer until interaction; the other clip still fills the box */
      })
    }
  }, [])

  // Graceful degrade: never render an empty box — show the existing orb instead.
  if (failed) {
    return <NikkiOrb size={size} state={state} className={className} />
  }

  return (
    <div
      className={['nikki-avatar', className].filter(Boolean).join(' ')}
      style={{ width: size, height: size }}
      aria-hidden
    >
      <video
        ref={listenRef}
        className="nikki-avatar-video"
        src={LISTEN_SRC}
        muted
        loop
        autoPlay
        playsInline
        preload="auto"
        style={{ opacity: speaking ? 0 : 1 }}
        onError={() => setFailed(true)}
      />
      <video
        ref={talkRef}
        className="nikki-avatar-video"
        src={CONVERSATION_SRC}
        muted
        loop
        autoPlay
        playsInline
        preload="auto"
        style={{ opacity: speaking ? 1 : 0 }}
        onError={() => setFailed(true)}
      />
    </div>
  )
}
