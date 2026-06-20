import { useCallback, useRef, useState } from 'react'
import { loadTranscript, saveTranscript, type StoredMessage } from '@/lib/sessionStore'

export interface ChatMessage extends StoredMessage {
  id: string
}

interface UseSessionChatOptions {
  studentId: string
  subject: string
  childName: string
  grade: string
  level: string
  greeting: string
}

/** Stream an SSE response from /api/chat into the assistant message, returning the final text. */
async function streamInto(
  response: Response,
  assistantId: string,
  setMessages: React.Dispatch<React.SetStateAction<ChatMessage[]>>,
): Promise<string> {
  const reader = response.body?.getReader()
  if (!reader) throw new Error('No response body')
  const decoder = new TextDecoder()
  let content = ''
  let buffer = ''

  const apply = (rawEvent: string) => {
    const dataLines = rawEvent
      .split('\n')
      .filter((l) => l.startsWith('data:'))
      .map((l) => l.slice(5).trimStart())
    if (!dataLines.length) return
    const data = dataLines.join('\n')
    if (data === '[DONE]') return
    try {
      const parsed = JSON.parse(data)
      if (parsed.content) {
        content += parsed.content
        setMessages((prev) => prev.map((m) => (m.id === assistantId ? { ...m, content } : m)))
      }
      if (parsed.error) throw new Error(parsed.error)
    } catch {
      // Ignore malformed SSE events.
    }
  }

  while (true) {
    const { done, value } = await reader.read()
    if (done) break
    buffer += decoder.decode(value, { stream: true }).replace(/\r\n/g, '\n')
    let i = buffer.indexOf('\n\n')
    while (i !== -1) {
      apply(buffer.slice(0, i))
      buffer = buffer.slice(i + 2)
      i = buffer.indexOf('\n\n')
    }
  }
  apply(buffer)
  return content
}

/**
 * Conversational tutor chat for the session, over the phase-1 Anthropic engine
 * (/api/chat, claude-sonnet-4-6) using the child- and subject-aware kid-tutor
 * prompt. Opens with Nikki's greeting and persists the transcript locally.
 */
export function useSessionChat(opts: UseSessionChatOptions) {
  const { studentId, subject } = opts
  const [messages, setMessages] = useState<ChatMessage[]>(() => {
    const saved = loadTranscript(studentId, subject)
    if (saved.length) return saved.map((m, i) => ({ ...m, id: `saved-${i}` }))
    return [{ id: 'greeting', role: 'assistant', content: opts.greeting }]
  })
  const [isLoading, setIsLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const optsRef = useRef(opts)
  optsRef.current = opts
  const messagesRef = useRef(messages)
  messagesRef.current = messages

  const persist = useCallback(
    (msgs: ChatMessage[]) => {
      saveTranscript(studentId, subject, msgs.map(({ role, content }) => ({ role, content })))
    },
    [studentId, subject],
  )

  const sendMessage = useCallback(
    async (text: string) => {
      const content = text.trim()
      if (!content || isLoading) return

      const userMsg: ChatMessage = { id: `user-${Date.now()}`, role: 'user', content }
      const assistantId = `assistant-${Date.now()}`
      const convo = [...messagesRef.current, userMsg]
      setMessages([...convo, { id: assistantId, role: 'assistant', content: '' }])
      setIsLoading(true)
      setError(null)

      // Anthropic requires the first message to be a user turn — drop the
      // greeting / any leading assistant messages from what we send.
      const firstUser = convo.findIndex((m) => m.role === 'user')
      const apiMessages = convo.slice(firstUser === -1 ? convo.length : firstUser).map((m) => ({
        role: m.role,
        content: m.content,
      }))

      const o = optsRef.current
      try {
        const response = await fetch('/api/chat', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
            messages: apiMessages,
            mode: 'kid-tutor',
            context: {
              subject: o.subject,
              focusAreas: [],
              appMode: null,
              childName: o.childName,
              grade: o.grade,
              level: o.level,
            },
          }),
        })
        if (!response.ok) throw new Error('Failed to get response')

        const reply = await streamInto(response, assistantId, setMessages)
        const finalMsgs = [...convo, { id: assistantId, role: 'assistant' as const, content: reply }]
        persist(finalMsgs)
      } catch (err) {
        setError(err instanceof Error ? err.message : 'Something went wrong.')
        setMessages((prev) =>
          prev.map((m) =>
            m.id === assistantId
              ? {
                  ...m,
                  content:
                    "I'm having a little trouble connecting right now. Let's try once more in a moment.",
                }
              : m,
          ),
        )
      } finally {
        setIsLoading(false)
      }
    },
    [isLoading, persist],
  )

  const sendImageTurn = useCallback(
    async ({
      placeholder,
      prompt,
      imageB64,
      mediaType,
    }: {
      placeholder: string
      prompt: string
      imageB64: string
      mediaType: string
    }) => {
      if (isLoading) return

      const userMsg: ChatMessage = { id: `user-${Date.now()}`, role: 'user', content: placeholder }
      const assistantId = `assistant-${Date.now()}`
      const convo = [...messagesRef.current, userMsg]
      setMessages([...convo, { id: assistantId, role: 'assistant', content: '' }])
      setIsLoading(true)
      setError(null)

      // Send the real instruction (not the visible placeholder) plus the image.
      const firstUser = convo.findIndex((m) => m.role === 'user')
      const apiMessages = convo
        .slice(firstUser === -1 ? convo.length : firstUser)
        .map((m) => ({ role: m.role, content: m.content }))
      if (apiMessages.length) apiMessages[apiMessages.length - 1] = { role: 'user', content: prompt }

      const o = optsRef.current
      try {
        const response = await fetch('/api/chat', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
            messages: apiMessages,
            mode: 'kid-tutor',
            context: {
              subject: o.subject,
              focusAreas: [],
              appMode: null,
              childName: o.childName,
              grade: o.grade,
              level: o.level,
            },
            image: { data: imageB64, mediaType },
          }),
        })
        if (!response.ok) throw new Error('Failed to get response')

        const reply = await streamInto(response, assistantId, setMessages)
        persist([...convo, { id: assistantId, role: 'assistant' as const, content: reply }])
      } catch (err) {
        setError(err instanceof Error ? err.message : 'Something went wrong.')
        setMessages((prev) =>
          prev.map((m) =>
            m.id === assistantId
              ? { ...m, content: 'I had trouble seeing that one. Could you tell me what it says, or try again?' }
              : m,
          ),
        )
      } finally {
        setIsLoading(false)
      }
    },
    [isLoading, persist],
  )

  return { messages, isLoading, error, sendMessage, sendImageTurn }
}
