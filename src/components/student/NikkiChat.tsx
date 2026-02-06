import { useState, useRef, useEffect, useCallback } from 'react'
import { Volume2, VolumeX, Square, Loader2 } from 'lucide-react'
import { ChatContainer } from '@/components/chat/ChatContainer'
import { Switch } from '@/components/ui/switch'
import { useTextToSpeech } from '@/hooks/useTextToSpeech'
import { stripMarkdownForTTS } from '@/lib/stripMarkdownForTTS'
import type { Message } from '@/components/chat/ChatMessage'
import type { Subject } from '@/lib/types'

interface NikkiChatProps {
  subject: Subject
  messages: Message[]
  isLoading: boolean
  error: string | null
  sendMessage: (content: string) => Promise<void>
  dismissError: () => void
  onTtsActiveChange?: (active: boolean) => void
}

export function NikkiChat({
  subject,
  messages,
  isLoading,
  error,
  sendMessage,
  dismissError,
  onTtsActiveChange,
}: NikkiChatProps) {
  const { speak, stop, unlockAudio, isSpeaking, isLoading: ttsLoading, error: ttsError } = useTextToSpeech()
  const ttsActive = isSpeaking || ttsLoading

  const [readAloud, setReadAloud] = useState(true)

  // Detect streaming completion: isLoading transitions true → false
  const wasLoadingRef = useRef(false)

  useEffect(() => {
    // Detect true → false: streaming complete, play full response
    if (wasLoadingRef.current && !isLoading && readAloud) {
      const lastMessage = messages[messages.length - 1]
      if (lastMessage?.role === 'assistant' && lastMessage.content.trim()) {
        const plainText = stripMarkdownForTTS(lastMessage.content)
        if (plainText) void speak(plainText)
      }
    }
    wasLoadingRef.current = isLoading
  }, [isLoading, messages, readAloud, speak])

  useEffect(() => {
    onTtsActiveChange?.(ttsActive)
  }, [ttsActive, onTtsActiveChange])

  useEffect(() => {
    return () => {
      onTtsActiveChange?.(false)
    }
  }, [onTtsActiveChange])

  const handleToggle = (checked: boolean) => {
    setReadAloud(checked)
    if (checked) {
      // Unlock iOS AudioContext on user gesture
      unlockAudio()
    } else {
      stop()
    }
  }

  // Wrap sendMessage so the user's tap/send gesture unlocks iOS AudioContext.
  // This ensures TTS works from Question 1 onward (auto-start has no gesture).
  const handleSendMessage = useCallback(async (content: string) => {
    unlockAudio()
    await sendMessage(content)
  }, [unlockAudio, sendMessage])

  const handleReplayAssistantMessage = (content: string) => {
    const plainText = stripMarkdownForTTS(content)
    if (!plainText) return

    // User gesture ensures iOS audio can resume for replay taps.
    unlockAudio()
    void speak(plainText)
  }

  return (
    <div className="bg-white rounded-2xl border-2 border-slate-100 shadow-sm overflow-hidden">
      {/* Header */}
      <div className="px-4 py-3 bg-gradient-to-r from-primary/5 to-accent/5 border-b border-slate-100">
        <div className="flex items-start justify-between gap-3">
          {/* Left: Title */}
          <div className="min-w-0">
            <h2 className="font-semibold text-primary">
              Practice Session — N.I.K.K.I.
            </h2>
            <p className="text-sm text-muted-foreground mt-0.5">
              Answer each question to complete your session
            </p>
          </div>

          {/* Right: TTS controls */}
          <div className="flex items-center gap-2 shrink-0 pt-0.5">
            {/* Stop button — only visible when TTS is active */}
            {ttsActive && (
              <button
                onClick={stop}
                className="flex items-center gap-1.5 px-2 py-1 rounded-lg text-xs font-medium bg-accent/10 text-accent hover:bg-accent/20 transition-colors"
                aria-label="Stop speaking"
              >
                {ttsLoading ? (
                  <Loader2 className="h-3.5 w-3.5 animate-spin" />
                ) : (
                  <Volume2 className="h-3.5 w-3.5 animate-pulse" />
                )}
                <Square className="h-2.5 w-2.5 fill-current" />
              </button>
            )}

            {/* Read aloud label — hidden on small screens */}
            <label
              htmlFor="read-aloud"
              className="hidden sm:block text-xs font-medium text-muted-foreground cursor-pointer select-none"
            >
              Read aloud
            </label>

            {/* Volume icon — shown on small screens only */}
            {readAloud ? (
              <Volume2 className="h-4 w-4 text-primary sm:hidden" />
            ) : (
              <VolumeX className="h-4 w-4 text-muted-foreground sm:hidden" />
            )}

            <Switch
              id="read-aloud"
              checked={readAloud}
              onCheckedChange={handleToggle}
              aria-label="Toggle read aloud"
            />
          </div>
        </div>

        {/* TTS error — small text below header content */}
        {ttsError && (
          <p className="text-xs text-red-500 mt-1.5">
            Voice playback failed — responses will still appear as text.
          </p>
        )}
      </div>

      {/* Chat container with constrained height */}
      <div className="h-[400px]">
        <ChatContainer
          subject={subject}
          messages={messages}
          onSendMessage={handleSendMessage}
          isLoading={isLoading}
          error={error}
          onDismissError={dismissError}
          onReplayAssistantMessage={handleReplayAssistantMessage}
        />
      </div>
    </div>
  )
}
