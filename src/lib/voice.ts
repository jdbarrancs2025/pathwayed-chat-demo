// Plays Nikki's voice via the ElevenLabs-backed /api/tts endpoint. If that fails
// (missing key, API error, or blocked playback) it falls back to the browser's
// speechSynthesis so the app degrades gracefully instead of going silent. Audio
// for a given piece of text is cached for the session to avoid re-fetching (cost).

export interface SpeakOptions {
  /** Optional ElevenLabs voice id override (normally the server default is used). */
  voiceId?: string
  /** Fires when audio actually starts — use to drive the speaking animation. */
  onStart?: () => void
  /** Fires when audio finishes, errors, or is stopped — reset the animation here. */
  onEnd?: () => void
}

// cacheKey -> object URL of the fetched audio, for the session.
const audioCache = new Map<string, string>()
let current: HTMLAudioElement | null = null

/** Strip markdown so the voice doesn't read out asterisks, hashes, etc. */
function cleanForSpeech(text: string): string {
  return text.replace(/[*#`_>]/g, "").trim()
}

async function fetchAudioUrl(text: string, voiceId?: string): Promise<string> {
  const key = `${voiceId ?? "default"}::${text}`
  const cached = audioCache.get(key)
  if (cached) return cached

  const res = await fetch("/api/tts", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(voiceId ? { text, voiceId } : { text }),
  })
  if (!res.ok) throw new Error(`tts request failed: ${res.status}`)

  const blob = await res.blob()
  const url = URL.createObjectURL(blob)
  audioCache.set(key, url)
  return url
}

function fallbackSpeak(text: string, opts: SpeakOptions): void {
  if (typeof window === "undefined" || !("speechSynthesis" in window)) {
    opts.onEnd?.()
    return
  }
  window.speechSynthesis.cancel()
  const u = new SpeechSynthesisUtterance(text)
  u.rate = 1
  u.pitch = 1.05
  u.onstart = () => opts.onStart?.()
  u.onend = () => opts.onEnd?.()
  window.speechSynthesis.speak(u)
}

/** Stop any in-progress Nikki speech (ElevenLabs audio or fallback). */
export function stopNikkiSpeech(): void {
  if (current) {
    try {
      current.pause()
      current.currentTime = 0
    } catch {
      // ignore — element may already be torn down
    }
    current = null
  }
  if (typeof window !== "undefined" && "speechSynthesis" in window) {
    window.speechSynthesis.cancel()
  }
}

/**
 * Speak `text` in Nikki's voice. Prefers ElevenLabs; falls back to the browser
 * voice if the fetch or playback fails. `onStart`/`onEnd` let the caller animate
 * the speaking state for whichever path actually plays.
 */
export async function speakWithNikki(text: string, opts: SpeakOptions = {}): Promise<void> {
  const clean = cleanForSpeech(text)
  if (!clean) return

  stopNikkiSpeech()

  let url: string
  try {
    url = await fetchAudioUrl(clean, opts.voiceId)
  } catch {
    // Couldn't get ElevenLabs audio (e.g. missing key) — use the browser voice.
    fallbackSpeak(clean, opts)
    return
  }

  const audio = new Audio(url)
  current = audio
  audio.onplay = () => opts.onStart?.()
  audio.onended = () => {
    if (current === audio) current = null
    opts.onEnd?.()
  }
  audio.onerror = () => {
    if (current === audio) current = null
    opts.onEnd?.()
  }

  try {
    await audio.play()
  } catch {
    // Playback was blocked/failed before starting — fall back to browser voice.
    if (current === audio) current = null
    fallbackSpeak(clean, opts)
  }
}
