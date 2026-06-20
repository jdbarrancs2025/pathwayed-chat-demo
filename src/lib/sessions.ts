import { supabase } from '@/lib/supabase'
import type { Json } from '@/lib/database.types'

export interface StoredMessage {
  role: 'user' | 'assistant'
  content: string
}

const MAX_MESSAGES = 40

function normalizeMessages(raw: unknown): StoredMessage[] {
  if (!Array.isArray(raw)) return []
  const result: StoredMessage[] = []
  for (const item of raw) {
    if (item && typeof item === 'object' && 'role' in item && 'content' in item) {
      const content = (item as { content: unknown }).content
      const role = (item as { role: unknown }).role
      if (typeof content === 'string') {
        result.push({ role: role === 'assistant' ? 'assistant' : 'user', content })
      }
    }
  }
  return result
}

/** Resume a saved transcript for a student + subject (RLS scopes to the parent). */
export async function loadTranscript(studentId: string, subject: string): Promise<StoredMessage[]> {
  const { data, error } = await supabase
    .from('sessions')
    .select('messages')
    .eq('student_id', studentId)
    .eq('subject', subject)
    .maybeSingle()
  if (error || !data) return []
  return normalizeMessages(data.messages as unknown)
}

/** Upsert the running transcript, keeping the most recent 40 messages. */
export async function saveTranscript(
  studentId: string,
  subject: string,
  messages: StoredMessage[],
): Promise<void> {
  const trimmed = messages.slice(-MAX_MESSAGES)
  await supabase.from('sessions').upsert(
    {
      student_id: studentId,
      subject,
      messages: trimmed as unknown as Json,
      updated_at: new Date().toISOString(),
    },
    { onConflict: 'student_id,subject' },
  )
}

/** Subjects with a non-empty saved session — drives the kid-home Continue badge. */
export async function listSavedSubjects(studentId: string): Promise<string[]> {
  const { data, error } = await supabase
    .from('sessions')
    .select('subject, messages')
    .eq('student_id', studentId)
  if (error || !data) return []
  return data
    .filter((row) => Array.isArray(row.messages as unknown) && (row.messages as unknown[]).length > 0)
    .map((row) => row.subject)
}

/** Record end-of-session feedback. */
export async function saveFeedback(
  studentId: string,
  subject: string,
  rating: string,
  note: string,
): Promise<void> {
  await supabase.from('feedback').insert({
    student_id: studentId,
    subject,
    rating,
    note: note.trim() || null,
  })
}
