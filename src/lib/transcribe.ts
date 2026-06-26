/**
 * Send a recorded audio blob to the existing /api/transcribe endpoint (OpenAI
 * Whisper) and return the transcribed text. Throws on failure so callers can
 * fall back to typing.
 */
export async function transcribeAudio(blob: Blob, mimeType: string): Promise<string> {
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
    body: JSON.stringify({ audio: base64, mimeType }),
  })
  if (!res.ok) throw new Error(`transcribe failed: ${res.status}`)
  const data = (await res.json()) as { text?: string }
  return (data.text ?? '').trim()
}
