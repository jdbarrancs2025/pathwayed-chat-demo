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

  return (
    <div className="p-4 pb-safe md:p-6 bg-gradient-to-t from-slate-50 to-transparent">
      <form
        onSubmit={handleSubmit}
        className="relative max-w-3xl mx-auto"
      >
        {/* Input container with playful styling */}
        <div className="relative flex items-end gap-2 bg-white rounded-3xl shadow-lg shadow-slate-200/50 border-2 border-slate-100 p-2 transition-all duration-200 focus-within:border-accent/30 focus-within:shadow-accent/10">
          {/* Mic button (placeholder) */}
          <button
            type="button"
            className={cn(
              "flex-shrink-0 w-11 h-11 rounded-2xl flex items-center justify-center",
              "bg-slate-50 text-slate-400 hover:bg-slate-100 hover:text-slate-600",
              "transition-all duration-200 hover:scale-105 active:scale-95"
            )}
            aria-label="Voice input (coming soon)"
            title="Voice input coming soon"
          >
            <Mic className="w-5 h-5" />
          </button>

          {/* Text input */}
          <textarea
            ref={textareaRef}
            value={message}
            onChange={(e) => setMessage(e.target.value)}
            onKeyDown={handleKeyDown}
            placeholder="Ask PathwayEd anything..."
            disabled={disabled}
            rows={1}
            className={cn(
              "flex-1 resize-none bg-transparent border-0 outline-none",
              "text-slate-700 placeholder:text-slate-400",
              "text-[15px] leading-relaxed py-2.5 px-2",
              "max-h-[150px] overflow-y-auto",
              "disabled:opacity-50 disabled:cursor-not-allowed"
            )}
          />

          {/* Send button */}
          <button
            type="submit"
            disabled={!message.trim() || disabled}
            className={cn(
              "flex-shrink-0 w-11 h-11 rounded-2xl flex items-center justify-center",
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

        {/* Helper text */}
        <p className="text-center text-[11px] text-slate-400 mt-3 tracking-wide">
          Press <kbd className="px-1.5 py-0.5 bg-slate-100 rounded text-slate-500 font-mono text-[10px]">Enter</kbd> to send · <kbd className="px-1.5 py-0.5 bg-slate-100 rounded text-slate-500 font-mono text-[10px]">Shift + Enter</kbd> for new line
        </p>
      </form>
    </div>
  )
}
