import OpenAI from "openai"
import type { VercelRequest, VercelResponse } from "@vercel/node"

interface TtsRequest {
  text: string
  format?: "mp3" | "pcm"
}

export default async function handler(req: VercelRequest, res: VercelResponse) {
  if (req.method !== "POST") {
    return res.status(405).json({ error: "Method not allowed" })
  }

  const apiKey = process.env.OPENAI_API_KEY
  if (!apiKey) {
    return res.status(500).json({ error: "OpenAI API key not configured" })
  }

  const openai = new OpenAI({ apiKey })

  try {
    const { text, format = "mp3" } = req.body as TtsRequest

    if (!text) {
      return res.status(400).json({ error: "text is required" })
    }

    // OpenAI TTS has a 4096 character limit
    const truncated = text.slice(0, 4096)

    if (format === "pcm") {
      // Streaming PCM path — pipe chunks to client as they arrive
      const response = await openai.audio.speech.create({
        model: "tts-1",
        voice: "nova",
        input: truncated,
        response_format: "pcm",
      })

      res.setHeader("Content-Type", "application/octet-stream")
      res.setHeader("Cache-Control", "no-cache")
      res.setHeader("Transfer-Encoding", "chunked")

      const body = response.body as ReadableStream<Uint8Array> | null
      if (!body) {
        return res.status(500).json({ error: "No response body from OpenAI" })
      }

      const reader = body.getReader()
      try {
        while (true) {
          const { done, value } = await reader.read()
          if (done) break
          res.write(value)
        }
      } catch (streamError) {
        if (!res.headersSent) {
          return res.status(500).json({ error: "Stream interrupted" })
        }
        console.error("TTS stream error:", streamError)
      } finally {
        res.end()
      }
      return
    }

    // Buffered MP3 path (default) — used by filler preloading
    const response = await openai.audio.speech.create({
      model: "tts-1",
      voice: "nova",
      input: truncated,
      response_format: "mp3",
    })

    const arrayBuffer = await response.arrayBuffer()
    const buffer = Buffer.from(arrayBuffer)

    res.setHeader("Content-Type", "audio/mpeg")
    res.setHeader("Content-Length", buffer.length.toString())
    return res.status(200).send(buffer)
  } catch (error) {
    console.error("TTS API error:", error)
    if (!res.headersSent) {
      return res.status(500).json({ error: "Text-to-speech failed" })
    }
  }
}
