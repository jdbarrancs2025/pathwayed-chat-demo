import { useRef, useEffect } from "react"
import { X, AlertCircle } from "lucide-react"
import { ChatMessage, type Message } from "./ChatMessage"
import { ChatInput } from "./ChatInput"
import { WelcomeMessage } from "./WelcomeMessage"

interface ChatContainerProps {
  messages: Message[]
  onSendMessage: (message: string) => void
  isLoading?: boolean
  error?: string | null
  onDismissError?: () => void
}

export function ChatContainer({
  messages,
  onSendMessage,
  isLoading,
  error,
  onDismissError,
}: ChatContainerProps) {
  const messagesEndRef = useRef<HTMLDivElement>(null)
  const messagesContainerRef = useRef<HTMLDivElement>(null)

  // Auto-scroll to bottom when new messages arrive
  useEffect(() => {
    if (messagesEndRef.current) {
      messagesEndRef.current.scrollIntoView({ behavior: "smooth" })
    }
  }, [messages])

  const isEmpty = messages.length === 0

  return (
    <div className="flex flex-col h-full bg-gradient-to-b from-slate-50/50 to-white">
      {/* Error Banner */}
      {error && (
        <div className="flex-shrink-0 px-4 pt-4">
          <div className="max-w-3xl mx-auto">
            <div className="flex items-center gap-3 px-4 py-3 bg-red-50 border border-red-200 rounded-2xl text-red-700 animate-in fade-in slide-in-from-top-2 duration-300">
              <AlertCircle className="h-5 w-5 flex-shrink-0" />
              <span className="flex-1 text-sm font-medium">{error}</span>
              {onDismissError && (
                <button
                  onClick={onDismissError}
                  className="p-1 hover:bg-red-100 rounded-full transition-colors"
                  aria-label="Dismiss error"
                >
                  <X className="h-4 w-4" />
                </button>
              )}
            </div>
          </div>
        </div>
      )}

      {/* Messages area */}
      <div
        ref={messagesContainerRef}
        className="flex-1 overflow-y-auto"
      >
        {isEmpty ? (
          <WelcomeMessage onSuggestionClick={onSendMessage} />
        ) : (
          <div className="max-w-3xl mx-auto px-4 py-6 md:px-6 md:py-8">
            {/* Subtle pattern background for conversation area */}
            <div className="relative">
              {messages.map((message, index) => (
                <ChatMessage
                  key={message.id}
                  message={message}
                  isLatest={index === messages.length - 1}
                />
              ))}

              {/* Typing indicator when loading */}
              {isLoading && (
                <div className="flex justify-start mb-4 animate-in fade-in slide-in-from-bottom-2 duration-300">
                  <div className="max-w-[85%] md:max-w-[70%]">
                    <div className="px-5 py-4 rounded-3xl rounded-bl-lg bg-white border-2 border-slate-100 shadow-md shadow-slate-200/50">
                      <div className="flex items-center gap-1.5">
                        <div className="w-2 h-2 bg-primary/40 rounded-full animate-bounce" style={{ animationDelay: "0ms" }} />
                        <div className="w-2 h-2 bg-primary/40 rounded-full animate-bounce" style={{ animationDelay: "150ms" }} />
                        <div className="w-2 h-2 bg-primary/40 rounded-full animate-bounce" style={{ animationDelay: "300ms" }} />
                      </div>
                    </div>
                  </div>
                </div>
              )}

              {/* Scroll anchor */}
              <div ref={messagesEndRef} />
            </div>
          </div>
        )}
      </div>

      {/* Input area - fixed at bottom */}
      <div className="flex-shrink-0 border-t border-slate-100">
        <ChatInput onSendMessage={onSendMessage} disabled={isLoading} />
      </div>
    </div>
  )
}

export type { Message }
