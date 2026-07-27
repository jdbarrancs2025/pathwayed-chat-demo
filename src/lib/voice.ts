// Plays Nikki's voice via the ElevenLabs-backed /api/tts endpoint. If that fails
// (missing key, API error, or blocked playback) it falls back to the browser's
// speechSynthesis so the app degrades gracefully instead of going silent. Audio
// for a given piece of text is cached for the session to avoid re-fetching (cost).

import { stripMarkdownForTTS } from '@/lib/stripMarkdownForTTS'

export interface SpeakOptions {
  /** Optional ElevenLabs voice id override (normally the server default is used). */
  voiceId?: string
  /** Fires when audio actually starts — use to drive the speaking animation. */
  onStart?: () => void
  /** Fires when audio finishes, errors, or is stopped — reset the animation here. */
  onEnd?: () => void
  /** Fires when NOTHING audible could start because the browser blocked
   *  playback without a user gesture (ElevenLabs play() rejected AND the
   *  speechSynthesis fallback was refused with 'not-allowed'). Callers use it
   *  to show a tap-to-hear cue instead of staying silent. Without it, blocked
   *  playback ends via onEnd as before. */
  onBlocked?: () => void
}

// cacheKey -> object URL of the fetched audio, for the session.
const audioCache = new Map<string, string>()
let current: HTMLAudioElement | null = null
// Bumped on every stop/new utterance so an in-flight sentence sequence can tell
// it has been superseded and bail out.
let playToken = 0

/**
 * Single sanitization gate for this path. Previously this only deleted a handful
 * of punctuation characters, so callers that passed raw model output (Practice's
 * solution text, Flashcards) could still hand LaTeX, links, and code fences to
 * ElevenLabs. stripMarkdownForTTS is the full converter and is safe to run on
 * already-clean text, so callers that pre-sanitize are unaffected.
 */
function cleanForSpeech(text: string): string {
  return stripMarkdownForTTS(text).trim()
}

/**
 * Break text into speakable chunks (roughly one sentence each) so playback of
 * the first chunk can start while later chunks are still being generated — this
 * is what cuts the lag before Nikki starts talking. Over-long sentences are
 * split on spaces so the first chunk stays short.
 */
function splitForSpeech(text: string): string[] {
  const sentences = text.match(/[^.!?\n]+[.!?]*/g)?.map((s) => s.trim()).filter(Boolean) ?? []
  if (sentences.length === 0) return text.trim() ? [text.trim()] : []
  const MAX = 200
  const out: string[] = []
  for (const s of sentences) {
    if (s.length <= MAX) {
      out.push(s)
      continue
    }
    let rest = s
    while (rest.length > MAX) {
      // Always cut on whitespace. The old fallback sliced at exactly MAX when no
      // space was found early enough, which split a word across two separate
      // ElevenLabs requests, and each half was then voiced as its own utterance,
      // which is heard as a slur or stutter. Prefer the last space before MAX;
      // if there isn't a usable one, run past MAX to the next space instead.
      let cut = rest.lastIndexOf(" ", MAX)
      if (cut < 60) cut = rest.indexOf(" ", MAX)
      if (cut === -1) break // one unbroken run: emit it whole below
      out.push(rest.slice(0, cut).trim())
      rest = rest.slice(cut).trim()
    }
    if (rest) out.push(rest)
  }
  return out
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
    if (opts.onBlocked) opts.onBlocked()
    else opts.onEnd?.()
    return
  }
  window.speechSynthesis.cancel()
  const u = new SpeechSynthesisUtterance(text)
  u.rate = 1
  u.pitch = 1.05
  u.onstart = () => opts.onStart?.()
  u.onend = () => opts.onEnd?.()
  u.onerror = (e) => {
    // 'not-allowed' means the browser refused to speak without a user gesture —
    // the one case the caller may want to surface as a tap-to-hear cue. Other
    // errors (including 'interrupted'/'canceled' from stopNikkiSpeech) are a
    // normal end.
    if (e.error === "not-allowed" && opts.onBlocked) opts.onBlocked()
    else opts.onEnd?.()
  }
  window.speechSynthesis.speak(u)
}

/** Stop any in-progress Nikki speech (ElevenLabs audio or fallback). */
export function stopNikkiSpeech(): void {
  playToken++ // invalidate any running sentence sequence
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

/** Play one prefetched audio URL to completion. Resolves true once it ends (or
 *  errors mid-play); resolves false if playback was blocked before starting. */
function playChunk(url: string, onFirstPlay: () => void): Promise<boolean> {
  return new Promise((resolve) => {
    const audio = new Audio(url)
    current = audio
    const finish = () => {
      if (current === audio) current = null
      resolve(true)
    }
    audio.onended = finish
    audio.onerror = finish
    audio.play().then(onFirstPlay, () => {
      if (current === audio) current = null
      resolve(false)
    })
  })
}

/**
 * Speak `text` in Nikki's voice. Splits into sentences and starts playing the
 * first as soon as its audio is ready, prefetching the next while the current
 * one plays — so the time-to-first-audio is just the first short sentence, not
 * the whole reply. Falls back to the browser voice if ElevenLabs is unavailable
 * or autoplay is blocked. `onStart` fires when the first audio actually plays;
 * `onEnd` when the last finishes (or on fallback completion).
 */
export async function speakWithNikki(text: string, opts: SpeakOptions = {}): Promise<void> {
  const clean = cleanForSpeech(text)
  if (!clean) return

  stopNikkiSpeech() // stop prior audio and take a fresh token
  const token = playToken
  const chunks = splitForSpeech(clean)
  if (chunks.length === 0) return

  // Fetch helper that never rejects (null on failure), so prefetch promises
  // can't raise unhandled rejections if the sequence is abandoned.
  const fetchSafe = (t: string) => fetchAudioUrl(t, opts.voiceId).then((u) => u, () => null)

  let nextUrl = fetchSafe(chunks[0])
  let started = false

  for (let i = 0; i < chunks.length; i++) {
    if (token !== playToken) return // superseded by a newer utterance / stop
    const url = await nextUrl
    // Kick off the next sentence's fetch while this one plays.
    nextUrl = i + 1 < chunks.length ? fetchSafe(chunks[i + 1]) : Promise.resolve(null)
    if (token !== playToken) return

    if (!url) {
      if (!started) {
        // Couldn't get the very first chunk — fall back to the browser voice.
        if (token === playToken) fallbackSpeak(clean, opts)
        return
      }
      continue // a later chunk failed; skip it and keep going
    }

    const played = await playChunk(url, () => {
      if (!started) {
        started = true
        opts.onStart?.()
      }
    })
    if (!played && !started) {
      // Autoplay was blocked on the first chunk — fall back to the browser voice.
      if (token === playToken) fallbackSpeak(clean, opts)
      return
    }
    if (token !== playToken) return
  }

  if (token === playToken) opts.onEnd?.()
}
