import { useState, useRef, useCallback, useEffect } from "react"

export type RecorderState = "idle" | "requesting" | "recording" | "stopped" | "error"

export interface UseAudioRecorderReturn {
  state: RecorderState
  error: string | null
  analyserNode: AnalyserNode | null
  startRecording: () => Promise<void>
  stopRecording: () => void
  audioBlob: Blob | null
  mimeType: string
  /** Whole seconds left before the safety cap fires, but only inside the final
   *  COUNTDOWN_MS of a recording; null at every other time. Surfaces let the
   *  child see the cap coming instead of being cut off without warning. */
  secondsLeft: number | null
}

/** Detect best supported MIME type for MediaRecorder */
function detectMimeType(): string {
  if (typeof MediaRecorder === "undefined") return ""
  const types = [
    "audio/webm;codecs=opus",
    "audio/webm",
    "audio/mp4",
    "audio/wav",
  ]
  for (const type of types) {
    if (MediaRecorder.isTypeSupported(type)) return type
  }
  return ""
}

const supportedMimeType = typeof window !== "undefined" ? detectMimeType() : ""

// Guards against sub-second clips, which are the ones the transcription model
// hallucinates on (a spoken "277" coming back as "New York City 7"). This is a
// tap-to-toggle recorder, so an accidental double-tap or a too-quick answer can
// otherwise ship a near-empty blob straight to the API.
const MIN_RECORDING_MS = 400 // discard a recording shorter than this
const MIN_BLOB_BYTES = 2000 // secondary guard; bitrate varies, so duration leads
// Safety cap only: this recorder is tap-to-start / tap-to-stop, with no
// silence detection, so nothing else ends a recording. 30s was short enough
// that a child reading a passage aloud hit it mid-sentence, so the cap now sits
// at a minute and the last 10 seconds are counted down on screen.
const MAX_RECORDING_MS = 60000
const COUNTDOWN_MS = 10000 // show the remaining seconds inside this final window
const COUNTDOWN_TICK_MS = 250 // how often the countdown re-reads the clock
// iOS Safari can fire MediaRecorder's `stop` before the final `dataavailable`,
// which drops the last slice of audio (the tail of the sentence). Finalize only
// once both have landed, with this as the backstop if no final chunk ever comes.
const FINAL_CHUNK_GRACE_MS = 250

export function useAudioRecorder(): UseAudioRecorderReturn {
  const [state, setState] = useState<RecorderState>("idle")
  const [error, setError] = useState<string | null>(null)
  const [analyserNode, setAnalyserNode] = useState<AnalyserNode | null>(null)
  const [audioBlob, setAudioBlob] = useState<Blob | null>(null)
  const [secondsLeft, setSecondsLeft] = useState<number | null>(null)

  const mediaRecorderRef = useRef<MediaRecorder | null>(null)
  const audioContextRef = useRef<AudioContext | null>(null)
  const streamRef = useRef<MediaStream | null>(null)
  const chunksRef = useRef<Blob[]>([])
  const analyserRef = useRef<AnalyserNode | null>(null)
  const startTimeRef = useRef(0)
  const maxTimerRef = useRef<ReturnType<typeof setTimeout> | null>(null)
  const countdownRef = useRef<ReturnType<typeof setInterval> | null>(null)
  // Final-chunk handshake: `stop` and the last `dataavailable` can arrive in
  // either order, so whichever lands second does the finalizing (see below).
  const stoppedRef = useRef(false)
  const finalizedRef = useRef(false)
  const graceTimerRef = useRef<ReturnType<typeof setTimeout> | null>(null)

  const cleanup = useCallback(() => {
    if (maxTimerRef.current != null) {
      clearTimeout(maxTimerRef.current)
      maxTimerRef.current = null
    }
    if (countdownRef.current != null) {
      clearInterval(countdownRef.current)
      countdownRef.current = null
    }
    if (graceTimerRef.current != null) {
      clearTimeout(graceTimerRef.current)
      graceTimerRef.current = null
    }
    setSecondsLeft(null)
    // Stop all tracks
    if (streamRef.current) {
      streamRef.current.getTracks().forEach((t) => t.stop())
      streamRef.current = null
    }
    // Close audio context
    if (audioContextRef.current) {
      audioContextRef.current.close().catch(() => {})
      audioContextRef.current = null
    }
    // Clear analyser
    analyserRef.current = null
    setAnalyserNode(null)
    mediaRecorderRef.current = null
    chunksRef.current = []
  }, [])

  const startRecording = useCallback(async () => {
    // Reset previous state
    setError(null)
    setAudioBlob(null)
    setState("requesting")

    if (!supportedMimeType) {
      setError("Audio recording is not supported in this browser.")
      setState("error")
      return
    }

    try {
      const stream = await navigator.mediaDevices.getUserMedia({ audio: true })
      streamRef.current = stream

      // Create AudioContext inside user gesture for iOS
      const ctx = new AudioContext()
      audioContextRef.current = ctx

      // Resume if suspended/interrupted (iOS)
      if (ctx.state === "suspended" || (ctx.state as string) === "interrupted") {
        await ctx.resume()
      }

      // Set up analyser for visualization
      const source = ctx.createMediaStreamSource(stream)
      const analyser = ctx.createAnalyser()
      analyser.fftSize = 256
      source.connect(analyser)
      // Do NOT connect analyser to destination (would cause feedback)
      analyserRef.current = analyser
      setAnalyserNode(analyser)

      // Set up MediaRecorder
      const recorder = new MediaRecorder(stream, { mimeType: supportedMimeType })
      mediaRecorderRef.current = recorder
      chunksRef.current = []

      // Assemble the blob exactly once, only after the recorder has stopped AND
      // its final slice of audio has arrived. Called from both `dataavailable`
      // and `stop` so it runs on whichever fires last, plus a grace timer for
      // the case where no final chunk is delivered at all.
      const finalize = () => {
        if (finalizedRef.current || !stoppedRef.current) return
        finalizedRef.current = true
        const durationMs = performance.now() - startTimeRef.current
        const blob = new Blob(chunksRef.current, { type: supportedMimeType })
        // Too short to be a real spoken answer (a blip or accidental double-tap).
        // Discard without transcribing and surface a retry through the error flag,
        // which Session's micError UI shows — sub-second clips are the main source
        // of transcription hallucinations.
        if (durationMs < MIN_RECORDING_MS || blob.size < MIN_BLOB_BYTES) {
          setError("I didn't catch that. Tap the mic and say your answer.")
          setState("error")
          cleanup()
          return
        }
        setAudioBlob(blob)
        setState("stopped")
        cleanup()
      }

      recorder.ondataavailable = (e) => {
        if (e.data.size > 0) {
          chunksRef.current.push(e.data)
        }
        // Post-stop chunk: this is the tail of the recording, so it is safe to
        // build the blob now rather than waiting out the grace timer.
        if (stoppedRef.current) finalize()
      }

      recorder.onstop = () => {
        stoppedRef.current = true
        // If the final chunk already arrived this finalizes immediately;
        // otherwise the grace timer covers a browser that never sends one.
        if (graceTimerRef.current != null) clearTimeout(graceTimerRef.current)
        graceTimerRef.current = setTimeout(finalize, FINAL_CHUNK_GRACE_MS)
        if (chunksRef.current.length > 0) finalize()
      }

      recorder.onerror = () => {
        setError("Recording failed. Please try again.")
        setState("error")
        cleanup()
      }

      stoppedRef.current = false
      finalizedRef.current = false
      recorder.start()
      startTimeRef.current = performance.now()
      // Safety cap: if a recording is somehow left running, auto-stop it so it
      // always flushes rather than growing unbounded. Nothing else stops this
      // recorder: there is no silence detection on tap-to-talk.
      maxTimerRef.current = setTimeout(() => {
        if (mediaRecorderRef.current && mediaRecorderRef.current.state === "recording") {
          mediaRecorderRef.current.stop()
        }
      }, MAX_RECORDING_MS)
      // Countdown for the final stretch, so the cap is visible before it lands.
      setSecondsLeft(null)
      countdownRef.current = setInterval(() => {
        const remaining = MAX_RECORDING_MS - (performance.now() - startTimeRef.current)
        setSecondsLeft(remaining > COUNTDOWN_MS ? null : Math.max(0, Math.ceil(remaining / 1000)))
      }, COUNTDOWN_TICK_MS)
      setState("recording")
    } catch (err) {
      const message = mapError(err)
      setError(message)
      setState("error")
      cleanup()
    }
  }, [cleanup])

  const stopRecording = useCallback(() => {
    if (mediaRecorderRef.current && mediaRecorderRef.current.state === "recording") {
      mediaRecorderRef.current.stop()
      // State transitions happen in onstop handler
    }
  }, [])

  // Cleanup on unmount
  useEffect(() => {
    return () => {
      if (mediaRecorderRef.current && mediaRecorderRef.current.state === "recording") {
        mediaRecorderRef.current.stop()
      }
      cleanup()
    }
  }, [cleanup])

  return {
    state,
    error,
    analyserNode,
    startRecording,
    stopRecording,
    audioBlob,
    mimeType: supportedMimeType,
    secondsLeft,
  }
}

function mapError(err: unknown): string {
  if (err instanceof DOMException) {
    switch (err.name) {
      case "NotAllowedError":
        return "Microphone access was denied. Please allow microphone access and try again."
      case "NotFoundError":
        return "No microphone found. Please connect a microphone and try again."
      case "NotReadableError":
        return "Microphone is in use by another application."
      default:
        return `Microphone error: ${err.message}`
    }
  }
  return "An unexpected error occurred while accessing the microphone."
}
