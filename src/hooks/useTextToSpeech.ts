import { useState, useRef, useCallback, useEffect } from 'react'

// Module-level singleton — only one AudioContext per page (Safari limits to 4)
let sharedAudioContext: AudioContext | null = null
let isUnlocked = false

export interface UseTextToSpeechReturn {
  speak: (text: string) => Promise<void>
  stop: () => void
  unlockAudio: () => void
  isSpeaking: boolean
  isLoading: boolean
  error: string | null
}

function getOrCreateContext(): AudioContext {
  if (!sharedAudioContext) {
    sharedAudioContext = new AudioContext()
  }
  return sharedAudioContext
}

/**
 * Unlocks AudioContext for iOS Safari.
 * Must be called synchronously from a user gesture (e.g., click/tap handler).
 * Plays a 1-sample silent buffer to move the context to "running" state.
 */
function unlockAudioContext(): void {
  if (isUnlocked) return

  const ctx = getOrCreateContext()

  // Resume if suspended (required on iOS)
  if (ctx.state === 'suspended') {
    ctx.resume().catch(() => {})
  }

  // Play a silent buffer to fully unlock on iOS Safari
  const buffer = ctx.createBuffer(1, 1, 22050)
  const source = ctx.createBufferSource()
  source.buffer = buffer
  source.connect(ctx.destination)
  source.start(0)

  isUnlocked = true
}

export function useTextToSpeech(): UseTextToSpeechReturn {
  const [isSpeaking, setIsSpeaking] = useState(false)
  const [isLoading, setIsLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const isMountedRef = useRef(true)
  const abortControllerRef = useRef<AbortController | null>(null)
  const sourceNodeRef = useRef<AudioBufferSourceNode | null>(null)

  // Track mount state
  useEffect(() => {
    isMountedRef.current = true
    return () => {
      isMountedRef.current = false
    }
  }, [])

  const stop = useCallback(() => {
    // Abort any in-flight fetch
    if (abortControllerRef.current) {
      abortControllerRef.current.abort()
      abortControllerRef.current = null
    }

    // Stop current audio playback
    if (sourceNodeRef.current) {
      try {
        sourceNodeRef.current.stop()
        sourceNodeRef.current.disconnect()
      } catch {
        // Source may already have ended
      }
      sourceNodeRef.current = null
    }

    if (isMountedRef.current) {
      setIsSpeaking(false)
      setIsLoading(false)
    }
  }, [])

  const speak = useCallback(
    async (text: string) => {
      // Cancel any current playback/fetch
      stop()

      if (!text.trim()) return

      if (!isMountedRef.current) return
      setError(null)
      setIsLoading(true)

      const ctx = getOrCreateContext()

      // Belt-and-suspenders: try to resume if still suspended
      if (ctx.state === 'suspended') {
        try {
          await ctx.resume()
        } catch {
          // Ignore — will fail gracefully below
        }
      }

      const abortController = new AbortController()
      abortControllerRef.current = abortController

      try {
        const response = await fetch('/api/tts', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ text }),
          signal: abortController.signal,
        })

        if (!response.ok) {
          throw new Error('Text-to-speech failed')
        }

        const arrayBuffer = await response.arrayBuffer()

        // Decode the audio data
        const audioBuffer = await ctx.decodeAudioData(arrayBuffer)

        // Check if we were stopped/unmounted during the async operations
        if (!isMountedRef.current || abortController.signal.aborted) return

        // Create and play source node
        const source = ctx.createBufferSource()
        source.buffer = audioBuffer
        source.connect(ctx.destination)
        sourceNodeRef.current = source

        source.onended = () => {
          sourceNodeRef.current = null
          if (isMountedRef.current) {
            setIsSpeaking(false)
          }
        }

        source.start(0)

        if (isMountedRef.current) {
          setIsLoading(false)
          setIsSpeaking(true)
        }
      } catch (err) {
        // Silently ignore abort errors (user cancelled)
        if (err instanceof DOMException && err.name === 'AbortError') return

        if (isMountedRef.current) {
          setError(
            err instanceof Error ? err.message : 'Text-to-speech failed'
          )
          setIsLoading(false)
          setIsSpeaking(false)
        }
      }
    },
    [stop]
  )

  const unlockAudio = useCallback(() => {
    unlockAudioContext()
  }, [])

  // Cleanup on unmount: abort fetch, stop playback
  useEffect(() => {
    return () => {
      if (abortControllerRef.current) {
        abortControllerRef.current.abort()
      }
      if (sourceNodeRef.current) {
        try {
          sourceNodeRef.current.stop()
          sourceNodeRef.current.disconnect()
        } catch {
          // Source may already have ended
        }
      }
    }
  }, [])

  return {
    speak,
    stop,
    unlockAudio,
    isSpeaking,
    isLoading,
    error,
  }
}
