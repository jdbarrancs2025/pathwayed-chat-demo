import { useCallback, useEffect, useRef, useState } from 'react'

export type ConvoMicState = 'idle' | 'starting' | 'listening' | 'error'

/** Detect the best supported MediaRecorder MIME type. */
function detectMimeType(): string {
  if (typeof MediaRecorder === 'undefined') return ''
  for (const t of ['audio/webm;codecs=opus', 'audio/webm', 'audio/mp4', 'audio/wav']) {
    if (MediaRecorder.isTypeSupported(t)) return t
  }
  return ''
}
const MIME = typeof window !== 'undefined' ? detectMimeType() : ''

// ── Voice-activity tuning (re-tune these two as needed) ──────────────────────
// SPEECH_RMS: how loud audio must be to count as the child talking.
//   LOWER  = more sensitive (picks up softer/quieter voices), but more prone to
//            triggering on background noise.
//   HIGHER = needs a louder voice.
//   Tuned very low here for a QUIET room with a very soft-spoken child.
const SPEECH_RMS = 0.008
// SILENCE_MS: how long a pause must last to end the child's turn.
//   HIGHER = waits longer before ending a turn (more forgiving of mid-sentence
//            pauses — good for kids who pause to think), but slower to respond.
//   LOWER  = ends turns faster, but can cut a child off mid-sentence.
//   1300ms cut children off mid-sentence in live testing: a normal breath or a
//   pause to decode the next word is routinely longer than that. 2500ms clears
//   a natural reading pause at the cost of ~1.2s more before Nikki replies.
const SILENCE_MS = 2500
// ─────────────────────────────────────────────────────────────────────────────
const MIN_SPEECH_MS = 300 // ignore blips shorter than this
// Hard cap so a segment always flushes. Only reached when the silence detector
// never fires (e.g. a noisy room holding RMS above SPEECH_RMS); 14s used to
// split a child reading a passage aloud straight down the middle of a sentence.
const MAX_UTTERANCE_MS = 45000
const MIN_BLOB_BYTES = 1500 // drop near-empty segments
// iOS Safari can fire `stop` ahead of the final `dataavailable`, dropping the
// tail of the utterance. Wait for both before handing the blob off.
const FINAL_CHUNK_GRACE_MS = 250

function mapError(err: unknown): string {
  if (err instanceof DOMException) {
    if (err.name === 'NotAllowedError')
      return 'Microphone access was denied. You can still type, or allow the mic and tap again.'
    if (err.name === 'NotFoundError') return 'No microphone found. You can still type your message.'
    if (err.name === 'NotReadableError') return 'The microphone is in use by another app. You can still type.'
  }
  return "I couldn't start the microphone. You can still type your message."
}

interface Options {
  /** Called with each detected utterance to transcribe + send. */
  onUtterance: (blob: Blob, mimeType: string) => void
  /** While this returns true, capturing pauses (e.g. Nikki is speaking/thinking). */
  isPaused?: () => boolean
}

/**
 * Continuous "conversation mode" mic: after one tap it keeps listening, splitting
 * speech into utterances on silence (simple RMS voice-activity detection) and
 * handing each to `onUtterance`. One persistent stream is reused across
 * utterances (no re-prompting). Used for Reading; other subjects keep the
 * single-shot useAudioRecorder.
 */
export function useConversationMic({ onUtterance, isPaused }: Options) {
  const [state, setState] = useState<ConvoMicState>('idle')
  const [error, setError] = useState<string | null>(null)

  const streamRef = useRef<MediaStream | null>(null)
  const ctxRef = useRef<AudioContext | null>(null)
  const analyserRef = useRef<AnalyserNode | null>(null)
  const recorderRef = useRef<MediaRecorder | null>(null)
  const rafRef = useRef<number | null>(null)
  const activeRef = useRef(false)

  // Per-utterance VAD bookkeeping.
  const speakingRef = useRef(false)
  const speechStartRef = useRef(0)
  const lastLoudRef = useRef(0)
  const segStartRef = useRef(0)

  // Keep latest callbacks without restarting the loop. These refs are read only
  // asynchronously (inside the rAF loop and event handlers), so syncing them in a
  // post-commit effect keeps the running loop current without writing refs during render.
  const onUtteranceRef = useRef(onUtterance)
  const isPausedRef = useRef(isPaused)

  const cleanup = useCallback(() => {
    if (rafRef.current != null) {
      cancelAnimationFrame(rafRef.current)
      rafRef.current = null
    }
    const rec = recorderRef.current
    if (rec && rec.state !== 'inactive') {
      try {
        rec.stop()
      } catch {
        // already stopped
      }
    }
    recorderRef.current = null
    if (streamRef.current) {
      streamRef.current.getTracks().forEach((t) => t.stop())
      streamRef.current = null
    }
    if (ctxRef.current) {
      ctxRef.current.close().catch(() => {})
      ctxRef.current = null
    }
    analyserRef.current = null
    speakingRef.current = false
  }, [])

  const startSegment = useCallback(() => {
    const stream = streamRef.current
    if (!stream || !activeRef.current) return
    if (recorderRef.current && recorderRef.current.state === 'recording') return

    const rec = new MediaRecorder(stream, MIME ? { mimeType: MIME } : undefined)

    // Chunks are per-segment locals, not a shared ref: the next segment starts
    // as soon as this recorder leaves the 'recording' state, which can be before
    // this one has delivered its final chunk.
    const chunks: Blob[] = []
    // Deliver the utterance exactly once, only after the recorder has stopped
    // AND its final slice has arrived (the two can land in either order).
    let stopped = false
    let delivered = false
    let graceTimer: ReturnType<typeof setTimeout> | null = null
    const deliver = () => {
      if (delivered || !stopped) return
      delivered = true
      if (graceTimer != null) clearTimeout(graceTimer)
      const blob = new Blob(chunks, { type: MIME })
      if (blob.size >= MIN_BLOB_BYTES) onUtteranceRef.current(blob, MIME)
    }

    rec.ondataavailable = (e) => {
      if (e.data.size > 0) chunks.push(e.data)
      if (stopped) deliver()
    }
    rec.onstop = () => {
      stopped = true
      graceTimer = setTimeout(deliver, FINAL_CHUNK_GRACE_MS)
      if (chunks.length > 0) deliver()
    }
    recorderRef.current = rec
    speakingRef.current = false
    speechStartRef.current = 0
    lastLoudRef.current = 0
    rec.start()
    segStartRef.current = performance.now()
  }, [])

  const stopSegment = useCallback(() => {
    const rec = recorderRef.current
    if (rec && rec.state === 'recording') {
      try {
        rec.stop()
      } catch {
        // ignore
      }
    }
  }, [])

  // Hold the latest loop in a ref so the frame can reschedule itself without the
  // callback referencing its own binding (same "latest without restart" pattern
  // as onUtteranceRef/isPausedRef above).
  const loopRef = useRef<() => void>(() => {})

  const loop = useCallback(() => {
    rafRef.current = requestAnimationFrame(() => loopRef.current())
    const analyser = analyserRef.current
    if (!analyser || !activeRef.current) return

    // Pause capturing while Nikki is talking/thinking, then resume listening.
    if (isPausedRef.current?.()) {
      stopSegment()
      return
    }
    if (!recorderRef.current || recorderRef.current.state !== 'recording') {
      startSegment()
      return
    }

    const buf = new Uint8Array(analyser.fftSize)
    analyser.getByteTimeDomainData(buf)
    let sum = 0
    for (let i = 0; i < buf.length; i++) {
      const v = (buf[i] - 128) / 128
      sum += v * v
    }
    const rms = Math.sqrt(sum / buf.length)
    const now = performance.now()

    if (rms > SPEECH_RMS) {
      if (!speakingRef.current) {
        speakingRef.current = true
        speechStartRef.current = now
      }
      lastLoudRef.current = now
    }

    const spoke = speakingRef.current && now - speechStartRef.current > MIN_SPEECH_MS
    const silentFor = now - lastLoudRef.current
    const segLen = now - segStartRef.current
    if ((spoke && silentFor > SILENCE_MS) || segLen > MAX_UTTERANCE_MS) {
      stopSegment() // onstop delivers the utterance; the loop starts a fresh segment
    }
  }, [startSegment, stopSegment])

  // Sync latest callbacks/loop into their refs after each commit (see note above).
  useEffect(() => {
    onUtteranceRef.current = onUtterance
    isPausedRef.current = isPaused
    loopRef.current = loop
  })

  const start = useCallback(async () => {
    setError(null)
    if (activeRef.current) return
    if (!MIME) {
      setError('Audio recording is not supported in this browser. You can still type.')
      setState('error')
      return
    }
    setState('starting')
    try {
      const stream = await navigator.mediaDevices.getUserMedia({ audio: true })
      streamRef.current = stream
      const ctx = new AudioContext()
      ctxRef.current = ctx
      if (ctx.state === 'suspended') await ctx.resume()
      const source = ctx.createMediaStreamSource(stream)
      const analyser = ctx.createAnalyser()
      analyser.fftSize = 1024
      source.connect(analyser)
      analyserRef.current = analyser
      activeRef.current = true
      setState('listening')
      rafRef.current = requestAnimationFrame(() => loopRef.current())
    } catch (err) {
      setError(mapError(err))
      setState('error')
      cleanup()
    }
  }, [cleanup])

  const stop = useCallback(() => {
    activeRef.current = false
    cleanup()
    setState('idle')
  }, [cleanup])

  useEffect(() => {
    return () => {
      activeRef.current = false
      cleanup()
    }
  }, [cleanup])

  return {
    state,
    error,
    start,
    stop,
    active: state === 'listening' || state === 'starting',
  }
}
