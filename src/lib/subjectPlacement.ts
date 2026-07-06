import { supabase } from '@/lib/supabase'
import { gradeBand } from '@/lib/gradeBand'
import type { ScopeSubject } from '@/lib/scopeSequence'

/**
 * Parent-facing per-subject placement, derived from the stored diagnostic answers
 * (question_attempts where is_diagnostic). Recomputed on view (a retake updates
 * it). The CHILD never sees this — it lives only in the parent dashboard. Five
 * levels, each paired with a next step so a band is direction, never a verdict.
 */

export type PlacementLevel = 'below' | 'slightly-below' | 'on' | 'slightly-above' | 'above'

export interface SubjectPlacement {
  subject: ScopeSubject
  level: PlacementLevel
  answered: number
}

const BAND_ORDER = ['k-2', '3-5', '6-8', '9-12']
const SUBJECTS: ScopeSubject[] = ['math', 'reading', 'writing']

type Answer = { position: 'below' | 'at' | 'above'; isCorrect: boolean }

function fractionAt(answers: Answer[], position: Answer['position']): number | null {
  const subset = answers.filter((a) => a.position === position)
  if (!subset.length) return null
  return subset.filter((a) => a.isCorrect).length / subset.length
}

/** Map diagnostic answers (positioned relative to the student's grade band) to a level. */
export function computeLevel(answers: Answer[]): PlacementLevel {
  const at = fractionAt(answers, 'at')
  const above = fractionAt(answers, 'above')
  const below = fractionAt(answers, 'below')

  if (above !== null && above >= 0.6) return 'above'
  if (at !== null && at >= 0.7) {
    return above !== null && above >= 0.34 ? 'slightly-above' : 'on'
  }
  if (at !== null && at >= 0.4) return 'slightly-below'
  if (at !== null) return 'below'
  // No at-grade evidence — fall back to the below/above signal.
  if (below !== null && below < 0.5) return 'below'
  if (above !== null && above >= 0.6) return 'above'
  return 'on'
}

/**
 * Copy for a level, framed by consent. When the parent is grade-focused
 * (consent=false), above-grade results are softened to on-grade (lead with
 * on-grade), never emphasized. Every level returns a next step.
 */
export function placementCopy(
  level: PlacementLevel,
  subjectLabel: string,
  consent: boolean,
): { band: string; nextStep: string } {
  const shown: PlacementLevel =
    !consent && (level === 'above' || level === 'slightly-above') ? 'on' : level
  const subj = subjectLabel.toLowerCase()
  const copy: Record<PlacementLevel, { band: string; nextStep: string }> = {
    below: {
      band: 'Building foundations',
      nextStep: `We'll start with the core ${subj} skills and build up from there.`,
    },
    'slightly-below': {
      band: 'A little below grade',
      nextStep: `We'll close a few small ${subj} gaps, then keep moving forward.`,
    },
    on: {
      band: 'On grade level',
      nextStep: `We'll keep ${subj} moving right on track.`,
    },
    'slightly-above': {
      band: 'A little ahead of grade',
      nextStep: `We'll stretch into the next ${subj} skills.`,
    },
    above: {
      band: 'Ahead of grade',
      nextStep: `We'll keep the ${subj} challenges coming.`,
    },
  }
  return copy[shown]
}

/**
 * Per-subject placement for the parent, derived from this student's diagnostic
 * attempts. Uses the latest attempt per skill (so a retake updates the picture).
 * Returns only subjects that have diagnostic answers. Best-effort; [] on error.
 */
export async function getSubjectPlacements(studentId: string, grade: string): Promise<SubjectPlacement[]> {
  const { data: attempts, error } = await supabase
    .from('question_attempts')
    .select('skill_id, is_correct, created_at')
    .eq('student_id', studentId)
    .eq('is_diagnostic', true)
    .order('created_at', { ascending: true })
  if (error) console.error('getSubjectPlacements: attempts read failed', error)
  if (!attempts?.length) return []

  const skillIds = [...new Set(attempts.map((a) => a.skill_id).filter(Boolean))]
  const { data: skills } = await supabase
    .from('skills')
    .select('id, subject, grade_band')
    .in('id', skillIds)
  const meta = new Map((skills ?? []).map((s) => [s.id, { subject: s.subject, band: s.grade_band }]))

  // Latest attempt per skill (attempts are ascending, so the last write wins).
  const latestBySkill = new Map<string, boolean>()
  for (const a of attempts) latestBySkill.set(a.skill_id, a.is_correct)

  const atIdx = BAND_ORDER.indexOf(gradeBand(grade))
  const bySubject = new Map<ScopeSubject, Answer[]>()
  for (const [skillId, isCorrect] of latestBySkill) {
    const m = meta.get(skillId)
    if (!m?.subject || !m.band) continue
    if (m.subject !== 'math' && m.subject !== 'reading' && m.subject !== 'writing') continue
    const skIdx = BAND_ORDER.indexOf(m.band)
    const position: Answer['position'] = skIdx < atIdx ? 'below' : skIdx > atIdx ? 'above' : 'at'
    const arr = bySubject.get(m.subject) ?? []
    arr.push({ position, isCorrect })
    bySubject.set(m.subject, arr)
  }

  const out: SubjectPlacement[] = []
  for (const subject of SUBJECTS) {
    const answers = bySubject.get(subject)
    if (answers?.length) out.push({ subject, level: computeLevel(answers), answered: answers.length })
  }
  return out
}
