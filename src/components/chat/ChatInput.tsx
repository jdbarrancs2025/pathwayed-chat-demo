import { useState, useRef, useEffect, useCallback } from "react"
import { Send, Mic, Square, Loader2, Calculator } from "lucide-react"
import { cn } from "@/lib/utils"
import { useAudioRecorder } from "@/hooks/useAudioRecorder"
import { transcribeAudio, NO_SPEECH_MESSAGE } from "@/lib/transcribe"
import { buildTranscriptionPrompt } from "@/lib/transcriptionPrompt"
import { WaveformVisualizer } from "./WaveformVisualizer"
import { MathKeyboard } from "./MathKeyboard"
import type { Subject } from "@/lib/types"

function normalizeForSubmission(text: string): string {
  return text
    .replace(/×/g, "*")
    .replace(/÷/g, "/")
}

interface ChatInputProps {
  subject?: Subject
  onSendMessage: (message: string) => void
  disabled?: boolean
}

export function ChatInput({ subject, onSendMessage, disabled }: ChatInputProps) {
  const [message, setMessage] = useState("")
  const [isTranscribing, setIsTranscribing] = useState(false)
  const [micError, setMicError] = useState("")
  const [mathKeyboardOpen, setMathKeyboardOpen] = useState(false)
  const textareaRef = useRef<HTMLTextAreaElement>(null)

  const {
    state: recorderState,
    analyserNode,
    startRecording,
    stopRecording,
    audioBlob,
    mimeType,
    secondsLeft,
    error: recorderError,
  } = useAudioRecorder()

  const isRecording = recorderState === "recording"
  const isRequesting = recorderState === "requesting"

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    if (message.trim() && !disabled && !isRecording && !isTranscribing) {
      onSendMessage(normalizeForSubmission(message).trim())
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
      setMicError("")
      await startRecording()
    }
  }, [isRecording, startRecording, stopRecording])

  // Transcribe audio when blob is available. Uses the shared transcribeAudio
  // helper so this input inherits the upgraded model and the context-biasing
  // prompt, built here from its own subject. The transcript lands in the textarea
  // for the user to edit before sending (behavior unchanged).
  useEffect(() => {
    if (!audioBlob || !mimeType) return

    const blob = audioBlob
    const mime = mimeType
    let cancelled = false

    async function transcribe() {
      setIsTranscribing(true)
      setMicError("")
      try {
        const { text, noSpeech } = await transcribeAudio(
          blob,
          mime,
          buildTranscriptionPrompt({ subject }),
        )
        if (cancelled) return
        // Silence, noise, or a hallucinated transcript: leave the box untouched
        // and prompt a retry rather than dropping garbage in for the kid to send.
        if (noSpeech || !text) {
          setMicError(NO_SPEECH_MESSAGE)
          return
        }
        setMessage(text)
        // Focus textarea so user can edit before sending
        setTimeout(() => textareaRef.current?.focus(), 50)
      } catch {
        // Silently fail — user can still type manually
        console.error("Transcription error")
      } finally {
        if (!cancelled) setIsTranscribing(false)
      }
    }

    transcribe()
    return () => {
      cancelled = true
    }
  }, [audioBlob, mimeType, subject])

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
  const isMathSubject = subject === "math" && !isRecording && !isTranscribing

  const focusInput = useCallback(() => {
    const textarea = textareaRef.current
    if (!textarea) return

    textarea.focus()
  }, [])

  const insertAtCursor = useCallback((text: string) => {
    const textarea = textareaRef.current
    if (!textarea) {
      setMessage((prev) => `${prev}${text}`)
      return
    }

    const selectionStart = textarea.selectionStart ?? message.length
    const selectionEnd = textarea.selectionEnd ?? message.length
    const next = `${message.slice(0, selectionStart)}${text}${message.slice(selectionEnd)}`
    setMessage(next)

    requestAnimationFrame(() => {
      const cursor = selectionStart + text.length
      textarea.focus()
      textarea.setSelectionRange(cursor, cursor)
    })
  }, [message])

  const handleInsertMath = useCallback((text: string) => {
    if (inputDisabled) return

    if (text === "()") {
      const textarea = textareaRef.current
      if (!textarea) {
        setMessage((prev) => `${prev}()`)
        return
      }

      const selectionStart = textarea.selectionStart ?? message.length
      const selectionEnd = textarea.selectionEnd ?? message.length
      const selected = message.slice(selectionStart, selectionEnd)
      const wrapped = `(${selected})`
      const next = `${message.slice(0, selectionStart)}${wrapped}${message.slice(selectionEnd)}`
      setMessage(next)

      requestAnimationFrame(() => {
        const cursor = selectionStart + wrapped.length
        textarea.focus()
        textarea.setSelectionRange(cursor, cursor)
      })
      return
    }

    insertAtCursor(text)
  }, [inputDisabled, insertAtCursor, message])

  const handleBackspaceMath = useCallback(() => {
    if (inputDisabled || !message) return

    const textarea = textareaRef.current
    if (!textarea) {
      setMessage((prev) => prev.slice(0, -1))
      return
    }

    const selectionStart = textarea.selectionStart ?? message.length
    const selectionEnd = textarea.selectionEnd ?? message.length

    if (selectionStart !== selectionEnd) {
      const next = `${message.slice(0, selectionStart)}${message.slice(selectionEnd)}`
      setMessage(next)
      requestAnimationFrame(() => {
        textarea.focus()
        textarea.setSelectionRange(selectionStart, selectionStart)
      })
      return
    }

    if (selectionStart === 0) return

    const next = `${message.slice(0, selectionStart - 1)}${message.slice(selectionStart)}`
    const cursor = selectionStart - 1
    setMessage(next)

    requestAnimationFrame(() => {
      textarea.focus()
      textarea.setSelectionRange(cursor, cursor)
    })
  }, [inputDisabled, message])

  const handleClearMath = useCallback(() => {
    if (inputDisabled) return
    setMessage("")
    requestAnimationFrame(focusInput)
  }, [focusInput, inputDisabled])

  return (
    <div className="p-3 pb-safe sm:p-4 md:p-5 lg:p-6 bg-gradient-to-t from-slate-50 to-transparent">
      {isMathSubject && (
        <div
          className={cn(
            "grid transition-[grid-template-rows] duration-300 ease-in-out",
            mathKeyboardOpen ? "grid-rows-[1fr]" : "grid-rows-[0fr]"
          )}
        >
          <div className="overflow-hidden">
            <MathKeyboard
              onInsert={handleInsertMath}
              onBackspace={handleBackspaceMath}
              onClear={handleClearMath}
              disabled={inputDisabled}
            />
          </div>
        </div>
      )}
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

          {/* Math keyboard toggle, only for math sessions */}
          {isMathSubject && (
            <button
              type="button"
              onClick={() => setMathKeyboardOpen((prev) => !prev)}
              className={cn(
                "flex-shrink-0 w-12 h-12 sm:w-11 sm:h-11 rounded-2xl flex items-center justify-center",
                "transition-all duration-200",
                mathKeyboardOpen
                  ? "bg-primary/10 text-primary hover:bg-primary/15"
                  : "bg-slate-50 text-slate-400 hover:bg-slate-100 hover:text-slate-600 hover:scale-105 active:scale-95"
              )}
              aria-label={mathKeyboardOpen ? "Hide math keyboard" : "Show math keyboard"}
            >
              <Calculator className="w-5 h-5" />
            </button>
          )}

          {/* Middle area: waveform when recording, spinner when transcribing, textarea otherwise */}
          {isRecording ? (
            <div className="flex-1 flex items-center gap-3 py-2.5 px-2 min-h-[40px]">
              <WaveformVisualizer
                analyserNode={analyserNode}
                isRecording={isRecording}
                className="flex-1"
              />
              <span className="text-xs text-accent font-medium whitespace-nowrap">
                {secondsLeft === null ? "Recording..." : `${secondsLeft}s left`}
              </span>
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

        {/* Recorder / no-speech retry message */}
        {(recorderError || micError) && (
          <p className="text-center text-xs text-red-500 mt-2">{recorderError || micError}</p>
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
