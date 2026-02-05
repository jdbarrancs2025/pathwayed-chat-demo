import { useState, useCallback, useEffect, useRef } from 'react'
import type { Message } from '@/components/chat/ChatMessage'
import type { Subject, AppMode } from '@/lib/types'
import { focusAreaLabels } from '@/lib/practiceQuestions'

interface NikkiChatContext {
  subject: Subject
  focusAreas: string[]
  appMode: AppMode
  gradeBand?: string
  questionCount?: number
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
  currentQuestion: number | null
  totalQuestions: number | null
  isSessionComplete: boolean
  resetSession: () => void
}

function parseProgress(content: string): { current: number | null; total: number | null; complete: boolean } {
  let current: number | null = null
  let total: number | null = null

  // Find all "Question X of Y" patterns — use the last one found
  const matches = [...content.matchAll(/\*\*Question\s+(\d+)\s+of\s+(\d+)\*\*/gi)]
  if (matches.length > 0) {
    const lastMatch = matches[matches.length - 1]
    current = parseInt(lastMatch[1], 10)
    total = parseInt(lastMatch[2], 10)
  }

  const complete = /session\s+complete/i.test(content)

  return { current, total, complete }
}

/**
 * Stream an SSE response from /api/chat into message state.
 * Returns the final assistant content string.
 */
async function streamResponse(
  response: Response,
  assistantId: string,
  setMessages: React.Dispatch<React.SetStateAction<Message[]>>
): Promise<string> {
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

  return assistantContent
}

/**
 * Custom hook for N.I.K.K.I. chat with SSE streaming.
 * Auto-starts a practice session on mount and tracks question progress.
 */
export function useNikkiChat({ context }: UseNikkiChatOptions): UseNikkiChatReturn {
  const [messages, setMessages] = useState<Message[]>([])
  const [isLoading, setIsLoading] = useState(true) // true by default — auto-start fires immediately
  const [error, setError] = useState<string | null>(null)
  const [currentQuestion, setCurrentQuestion] = useState<number | null>(null)
  const [totalQuestions, setTotalQuestions] = useState<number | null>(null)
  const [isSessionComplete, setIsSessionComplete] = useState(false)
  const [resetCounter, setResetCounter] = useState(0)

  // Ref to track if auto-start has fired for this reset cycle
  const autoStartFired = useRef(false)

  const dismissError = useCallback(() => {
    setError(null)
  }, [])

  // Convert focus area slugs to human-readable labels for the API context
  const focusAreaLabelsForApi = context.focusAreas.map(
    (area) => focusAreaLabels[area] || area
  )

  const buildRequestBody = useCallback(
    (messageHistory: { role: string; content: string }[]) => ({
      messages: messageHistory,
      mode: 'student-support' as const,
      context: {
        subject: context.subject,
        focusAreas: focusAreaLabelsForApi,
        appMode: context.appMode,
        gradeBand: context.gradeBand,
        questionCount: context.questionCount,
      },
    }),
    // eslint-disable-next-line react-hooks/exhaustive-deps
    [context.subject, context.appMode, context.gradeBand, context.questionCount, ...context.focusAreas]
  )

  // Auto-start: send synthetic message on mount / reset
  useEffect(() => {
    if (autoStartFired.current) return
    autoStartFired.current = true

    const controller = new AbortController()

    ;(async () => {
      setIsLoading(true)
      setError(null)

      const assistantId = `assistant-auto-${Date.now()}`
      const assistantMessage: Message = {
        id: assistantId,
        role: 'assistant',
        content: '',
      }
      setMessages([assistantMessage])

      try {
        // Send synthetic "Start my practice session" — not shown in visible messages
        const syntheticHistory = [
          { role: 'user', content: 'Start my practice session' },
        ]

        const response = await fetch('/api/chat', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(buildRequestBody(syntheticHistory)),
          signal: controller.signal,
        })

        if (!response.ok) throw new Error('Failed to get response')

        const content = await streamResponse(response, assistantId, setMessages)

        // Parse progress from completed response
        const progress = parseProgress(content)
        if (progress.current !== null) setCurrentQuestion(progress.current)
        if (progress.total !== null) setTotalQuestions(progress.total)
        if (progress.complete) setIsSessionComplete(true)
      } catch (err) {
        if ((err as Error).name === 'AbortError') return
        setError(
          err instanceof Error
            ? err.message
            : 'Something went wrong. Please try again.'
        )
        setMessages([])
      } finally {
        setIsLoading(false)
      }
    })()

    return () => controller.abort()
  }, [resetCounter, buildRequestBody])

  const sendMessage = useCallback(
    async (content: string) => {
      if (!content.trim() || isLoading) return

      const userMessage: Message = {
        id: `user-${Date.now()}`,
        role: 'user',
        content: content.trim(),
      }

      setMessages((prev) => [...prev, userMessage])
      setIsLoading(true)
      setError(null)

      const assistantId = `assistant-${Date.now()}`
      const assistantMessage: Message = {
        id: assistantId,
        role: 'assistant',
        content: '',
      }
      setMessages((prev) => [...prev, assistantMessage])

      try {
        // Build message history — include the synthetic start message for context
        const currentMessages = [...messages, userMessage]
        const messageHistory = [
          { role: 'user', content: 'Start my practice session' },
          ...currentMessages.map((m) => ({
            role: m.role,
            content: m.content,
          })),
        ]

        const response = await fetch('/api/chat', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(buildRequestBody(messageHistory)),
        })

        if (!response.ok) throw new Error('Failed to get response')

        const assistantContent = await streamResponse(response, assistantId, setMessages)

        // Parse progress from completed response
        const progress = parseProgress(assistantContent)
        if (progress.current !== null) setCurrentQuestion(progress.current)
        if (progress.total !== null) setTotalQuestions(progress.total)
        if (progress.complete) setIsSessionComplete(true)
      } catch (err) {
        setError(
          err instanceof Error
            ? err.message
            : 'Something went wrong. Please try again.'
        )
        setMessages((prev) => prev.filter((m) => m.id !== assistantId))
      } finally {
        setIsLoading(false)
      }
    },
    [messages, isLoading, buildRequestBody]
  )

  const resetSession = useCallback(() => {
    setMessages([])
    setCurrentQuestion(null)
    setTotalQuestions(null)
    setIsSessionComplete(false)
    setError(null)
    setIsLoading(true)
    autoStartFired.current = false
    setResetCounter((c) => c + 1)
  }, [])

  return {
    messages,
    isLoading,
    error,
    sendMessage,
    dismissError,
    currentQuestion,
    totalQuestions,
    isSessionComplete,
    resetSession,
  }
}
