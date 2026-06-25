import type { VercelRequest, VercelResponse } from "@vercel/node"

interface TtsRequest {
  text: string
  voiceId?: string
  // "mp3" (default, buffered) for one-shot playback; "pcm" streams raw 24kHz
  // 16-bit LE PCM for the gapless streaming path in useTextToSpeech.
  format?: "mp3" | "pcm"
}

// Warm, calm, widely-available ElevenLabs preset voice ("Rachel") — a good
// default for reading to young children. Override with ELEVENLABS_VOICE_ID.
const DEFAULT_VOICE_ID = "21m00Tcm4TlvDq8ikWAM"
// Low-latency, natural model suitable for back-and-forth tutoring.
const MODEL_ID = "eleven_turbo_v2_5"
const MAX_CHARS = 2500

/**
 * Text-to-speech for Nikki's voice, backed by ElevenLabs. The API key is read
 * from the server environment and never exposed to the client. On any failure
 * this returns a JSON error (no audio), so the client can degrade to the
 * browser's speechSynthesis instead of crashing.
 */
export default async function handler(req: VercelRequest, res: VercelResponse) {
  if (req.method !== "POST") {
    return res.status(405).json({ error: "Method not allowed" })
  }

  const apiKey = process.env.ELEVENLABS_API_KEY
  if (!apiKey) {
    // 503 → client falls back to browser speech rather than erroring out.
    return res.status(503).json({ error: "ElevenLabs API key not configured" })
  }

  try {
    const { text, voiceId, format = "mp3" } = req.body as TtsRequest
    if (!text || !text.trim()) {
      return res.status(400).json({ error: "text is required" })
    }

    const voice = voiceId || process.env.ELEVENLABS_VOICE_ID || DEFAULT_VOICE_ID
    const input = text.slice(0, MAX_CHARS)
    const isPcm = format === "pcm"
    const outputFormat = isPcm ? "pcm_24000" : "mp3_44100_128"

    const endpoint =
      `https://api.elevenlabs.io/v1/text-to-speech/${voice}` +
      `${isPcm ? "/stream" : ""}?output_format=${outputFormat}`

    const elevenRes = await fetch(endpoint, {
      method: "POST",
      headers: {
        "xi-api-key": apiKey,
        "Content-Type": "application/json",
        Accept: isPcm ? "audio/pcm" : "audio/mpeg",
      },
      body: JSON.stringify({
        text: input,
        model_id: MODEL_ID,
        voice_settings: {
          stability: 0.5,
          similarity_boost: 0.75,
          style: 0.0,
          use_speaker_boost: true,
        },
      }),
    })

    if (!elevenRes.ok || !elevenRes.body) {
      const detail = await elevenRes.text().catch(() => "")
      console.error("ElevenLabs TTS error:", elevenRes.status, detail.slice(0, 300))
      return res.status(502).json({ error: "Text-to-speech failed" })
    }

    if (isPcm) {
      // Stream raw PCM straight through to the client (24kHz, 16-bit LE) — the
      // shape useTextToSpeech decodes for gapless playback.
      res.setHeader("Content-Type", "application/octet-stream")
      res.setHeader("Cache-Control", "no-cache")
      const reader = elevenRes.body.getReader()
      try {
        while (true) {
          const { done, value } = await reader.read()
          if (done) break
          if (value) res.write(Buffer.from(value))
        }
      } catch (streamError) {
        console.error("TTS stream error:", streamError)
      } finally {
        res.end()
      }
      return
    }

    // Buffered MP3 (default).
    const arrayBuffer = await elevenRes.arrayBuffer()
    const buffer = Buffer.from(arrayBuffer)
    res.setHeader("Content-Type", "audio/mpeg")
    res.setHeader("Content-Length", buffer.length.toString())
    res.setHeader("Cache-Control", "no-store")
    return res.status(200).send(buffer)
  } catch (error) {
    console.error("TTS API error:", error)
    if (!res.headersSent) {
      return res.status(500).json({ error: "Text-to-speech failed" })
    }
    res.end()
  }
}
