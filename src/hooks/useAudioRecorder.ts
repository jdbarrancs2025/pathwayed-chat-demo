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
const MAX_RECORDING_MS = 30000 // safety cap: auto-stop a recording left running

export function useAudioRecorder(): UseAudioRecorderReturn {
  const [state, setState] = useState<RecorderState>("idle")
  const [error, setError] = useState<string | null>(null)
  const [analyserNode, setAnalyserNode] = useState<AnalyserNode | null>(null)
  const [audioBlob, setAudioBlob] = useState<Blob | null>(null)

  const mediaRecorderRef = useRef<MediaRecorder | null>(null)
  const audioContextRef = useRef<AudioContext | null>(null)
  const streamRef = useRef<MediaStream | null>(null)
  const chunksRef = useRef<Blob[]>([])
  const analyserRef = useRef<AnalyserNode | null>(null)
  const startTimeRef = useRef(0)
  const maxTimerRef = useRef<ReturnType<typeof setTimeout> | null>(null)

  const cleanup = useCallback(() => {
    if (maxTimerRef.current != null) {
      clearTimeout(maxTimerRef.current)
      maxTimerRef.current = null
    }
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

      recorder.ondataavailable = (e) => {
        if (e.data.size > 0) {
          chunksRef.current.push(e.data)
        }
      }

      recorder.onstop = () => {
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

      recorder.onerror = () => {
        setError("Recording failed. Please try again.")
        setState("error")
        cleanup()
      }

      recorder.start()
      startTimeRef.current = performance.now()
      // Safety cap: if a recording is somehow left running, auto-stop it so it
      // always flushes rather than growing unbounded.
      maxTimerRef.current = setTimeout(() => {
        if (mediaRecorderRef.current && mediaRecorderRef.current.state === "recording") {
          mediaRecorderRef.current.stop()
        }
      }, MAX_RECORDING_MS)
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
