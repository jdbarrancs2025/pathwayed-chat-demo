import { useState, useCallback, useRef, useEffect } from "react"
import { AppLayout } from "@/components/AppLayout"
import { ChatContainer, type Message } from "@/components/chat"
import { getOpeningMessage, type Mode } from "@/lib/prompts"

function App() {
  const [messages, setMessages] = useState<Message[]>([])
  const [isLoading, setIsLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [mode, setMode] = useState<Mode>("student-support")
  const [autoplayVoice, setAutoplayVoice] = useState(false)
  const abortControllerRef = useRef<AbortController | null>(null)

  // Initialize with opening message on mount
  useEffect(() => {
    const openingMessage: Message = {
      id: `assistant-${Date.now()}`,
      role: "assistant",
      content: getOpeningMessage(mode),
    }
    setMessages([openingMessage])
  }, []) // eslint-disable-line react-hooks/exhaustive-deps

  const handleModeChange = useCallback((newMode: Mode) => {
    // Cancel any in-flight request
    if (abortControllerRef.current) {
      abortControllerRef.current.abort()
      abortControllerRef.current = null
    }

    setMode(newMode)
    setIsLoading(false)
    setError(null)

    // Reset chat with new mode's opening message
    const openingMessage: Message = {
      id: `assistant-${Date.now()}`,
      role: "assistant",
      content: getOpeningMessage(newMode),
    }
    setMessages([openingMessage])
  }, [])

  const handleNewChat = useCallback(() => {
    // Cancel any in-flight request
    if (abortControllerRef.current) {
      abortControllerRef.current.abort()
      abortControllerRef.current = null
    }

    setIsLoading(false)
    setError(null)

    // Reset chat with current mode's opening message
    const openingMessage: Message = {
      id: `assistant-${Date.now()}`,
      role: "assistant",
      content: getOpeningMessage(mode),
    }
    setMessages([openingMessage])
  }, [mode])

  const handleSendMessage = useCallback(async (content: string) => {
    // Clear any previous error
    setError(null)

    // Add user message
    const userMessage: Message = {
      id: `user-${Date.now()}`,
      role: "user",
      content,
    }
    setMessages((prev) => [...prev, userMessage])
    setIsLoading(true)

    // Create assistant message placeholder
    const assistantId = `assistant-${Date.now()}`
    const assistantMessage: Message = {
      id: assistantId,
      role: "assistant",
      content: "",
    }
    setMessages((prev) => [...prev, assistantMessage])

    // Create abort controller for this request
    abortControllerRef.current = new AbortController()

    try {
      // Prepare messages for API (exclude opening message, only include conversation)
      const conversationMessages = messages
        .filter((m) => m.role === "user" || (m.role === "assistant" && m.content !== getOpeningMessage(mode)))
        .map((m) => ({ role: m.role, content: m.content }))

      // Add the new user message
      conversationMessages.push({ role: "user", content })

      const response = await fetch("/api/chat", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          messages: conversationMessages,
          mode,
        }),
        signal: abortControllerRef.current.signal,
      })

      if (!response.ok) {
        throw new Error(`API error: ${response.status}`)
      }

      const reader = response.body?.getReader()
      if (!reader) {
        throw new Error("Failed to read response stream")
      }

      const decoder = new TextDecoder()
      let buffer = ""

      while (true) {
        const { done, value } = await reader.read()
        if (done) break

        buffer += decoder.decode(value, { stream: true })
        const lines = buffer.split("\n")
        buffer = lines.pop() || ""

        for (const line of lines) {
          const trimmed = line.trim()
          if (!trimmed || !trimmed.startsWith("data: ")) continue

          const data = trimmed.slice(6)
          if (data === "[DONE]") continue

          try {
            const parsed = JSON.parse(data)
            const chunk = parsed.content
            if (chunk) {
              setMessages((prev) =>
                prev.map((m) =>
                  m.id === assistantId
                    ? { ...m, content: m.content + chunk }
                    : m
                )
              )
            }
          } catch {
            // Skip malformed JSON
          }
        }
      }
    } catch (err) {
      if (err instanceof Error && err.name === "AbortError") {
        // Request was cancelled, remove the empty assistant message
        setMessages((prev) => prev.filter((m) => m.id !== assistantId))
        return
      }

      console.error("Chat error:", err)
      setError("Something went wrong. Please try again.")

      // Remove the empty assistant message on error
      setMessages((prev) => prev.filter((m) => m.id !== assistantId))
    } finally {
      setIsLoading(false)
      abortControllerRef.current = null
    }
  }, [messages, mode])

  const handleDismissError = useCallback(() => {
    setError(null)
  }, [])

  return (
    <AppLayout
      mode={mode}
      onModeChange={handleModeChange}
      autoplayVoice={autoplayVoice}
      onAutoplayVoiceChange={setAutoplayVoice}
      onNewChat={handleNewChat}
    >
      <ChatContainer
        messages={messages}
        onSendMessage={handleSendMessage}
        isLoading={isLoading}
        error={error}
        onDismissError={handleDismissError}
      />
    </AppLayout>
  )
}

export default App
