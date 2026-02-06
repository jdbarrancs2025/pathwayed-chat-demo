import { cn } from "@/lib/utils"
import { Streamdown } from "streamdown"
import { createMathPlugin } from "@streamdown/math"
import { Volume2 } from "lucide-react"

const mathPlugin = createMathPlugin({
  singleDollarTextMath: true,
})

/**
 * Normalize LaTeX math delimiters for Streamdown compatibility.
 * Converts \(...\) to $...$ (inline) and \[...\] to $$...$$ (block).
 * See: https://github.com/vercel/streamdown/issues/194
 */
function normalizeMathDelimiters(content: string): string {
  return content
    // Convert \[...\] to $$...$$ (block math) - must do first to avoid conflicts
    .replace(/\\\[([\s\S]*?)\\\]/g, '$$$$$1$$$$')
    // Convert \(...\) to $...$ (inline math)
    .replace(/\\\(([\s\S]*?)\\\)/g, '$$$1$$')
}

export interface Message {
  id: string
  role: "user" | "assistant"
  content: string
}

interface ChatMessageProps {
  message: Message
  isLatest?: boolean
  onReplay?: () => void
}

export function ChatMessage({ message, isLatest, onReplay }: ChatMessageProps) {
  const isUser = message.role === "user"

  return (
    <div
      className={cn(
        "flex w-full mb-4 animate-in fade-in slide-in-from-bottom-2 duration-300",
        isUser ? "justify-end" : "justify-start",
        isLatest && "animate-in zoom-in-95"
      )}
      style={{
        animationDelay: isLatest ? "0ms" : "0ms",
      }}
    >
      <div
        className={cn(
          "max-w-[90%] sm:max-w-[85%] md:max-w-[75%] lg:max-w-[70%] xl:max-w-[65%] relative group",
          isUser ? "order-1" : "order-1"
        )}
      >
        {/* Message bubble */}
        <div
          className={cn(
            "px-5 py-3 rounded-3xl relative transition-all duration-200",
            !isUser && onReplay && "pr-20",
            isUser
              ? "bg-gradient-to-br from-accent to-[#d14d1a] text-white rounded-br-lg shadow-lg shadow-accent/20"
              : "bg-white border-2 border-slate-100 text-slate-700 rounded-bl-lg shadow-md shadow-slate-200/50"
          )}
        >
          {/* Subtle inner glow for user messages */}
          {isUser && (
            <div className="absolute inset-0 rounded-3xl rounded-br-lg bg-gradient-to-t from-transparent to-white/10 pointer-events-none" />
          )}

          {/* Message content */}
          {isUser ? (
            <p className="text-[15px] leading-relaxed relative z-10 whitespace-pre-wrap font-medium">
              {message.content}
            </p>
          ) : (
            <div className="text-[15px] leading-relaxed relative z-10 prose prose-slate prose-sm max-w-none [&>*:first-child]:mt-0 [&>*:last-child]:mb-0">
              <Streamdown plugins={{ math: mathPlugin }}>
                {normalizeMathDelimiters(message.content)}
              </Streamdown>
            </div>
          )}

          {!isUser && onReplay && message.content.trim() && (
            <button
              type="button"
              onClick={onReplay}
              className="absolute top-2.5 right-2.5 h-7 px-2 rounded-lg border border-slate-200 bg-white/95 text-slate-500 hover:text-primary hover:border-primary/30 hover:bg-white transition-colors inline-flex items-center gap-1.5 z-20"
              aria-label="Repeat explanation"
            >
              <Volume2 className="h-3.5 w-3.5" />
              <span className="text-[11px] font-medium">Repeat</span>
            </button>
          )}
        </div>

        {/* Decorative tail for bubbles */}
        <div
          className={cn(
            "absolute bottom-0 w-4 h-4",
            isUser
              ? "right-0 translate-x-1/2 -translate-y-1"
              : "left-0 -translate-x-1/2 -translate-y-1"
          )}
        >
          <div
            className={cn(
              "w-full h-full rounded-full transform rotate-45",
              isUser
                ? "bg-[#d14d1a] opacity-0" // Hidden for cleaner look
                : "bg-white border-2 border-slate-100 opacity-0"
            )}
          />
        </div>

        {/* Role label (subtle) */}
        <span
          className={cn(
            "text-[10px] uppercase tracking-wider mt-1.5 block opacity-0 group-hover:opacity-60 transition-opacity",
            isUser ? "text-right text-slate-400" : "text-left text-slate-400"
          )}
        >
          {isUser ? "You" : "N.I.K.K.I."}
        </span>
      </div>
    </div>
  )
}
