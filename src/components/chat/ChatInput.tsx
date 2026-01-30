import { useState, useRef, useEffect, useCallback } from "react"
import { Send, Mic, Square, Loader2 } from "lucide-react"
import { cn } from "@/lib/utils"
import { useAudioRecorder } from "@/hooks/useAudioRecorder"
import { WaveformVisualizer } from "./WaveformVisualizer"

interface ChatInputProps {
  onSendMessage: (message: string) => void
  disabled?: boolean
}

export function ChatInput({ onSendMessage, disabled }: ChatInputProps) {
  const [message, setMessage] = useState("")
  const [isTranscribing, setIsTranscribing] = useState(false)
  const textareaRef = useRef<HTMLTextAreaElement>(null)

  const {
    state: recorderState,
    analyserNode,
    startRecording,
    stopRecording,
    audioBlob,
    mimeType,
    error: recorderError,
  } = useAudioRecorder()

  const isRecording = recorderState === "recording"
  const isRequesting = recorderState === "requesting"

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    if (message.trim() && !disabled && !isRecording && !isTranscribing) {
      onSendMessage(message.trim())
      setMessage("")
      if (textareaRef.current) {
        textareaRef.current.style.height = "auto"
      }
    }
  }

  const handleKeyDown = (e: React.KeyboardEvent) => {
    if (e.key === "Enter" && !e.shiftKey) {
      e.preventDefault()
      handleSubmit(e)
    }
  }

  const handleMicClick = useCallback(async () => {
    if (isRecording) {
      stopRecording()
    } else {
      await startRecording()
    }
  }, [isRecording, startRecording, stopRecording])

  // Transcribe audio when blob is available
  useEffect(() => {
    if (!audioBlob || !mimeType) return

    let cancelled = false

    async function transcribe() {
      setIsTranscribing(true)
      try {
        // Convert blob to base64
        const arrayBuffer = await audioBlob!.arrayBuffer()
        const bytes = new Uint8Array(arrayBuffer)
        let binary = ""
        for (let i = 0; i < bytes.length; i++) {
          binary += String.fromCharCode(bytes[i])
        }
        const base64 = btoa(binary)

        const res = await fetch("/api/transcribe", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ audio: base64, mimeType }),
        })

        if (!res.ok) {
          throw new Error("Transcription failed")
        }

        const data = await res.json()
        if (!cancelled && data.text) {
          setMessage(data.text)
          // Focus textarea so user can edit before sending
          setTimeout(() => textareaRef.current?.focus(), 50)
        }
      } catch {
        // Silently fail — user can still type manually
        console.error("Transcription error")
      } finally {
        if (!cancelled) {
          setIsTranscribing(false)
        }
      }
    }

    transcribe()
    return () => { cancelled = true }
  }, [audioBlob, mimeType])

  // Auto-resize textarea
  useEffect(() => {
    const textarea = textareaRef.current
    if (textarea) {
      textarea.style.height = "auto"
      textarea.style.height = `${Math.min(textarea.scrollHeight, 150)}px`
    }
  }, [message])

  // Scroll input into view on focus (iOS keyboard fix)
  useEffect(() => {
    const textarea = textareaRef.current
    if (!textarea) return

    const handleFocus = () => {
      setTimeout(() => {
        textarea.scrollIntoView({ behavior: "smooth", block: "center" })
      }, 300)
    }

    textarea.addEventListener("focus", handleFocus)
    return () => textarea.removeEventListener("focus", handleFocus)
  }, [])

  const inputDisabled = disabled || isRecording || isTranscribing
  const sendDisabled = !message.trim() || disabled || isRecording || isTranscribing

  return (
    <div className="p-3 pb-safe sm:p-4 md:p-5 lg:p-6 bg-gradient-to-t from-slate-50 to-transparent">
      <form
        onSubmit={handleSubmit}
        className="relative max-w-3xl mx-auto"
      >
        {/* Input container with playful styling */}
        <div className={cn(
          "relative flex items-end gap-2 bg-white rounded-3xl shadow-lg shadow-slate-200/50 border-2 p-2 transition-all duration-200",
          isRecording
            ? "border-accent/40 shadow-accent/15"
            : "border-slate-100 focus-within:border-accent/30 focus-within:shadow-accent/10"
        )}>
          {/* Mic / Stop button */}
          <button
            type="button"
            onClick={handleMicClick}
            disabled={disabled || isTranscribing}
            className={cn(
              "flex-shrink-0 w-12 h-12 sm:w-11 sm:h-11 rounded-2xl flex items-center justify-center",
              "transition-all duration-200",
              isRecording
                ? "bg-accent/10 text-accent hover:bg-accent/20 animate-pulse"
                : isRequesting
                  ? "bg-slate-50 text-slate-400 animate-pulse"
                  : "bg-slate-50 text-slate-400 hover:bg-slate-100 hover:text-slate-600 hover:scale-105 active:scale-95",
              (disabled || isTranscribing) && "opacity-50 cursor-not-allowed"
            )}
            aria-label={isRecording ? "Stop recording" : "Start voice input"}
          >
            {isRecording ? (
              <Square className="w-4 h-4 fill-current" />
            ) : (
              <Mic className="w-5 h-5" />
            )}
          </button>

          {/* Middle area: waveform when recording, spinner when transcribing, textarea otherwise */}
          {isRecording ? (
            <div className="flex-1 flex items-center gap-3 py-2.5 px-2 min-h-[40px]">
              <WaveformVisualizer
                analyserNode={analyserNode}
                isRecording={isRecording}
                className="flex-1"
              />
              <span className="text-xs text-accent font-medium whitespace-nowrap">Recording...</span>
            </div>
          ) : isTranscribing ? (
            <div className="flex-1 flex items-center gap-2 py-2.5 px-2 min-h-[40px]">
              <Loader2 className="w-4 h-4 text-slate-400 animate-spin" />
              <span className="text-sm text-slate-400">Transcribing...</span>
            </div>
          ) : (
            <textarea
              ref={textareaRef}
              value={message}
              onChange={(e) => setMessage(e.target.value)}
              onKeyDown={handleKeyDown}
              placeholder="Ask N.I.K.K.I. anything..."
              disabled={inputDisabled}
              rows={1}
              className={cn(
                "flex-1 resize-none bg-transparent border-0 outline-none",
                "text-slate-700 placeholder:text-slate-400",
                "text-base sm:text-[15px] leading-relaxed py-2.5 px-2",
                "max-h-[150px] overflow-y-auto",
                "disabled:opacity-50 disabled:cursor-not-allowed"
              )}
            />
          )}

          {/* Send button - hidden during recording */}
          {!isRecording && (
            <button
              type="submit"
              disabled={sendDisabled}
              className={cn(
                "flex-shrink-0 w-12 h-12 sm:w-11 sm:h-11 rounded-2xl flex items-center justify-center",
                "transition-all duration-200",
                !sendDisabled
                  ? "bg-gradient-to-br from-accent to-[#d14d1a] text-white shadow-md shadow-accent/30 hover:shadow-lg hover:shadow-accent/40 hover:scale-105 active:scale-95"
                  : "bg-slate-100 text-slate-300 cursor-not-allowed"
              )}
              aria-label="Send message"
            >
              {isTranscribing ? (
                <Loader2 className="w-5 h-5 animate-spin" />
              ) : (
                <Send className="w-5 h-5" />
              )}
            </button>
          )}
        </div>

        {/* Recorder error message */}
        {recorderError && (
          <p className="text-center text-xs text-red-500 mt-2">{recorderError}</p>
        )}

        {/* Helper text - hidden on small screens where keyboard shortcuts are less relevant */}
        {!isRecording && !isTranscribing && (
          <p className="hidden sm:block text-center text-[11px] text-slate-400 mt-3 tracking-wide">
            Press <kbd className="px-1.5 py-0.5 bg-slate-100 rounded text-slate-500 font-mono text-[10px]">Enter</kbd> to send · <kbd className="px-1.5 py-0.5 bg-slate-100 rounded text-slate-500 font-mono text-[10px]">Shift + Enter</kbd> for new line
          </p>
        )}
      </form>
    </div>
  )
}
