import { useState, useRef, useEffect } from 'react'
import { Volume2, VolumeX, Square, Loader2 } from 'lucide-react'
import { ChatContainer } from '@/components/chat/ChatContainer'
import { Switch } from '@/components/ui/switch'
import { useNikkiChat } from '@/hooks/useNikkiChat'
import { useTextToSpeech } from '@/hooks/useTextToSpeech'
import { stripMarkdownForTTS } from '@/lib/stripMarkdownForTTS'
import type { Subject, AppMode } from '@/lib/types'

interface NikkiChatProps {
  subject: Subject
  focusAreas: string[]
  appMode: AppMode
}

export function NikkiChat({ subject, focusAreas, appMode }: NikkiChatProps) {
  const { messages, isLoading, error, sendMessage, dismissError } = useNikkiChat({
    context: { subject, focusAreas, appMode },
  })

  const { speak, stop, unlockAudio, isSpeaking, isLoading: ttsLoading, error: ttsError } = useTextToSpeech()

  const [readAloud, setReadAloud] = useState(false)

  // Detect streaming completion: isLoading transitions true → false
  const wasLoadingRef = useRef(false)

  useEffect(() => {
    if (wasLoadingRef.current && !isLoading && readAloud) {
      const lastMessage = messages[messages.length - 1]
      if (lastMessage?.role === 'assistant' && lastMessage.content.trim()) {
        const plainText = stripMarkdownForTTS(lastMessage.content)
        if (plainText) speak(plainText)
      }
    }
    wasLoadingRef.current = isLoading
  }, [isLoading, messages, readAloud, speak])

  const handleToggle = (checked: boolean) => {
    setReadAloud(checked)
    if (checked) {
      // Unlock iOS AudioContext on user gesture
      unlockAudio()
    } else {
      stop()
    }
  }

  const ttsActive = isSpeaking || ttsLoading

  return (
    <div className="bg-white rounded-2xl border-2 border-slate-100 shadow-sm overflow-hidden">
      {/* Header */}
      <div className="px-4 py-3 bg-gradient-to-r from-primary/5 to-accent/5 border-b border-slate-100">
        <div className="flex items-start justify-between gap-3">
          {/* Left: Title */}
          <div className="min-w-0">
            <h2 className="font-semibold text-primary">
              Homework Help — Ask N.I.K.K.I.
            </h2>
            <p className="text-sm text-muted-foreground mt-0.5">
              Get step-by-step help with your practice questions
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
          messages={messages}
          onSendMessage={sendMessage}
          isLoading={isLoading}
          error={error}
          onDismissError={dismissError}
        />
      </div>
    </div>
  )
}
