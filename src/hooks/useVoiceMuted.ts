import { useCallback, useEffect, useState } from 'react'
import { getVoiceMuted, setVoiceMuted, subscribeVoiceMuted } from '@/lib/voicePrefs'

/**
 * Read + toggle the app-wide "read aloud" mute preference. Stays in sync across
 * components (and persists) via the voicePrefs store, so muting in one place
 * mutes Nikki's voice everywhere.
 */
export function useVoiceMuted(): [boolean, () => void] {
  const [muted, setMuted] = useState(getVoiceMuted)
  useEffect(() => subscribeVoiceMuted(setMuted), [])
  const toggle = useCallback(() => setVoiceMuted(!getVoiceMuted()), [])
  return [muted, toggle]
}
