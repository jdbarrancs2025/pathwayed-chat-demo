import type { VercelRequest, VercelResponse } from "@vercel/node"
import { getCombinedSystemPrompt, type Mode } from "../src/lib/prompts"

interface ChatMessage {
  role: "user" | "assistant"
  content: string
}

interface ChatRequest {
  messages: ChatMessage[]
  mode: Mode
}

export default async function handler(req: VercelRequest, res: VercelResponse) {
  // Only allow POST
  if (req.method !== "POST") {
    return res.status(405).json({ error: "Method not allowed" })
  }

  // Validate API key
  const apiKey = process.env.OPENAI_API_KEY
  if (!apiKey) {
    return res.status(500).json({ error: "OpenAI API key not configured" })
  }

  try {
    const { messages, mode } = req.body as ChatRequest

    // Validate request body
    if (!messages || !Array.isArray(messages)) {
      return res.status(400).json({ error: "Messages array is required" })
    }
    if (!mode) {
      return res.status(400).json({ error: "Mode is required" })
    }

    // Build messages array with system prompt
    const systemPrompt = getCombinedSystemPrompt(mode)
    const openaiMessages = [
      { role: "system", content: systemPrompt },
      ...messages.map((m) => ({ role: m.role, content: m.content })),
    ]

    // Call OpenAI API with streaming
    const response = await fetch("https://api.openai.com/v1/chat/completions", {
      method: "POST",
      headers: {
        Authorization: `Bearer ${apiKey}`,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        model: "gpt-4o-mini",
        messages: openaiMessages,
        stream: true,
        max_tokens: 1024,
        temperature: 0.7,
      }),
    })

    if (!response.ok) {
      const error = await response.text()
      console.error("OpenAI API error:", error)
      return res.status(response.status).json({
        error: "Failed to get response from AI"
      })
    }

    // Set up SSE headers
    res.setHeader("Content-Type", "text/event-stream")
    res.setHeader("Cache-Control", "no-cache")
    res.setHeader("Connection", "keep-alive")

    // Stream the response
    const reader = response.body?.getReader()
    if (!reader) {
      return res.status(500).json({ error: "Failed to read response stream" })
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
        if (data === "[DONE]") {
          res.write("data: [DONE]\n\n")
          continue
        }

        try {
          const parsed = JSON.parse(data)
          const content = parsed.choices?.[0]?.delta?.content
          if (content) {
            res.write(`data: ${JSON.stringify({ content })}\n\n`)
          }
        } catch {
          // Skip malformed JSON
        }
      }
    }

    res.end()
  } catch (error) {
    console.error("Chat API error:", error)
    return res.status(500).json({ error: "Internal server error" })
  }
}
