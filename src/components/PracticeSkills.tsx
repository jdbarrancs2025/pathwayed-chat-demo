import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router'
import { listPracticeableSkills, type PracticeableSkill } from '@/lib/questions'
import { subjectDisplayName } from '@/lib/subjects'

/**
 * Dashboard practice picker. Lists the skills that actually have published
 * questions (grouped by subject) and starts a practice session for the one the
 * student taps. Only practiceable skills appear — no dead ends. Renders nothing
 * until the skills load, and nothing at all if none are practiceable yet, so the
 * dashboard doesn't show an empty "Practice" shell.
 */

const SUBJECT_ACCENT: Record<string, string> = {
  math: 'var(--math)',
  reading: 'var(--reading)',
  writing: 'var(--writing)',
  science: 'var(--science)',
}

function accentFor(subject: string): string {
  return SUBJECT_ACCENT[subject] ?? 'var(--grow)'
}

export function PracticeSkills({ studentId }: { studentId: string }) {
  const navigate = useNavigate()
  const [skills, setSkills] = useState<PracticeableSkill[] | null>(null)

  useEffect(() => {
    let active = true
    listPracticeableSkills().then((s) => {
      if (active) setSkills(s)
    })
    return () => {
      active = false
    }
  }, [])

  // Nothing to show until loaded, and nothing at all if no skill is practiceable.
  if (!skills || skills.length === 0) return null

  // Group the already-sorted (subject, then name) list into subject sections.
  const groups: { subject: string; skills: PracticeableSkill[] }[] = []
  for (const s of skills) {
    const last = groups[groups.length - 1]
    if (last && last.subject === s.subject) last.skills.push(s)
    else groups.push({ subject: s.subject, skills: [s] })
  }

  return (
    <section className="panel practice-picker">
      <h3>Show what you know</h3>
      <p className="muted practice-picker-sub">
        Pick a skill and try it on your own, then get instant feedback.
      </p>
      {groups.map((group) => (
        <div key={group.subject} className="subj-group">
          <div className="subj-head">
            <span className="dot" style={{ background: accentFor(group.subject) }} />
            {subjectDisplayName(group.subject)}
          </div>
          <div className="practice-skill-list">
            {group.skills.map((s) => (
              <button
                key={s.skill_id}
                type="button"
                className="practice-skill"
                onClick={() => navigate(`/students/${studentId}/practice/${s.slug}`)}
              >
                <span className="practice-skill-name">{s.name}</span>
                <span className="practice-skill-go" aria-hidden="true">
                  ›
                </span>
              </button>
            ))}
          </div>
        </div>
      ))}
    </section>
  )
}
