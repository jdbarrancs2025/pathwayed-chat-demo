import { supabase } from '@/lib/supabase'
import { resolveSkillIdsBySlug } from '@/lib/skills'

/**
 * Practice-SAT Phase 2 — per-student focus skills. When a student misses skills
 * on the practice SAT, we record those SKILLS here (not raw question rows); the
 * learning path then serves them ahead of the normal scope-sequence walk until
 * addressed. Deliberately NON-DESTRUCTIVE: this never touches
 * student_skill_mastery, so mastery layering stays intact.
 *
 * A row is "active" while resolved_at is null. One completed lesson on the skill
 * resolves it (keyed off the launch slug, since the HS mastery signal is
 * unreliable today). Re-missing a resolved skill reactivates it via upsert.
 *
 * Scoped to source='sat_practice' — the only origin of misses today.
 */

const SAT_SOURCE = 'sat_practice'

/**
 * Record the skills a student missed on the practice SAT as active focus rows.
 * Upsert on (student_id, skill_id, source): a re-miss reactivates a previously
 * resolved skill (resolved_at back to null). Best-effort — never throws.
 */
export async function recordSatMisses(studentId: string, skillIds: string[]): Promise<void> {
  const unique = [...new Set(skillIds)].filter(Boolean)
  if (!unique.length) return
  const rows = unique.map((skill_id) => ({
    student_id: studentId,
    skill_id,
    source: SAT_SOURCE,
    resolved_at: null,
  }))
  try {
    const { error } = await supabase
      .from('student_focus_skills')
      .upsert(rows, { onConflict: 'student_id,skill_id,source' })
    if (error) console.error('recordSatMisses upsert failed', { error, rows })
  } catch (err) {
    console.error('recordSatMisses threw', err)
  }
}

/**
 * The student's active (unresolved) focus skill_ids. Best-effort — returns an
 * empty set on any read error so the learning path just falls back to its normal
 * sequence walk.
 */
export async function getActiveFocusSkillIds(studentId: string): Promise<Set<string>> {
  const { data, error } = await supabase
    .from('student_focus_skills')
    .select('skill_id')
    .eq('student_id', studentId)
    .is('resolved_at', null)
  if (error) {
    console.error('getActiveFocusSkillIds read failed', error)
    return new Set()
  }
  return new Set((data ?? []).map((r) => r.skill_id))
}

/**
 * Resolve the active focus row for a skill the student just completed a lesson
 * on, identified by its slug (the same slug the lesson launched with). No-op if
 * the slug isn't a focus skill, so it's safe to call for ANY completed lesson.
 * Best-effort — never throws into the caller's completion flow.
 */
export async function resolveFocusForSlug(studentId: string, slug: string): Promise<void> {
  if (!slug) return
  const idBySlug = await resolveSkillIdsBySlug([slug])
  const skillId = idBySlug.get(slug)
  if (!skillId) return
  try {
    const { error } = await supabase
      .from('student_focus_skills')
      .update({ resolved_at: new Date().toISOString() })
      .eq('student_id', studentId)
      .eq('skill_id', skillId)
      .is('resolved_at', null)
    if (error) console.error('resolveFocusForSlug update failed', { error, studentId, slug })
  } catch (err) {
    console.error('resolveFocusForSlug threw', err)
  }
}
