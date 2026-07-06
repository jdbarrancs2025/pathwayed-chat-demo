import { useEffect, useRef, useState } from 'react'
import { useNavigate, useParams, useSearchParams } from 'react-router'
import { getStudent, setAboveGradeConsent, type Student } from '@/lib/students'
import {
  fetchDiagnosticQuestions,
  listPracticeableSkills,
  recordQuestionAttempt,
  scoreChoice,
  type DiagnosticQuestion,
  type PracticeableSkill,
} from '@/lib/questions'
import { seedDiagnosticMastery } from '@/lib/skills'
import { diagnosticBands, shouldExtend, type DiagnosticResult } from '@/lib/diagnostic'
import { gradeBand } from '@/lib/gradeBand'
import {
  loadDiagnosticProgress,
  saveDiagnosticProgress,
  clearDiagnosticProgress,
} from '@/lib/diagnosticProgress'
import { MathText } from '@/components/MathText'
import { TopMenu } from '@/components/TopMenu'
import '@/styles/app-screens.css'

/**
 * Placement diagnostic — PHASE 2 (adaptive + placement). Still silent: present ->
 * record -> advance, with NO teaching feedback. Differences from Phase 1:
 *  - ADAPTIVE sampling: starts with the band below + at-grade band; if the
 *    student answers the at-grade questions well (shouldExtend), it extends up to
 *    the band above. Struggling kids get a short at-and-below check; strong kids
 *    earn into above-grade questions.
 *  - PLACEMENT: at the end it seeds student_skill_mastery from the answers
 *    (correct 60 / wrong 25) and recomputes readiness, so the dashboard/path pick
 *    up at the student's real level. A plain summary is shown on completion.
 * Still behind the direct /students/:id/diagnostic route; not wired into onboarding.
 */
/** Only honor a known same-app return path (guards against open redirects):
 *  this student's own routes, or the parent dashboard (parent-triggered reassess). */
function resolveReturn(raw: string | null, studentId: string): string {
  if (raw && (raw.startsWith(`/students/${studentId}`) || raw === '/parent')) return raw
  return `/students/${studentId}`
}

export function Diagnostic() {
  const { id } = useParams<{ id: string }>()
  const [searchParams] = useSearchParams()
  const navigate = useNavigate()

  const [student, setStudent] = useState<Student | null>(null)
  const [questions, setQuestions] = useState<DiagnosticQuestion[] | null>(null)
  const [atBand, setAtBand] = useState('')
  const [extensionSkills, setExtensionSkills] = useState<PracticeableSkill[]>([])
  const [index, setIndex] = useState(0)
  const [results, setResults] = useState<DiagnosticResult[]>([])
  const [extended, setExtended] = useState(false)
  const [busy, setBusy] = useState(false) // fetching the extension, or seeding at the end
  const [done, setDone] = useState(false)
  const [started, setStarted] = useState(false)
  const [consent, setConsent] = useState(false) // parent OK to show above-grade / SAT framing
  const shownAtRef = useRef(0)

  useEffect(() => {
    if (!id) return
    let active = true
    ;(async () => {
      const s = await getStudent(id)
      if (!active) return
      if (!s) {
        navigate('/students', { replace: true })
        return
      }
      setStudent(s)

      // A reassessment (?fresh=1) always starts clean; otherwise resume a paused
      // run (device-local) instead of re-fetching a new set.
      if (searchParams.get('fresh')) clearDiagnosticProgress(s.id)
      const saved = searchParams.get('fresh') ? null : loadDiagnosticProgress(s.id)
      if (saved) {
        setConsent(saved.consent)
        setStarted(saved.started)
        setQuestions(saved.questions)
        setAtBand(saved.atBand)
        setExtensionSkills(saved.extensionSkills)
        setIndex(saved.index)
        setResults(saved.results)
        setExtended(saved.extended)
        return
      }

      // Fresh assembly.
      const practiceable = await listPracticeableSkills()
      if (!active) return
      const inBand = (bands: string[]) => (sk: PracticeableSkill) => !!sk.grade_band && bands.includes(sk.grade_band)
      const { initial, extension } = diagnosticBands(s.grade)
      let initialSkills = practiceable.filter(inBand(initial))
      let extSkills = practiceable.filter(inBand(extension))
      let at = gradeBand(s.grade) as string
      // If the grade's own band has no practiceable skills (e.g. K-2 math), start
      // at the next band up and don't extend further.
      if (!initialSkills.length && extSkills.length) {
        initialSkills = extSkills
        at = extension[0] ?? at
        extSkills = []
      }
      const qs = await fetchDiagnosticQuestions(initialSkills)
      if (!active) return
      setAtBand(at)
      setExtensionSkills(extSkills)
      setQuestions(qs)
    })()
    return () => {
      active = false
    }
  }, [id, navigate])

  // Persist the running assessment so it can be paused and resumed. Only once
  // started and before completion (finishing clears it in finish()).
  useEffect(() => {
    if (!student || !started || done || !questions) return
    saveDiagnosticProgress(student.id, {
      consent,
      started,
      questions,
      atBand,
      extensionSkills,
      index,
      results,
      extended,
    })
  }, [student, started, done, questions, atBand, extensionSkills, index, results, extended, consent])

  // Stamp the presented-at time whenever a new question is shown, including when
  // the quiz starts (so reading the consent intro isn't counted). Date.now() is
  // only valid outside render, so it lives in an effect, not the click handler.
  useEffect(() => {
    shownAtRef.current = Date.now()
  }, [index, questions, started])

  // Parent-consent step: record the above-grade framing choice, then begin. Either
  // choice proceeds to the same questions — consent governs framing, not learning.
  const handleStart = (ok: boolean) => {
    if (!student) return
    setConsent(ok)
    void setAboveGradeConsent(student.id, ok)
    setStarted(true)
  }

  const finish = async (allResults: DiagnosticResult[], stu: Student) => {
    setBusy(true)
    // The real placement is the seeded mastery (behind the scenes); the kid never
    // sees a score or band. Parent-facing per-subject bands are derived separately
    // from the stored diagnostic attempts.
    await seedDiagnosticMastery(
      stu.id,
      allResults.map((r) => ({ skillId: r.skillId, isCorrect: r.isCorrect })),
    )
    clearDiagnosticProgress(stu.id)
    setBusy(false)
    setDone(true)
  }

  // After the last question in the current list: adaptively extend upward, or finish.
  const afterList = async (allResults: DiagnosticResult[], stu: Student) => {
    if (!extended && extensionSkills.length && shouldExtend(allResults, atBand)) {
      setBusy(true)
      const more = await fetchDiagnosticQuestions(extensionSkills)
      setExtended(true)
      setBusy(false)
      if (more.length) {
        setQuestions((qs) => [...(qs ?? []), ...more])
        setIndex((i) => i + 1)
        return
      }
    }
    await finish(allResults, stu)
  }

  // Silent scoring: score, record the attempt, accumulate the result, advance.
  const handlePick = (choiceIndex: number) => {
    if (!student || !questions || busy) return
    const current = questions[index]
    if (!current) return
    const { isCorrect, misconceptionToken } = scoreChoice(current.choices, choiceIndex)
    void recordQuestionAttempt({
      studentId: student.id,
      generatedQuestionId: current.id,
      skillId: current.skill_id,
      satAlignment: current.sat_alignment,
      isCorrect,
      chosenChoiceIndex: choiceIndex,
      chosenMisconceptionToken: misconceptionToken,
      shownAtMs: shownAtRef.current,
      isDiagnostic: true,
    })
    const nextResults = [...results, { skillId: current.skill_id, band: current.grade_band ?? '', isCorrect }]
    setResults(nextResults)
    if (index + 1 < questions.length) {
      setIndex(index + 1)
    } else {
      void afterList(nextResults, student)
    }
  }

  if (!student || !questions || busy) {
    return (
      <div className="kid-screen">
        <div className="shell">
          <p className="muted">{busy ? 'Finding the right level for you…' : 'Loading…'}</p>
        </div>
      </div>
    )
  }

  if (questions.length === 0) {
    return (
      <div className="kid-screen">
        <div className="shell">
          <TopMenu />
          <h1 className="greet">Check back soon</h1>
          <p className="muted">No diagnostic questions are ready yet.</p>
          <button className="btn btn-navy" onClick={() => navigate(`/students/${student.id}`)}>
            Back to my dashboard
          </button>
        </div>
      </div>
    )
  }

  if (done) {
    // No score, no band, no verdict to the child — just a positive forward line
    // and straight into learning.
    return (
      <div className="kid-screen">
        <div className="shell">
          <TopMenu />
          <h1 className="greet">Perfect — I know just where to start you!</h1>
          <p className="muted">Great effort, {student.first_name}. Let’s jump into your first lesson.</p>
          <button
            className="btn btn-navy"
            style={{ marginTop: 14 }}
            onClick={() => navigate(resolveReturn(searchParams.get('return'), student.id))}
          >
            Let’s go →
          </button>
        </div>
      </div>
    )
  }

  // Parent-consent step (above-grade / SAT framing) before the questions begin.
  if (!started) {
    return (
      <div className="kid-screen">
        <div className="shell">
          <TopMenu />
          <h1 className="greet">Let’s find {student.first_name}’s level</h1>
          <div className="panel">
            <p className="muted" style={{ margin: '0 0 10px' }}>
              A few quick questions help us start {student.first_name} at the right level — not too easy, not too
              hard. There’s nothing to study; they just answer what they can.
            </p>
            <p className="muted" style={{ margin: '0 0 10px' }}>
              Sometimes a child is ready for work beyond their grade. For example, if your 1st grader reads at a
              3rd-grade level, we can let them move ahead. Is that okay with you?
            </p>
            <p className="muted" style={{ margin: 0, fontSize: 12.5 }}>
              Either way, {student.first_name} practices at the level that fits them — your choice only controls
              whether we show above-grade and SAT progress.
            </p>
          </div>
          <button className="btn btn-navy" onClick={() => handleStart(true)}>
            Yes — let {student.first_name} get ahead when ready
          </button>
          <button className="btn btn-soft" style={{ marginTop: 10 }} onClick={() => handleStart(false)}>
            Keep it grade-focused for now
          </button>
        </div>
      </div>
    )
  }

  const current = questions[index]
  return (
    <div className="kid-screen">
      <div className="shell">
        <TopMenu />
        <p className="practice-solo">Just do your best — this helps us find the right level for you.</p>
        <div className="practice-progress muted">
          Question {index + 1} of {questions.length}
        </div>
        <div className="panel practice-q">
          <div className="practice-stem">
            <MathText content={current.stem} />
          </div>
          <div className="practice-choices">
            {current.choices.map((c, i) => (
              <button key={i} className="practice-choice" onClick={() => handlePick(i)}>
                <MathText content={c.text} />
              </button>
            ))}
          </div>
        </div>
      </div>
    </div>
  )
}
