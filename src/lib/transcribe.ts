import { authedJsonHeaders } from '@/lib/apiAuth'

export interface TranscriptionResult {
  /** The transcript, or '' when there was nothing usable to send. */
  text: string
  /**
   * The server rejected the audio as silence, noise, or a hallucinated
   * transcript (see isNoSpeech in api/transcribe.ts). Callers must NOT send a
   * message to Nikki on this: show the retry cue so the child can try again
   * without burning a chat turn.
   */
  noSpeech: boolean
}

/** Shared retry copy for a recording that produced nothing usable. */
export const NO_SPEECH_MESSAGE = "I didn't catch that. Tap the mic and say your answer."

/**
 * Send a recorded audio blob to the existing /api/transcribe endpoint and return
 * the transcribed text. Throws on failure so callers can fall back to typing.
 *
 * `prompt` is an optional context-biasing hint (child's name + lesson vocabulary,
 * see buildTranscriptionPrompt) that nudges the model toward this lesson's words.
 */
export async function transcribeAudio(
  blob: Blob,
  mimeType: string,
  prompt?: string,
): Promise<TranscriptionResult> {
  const bytes = new Uint8Array(await blob.arrayBuffer())
  // Base64-encode in chunks to avoid blowing the call-stack on large arrays.
  let binary = ''
  const CHUNK = 0x8000
  for (let i = 0; i < bytes.length; i += CHUNK) {
    binary += String.fromCharCode(...bytes.subarray(i, i + CHUNK))
  }
  const base64 = btoa(binary)

  const res = await fetch('/api/transcribe', {
    method: 'POST',
    headers: await authedJsonHeaders(),
    body: JSON.stringify(prompt ? { audio: base64, mimeType, prompt } : { audio: base64, mimeType }),
  })
  if (!res.ok) throw new Error(`transcribe failed: ${res.status}`)
  const data = (await res.json()) as { text?: string; noSpeech?: boolean }
  if (data.noSpeech) return { text: '', noSpeech: true }
  const text = (data.text ?? '').trim()
  // An empty transcript with no explicit flag is the same outcome for the child.
  return { text, noSpeech: text.length === 0 }
}
