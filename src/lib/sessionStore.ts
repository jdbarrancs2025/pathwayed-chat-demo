export interface StoredMessage {
  role: 'user' | 'assistant'
  content: string
}

/**
 * Per-student, per-subject chat transcripts. Stored in localStorage for now
 * (mirrors the prototype's `pe_tx_*` keys); this is what drives the "Continue"
 * badge and lets a session resume. Swap for a DB-backed store when session
 * persistence moves server-side.
 */
function key(studentId: string, subject: string): string {
  return `pe_tx_${studentId}_${subject}`
}

export function loadTranscript(studentId: string, subject: string): StoredMessage[] {
  try {
    const raw = localStorage.getItem(key(studentId, subject))
    if (!raw) return []
    const parsed = JSON.parse(raw)
    return Array.isArray(parsed) ? (parsed as StoredMessage[]) : []
  } catch {
    return []
  }
}

export function saveTranscript(studentId: string, subject: string, messages: StoredMessage[]): void {
  try {
    localStorage.setItem(key(studentId, subject), JSON.stringify(messages.slice(-40)))
  } catch {
    // Ignore storage failures (private mode, quota) — the session still works in memory.
  }
}

export function hasSavedSession(studentId: string, subject: string): boolean {
  return loadTranscript(studentId, subject).length > 0
}
