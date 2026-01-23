import { cn } from "@/lib/utils"

export interface Message {
  id: string
  role: "user" | "assistant"
  content: string
}

interface ChatMessageProps {
  message: Message
  isLatest?: boolean
}

export function ChatMessage({ message, isLatest }: ChatMessageProps) {
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
          "max-w-[85%] md:max-w-[70%] relative group",
          isUser ? "order-1" : "order-1"
        )}
      >
        {/* Message bubble */}
        <div
          className={cn(
            "px-5 py-3 rounded-3xl relative transition-all duration-200",
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
          <p className={cn(
            "text-[15px] leading-relaxed relative z-10 whitespace-pre-wrap",
            isUser ? "font-medium" : "font-normal"
          )}>
            {message.content}
          </p>
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
          {isUser ? "You" : "PathwayEd"}
        </span>
      </div>
    </div>
  )
}
