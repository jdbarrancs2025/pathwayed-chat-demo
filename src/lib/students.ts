import { supabase } from '@/lib/supabase'
import type { Database } from '@/lib/database.types'

export type Student = Database['public']['Tables']['students']['Row']
export type StudentLevel = 'on' | 'ahead' | 'advanced'

export interface StudentInput {
  first_name: string
  grade: string
  level: StudentLevel
}

export const GRADES = ['K', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12']

export const LEVELS: { id: StudentLevel; label: string; desc: string }[] = [
  { id: 'on', label: 'On grade level', desc: 'Practice right at their current grade' },
  { id: 'ahead', label: 'Getting ahead', desc: 'Build toward the next grade up' },
  { id: 'advanced', label: 'Advanced challenge', desc: 'Stretch well beyond their grade' },
]

const AV_COLORS = ['#2E5BB8', '#1F9E6F', '#8B5CD6', '#E8943A', '#CC543C', '#0E8B8B']

export function gradeLabel(grade: string): string {
  return grade === 'K' ? 'Kindergarten' : `Grade ${grade}`
}

export function levelLabel(level: string): string {
  return LEVELS.find((l) => l.id === level)?.label ?? level
}

export function avColor(index: number): string {
  return AV_COLORS[index % AV_COLORS.length]
}

export function initials(name: string): string {
  return (name || '?').trim().charAt(0).toUpperCase()
}

/** Children belonging to a parent, ordered stably by id so avatar colors are consistent. */
export async function listStudents(parentId: string): Promise<Student[]> {
  const { data, error } = await supabase
    .from('students')
    .select('*')
    .eq('parent_id', parentId)
    .order('id', { ascending: true })

  if (error || !data) return []
  return data
}

export async function getStudent(id: string): Promise<Student | null> {
  const { data } = await supabase.from('students').select('*').eq('id', id).maybeSingle()
  return data ?? null
}

/** Create a child and return its new id (needed to route into placement). */
export async function createStudent(
  parentId: string,
  input: StudentInput,
): Promise<{ id: string | null; error: unknown }> {
  const { data, error } = await supabase
    .from('students')
    .insert({ parent_id: parentId, ...input })
    .select('id')
    .single()
  return { id: data?.id ?? null, error }
}

/**
 * Set the per-child consent to surface above-grade / SAT framing. Placement still
 * advances the child at their real level regardless; this governs framing only.
 */
export async function setAboveGradeConsent(studentId: string, ok: boolean) {
  return supabase.from('students').update({ above_grade_ok: ok }).eq('id', studentId)
}

export async function updateStudent(id: string, input: StudentInput) {
  return supabase.from('students').update(input).eq('id', id)
}

export async function deleteStudent(id: string) {
  return supabase.from('students').delete().eq('id', id)
}
