import { useState, useRef, useCallback, useEffect } from 'react'

// Module-level singleton — only one AudioContext per page (Safari limits to 4)
let sharedAudioContext: AudioContext | null = null
let isUnlocked = false

// Module-level filler cache — persists across re-renders and hook re-initializations
const fillerCache = new Map<string, AudioBuffer>()

export interface UseTextToSpeechReturn {
  speak: (text: string) => Promise<void>
  stop: () => void
  unlockAudio: () => void
  preloadFillers: (phrases: string[]) => void
  playFiller: () => void
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
  const activeSourcesRef = useRef<AudioBufferSourceNode[]>([])

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

    // Stop all active audio sources
    for (const source of activeSourcesRef.current) {
      try {
        source.stop()
        source.disconnect()
      } catch {
        // Source may already have ended
      }
    }
    activeSourcesRef.current = []

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
          body: JSON.stringify({ text, format: 'pcm' }),
          signal: abortController.signal,
        })

        if (!response.ok) {
          throw new Error('Text-to-speech failed')
        }

        const body = response.body
        if (!body) {
          throw new Error('No response body')
        }

        const reader = body.getReader()
        const PCM_SAMPLE_RATE = 24000
        let leftover = new Uint8Array(0)
        let nextStartTime = 0
        let isFirstChunk = true
        let lastSource: AudioBufferSourceNode | null = null

        while (true) {
          const { done, value } = await reader.read()
          if (done) break

          if (abortController.signal.aborted) break

          // Combine leftover bytes with new chunk
          let data: Uint8Array
          if (leftover.length > 0) {
            data = new Uint8Array(leftover.length + value.length)
            data.set(leftover, 0)
            data.set(value, leftover.length)
          } else {
            data = value
          }

          // Handle odd byte — carry to next iteration
          const usableBytes = data.length & ~1 // Round down to even
          if (usableBytes === 0) {
            leftover = data
            continue
          }

          leftover =
            data.length > usableBytes ? data.slice(usableBytes) : new Uint8Array(0)

          // Convert Int16 LE → Float32 using DataView for safe alignment
          const sampleCount = usableBytes / 2
          const view = new DataView(data.buffer, data.byteOffset, usableBytes)
          const audioBuffer = ctx.createBuffer(1, sampleCount, PCM_SAMPLE_RATE)
          const channelData = audioBuffer.getChannelData(0)

          for (let i = 0; i < sampleCount; i++) {
            channelData[i] = view.getInt16(i * 2, true) / 32768
          }

          // Schedule gapless playback
          const source = ctx.createBufferSource()
          source.buffer = audioBuffer
          source.connect(ctx.destination)
          activeSourcesRef.current.push(source)

          // Snap forward if we've fallen behind
          if (nextStartTime < ctx.currentTime) {
            nextStartTime = ctx.currentTime
          }

          source.start(nextStartTime)
          nextStartTime += audioBuffer.duration
          lastSource = source

          if (isFirstChunk) {
            isFirstChunk = false
            if (isMountedRef.current) {
              setIsLoading(false)
              setIsSpeaking(true)
            }
          }
        }

        // When the last source ends, mark speaking as done
        if (lastSource) {
          lastSource.onended = () => {
            if (isMountedRef.current) {
              setIsSpeaking(false)
            }
          }
        } else {
          // No audio was produced
          if (isMountedRef.current) {
            setIsLoading(false)
            setIsSpeaking(false)
          }
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

  const preloadFillers = useCallback((phrases: string[]) => {
    const ctx = getOrCreateContext()
    const uncached = phrases.filter((p) => !fillerCache.has(p))
    if (uncached.length === 0) return

    Promise.allSettled(
      uncached.map(async (phrase) => {
        const res = await fetch('/api/tts', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ text: phrase }),
        })
        if (!res.ok) return
        const arrayBuffer = await res.arrayBuffer()
        const audioBuffer = await ctx.decodeAudioData(arrayBuffer)
        fillerCache.set(phrase, audioBuffer)
      })
    )
  }, [])

  const playFiller = useCallback(() => {
    if (fillerCache.size === 0) return

    const keys = Array.from(fillerCache.keys())
    const key = keys[Math.floor(Math.random() * keys.length)]
    const buffer = fillerCache.get(key)
    if (!buffer) return

    // Stop any current playback before playing filler
    for (const s of activeSourcesRef.current) {
      try {
        s.stop()
        s.disconnect()
      } catch {
        // Source may already have ended
      }
    }
    activeSourcesRef.current = []

    const ctx = getOrCreateContext()
    const source = ctx.createBufferSource()
    source.buffer = buffer
    source.connect(ctx.destination)
    activeSourcesRef.current.push(source)

    source.onended = () => {
      // Only clear if this source is still in the active list
      const idx = activeSourcesRef.current.indexOf(source)
      if (idx !== -1) {
        activeSourcesRef.current.splice(idx, 1)
      }
    }

    source.start(0)
  }, [])

  // Cleanup on unmount: abort fetch, stop playback
  useEffect(() => {
    return () => {
      if (abortControllerRef.current) {
        abortControllerRef.current.abort()
      }
      for (const source of activeSourcesRef.current) {
        try {
          source.stop()
          source.disconnect()
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
    preloadFillers,
    playFiller,
    isSpeaking,
    isLoading,
    error,
  }
}
