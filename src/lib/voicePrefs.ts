// One app-wide "Nikki's voice" mute preference, persisted so a child's choice
// carries across the greeting auto-speak (Session), the diagnostic, and practice.
// Kept dependency-free (no import of voice.ts) so any screen can read/toggle it.

const KEY = 'pathwayed.voiceMuted'
const listeners = new Set<(muted: boolean) => void>()

let muted = false
try {
  muted = typeof localStorage !== 'undefined' && localStorage.getItem(KEY) === '1'
} catch {
  // localStorage unavailable (private mode / SSR) — default to unmuted.
}

export function getVoiceMuted(): boolean {
  return muted
}

export function setVoiceMuted(next: boolean): void {
  muted = next
  try {
    localStorage.setItem(KEY, next ? '1' : '0')
  } catch {
    // ignore persistence failure — the in-memory value still applies this session.
  }
  listeners.forEach((l) => l(next))
}

/** Subscribe to changes; returns an unsubscribe. */
export function subscribeVoiceMuted(l: (muted: boolean) => void): () => void {
  listeners.add(l)
  return () => {
    listeners.delete(l)
  }
}
