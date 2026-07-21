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
import { STANDIN_SUBJECT, questionTypeLabel, standinSkillFor } from '@/lib/prep/standinSkills'
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
        module.sections.flatMap((sec) => sec.questionTypes.map((t) => standinSkillFor(t)).filter((x): x is string => !!x)),
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
    const slug = standinSkillFor(questionType)
    if (!slug || !id) return
    if (tab === 'train') {
      navigate(`/students/${id}/session/${STANDIN_SUBJECT}?skill=${encodeURIComponent(slug)}`)
    } else {
      navigate(`/students/${id}/practice/${encodeURIComponent(slug)}`)
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
              const slug = standinSkillFor(type)
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
        {tab === 'test' && <PrepTestTab />}
        {tab === 'progress' && <PrepProgressTab />}
      </div>
    </div>
  )
}

/**
 * Test tab. Placeholder for the timed engine. Intentionally self-contained with NO
 * Nikki / lesson imports — the timed test experience never involves Nikki, so this
 * component is where the timed engine drops in later without touching anything else.
 */
function PrepTestTab() {
  return (
    <div className="panel" style={{ padding: '22px 18px', textAlign: 'center' }}>
      <div style={{ fontSize: 34, marginBottom: 6 }}>⏱️</div>
      <h3 style={{ margin: '0 0 6px' }}>Timed practice is coming soon</h3>
      <p className="muted" style={{ margin: '0 auto', maxWidth: 340, fontSize: 13.5 }}>
        Full timed sections and practice tests, just like the real thing, are on the way. For now,
        head to Train and Practice to build up each skill.
      </p>
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
