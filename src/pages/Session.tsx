import { useEffect, useRef, useState } from 'react'
import { useNavigate, useParams, useSearchParams } from 'react-router'
import { getStudent, avatarModeOf, type Student } from '@/lib/students'
import { loadTranscript, saveFeedback } from '@/lib/sessions'
import { subjectDisplayName } from '@/lib/subjects'
import { skillLabel, scopeBandForGrade, isScopeSubject } from '@/lib/lessonPath'
import { useSessionChat, type ChatMessage } from '@/hooks/useSessionChat'
import { useAudioRecorder } from '@/hooks/useAudioRecorder'
import { useConversationMic } from '@/hooks/useConversationMic'
import { CallStage, type CallState } from '@/components/CallStage'
import { SessionWorkspace } from '@/components/SessionWorkspace'
import { SessionFeedback } from '@/components/SessionFeedback'
import { NikkiFace } from '@/components/NikkiFace'
import { MathText } from '@/components/MathText'
import { NikkiMarkdown } from '@/components/chat/NikkiMarkdown'
import { recordSessionMastery } from '@/lib/skills'
import { resolveFocusForSlug } from '@/lib/focusSkills'
import { speakWithNikki, stopNikkiSpeech } from '@/lib/voice'
import { stripMarkdownForTTS } from '@/lib/stripMarkdownForTTS'
import { transcribeAudio } from '@/lib/transcribe'
import '@/styles/app-screens.css'

const VALID_SUBJECTS = new Set(['math', 'reading', 'writing', 'science', 'homework'])

// Rating cap: offer the end-of-lesson rating at most once per browser visit
// ("session"), not once per lesson. sessionStorage is per-tab and clears when the
// visit ends — exactly the granularity we want.
const ratedKey = (studentId: string) => `pathwayed:ratedThisSession:${studentId}`
function ratingUsedThisSession(studentId: string): boolean {
  try {
    return sessionStorage.getItem(ratedKey(studentId)) === '1'
  } catch {
    return false
  }
}
function markRatingUsed(studentId: string): void {
  try {
    sessionStorage.setItem(ratedKey(studentId), '1')
  } catch {
    /* private mode / storage full — the cap is a nicety, ignore */
  }
}

// Neutral mastery signal for a completed lesson when no rating was collected
// (every completion after the first this visit). 'ok' maps to a mid accuracy —
// completing counts as steady practice, not a strong or weak read.
const NEUTRAL_COMPLETION_RATING = 'ok'

// Speak in Nikki's ElevenLabs voice (falls back to the browser voice on
// failure). setSpeaking drives the avatar's speaking ring while audio plays.
function speak(text: string, setSpeaking: (v: boolean) => void) {
  void speakWithNikki(text, {
    onStart: () => setSpeaking(true),
    onEnd: () => setSpeaking(false),
  })
}

function stopSpeak(setSpeaking: (v: boolean) => void) {
  stopNikkiSpeech()
  setSpeaking(false)
}

/** Id of the last assistant message, or null — used to avoid auto-speaking a
 *  message that's already on screen when the session mounts. */
function lastAssistantId(msgs: ChatMessage[]): string | null {
  for (let i = msgs.length - 1; i >= 0; i--) {
    if (msgs[i].role === 'assistant') return msgs[i].id
  }
  return null
}

function makeGreeting(
  name: string,
  subject: string,
  focusLabel?: string | null,
  isHomework?: boolean,
  fromSat?: boolean,
): string {
  if (subject === 'homework' || isHomework) {
    const subjPhrase = subject === 'homework' ? '' : ` ${subjectDisplayName(subject).toLowerCase()}`
    return `Hi ${name}! I'm Nikki. Upload a photo or PDF of your${subjPhrase} homework using the panel on the right, and we'll work through it together. You can also just tell me what it's about.`
  }
  if (focusLabel) {
    const satPhrase = fromSat ? ` This came up in your SAT Math practice, so let's strengthen it.` : ''
    return `Hi ${name}! I'm Nikki. Today we're working on ${focusLabel}.${satPhrase} I might ask a quick question first to see what you already know, then we'll learn it together. Ready to start?`
  }
  return `Hi ${name}! I'm Nikki. I'm glad you're here. What are we working on in ${subjectDisplayName(subject).toLowerCase()} today? You can ask me a question, or use the workspace on the right to show me your work.`
}

interface ReadyState {
  student: Student
  initialMessages: ChatMessage[]
  focusLabel: string | null
  focusSlug: string | null
  transcriptKey: string
  homeworkMode: boolean
}

export function Session() {
  const { id, subject } = useParams<{ id: string; subject: string }>()
  const [searchParams] = useSearchParams()
  const focusSlug = searchParams.get('skill')
  const isHomework = searchParams.get('mode') === 'homework'
  const fromSat = searchParams.get('from') === 'sat'
  const navigate = useNavigate()
  const [ready, setReady] = useState<ReadyState | null>(null)

  useEffect(() => {
    if (!id || !subject || !VALID_SUBJECTS.has(subject)) {
      navigate('/students', { replace: true })
      return
    }
    // Transcript is keyed per skill (subject:skill) so each new lesson opens fresh
    // and re-entering the same skill resumes; homework/plain sessions key on subject.
    const transcriptKey = focusSlug ? `${subject}:${focusSlug}` : subject
    let active = true
    Promise.all([getStudent(id), loadTranscript(id, transcriptKey)]).then(([s, saved]) => {
      if (!active) return
      if (!s) {
        navigate('/students', { replace: true })
        return
      }
      // Skills-building launches carry ?skill=<slug>; name it so the lesson is
      // focused (the diagnose-first prompt then checks that skill before teaching).
      const band = scopeBandForGrade(s.grade)
      const focusLabel =
        focusSlug && band && isScopeSubject(subject) ? skillLabel(band, subject, focusSlug) : null
      const initialMessages: ChatMessage[] = saved.length
        ? saved.map((m, i) => ({ id: `saved-${i}`, role: m.role, content: m.content }))
        : [
            {
              id: 'greeting',
              role: 'assistant',
              content: makeGreeting(s.first_name, subject, focusLabel, isHomework, fromSat),
            },
          ]
      setReady({ student: s, initialMessages, focusLabel, focusSlug, transcriptKey, homeworkMode: isHomework })
    })
    return () => {
      active = false
    }
  }, [id, subject, focusSlug, isHomework, fromSat, navigate])

  if (!ready || !subject) {
    return (
      <div className="session">
        <div className="feed">
          <p className="muted">Loading…</p>
        </div>
      </div>
    )
  }

  return (
    <SessionView
      student={ready.student}
      subject={subject}
      initialMessages={ready.initialMessages}
      focusLabel={ready.focusLabel}
      focusSlug={ready.focusSlug}
      transcriptKey={ready.transcriptKey}
      homeworkMode={ready.homeworkMode}
    />
  )
}

function SessionView({
  student,
  subject,
  initialMessages,
  focusLabel,
  focusSlug,
  transcriptKey,
  homeworkMode,
}: {
  student: Student
  subject: string
  initialMessages: ChatMessage[]
  focusLabel: string | null
  focusSlug: string | null
  transcriptKey: string
  homeworkMode: boolean
}) {
  const navigate = useNavigate()
  const { messages, isLoading, sendMessage, sendImageTurn } = useSessionChat({
    studentId: student.id,
    subject,
    childName: student.first_name,
    grade: student.grade,
    level: student.level,
    focusAreas: focusLabel ? [focusLabel] : [],
    transcriptKey,
    initialMessages,
  })

  const [pane, setPane] = useState<'chat' | 'work'>('chat')
  // On wide screens the chat and workspace show side-by-side and the pane toggle
  // is hidden (see .panetabs @media <=900px), so `pane` stays 'chat'. Track the
  // breakpoint so the workspace counts as active/visible on desktop — otherwise
  // the MathLive field, which mounts only while the workspace is active, never
  // renders on desktop.
  const [isWide, setIsWide] = useState(
    () => typeof window !== 'undefined' && window.matchMedia('(min-width: 901px)').matches,
  )
  useEffect(() => {
    const mq = window.matchMedia('(min-width: 901px)')
    const onChange = () => setIsWide(mq.matches)
    mq.addEventListener('change', onChange)
    return () => mq.removeEventListener('change', onChange)
  }, [])
  // Nikki auto-speaks her responses by default; this mutes that (in-session).
  const [muted, setMuted] = useState(false)
  const [speaking, setSpeaking] = useState(false)
  const [draft, setDraft] = useState('')
  const [showLeaveWarning, setShowLeaveWarning] = useState(false)
  const [showRating, setShowRating] = useState(false)
  const [niceWork, setNiceWork] = useState(false)
  const [savingFeedback, setSavingFeedback] = useState(false)
  // Seed with the last message already on screen so resuming doesn't replay it.
  const spokenRef = useRef<string | null>(lastAssistantId(initialMessages))
  const feedRef = useRef<HTMLDivElement>(null)

  // Voice input. Reading uses continuous "conversation mode" (tap once, stays
  // listening); other subjects use tap-to-talk. Both transcribe via Whisper and
  // send the text exactly like a typed message.
  const isReading = subject === 'reading'
  const recorder = useAudioRecorder()
  const [transcribing, setTranscribing] = useState(false)
  const [micError, setMicError] = useState('')

  const handleUtterance = (blob: Blob, mime: string) => {
    setTranscribing(true)
    setMicError('')
    transcribeAudio(blob, mime)
      .then((text) => {
        if (text) void sendMessage(text)
      })
      .catch(() => setMicError("Sorry, I couldn't hear that. Try again or type your message."))
      .finally(() => setTranscribing(false))
  }

  // Conversation mode pauses capturing while Nikki is thinking/speaking (turn-taking).
  const convoMic = useConversationMic({
    onUtterance: handleUtterance,
    isPaused: () => speaking || isLoading || transcribing,
  })

  useEffect(() => {
    const f = feedRef.current
    if (f) f.scrollTop = f.scrollHeight
  }, [messages, isLoading])

  // Auto-speak each new completed Nikki response (unless muted). speakWithNikki
  // stops any prior audio first, so a newer message interrupts an older one.
  // Math/LaTeX is converted to speech-friendly text (no "backslash frac").
  useEffect(() => {
    if (muted || isLoading) return
    const last = messages[messages.length - 1]
    if (last && last.role === 'assistant' && last.content && last.id !== 'greeting' && spokenRef.current !== last.id) {
      spokenRef.current = last.id
      const spoken = stripMarkdownForTTS(last.content)
      if (spoken) speak(spoken, setSpeaking)
    }
  }, [muted, isLoading, messages])

  useEffect(() => () => stopSpeak(setSpeaking), [])

  // When a recording finishes, transcribe it and send it like a typed message.
  useEffect(() => {
    if (!recorder.audioBlob || !recorder.mimeType) return
    let cancelled = false
    setTranscribing(true)
    setMicError('')
    transcribeAudio(recorder.audioBlob, recorder.mimeType)
      .then((text) => {
        if (cancelled) return
        if (text) void sendMessage(text)
        else setMicError("I didn't catch that — try again or type your message.")
      })
      .catch(() => {
        if (!cancelled) setMicError("Sorry, I couldn't hear that. Try again or type your message.")
      })
      .finally(() => {
        if (!cancelled) setTranscribing(false)
      })
    return () => {
      cancelled = true
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [recorder.audioBlob, recorder.mimeType])

  // Surface a friendly message if mic permission is denied / unavailable.
  useEffect(() => {
    if (recorder.state === 'error' && recorder.error) setMicError(recorder.error)
  }, [recorder.state, recorder.error])
  useEffect(() => {
    if (convoMic.error) setMicError(convoMic.error)
  }, [convoMic.error])

  const toggleMic = () => {
    setMicError('')
    if (isReading) {
      // Conversation mode: tap once to start listening, tap again to stop.
      if (convoMic.active) convoMic.stop()
      else void convoMic.start()
    } else if (recorder.state === 'recording') {
      recorder.stopRecording()
    } else {
      void recorder.startRecording()
    }
  }

  const toggleMute = () => {
    setMuted((m) => {
      const next = !m
      if (next) {
        // Muting: stop any speech in progress.
        stopSpeak(setSpeaking)
      } else {
        // Unmuting: don't replay the message already on screen — only new ones.
        spokenRef.current = lastAssistantId(messages)
      }
      return next
    })
  }

  const send = () => {
    const text = draft
    setDraft('')
    void sendMessage(text)
  }

  const returnToWelcome = () => navigate(`/students/${student.id}`)

  // Academic OS Phase 1: record skill mastery from this session's transcript
  // (client-side under RLS). Best-effort — a failure here must never block the
  // child returning to their welcome.
  const recordMastery = async (rating: string) => {
    try {
      await recordSessionMastery({
        studentId: student.id,
        subject,
        grade: student.grade,
        messages: messages.map(({ role, content }) => ({ role, content })),
        rating,
      })
    } catch (err) {
      console.error('mastery recording failed', err)
    }
  }

  // Mid-lesson exit (the ✕): nothing is completed, so warn before leaving.
  const attemptLeave = () => setShowLeaveWarning(true)
  const confirmLeave = () => {
    stopSpeak(setSpeaking)
    convoMic.stop()
    returnToWelcome()
  }

  // Completing the lesson (the "Done" button). No forced rating per lesson: the
  // rating is offered at most ONCE per visit (first completion); every later
  // completion gets a brief "Nice work" close and a smooth return. A completed
  // lesson never shows the leave warning — nothing is lost.
  const completeLesson = () => {
    stopSpeak(setSpeaking)
    convoMic.stop()
    if (ratingUsedThisSession(student.id)) {
      void finishWithNiceWork()
    } else {
      setShowRating(true)
    }
  }

  // Practice-SAT Phase 2: completing a lesson on a focus skill resolves it (keyed
  // off the launch slug, so it's reliable even when the HS mastery signal isn't).
  // No-op for a non-focus lesson. Only on COMPLETION — leaving mid-lesson doesn't
  // count as addressing it.
  const resolveFocusIfAny = async () => {
    if (focusSlug) await resolveFocusForSlug(student.id, focusSlug)
  }

  // First completion of the visit: capture the rating (real mastery signal), then
  // return. The rating card ("Nice work, {name}!") is itself the positive close.
  const submitRating = async (rating: string, note: string) => {
    setSavingFeedback(true)
    markRatingUsed(student.id)
    await saveFeedback(student.id, subject, rating, note)
    await recordMastery(rating)
    await resolveFocusIfAny()
    setSavingFeedback(false)
    returnToWelcome()
  }

  // Later completions this visit: brief positive close, neutral mastery signal,
  // then a smooth auto-return. Mastery is awaited so the write isn't cut off.
  const finishWithNiceWork = async () => {
    setNiceWork(true)
    await recordMastery(NEUTRAL_COMPLETION_RATING)
    await resolveFocusIfAny()
    window.setTimeout(returnToWelcome, 900)
  }

  const callState: CallState = isLoading ? 'thinking' : speaking ? 'speaking' : 'idle'
  const avatarMode = avatarModeOf(student)
  const recording = isReading
    ? convoMic.active
    : recorder.state === 'recording' || recorder.state === 'requesting'

  const visibleMessages = messages.filter((m) => m.content.length > 0)
  const last = messages[messages.length - 1]
  const showTyping = isLoading && (!last || last.role !== 'assistant' || last.content.length === 0)

  return (
    <div className="session">
      <div className="shead">
        <div className="who">
          <div className="s1">{subjectDisplayName(subject)}</div>
          <div className="s2">{student.first_name}</div>
        </div>
        <button
          className={`iconbtn ${muted ? 'muted' : ''}`}
          title={muted ? "Unmute Nikki's voice" : "Mute Nikki's voice"}
          aria-label={muted ? "Unmute Nikki's voice" : "Mute Nikki's voice"}
          aria-pressed={muted}
          onClick={toggleMute}
        >
          {muted ? (
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
              <path d="M11 5 6 9H2v6h4l5 4z" />
              <line x1="23" y1="9" x2="17" y2="15" />
              <line x1="17" y1="9" x2="23" y2="15" />
            </svg>
          ) : (
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round">
              <path d="M11 5 6 9H2v6h4l5 4zM15.5 8.5a5 5 0 0 1 0 7M19 5a9 9 0 0 1 0 14" />
            </svg>
          )}
        </button>
        <button className="iconbtn" title="Leave lesson" aria-label="Leave lesson" onClick={attemptLeave}>
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <path d="M18 6 6 18M6 6l12 12" />
          </svg>
        </button>
        <button
          type="button"
          title="Finish this lesson"
          onClick={completeLesson}
          style={{
            flexShrink: 0,
            padding: '11px 20px',
            borderRadius: 999,
            border: 'none',
            background: 'var(--orange)',
            color: '#fff',
            fontWeight: 700,
            fontSize: 14.5,
            fontFamily: 'var(--body)',
            cursor: 'pointer',
          }}
        >
          Done
        </button>
      </div>

      <div className="panetabs">
        <button className={pane === 'chat' ? 'on' : ''} onClick={() => setPane('chat')}>
          Chat with Nikki
        </button>
        <button className={pane === 'work' ? 'on' : ''} onClick={() => setPane('work')}>
          Workspace
        </button>
      </div>

      <div className="work" data-pane={pane}>
        <div className="chatpane">
          <CallStage state={callState} mode={avatarMode} />
          <div className="feed" ref={feedRef}>
            {visibleMessages.map((m) => (
              <div key={m.id} className={`msg ${m.role === 'assistant' ? 'nikki' : 'me'}`}>
                {m.role === 'assistant' ? (
                  <NikkiMarkdown content={m.content} />
                ) : (
                  <MathText content={m.content} />
                )}
              </div>
            ))}
            {showTyping && (
              <div className="typing">
                <i />
                <i />
                <i />
              </div>
            )}
          </div>
          {(recording || transcribing || micError) && (
            <div className={`mic-status ${micError ? 'err' : ''}`}>
              {micError
                ? micError
                : transcribing
                  ? 'Transcribing…'
                  : isReading
                    ? '🎙️ Listening — say it out loud. Tap the mic to stop.'
                    : 'Listening… tap the mic to stop'}
            </div>
          )}
          <div className="composer">
            <button
              type="button"
              className={`mic ${recording ? 'rec' : ''}`}
              title={recording ? (isReading ? 'Stop listening' : 'Stop recording') : isReading ? 'Start talking with Nikki' : 'Speak to Nikki'}
              aria-label={recording ? (isReading ? 'Stop listening' : 'Stop recording') : isReading ? 'Start talking with Nikki' : 'Speak to Nikki'}
              aria-pressed={recording}
              disabled={!isReading && (transcribing || isLoading)}
              onClick={toggleMic}
            >
              {transcribing ? (
                <span className="mic-spin" aria-hidden="true" />
              ) : recording ? (
                <svg width="20" height="20" viewBox="0 0 24 24" aria-hidden="true">
                  <rect x="7" y="7" width="10" height="10" rx="2" fill="currentColor" />
                </svg>
              ) : (
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
                  <path d="M12 1a3 3 0 0 0-3 3v8a3 3 0 0 0 6 0V4a3 3 0 0 0-3-3z" />
                  <path d="M19 10v2a7 7 0 0 1-14 0v-2" />
                  <line x1="12" y1="19" x2="12" y2="23" />
                  <line x1="8" y1="23" x2="16" y2="23" />
                </svg>
              )}
            </button>
            <textarea
              rows={1}
              placeholder="Type to Nikki..."
              value={draft}
              onChange={(e) => setDraft(e.target.value)}
              onKeyDown={(e) => {
                if (e.key === 'Enter' && !e.shiftKey) {
                  e.preventDefault()
                  send()
                }
              }}
            />
            <button className="send" onClick={send} disabled={!draft.trim() || isLoading}>
              <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                <path d="M22 2 11 13M22 2l-7 20-4-9-9-4z" />
              </svg>
            </button>
          </div>
        </div>

        <SessionWorkspace
          subject={subject}
          childName={student.first_name}
          grade={student.grade}
          level={student.level}
          paneActive={pane === 'work' || isWide}
          homeworkMode={homeworkMode}
          onSendText={(t) => {
            setPane('chat')
            void sendMessage(t)
          }}
          onSendImage={(turn) => {
            setPane('chat')
            void sendImageTurn(turn)
          }}
        />
      </div>

      {showRating && (
        <SessionFeedback
          childName={student.first_name}
          mode={avatarMode}
          saving={savingFeedback}
          onDone={(rating, note) => void submitRating(rating, note)}
          onKeepLearning={() => setShowRating(false)}
        />
      )}

      {showLeaveWarning && (
        <div className="feedback-overlay">
          <div className="feedback-card">
            <NikkiFace mode={avatarMode} size={84} />
            <h1 style={{ fontSize: 22, margin: '20px 0 4px' }}>Leave this lesson?</h1>
            <p className="muted" style={{ margin: '0 0 20px' }}>
              Leaving now will end this session — we haven’t finished this lesson yet.
            </p>
            <button type="button" className="btn btn-primary" onClick={() => setShowLeaveWarning(false)}>
              Keep going
            </button>
            <button
              type="button"
              className="link"
              style={{ display: 'block', margin: '12px auto 0' }}
              onClick={confirmLeave}
            >
              Leave anyway
            </button>
          </div>
        </div>
      )}

      {niceWork && (
        <div className="feedback-overlay">
          <div className="feedback-card">
            <NikkiFace mode={avatarMode} size={84} />
            <h1 style={{ fontSize: 23, margin: '20px 0 4px' }}>Nice work, {student.first_name}!</h1>
            <p className="muted" style={{ margin: 0 }}>Taking you back…</p>
          </div>
        </div>
      )}
    </div>
  )
}
