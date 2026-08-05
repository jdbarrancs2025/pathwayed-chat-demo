import { useCallback, useRef, useState } from 'react'
import { saveTranscript, type StoredMessage } from '@/lib/sessions'
import { stripCheckMarker, stripStreamingCheckMarker } from '@/lib/checkQuestion'

export interface ChatMessage extends StoredMessage {
  id: string
}

interface UseSessionChatOptions {
  studentId: string
  subject: string
  childName: string
  grade: string
  level: string
  /** Focus areas for the tutor prompt (e.g. today's skill label). Defaults to []. */
  focusAreas?: string[]
  /** Focus skill SLUG (e.g. 'paragraph-writing') — selects the writing-composition
   *  coaching module server-side. */
  focusSkill?: string | null
  /** For a writing-composition lesson: the exact prompt the student writes to, so
   *  Nikki coaches against the same prompt shown in the writing space. */
  writingPrompt?: string | null
  /** Pre-resolved misconception nudge for the distractor the student just chose on
   *  a graded bank question, produced client-side via explainMisconception(token).
   *  Threaded into the next turn's context so the tutor targets that specific
   *  mistake. Omitted when the last turn was not a graded miss. */
  lastMisconceptionNudge?: string | null
  /** Storage key for the transcript. Defaults to `subject`; skills-building
   *  lessons pass `subject:skill` so each skill has its own fresh transcript. */
  transcriptKey?: string
  /** Resolved opening transcript: the saved messages, or a single greeting. */
  initialMessages: ChatMessage[]
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
        // Strip the check marker for DISPLAY on every tick, so a partially
        // streamed "[[che" never flashes in the transcript. The raw accumulator
        // keeps the marker; the caller strips it once at the end for persistence.
        const shown = stripStreamingCheckMarker(content)
        setMessages((prev) => prev.map((m) => (m.id === assistantId ? { ...m, content: shown } : m)))
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
 * (/api/chat, claude-sonnet-4-6) with the child- and subject-aware kid-tutor
 * prompt. Opens from the resolved transcript and upserts it to Supabase per turn.
 */
export function useSessionChat(opts: UseSessionChatOptions) {
  const { studentId, subject } = opts
  const transcriptKey = opts.transcriptKey ?? subject
  const [messages, setMessages] = useState<ChatMessage[]>(opts.initialMessages)
  const [isLoading, setIsLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  // Nikki asked for a check question on her last turn. The caller decides whether
  // the cadence and the ladder guards actually allow one, then clears this.
  const [checkRequested, setCheckRequested] = useState(false)
  // Assistant turns completed this session — the clock the cadence rules run on.
  const [assistantTurns, setAssistantTurns] = useState(0)
  const clearCheckRequest = useCallback(() => setCheckRequested(false), [])

  const optsRef = useRef(opts)
  optsRef.current = opts
  const messagesRef = useRef(messages)
  messagesRef.current = messages

  const persist = useCallback(
    (msgs: ChatMessage[]) =>
      saveTranscript(studentId, transcriptKey, msgs.map(({ role, content }) => ({ role, content }))),
    [studentId, transcriptKey],
  )

  const sendMessage = useCallback(
    async (
      text: string,
      /**
       * Per-call misconception nudge. Passed explicitly rather than read from the
       * hook's options because the caller (a check question just answered) resolves
       * it in the same tick as the send: a setState would not have applied yet, so
       * the nudge would land on the turn AFTER the one it explains.
       */
      turnOpts?: { misconceptionNudge?: string | null },
    ) => {
      const content = text.trim()
      if (!content || isLoading) return

      const userMsg: ChatMessage = { id: `user-${Date.now()}`, role: 'user', content }
      const assistantId = `assistant-${Date.now()}`
      const convo = [...messagesRef.current, userMsg]
      setMessages([...convo, { id: assistantId, role: 'assistant', content: '' }])
      setIsLoading(true)
      setError(null)

      const firstUser = convo.findIndex((m) => m.role === 'user')
      const apiMessages = convo
        .slice(firstUser === -1 ? convo.length : firstUser)
        .map((m) => ({ role: m.role, content: m.content }))

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
              focusAreas: o.focusAreas ?? [],
              appMode: null,
              childName: o.childName,
              grade: o.grade,
              level: o.level,
              focusSkill: o.focusSkill ?? undefined,
              writingPrompt: o.writingPrompt ?? undefined,
              lastMisconceptionNudge:
                turnOpts?.misconceptionNudge ?? o.lastMisconceptionNudge ?? undefined,
            },
          }),
        })
        if (!response.ok) throw new Error('Failed to get response')

        const raw = await streamInto(response, assistantId, setMessages)
        // Final strip: the marker is removed once, here, so it reaches neither the
        // saved transcript nor the history sent back to the model on the next turn.
        const { text: reply, requested } = stripCheckMarker(raw)
        setMessages((prev) => prev.map((m) => (m.id === assistantId ? { ...m, content: reply } : m)))
        setAssistantTurns((n) => n + 1)
        if (requested) setCheckRequested(true)
        await persist([...convo, { id: assistantId, role: 'assistant', content: reply }])
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
              focusAreas: o.focusAreas ?? [],
              appMode: null,
              childName: o.childName,
              grade: o.grade,
              level: o.level,
              focusSkill: o.focusSkill ?? undefined,
              writingPrompt: o.writingPrompt ?? undefined,
              lastMisconceptionNudge: o.lastMisconceptionNudge ?? undefined,
            },
            image: { data: imageB64, mediaType },
          }),
        })
        if (!response.ok) throw new Error('Failed to get response')

        const raw = await streamInto(response, assistantId, setMessages)
        // Final strip: the marker is removed once, here, so it reaches neither the
        // saved transcript nor the history sent back to the model on the next turn.
        const { text: reply, requested } = stripCheckMarker(raw)
        setMessages((prev) => prev.map((m) => (m.id === assistantId ? { ...m, content: reply } : m)))
        setAssistantTurns((n) => n + 1)
        if (requested) setCheckRequested(true)
        await persist([...convo, { id: assistantId, role: 'assistant', content: reply }])
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

  return {
    messages,
    isLoading,
    error,
    sendMessage,
    sendImageTurn,
    checkRequested,
    clearCheckRequest,
    assistantTurns,
  }
}
