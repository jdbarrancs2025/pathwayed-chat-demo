import { useEffect, useRef, useState } from 'react'
import { useNavigate, useParams } from 'react-router'
import { useAuth } from '@/context/AuthContext'
import { getStudent, type Student } from '@/lib/students'
import { getNikkiChoice } from '@/lib/profile'
import { loadTranscript, saveFeedback } from '@/lib/sessions'
import { subjectDisplayName } from '@/lib/subjects'
import { useSessionChat, type ChatMessage } from '@/hooks/useSessionChat'
import { useAudioRecorder } from '@/hooks/useAudioRecorder'
import { CallStage, type CallState } from '@/components/CallStage'
import { SessionWorkspace } from '@/components/SessionWorkspace'
import { SessionFeedback } from '@/components/SessionFeedback'
import { MathText } from '@/components/MathText'
import { speakWithNikki, stopNikkiSpeech } from '@/lib/voice'
import { stripMarkdownForTTS } from '@/lib/stripMarkdownForTTS'
import { transcribeAudio } from '@/lib/transcribe'
import '@/styles/app-screens.css'

const VALID_SUBJECTS = new Set(['math', 'reading', 'writing', 'science', 'homework'])

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

function makeGreeting(name: string, subject: string): string {
  if (subject === 'homework') {
    return `Hi ${name}! I'm Nikki. Upload a photo or PDF of the homework you're working on using the panel on the right, and we'll go through it together. You can also just tell me what it's about.`
  }
  return `Hi ${name}! I'm Nikki. I'm glad you're here. What are we working on in ${subjectDisplayName(subject).toLowerCase()} today? You can ask me a question, or use the workspace on the right to show me your work.`
}

interface ReadyState {
  student: Student
  nikki: string
  initialMessages: ChatMessage[]
}

export function Session() {
  const { id, subject } = useParams<{ id: string; subject: string }>()
  const { user } = useAuth()
  const navigate = useNavigate()
  const [ready, setReady] = useState<ReadyState | null>(null)

  useEffect(() => {
    if (!id || !subject || !VALID_SUBJECTS.has(subject)) {
      navigate('/students', { replace: true })
      return
    }
    let active = true
    Promise.all([
      getStudent(id),
      user ? getNikkiChoice(user.id) : Promise.resolve('orb'),
      loadTranscript(id, subject),
    ]).then(([s, n, saved]) => {
      if (!active) return
      if (!s) {
        navigate('/students', { replace: true })
        return
      }
      const initialMessages: ChatMessage[] = saved.length
        ? saved.map((m, i) => ({ id: `saved-${i}`, role: m.role, content: m.content }))
        : [{ id: 'greeting', role: 'assistant', content: makeGreeting(s.first_name, subject) }]
      setReady({ student: s, nikki: n, initialMessages })
    })
    return () => {
      active = false
    }
  }, [id, subject, user, navigate])

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
      nikki={ready.nikki}
      initialMessages={ready.initialMessages}
    />
  )
}

function SessionView({
  student,
  subject,
  nikki,
  initialMessages,
}: {
  student: Student
  subject: string
  nikki: string
  initialMessages: ChatMessage[]
}) {
  const navigate = useNavigate()
  const { messages, isLoading, sendMessage, sendImageTurn } = useSessionChat({
    studentId: student.id,
    subject,
    childName: student.first_name,
    grade: student.grade,
    level: student.level,
    initialMessages,
  })

  const [pane, setPane] = useState<'chat' | 'work'>('chat')
  // Nikki auto-speaks her responses by default; this mutes that (in-session).
  const [muted, setMuted] = useState(false)
  const [speaking, setSpeaking] = useState(false)
  const [draft, setDraft] = useState('')
  const [showFeedback, setShowFeedback] = useState(false)
  const [savingFeedback, setSavingFeedback] = useState(false)
  // Seed with the last message already on screen so resuming doesn't replay it.
  const spokenRef = useRef<string | null>(lastAssistantId(initialMessages))
  const feedRef = useRef<HTMLDivElement>(null)

  // Voice input (speak instead of type) — records, transcribes via Whisper, then
  // sends the text exactly like a typed message.
  const recorder = useAudioRecorder()
  const [transcribing, setTranscribing] = useState(false)
  const [micError, setMicError] = useState('')

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

  const toggleMic = () => {
    setMicError('')
    if (recorder.state === 'recording') recorder.stopRecording()
    else void recorder.startRecording()
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

  const finish = () => {
    stopSpeak(setSpeaking)
    setShowFeedback(true)
  }

  const submitFeedback = async (rating: string, note: string) => {
    setSavingFeedback(true)
    await saveFeedback(student.id, subject, rating, note)
    navigate(`/students/${student.id}`)
  }

  const callState: CallState = isLoading ? 'thinking' : speaking ? 'speaking' : 'idle'
  const recording = recorder.state === 'recording' || recorder.state === 'requesting'

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
        <button className="iconbtn" title="Finish" onClick={finish}>
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <path d="M18 6 6 18M6 6l12 12" />
          </svg>
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
          <CallStage nikki={nikki} state={callState} />
          <div className="feed" ref={feedRef}>
            {visibleMessages.map((m) => (
              <div key={m.id} className={`msg ${m.role === 'assistant' ? 'nikki' : 'me'}`}>
                <MathText content={m.content} />
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
                  : 'Listening… tap the mic to stop'}
            </div>
          )}
          <div className="composer">
            <button
              type="button"
              className={`mic ${recording ? 'rec' : ''}`}
              title={recording ? 'Stop recording' : 'Speak to Nikki'}
              aria-label={recording ? 'Stop recording' : 'Speak to Nikki'}
              aria-pressed={recording}
              disabled={transcribing || isLoading}
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

      {showFeedback && (
        <SessionFeedback
          childName={student.first_name}
          nikki={nikki}
          saving={savingFeedback}
          onDone={(rating, note) => void submitFeedback(rating, note)}
          onKeepLearning={() => setShowFeedback(false)}
        />
      )}
    </div>
  )
}
