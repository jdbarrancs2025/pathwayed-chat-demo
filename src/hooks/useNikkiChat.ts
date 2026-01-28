import { useState, useCallback } from 'react'
import type { Message } from '@/components/chat/ChatMessage'
import type { Subject, AppMode } from '@/lib/types'

interface NikkiChatContext {
  subject: Subject
  focusAreas: string[]
  appMode: AppMode
}

interface UseNikkiChatOptions {
  context: NikkiChatContext
}

interface UseNikkiChatReturn {
  messages: Message[]
  isLoading: boolean
  error: string | null
  sendMessage: (content: string) => Promise<void>
  dismissError: () => void
}

/**
 * Custom hook for N.I.K.K.I. chat with SSE streaming
 * Passes subject/focus context to the API for contextual responses
 */
export function useNikkiChat({ context }: UseNikkiChatOptions): UseNikkiChatReturn {
  const [messages, setMessages] = useState<Message[]>([])
  const [isLoading, setIsLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const dismissError = useCallback(() => {
    setError(null)
  }, [])

  const sendMessage = useCallback(
    async (content: string) => {
      if (!content.trim() || isLoading) return

      // Add user message
      const userMessage: Message = {
        id: `user-${Date.now()}`,
        role: 'user',
        content: content.trim(),
      }

      setMessages((prev) => [...prev, userMessage])
      setIsLoading(true)
      setError(null)

      // Create placeholder for assistant response
      const assistantId = `assistant-${Date.now()}`
      const assistantMessage: Message = {
        id: assistantId,
        role: 'assistant',
        content: '',
      }
      setMessages((prev) => [...prev, assistantMessage])

      try {
        // Build message history for API
        const messageHistory = [...messages, userMessage].map((m) => ({
          role: m.role,
          content: m.content,
        }))

        const response = await fetch('/api/chat', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            messages: messageHistory,
            mode: 'student-support',
            context: {
              subject: context.subject,
              focusAreas: context.focusAreas,
              appMode: context.appMode,
            },
          }),
        })

        if (!response.ok) {
          throw new Error('Failed to get response')
        }

        // Handle SSE stream
        const reader = response.body?.getReader()
        if (!reader) {
          throw new Error('No response body')
        }

        const decoder = new TextDecoder()
        let assistantContent = ''

        while (true) {
          const { done, value } = await reader.read()
          if (done) break

          const chunk = decoder.decode(value, { stream: true })
          const lines = chunk.split('\n')

          for (const line of lines) {
            if (line.startsWith('data: ')) {
              const data = line.slice(6)
              if (data === '[DONE]') continue

              try {
                const parsed = JSON.parse(data)
                if (parsed.content) {
                  assistantContent += parsed.content
                  // Update assistant message with streaming content
                  setMessages((prev) =>
                    prev.map((m) =>
                      m.id === assistantId
                        ? { ...m, content: assistantContent }
                        : m
                    )
                  )
                }
                if (parsed.error) {
                  throw new Error(parsed.error)
                }
              } catch {
                // Ignore parse errors for incomplete JSON
              }
            }
          }
        }
      } catch (err) {
        setError(
          err instanceof Error
            ? err.message
            : 'Something went wrong. Please try again.'
        )
        // Remove empty assistant message on error
        setMessages((prev) => prev.filter((m) => m.id !== assistantId))
      } finally {
        setIsLoading(false)
      }
    },
    [messages, isLoading, context]
  )

  return {
    messages,
    isLoading,
    error,
    sendMessage,
    dismissError,
  }
}
