import { ChatContainer } from '@/components/chat/ChatContainer'
import { useNikkiChat } from '@/hooks/useNikkiChat'
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

  return (
    <div className="bg-white rounded-2xl border-2 border-slate-100 shadow-sm overflow-hidden">
      {/* Header */}
      <div className="px-4 py-3 bg-gradient-to-r from-primary/5 to-accent/5 border-b border-slate-100">
        <h2 className="font-semibold text-primary">
          Homework Help — Ask N.I.K.K.I.
        </h2>
        <p className="text-sm text-muted-foreground mt-0.5">
          Get step-by-step help with your practice questions
        </p>
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
