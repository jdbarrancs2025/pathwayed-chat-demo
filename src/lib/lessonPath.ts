import { supabase } from '@/lib/supabase'
import { resolveSkillIdsBySlug } from '@/lib/skills'
import { gradeBand } from '@/lib/gradeBand'
import { focusAreasByGrade } from '@/lib/focusAreas'
import { scopeSequence, type ScopeBand, type ScopeSubject } from '@/lib/scopeSequence'

/**
 * Learning path — picks the day's lesson by walking the approved per-subject
 * scope & sequence, using stored mastery to set the pace: skip skills already
 * known, loop on the first not-yet-known one. Mastery is truth, so a ready kid
 * moves ahead and is never held to grade pace.
 */

// mastery_percentage at/above which a skill is "known well enough to move past".
// Set at the diagnostic's correct-answer seed (60) so a student who demonstrated
// a skill at placement skips it rather than being held to grade pace. Tunable.
export const MASTERY_THRESHOLD = 60

export const SCOPE_SUBJECTS: ScopeSubject[] = ['math', 'reading', 'writing']

/** The three subjects that have a real skills-building track. */
export function isScopeSubject(subject: string): subject is ScopeSubject {
  return subject === 'math' || subject === 'reading' || subject === 'writing'
}

/** Grade → the band that has a track, or null (k-2 has no track). */
export function scopeBandForGrade(grade?: string): ScopeBand | null {
  const b = gradeBand(grade)
  return b === '3-5' || b === '6-8' || b === '9-12' ? b : null
}

export interface Lesson {
  slug: string
  label: string
  subject: ScopeSubject
  band: ScopeBand
  /** True when every skill in this subject's track is already mastered. */
  trackComplete: boolean
}

/** Display label for a slug, from focusAreas (the source of truth for names). */
export function skillLabel(band: ScopeBand, subject: ScopeSubject, slug: string): string {
  return focusAreasByGrade[band][subject].find((f) => f.value === slug)?.label ?? slug
}

/**
 * The next lesson for a subject: walk the sequence in order, skip mastered skills,
 * return the first not-yet-mastered one (the student loops on it until mastered).
 * If the whole track is mastered, returns the last skill with trackComplete=true
 * (kept for review; cross-band promotion is a Phase 5 reassessment concern).
 * Returns null only when the grade has no track (k-2).
 */
export async function nextLesson(
  studentId: string,
  grade: string | undefined,
  subject: ScopeSubject,
): Promise<Lesson | null> {
  const band = scopeBandForGrade(grade)
  if (!band) return null
  const seq = scopeSequence[band][subject]
  if (!seq.length) return null

  const idBySlug = await resolveSkillIdsBySlug(seq)
  const ids = seq.map((s) => idBySlug.get(s)).filter((x): x is string => !!x)
  const masteryById = new Map<string, number>()
  if (ids.length) {
    const { data, error } = await supabase
      .from('student_skill_mastery')
      .select('skill_id, mastery_percentage')
      .eq('student_id', studentId)
      .in('skill_id', ids)
    if (error) console.error('nextLesson: mastery read failed', error)
    for (const m of data ?? []) masteryById.set(m.skill_id, Number(m.mastery_percentage))
  }
  const mastered = (slug: string): boolean => {
    const id = idBySlug.get(slug)
    return id ? (masteryById.get(id) ?? 0) >= MASTERY_THRESHOLD : false
  }

  const nextSlug = seq.find((s) => !mastered(s))
  if (nextSlug) {
    return { slug: nextSlug, label: skillLabel(band, subject, nextSlug), subject, band, trackComplete: false }
  }
  const last = seq[seq.length - 1]
  return { slug: last, label: skillLabel(band, subject, last), subject, band, trackComplete: true }
}

/** Whether the student has any mastery yet — drives the first-arrival diagnostic. */
export async function hasAnyMastery(studentId: string): Promise<boolean> {
  const { data, error } = await supabase
    .from('student_skill_mastery')
    .select('skill_id')
    .eq('student_id', studentId)
    .limit(1)
  if (error) console.error('hasAnyMastery read failed', error)
  return (data?.length ?? 0) > 0
}
