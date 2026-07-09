import { useCallback, useEffect, useRef, useState } from 'react'
import { speakWithNikki, stopNikkiSpeech } from '@/lib/voice'
import { stripMarkdownForTTS } from '@/lib/stripMarkdownForTTS'

interface UseAutoReadArgs {
  /** Stable id of the current question. A change triggers ONE fresh read; null
   *  (e.g. before the assessment starts, or on a summary screen) reads nothing. */
  questionId: string | null | undefined
  /** The text to read aloud — the caller assembles the passage (if any) + stem. */
  text: string
  /** When true, no auto-read happens and replay() is inert (mute respected). */
  muted: boolean
}

/**
 * Auto-read a question aloud in Nikki's voice (ElevenLabs, with the same
 * speechSynthesis fallback the greeting uses). Reads ONCE when a new question
 * loads — not on mute/unmute — and exposes replay() for the speaker control.
 * Entering the assessment/lesson is the user gesture that unblocks autoplay; if a
 * browser still blocks it, voice.ts falls back to the browser voice.
 */
export function useAutoRead({ questionId, text, muted }: UseAutoReadArgs): {
  speaking: boolean
  replay: () => void
} {
  const [speaking, setSpeaking] = useState(false)
  // Mirror live values into refs (updated in effects, NOT during render) so the
  // auto-read effect can read the latest mute/text without taking them as deps —
  // toggling mute or tweaking text must never re-trigger a read. The text-mirror
  // effect is declared before the auto-read effect, so on a question change the
  // ref is refreshed before the read runs (effects fire in declaration order).
  const mutedRef = useRef(muted)
  const textRef = useRef(text)
  const lastReadRef = useRef<string | null>(null)
  useEffect(() => {
    mutedRef.current = muted
  }, [muted])
  useEffect(() => {
    textRef.current = text
  }, [text])

  const read = useCallback(() => {
    const spoken = stripMarkdownForTTS(textRef.current)
    if (!spoken) return
    void speakWithNikki(spoken, {
      onStart: () => setSpeaking(true),
      onEnd: () => setSpeaking(false),
    })
  }, [])

  // Fresh read on each NEW question (only if unmuted at load time).
  useEffect(() => {
    if (!questionId || lastReadRef.current === questionId) return
    lastReadRef.current = questionId
    if (mutedRef.current) return
    read()
  }, [questionId, read])

  // Stop any in-flight audio when the screen unmounts.
  useEffect(() => () => stopNikkiSpeech(), [])

  const replay = useCallback(() => {
    if (mutedRef.current) return
    read()
  }, [read])

  return { speaking, replay }
}
