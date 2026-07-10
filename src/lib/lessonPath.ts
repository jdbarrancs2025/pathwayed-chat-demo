import { supabase } from '@/lib/supabase'
import { resolveSkillIdsBySlug } from '@/lib/skills'
import { getActiveFocusSkillIds } from '@/lib/focusSkills'
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

/** Grade → the band that has a track. Every band now has one (k-2 = counting +
 *  phonics), so this is non-null in practice; the null guard is a safety net. */
export function scopeBandForGrade(grade?: string): ScopeBand | null {
  const b = gradeBand(grade)
  return b === 'k-2' || b === '3-5' || b === '6-8' || b === '9-12' ? b : null
}

/** Subjects that actually have a track for this band (non-empty sequence). K has
 *  math (counting) + reading (letter-sounds) but no writing yet. */
export function scopeSubjectsForBand(band: ScopeBand): ScopeSubject[] {
  return SCOPE_SUBJECTS.filter((s) => scopeSequence[band][s].length > 0)
}

/** Display labels for the K-2 pre-reader skills (focusAreas.ts covers 3-12 only). */
const K2_SKILL_LABELS: Record<string, string> = {
  counting: 'Counting',
  'letter-sounds': 'Letter Sounds',
}

export interface Lesson {
  slug: string
  label: string
  subject: ScopeSubject
  band: ScopeBand
  /** True when every skill in this subject's track is already mastered. */
  trackComplete: boolean
  /** True when this lesson was surfaced from the student's focus list (a skill
   *  missed on the practice SAT), ahead of the normal sequence walk. */
  fromFocus: boolean
}

/** Display label for a slug, from focusAreas (the source of truth for names).
 *  K-2 slugs aren't in focusAreas, so they use the K-2 label map. */
export function skillLabel(band: ScopeBand, subject: ScopeSubject, slug: string): string {
  if (band === 'k-2') return K2_SKILL_LABELS[slug] ?? slug
  return focusAreasByGrade[band][subject].find((f) => f.value === slug)?.label ?? slug
}

/**
 * The next lesson for a subject. Focus skills come FIRST: if the student missed
 * any of this subject's skills on the practice SAT (active student_focus_skills),
 * we serve the earliest such skill in sequence order — ahead of the normal walk
 * and regardless of its mastery (a missed skill may already be ≥60). This is
 * non-destructive: mastery is never lowered to force it.
 *
 * Otherwise the normal walk: skip mastered skills, return the first not-yet-
 * mastered one (the student loops on it until mastered). If the whole track is
 * mastered, returns the last skill with trackComplete=true (kept for review).
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

  const [idBySlug, focusIds] = await Promise.all([
    resolveSkillIdsBySlug(seq),
    getActiveFocusSkillIds(studentId),
  ])

  // Focus skills ahead of the walk, in scope-sequence order. A focus skill only
  // surfaces here for the subject it belongs to (SAT misses are math skills, so
  // they appear when the kid picks math).
  if (focusIds.size) {
    const focusSlug = seq.find((s) => {
      const id = idBySlug.get(s)
      return id ? focusIds.has(id) : false
    })
    if (focusSlug) {
      return {
        slug: focusSlug,
        label: skillLabel(band, subject, focusSlug),
        subject,
        band,
        trackComplete: false,
        fromFocus: true,
      }
    }
  }

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
    return { slug: nextSlug, label: skillLabel(band, subject, nextSlug), subject, band, trackComplete: false, fromFocus: false }
  }
  const last = seq[seq.length - 1]
  return { slug: last, label: skillLabel(band, subject, last), subject, band, trackComplete: true, fromFocus: false }
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
