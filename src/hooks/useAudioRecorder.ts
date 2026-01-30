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

  const cleanup = useCallback(() => {
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
        const blob = new Blob(chunksRef.current, { type: supportedMimeType })
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
