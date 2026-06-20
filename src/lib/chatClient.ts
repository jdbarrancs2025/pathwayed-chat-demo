interface ChatRequestBody {
  messages: { role: string; content: string }[]
  mode: string
  context?: unknown
  image?: { data: string; mediaType?: string }
  task?: string
}

/**
 * POST to /api/chat and return the full assistant text (drains the SSE stream).
 * Used by tools that need the complete reply rather than live streaming (e.g.
 * the Flashcards generator parsing JSON).
 */
export async function fetchChatText(body: ChatRequestBody): Promise<string> {
  const res = await fetch('/api/chat', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(body),
  })
  if (!res.ok || !res.body) throw new Error('Request failed')

  const reader = res.body.getReader()
  const decoder = new TextDecoder()
  let text = ''
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
      if (parsed.content) text += parsed.content
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
  return text
}
