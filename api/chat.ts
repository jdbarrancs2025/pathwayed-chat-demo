import Anthropic from "@anthropic-ai/sdk"
import type { VercelRequest, VercelResponse } from "@vercel/node"
import { getCombinedSystemPrompt, type Mode, type StudentContext } from "./prompts.js"

interface ChatMessage {
  role: "user" | "assistant"
  content: string
}

interface ImageInput {
  data: string // base64, without the data: prefix
  mediaType?: string
}

interface ChatRequest {
  messages: ChatMessage[]
  mode: Mode
  context?: StudentContext
  image?: ImageInput
}

export default async function handler(req: VercelRequest, res: VercelResponse) {
  // Only allow POST
  if (req.method !== "POST") {
    return res.status(405).json({ error: "Method not allowed" })
  }

  // Validate API key
  const apiKey = process.env.ANTHROPIC_API_KEY
  if (!apiKey) {
    return res.status(500).json({ error: "Anthropic API key not configured" })
  }

  const anthropic = new Anthropic({
    apiKey,
  })

  try {
    const { messages, mode, context, image } = req.body as ChatRequest

    // Validate request body
    if (!messages || !Array.isArray(messages)) {
      return res.status(400).json({ error: "Messages array is required" })
    }
    if (!mode) {
      return res.status(400).json({ error: "Mode is required" })
    }

    // Claude takes the system prompt in a dedicated top-level field — only
    // user/assistant turns go in the messages array.
    const systemPrompt = getCombinedSystemPrompt(mode, context)

    const anthropicMessages: Anthropic.MessageParam[] = messages.map((m) => ({
      role: m.role as "user" | "assistant",
      content: m.content,
    }))

    // Attach an optional image to the final user turn so vision works. The
    // base64 stays bound to this server request; the API key never leaves here.
    if (image?.data && anthropicMessages.length > 0) {
      const lastIndex = anthropicMessages.length - 1
      const last = anthropicMessages[lastIndex]
      if (last.role === "user") {
        const text = typeof last.content === "string" ? last.content : ""
        const mediaType =
          (image.mediaType as "image/png" | "image/jpeg" | "image/webp" | "image/gif") || "image/png"
        anthropicMessages[lastIndex] = {
          role: "user",
          content: [
            { type: "image", source: { type: "base64", media_type: mediaType, data: image.data } },
            { type: "text", text },
          ],
        }
      }
    }

    // Set up SSE headers
    res.setHeader("Content-Type", "text/event-stream")
    res.setHeader("Cache-Control", "no-cache")
    res.setHeader("Connection", "keep-alive")

    // Stream from Claude (Sonnet 4.6, no extended thinking) and translate the
    // text deltas into the existing `data: {content}` / `data: [DONE]` SSE shape
    // so the frontend and useNikkiChat hook are untouched.
    const stream = anthropic.messages.stream({
      model: "claude-sonnet-4-6",
      max_tokens: 1024,
      temperature: 0.7,
      system: systemPrompt,
      messages: anthropicMessages,
    })

    for await (const event of stream) {
      if (
        event.type === "content_block_delta" &&
        event.delta.type === "text_delta"
      ) {
        const content = event.delta.text
        if (content) {
          res.write(`data: ${JSON.stringify({ content })}\n\n`)
        }
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
