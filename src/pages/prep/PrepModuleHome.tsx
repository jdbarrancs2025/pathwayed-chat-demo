import { useEffect, useMemo, useState } from 'react'
import { useNavigate, useParams, useSearchParams } from 'react-router'
import { getStudent, type Student } from '@/lib/students'
import { getPrepModule } from '@/lib/prep/registry'
import type { PrepModule, PrepSection } from '@/lib/prep/types'
import {
  getPrepEntitlements,
  getPrepSettings,
  isKidEntitled,
  testDayCountdown,
} from '@/lib/prep/entitlements'
import { prepSkillFor, questionTypeLabel } from '@/lib/prep/prepSkills'
import { listAttempts, type PrepAttempt } from '@/lib/prep/timedSection'
import { getSkillMastery } from '@/lib/mastery'
import { resolveSkillIdsBySlug } from '@/lib/skills'
import { TopMenu } from '@/components/TopMenu'
import '@/styles/app-screens.css'

type Tab = 'train' | 'practice' | 'test' | 'progress'
const TABS: { id: Tab; label: string }[] = [
  { id: 'train', label: 'Train' },
  { id: 'practice', label: 'Practice' },
  { id: 'test', label: 'Test' },
  { id: 'progress', label: 'Progress' },
]

const tabBtn = (on: boolean): React.CSSProperties => ({
  flex: 1,
  padding: '9px 6px',
  borderRadius: 9,
  fontWeight: 700,
  fontSize: 13.5,
  cursor: 'pointer',
  border: 'none',
  background: on ? '#003078' : 'transparent',
  color: on ? '#fff' : '#5A6172',
})

/**
 * Kid-facing prep module home. Guarded: the child must be signed in and hold an
 * ACTIVE entitlement for this module, else we send them back to kid home. Four
 * tabs: Train and Practice launch the existing Nikki lesson + untimed practice
 * flows against the stand-in skill mapping; Test and Progress are friendly
 * placeholders for now.
 *
 * The Test tab is deliberately isolated (its own component, no Nikki imports) so
 * the timed engine can replace its body later without touching the rest, and so
 * Nikki never appears anywhere labeled Test.
 *
 * Kid surface: no money / subscription / cancellation language anywhere.
 */
export function PrepModuleHome() {
  const { id, moduleId } = useParams<{ id: string; moduleId: string }>()
  const navigate = useNavigate()
  const [searchParams, setSearchParams] = useSearchParams()

  const module = moduleId ? getPrepModule(moduleId as PrepModule['id']) : undefined

  const [student, setStudent] = useState<Student | null>(null)
  const [entitled, setEntitled] = useState<boolean | null>(null)
  const [testDate, setTestDate] = useState<string | null>(null)
  // Stand-in skill slug -> accuracy (0-100) when there is graded evidence, else null.
  const [slugAccuracy, setSlugAccuracy] = useState<Map<string, number | null>>(new Map())

  const rawTab = searchParams.get('tab')
  const tab: Tab = TABS.some((t) => t.id === rawTab) ? (rawTab as Tab) : 'train'
  const setTab = (t: Tab) => setSearchParams({ tab: t }, { replace: true })

  useEffect(() => {
    if (!id || !moduleId) return
    let active = true
    getStudent(id).then(async (s) => {
      if (!active) return
      if (!s) {
        navigate('/students', { replace: true })
        return
      }
      // Access: signed in + ACTIVE entitlement for this module. Nothing else.
      const ents = await getPrepEntitlements([id])
      if (!active) return
      const ok = !!module && ents.some((e) => e.moduleId === moduleId && isKidEntitled(e.status))
      if (!ok) {
        navigate(`/students/${id}`, { replace: true })
        return
      }
      setStudent(s)
      setEntitled(true)

      const settings = await getPrepSettings([id])
      if (active) setTestDate(settings.get(`${id}:${moduleId}`) ?? null)
    })
    return () => {
      active = false
    }
  }, [id, moduleId, module, navigate])

  // Per-type progress: resolve the stand-in slugs to skill ids, then read mastery.
  useEffect(() => {
    if (!student || !module) return
    let active = true
    const slugs = Array.from(
      new Set(
        module.sections.flatMap((sec) => sec.questionTypes.map((t) => prepSkillFor(t)?.slug).filter((x): x is string => !!x)),
      ),
    )
    if (slugs.length === 0) return
    Promise.all([resolveSkillIdsBySlug(slugs), getSkillMastery(student.id)]).then(([idBySlug, mastery]) => {
      if (!active) return
      const accById = new Map(mastery.map((m) => [m.skill_id, m.attempts_counted > 0 ? m.accuracy : null]))
      const next = new Map<string, number | null>()
      for (const slug of slugs) {
        const skillId = idBySlug.get(slug)
        next.set(slug, skillId ? accById.get(skillId) ?? null : null)
      }
      setSlugAccuracy(next)
    })
    return () => {
      active = false
    }
  }, [student, module])

  const countdown = useMemo(() => testDayCountdown(testDate), [testDate])

  if (!module) {
    // Unknown module id — bounce to the picker rather than render nothing.
    navigate('/students', { replace: true })
    return null
  }

  if (entitled === null || !student) {
    return (
      <div className="kid-screen">
        <div className="shell">
          <p className="muted">Loading…</p>
        </div>
      </div>
    )
  }

  const launchType = (questionType: string) => {
    const ref = prepSkillFor(questionType)
    if (!ref || !id) return
    if (tab === 'train') {
      navigate(`/students/${id}/session/${ref.sessionSubject}?skill=${encodeURIComponent(ref.slug)}`)
    } else {
      navigate(`/students/${id}/practice/${encodeURIComponent(ref.slug)}`)
    }
  }

  const renderSections = () => (
    <div style={{ display: 'grid', gap: 14 }}>
      <p className="muted" style={{ fontSize: 13.5, margin: 0 }}>
        {tab === 'train'
          ? 'Pick a topic and we’ll work through it together.'
          : 'Pick a topic for a short set of practice questions.'}
      </p>
      {module.sections.map((sec: PrepSection) => (
        <div key={sec.id} className="panel" style={{ padding: '14px 16px' }}>
          <h3 style={{ margin: '0 0 8px' }}>{sec.name}</h3>
          <div style={{ display: 'grid', gap: 6 }}>
            {sec.questionTypes.map((type) => {
              const slug = prepSkillFor(type)?.slug ?? null
              const acc = slug ? slugAccuracy.get(slug) ?? null : null
              return (
                <button
                  key={type}
                  type="button"
                  className="bigcard"
                  style={{ padding: '10px 12px' }}
                  disabled={!slug}
                  onClick={() => launchType(type)}
                >
                  <div style={{ flex: 1, textAlign: 'left' }}>
                    <h3 style={{ fontSize: 15, margin: 0 }}>{questionTypeLabel(type)}</h3>
                  </div>
                  {acc != null && (
                    <span
                      style={{
                        fontSize: 12.5,
                        fontWeight: 700,
                        color: '#1F9E6F',
                        background: '#E7F5EF',
                        padding: '3px 9px',
                        borderRadius: 999,
                        flexShrink: 0,
                      }}
                    >
                      {Math.round(acc)}%
                    </span>
                  )}
                </button>
              )
            })}
          </div>
        </div>
      ))}
    </div>
  )

  return (
    <div className="kid-screen">
      <div className="shell">
        <TopMenu />

        <div style={{ textAlign: 'center', margin: '10px 0 18px' }}>
          <h1 className="greet" style={{ marginBottom: 2 }}>{module.name} Prep</h1>
          <p className="muted" style={{ margin: 0 }}>{countdown ?? 'Let’s get ready, one section at a time.'}</p>
        </div>

        <div style={{ display: 'flex', gap: 6, background: '#F4EEE4', padding: 4, borderRadius: 12, marginBottom: 16 }}>
          {TABS.map((t) => (
            <button key={t.id} type="button" style={tabBtn(tab === t.id)} onClick={() => setTab(t.id)}>
              {t.label}
            </button>
          ))}
        </div>

        {(tab === 'train' || tab === 'practice') && renderSections()}
        {tab === 'test' && <PrepTestTab studentId={student.id} module={module} />}
        {tab === 'progress' && <PrepProgressTab />}
      </div>
    </div>
  )
}

/** Minutes label for a section time limit, e.g. 960 -> "16 min". */
function minutesLabel(sec: number): string {
  return `${Math.round(sec / 60)} min`
}

/** Friendly date for a past attempt, e.g. "Jul 21". */
function shortDate(iso: string | null): string {
  if (!iso) return ''
  const d = new Date(iso)
  return isNaN(d.getTime()) ? '' : d.toLocaleDateString('en-US', { month: 'short', day: 'numeric' })
}

/**
 * Test tab. Lists the module's timed sections (from config, essay excluded — the
 * MCQ engine doesn't grade essays), a disabled "Full test" that ships after single
 * sections prove out, and the child's past attempts. Launching a section navigates
 * to the dedicated timed route, which has NO Nikki — this component and the timed
 * engine stay Nikki-free; explanations return only on the review screen.
 */
function PrepTestTab({ studentId, module }: { studentId: string; module: PrepModule }) {
  const navigate = useNavigate()
  const [attempts, setAttempts] = useState<PrepAttempt[]>([])

  useEffect(() => {
    let active = true
    listAttempts(studentId, module.id).then((a) => {
      if (active) setAttempts(a.filter((x) => x.status === 'submitted' || x.status === 'expired'))
    })
    return () => {
      active = false
    }
  }, [studentId, module.id])

  const timedSections = module.sections.filter((s) => !s.essay)
  const sectionName = (sid: string) => module.sections.find((s) => s.id === sid)?.name ?? sid

  return (
    <div style={{ display: 'grid', gap: 14 }}>
      <p className="muted" style={{ fontSize: 13.5, margin: 0 }}>
        Take a timed section, just like the real test.
      </p>

      <div style={{ display: 'grid', gap: 8 }}>
        {timedSections.map((sec) => (
          <button
            key={sec.id}
            type="button"
            className="bigcard"
            style={{ padding: '12px 14px' }}
            onClick={() => navigate(`/students/${studentId}/prep/${module.id}/section/${sec.id}`)}
          >
            <div style={{ flex: 1, textAlign: 'left' }}>
              <h3 style={{ fontSize: 15, margin: 0 }}>{sec.name}</h3>
              <p style={{ margin: '2px 0 0', fontSize: 12.5, color: '#5A6172' }}>
                {sec.questionCount} questions · {minutesLabel(sec.timeLimitSec)}
              </p>
            </div>
            <span style={{ fontSize: 20 }}>⏱️</span>
          </button>
        ))}

        {/* Full test — data model supports it (full_test_group_id) but the UI ships
            after single sections prove out. */}
        <div
          className="bigcard"
          aria-disabled="true"
          style={{ padding: '12px 14px', opacity: 0.6, cursor: 'default' }}
        >
          <div style={{ flex: 1, textAlign: 'left' }}>
            <h3 style={{ fontSize: 15, margin: 0 }}>Full test</h3>
            <p style={{ margin: '2px 0 0', fontSize: 12.5, color: '#5A6172' }}>Coming soon</p>
          </div>
        </div>
      </div>

      {attempts.length > 0 && (
        <div>
          <h3 style={{ fontSize: 14, margin: '4px 0 8px' }}>Past attempts</h3>
          <div style={{ display: 'grid', gap: 6 }}>
            {attempts.map((a) => (
              <button
                key={a.id}
                type="button"
                className="panel"
                style={{ padding: '10px 12px', display: 'flex', alignItems: 'center', justifyContent: 'space-between', gap: 10, cursor: 'pointer', border: '1.4px solid #ECE4D8' }}
                onClick={() => navigate(`/students/${studentId}/prep/${module.id}/review/${a.id}`)}
              >
                <span style={{ fontSize: 13.5, color: '#1C2230' }}>
                  {sectionName(a.sectionId)}
                  <span className="muted" style={{ fontSize: 12 }}> · {shortDate(a.startedAt)}{a.status === 'expired' ? ' · timed out' : ''}</span>
                </span>
                <b style={{ fontSize: 14, color: '#003078' }}>{a.score != null ? `${Math.round(a.score * 100)}%` : '—'}</b>
              </button>
            ))}
          </div>
        </div>
      )}
    </div>
  )
}

/** Progress tab. Placeholder until the progress view is built. */
function PrepProgressTab() {
  return (
    <div className="panel" style={{ padding: '22px 18px', textAlign: 'center' }}>
      <div style={{ fontSize: 34, marginBottom: 6 }}>📈</div>
      <h3 style={{ margin: '0 0 6px' }}>Your progress is coming soon</h3>
      <p className="muted" style={{ margin: '0 auto', maxWidth: 340, fontSize: 13.5 }}>
        You’ll see how each section is shaping up here. Keep practicing and this will fill in.
      </p>
    </div>
  )
}
