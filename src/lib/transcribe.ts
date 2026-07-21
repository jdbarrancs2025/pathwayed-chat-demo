/**
 * Send a recorded audio blob to the existing /api/transcribe endpoint and return
 * the transcribed text. Throws on failure so callers can fall back to typing.
 *
 * `prompt` is an optional context-biasing hint (child's name + lesson vocabulary,
 * see buildTranscriptionPrompt) that nudges the model toward this lesson's words.
 */
export async function transcribeAudio(blob: Blob, mimeType: string, prompt?: string): Promise<string> {
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
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(prompt ? { audio: base64, mimeType, prompt } : { audio: base64, mimeType }),
  })
  if (!res.ok) throw new Error(`transcribe failed: ${res.status}`)
  const data = (await res.json()) as { text?: string }
  return (data.text ?? '').trim()
}
