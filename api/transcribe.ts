import OpenAI, { toFile } from "openai"
import type { VercelRequest, VercelResponse } from "@vercel/node"
import { SESSION_LANGUAGE } from "./prompts.js"

interface TranscribeRequest {
  audio: string // base64-encoded audio
  mimeType: string
  /** Optional context-biasing prompt (child's name + subject vocabulary) to
   *  improve accuracy on short, soft kid utterances. Whisper-family models use
   *  roughly the last 224 tokens, so callers keep this short. */
  prompt?: string
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
    const { audio, mimeType, prompt } = req.body as TranscribeRequest

    if (!audio || !mimeType) {
      return res.status(400).json({ error: "audio (base64) and mimeType are required" })
    }

    // Defensive cap: the model only reads ~224 tokens of prompt, and callers aim
    // for under ~200. A client sending more would just be truncated by the API,
    // but trim it anyway (~800 chars is comfortably under the token ceiling).
    const biasPrompt = typeof prompt === "string" ? prompt.trim().slice(0, 800) : ""

    const buffer = Buffer.from(audio, "base64")

    // Validate size (25MB limit for Whisper)
    if (buffer.length > 25 * 1024 * 1024) {
      return res.status(400).json({ error: "Audio file too large. Maximum size is 25MB." })
    }

    const ext = getExtension(mimeType)
    const file = await toFile(buffer, `recording.${ext}`, { type: mimeType })

    const transcription = await openai.audio.transcriptions.create({
      file,
      // gpt-4o-mini-transcribe is markedly more accurate than whisper-1 on the
      // short, soft, disfluent speech young kids produce. Same request shape:
      // it accepts file + language + prompt and returns { text } by default.
      model: "gpt-4o-mini-transcribe",
      // Locked to the session language (see SESSION_LANGUAGE) — auto-detect on
      // short kid utterances is a known source of wrong-language transcripts.
      language: SESSION_LANGUAGE.whisper,
      // Context biasing: the child's name and the active lesson's vocabulary,
      // so homophones and proper nouns resolve toward this lesson's words.
      ...(biasPrompt ? { prompt: biasPrompt } : {}),
    })

    return res.status(200).json({ text: transcription.text })
  } catch (error) {
    console.error("Transcribe API error:", error)
    return res.status(500).json({ error: "Transcription failed" })
  }
}
