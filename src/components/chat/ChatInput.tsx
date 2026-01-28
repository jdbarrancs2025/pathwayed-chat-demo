import { useState, useRef, useEffect } from "react"
import { Send, Mic } from "lucide-react"
import { cn } from "@/lib/utils"

interface ChatInputProps {
  onSendMessage: (message: string) => void
  disabled?: boolean
}

export function ChatInput({ onSendMessage, disabled }: ChatInputProps) {
  const [message, setMessage] = useState("")
  const textareaRef = useRef<HTMLTextAreaElement>(null)

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    if (message.trim() && !disabled) {
      onSendMessage(message.trim())
      setMessage("")
      // Reset textarea height
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
      // Delay allows keyboard to fully appear before scrolling
      setTimeout(() => {
        textarea.scrollIntoView({ behavior: "smooth", block: "center" })
      }, 300)
    }

    textarea.addEventListener("focus", handleFocus)
    return () => textarea.removeEventListener("focus", handleFocus)
  }, [])

  return (
    <div className="p-3 pb-safe sm:p-4 md:p-5 lg:p-6 bg-gradient-to-t from-slate-50 to-transparent">
      <form
        onSubmit={handleSubmit}
        className="relative max-w-3xl mx-auto"
      >
        {/* Input container with playful styling */}
        <div className="relative flex items-end gap-2 bg-white rounded-3xl shadow-lg shadow-slate-200/50 border-2 border-slate-100 p-2 transition-all duration-200 focus-within:border-accent/30 focus-within:shadow-accent/10">
          {/* Mic button (placeholder) - 48px on mobile for touch, 44px on larger screens */}
          <button
            type="button"
            className={cn(
              "flex-shrink-0 w-12 h-12 sm:w-11 sm:h-11 rounded-2xl flex items-center justify-center",
              "bg-slate-50 text-slate-400 hover:bg-slate-100 hover:text-slate-600",
              "transition-all duration-200 hover:scale-105 active:scale-95"
            )}
            aria-label="Voice input (coming soon)"
            title="Voice input coming soon"
          >
            <Mic className="w-5 h-5" />
          </button>

          {/* Text input - 16px on mobile to prevent iOS zoom, 15px on larger screens */}
          <textarea
            ref={textareaRef}
            value={message}
            onChange={(e) => setMessage(e.target.value)}
            onKeyDown={handleKeyDown}
            placeholder="Ask N.I.K.K.I. anything..."
            disabled={disabled}
            rows={1}
            className={cn(
              "flex-1 resize-none bg-transparent border-0 outline-none",
              "text-slate-700 placeholder:text-slate-400",
              "text-base sm:text-[15px] leading-relaxed py-2.5 px-2",
              "max-h-[150px] overflow-y-auto",
              "disabled:opacity-50 disabled:cursor-not-allowed"
            )}
          />

          {/* Send button - 48px on mobile for touch, 44px on larger screens */}
          <button
            type="submit"
            disabled={!message.trim() || disabled}
            className={cn(
              "flex-shrink-0 w-12 h-12 sm:w-11 sm:h-11 rounded-2xl flex items-center justify-center",
              "transition-all duration-200",
              message.trim() && !disabled
                ? "bg-gradient-to-br from-accent to-[#d14d1a] text-white shadow-md shadow-accent/30 hover:shadow-lg hover:shadow-accent/40 hover:scale-105 active:scale-95"
                : "bg-slate-100 text-slate-300 cursor-not-allowed"
            )}
            aria-label="Send message"
          >
            <Send className="w-5 h-5" />
          </button>
        </div>

        {/* Helper text - hidden on small screens where keyboard shortcuts are less relevant */}
        <p className="hidden sm:block text-center text-[11px] text-slate-400 mt-3 tracking-wide">
          Press <kbd className="px-1.5 py-0.5 bg-slate-100 rounded text-slate-500 font-mono text-[10px]">Enter</kbd> to send · <kbd className="px-1.5 py-0.5 bg-slate-100 rounded text-slate-500 font-mono text-[10px]">Shift + Enter</kbd> for new line
        </p>
      </form>
    </div>
  )
}
