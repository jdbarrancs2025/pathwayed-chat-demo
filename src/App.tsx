import { useState, useCallback } from "react"
import { AppLayout } from "@/components/AppLayout"
import { ChatContainer, type Message } from "@/components/chat"

function App() {
  const [messages, setMessages] = useState<Message[]>([])
  const [isLoading, setIsLoading] = useState(false)

  const handleSendMessage = useCallback((content: string) => {
    // Add user message
    const userMessage: Message = {
      id: `user-${Date.now()}`,
      role: "user",
      content,
    }
    setMessages((prev) => [...prev, userMessage])

    // Simulate AI response (will be replaced with actual OpenAI integration in Phase 4)
    setIsLoading(true)
    setTimeout(() => {
      const aiMessage: Message = {
        id: `assistant-${Date.now()}`,
        role: "assistant",
        content: `Thanks for your message! This is a placeholder response. In the next phase, I'll be connected to OpenAI to provide helpful answers about "${content.slice(0, 50)}${content.length > 50 ? "..." : ""}"`,
      }
      setMessages((prev) => [...prev, aiMessage])
      setIsLoading(false)
    }, 1500)
  }, [])

  return (
    <AppLayout>
      <ChatContainer
        messages={messages}
        onSendMessage={handleSendMessage}
        isLoading={isLoading}
      />
    </AppLayout>
  )
}

export default App
