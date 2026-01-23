import OpenAI from "openai"
import type { VercelRequest, VercelResponse } from "@vercel/node"
import { getCombinedSystemPrompt, type Mode } from "./prompts.js"

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

  const openai = new OpenAI({
    apiKey,
  })

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
    const openaiMessages: OpenAI.Chat.Completions.ChatCompletionMessageParam[] = [
      { role: "system", content: systemPrompt },
      ...messages.map((m) => ({ role: m.role as "user" | "assistant", content: m.content })),
    ]

    // Call OpenAI API with streaming using the SDK
    const stream = await openai.chat.completions.create({
      model: "gpt-4o-mini",
      messages: openaiMessages,
      stream: true,
      max_tokens: 1024,
      temperature: 0.7,
    })

    // Set up SSE headers
    res.setHeader("Content-Type", "text/event-stream")
    res.setHeader("Cache-Control", "no-cache")
    res.setHeader("Connection", "keep-alive")

    // Stream the response using for-await pattern
    for await (const chunk of stream) {
      const content = chunk.choices[0]?.delta?.content
      if (content) {
        res.write(`data: ${JSON.stringify({ content })}\n\n`)
      }
    }

    res.write("data: [DONE]\n\n")
    res.end()
  } catch (error) {
    console.error("Chat API error:", error)

    // Check if headers already sent (streaming started)
    if (res.headersSent) {
      res.write(`data: ${JSON.stringify({ error: "Stream interrupted" })}\n\n`)
      res.end()
      return
    }

    return res.status(500).json({ error: "Internal server error" })
  }
}
