import OpenAI, { toFile } from "openai"
import type { VercelRequest, VercelResponse } from "@vercel/node"
import { SESSION_LANGUAGE } from "./prompts.js"

interface TranscribeRequest {
  audio: string // base64-encoded audio
  mimeType: string
}

/** Map MIME types to file extensions for the OpenAI API */
function getExtension(mimeType: string): string {
  if (mimeType.startsWith("audio/webm")) return "webm"
  if (mimeType.startsWith("audio/mp4")) return "m4a"
  if (mimeType.startsWith("audio/wav")) return "wav"
  if (mimeType.startsWith("audio/mpeg")) return "mp3"
  return "webm"
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
    const { audio, mimeType } = req.body as TranscribeRequest

    if (!audio || !mimeType) {
      return res.status(400).json({ error: "audio (base64) and mimeType are required" })
    }

    const buffer = Buffer.from(audio, "base64")

    // Validate size (25MB limit for Whisper)
    if (buffer.length > 25 * 1024 * 1024) {
      return res.status(400).json({ error: "Audio file too large. Maximum size is 25MB." })
    }

    const ext = getExtension(mimeType)
    const file = await toFile(buffer, `recording.${ext}`, { type: mimeType })

    const transcription = await openai.audio.transcriptions.create({
      file,
      model: "whisper-1",
      // Locked to the session language (see SESSION_LANGUAGE) — auto-detect on
      // short kid utterances is a known source of wrong-language transcripts.
      language: SESSION_LANGUAGE.whisper,
    })

    return res.status(200).json({ text: transcription.text })
  } catch (error) {
    console.error("Transcribe API error:", error)
    return res.status(500).json({ error: "Transcription failed" })
  }
}
