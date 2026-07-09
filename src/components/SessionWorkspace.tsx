import { useState } from 'react'
import { Notepad } from '@/components/workspace/Notepad'
import { Flashcards } from '@/components/workspace/Flashcards'
import { HomeworkUpload } from '@/components/workspace/HomeworkUpload'
import { WritingSpace } from '@/components/workspace/WritingSpace'
import type { ImageTurn } from '@/lib/image'

type Tool = 'note' | 'cards' | 'home' | 'write'

/** Subject-specific tool set. In homework mode the photo/PDF upload is added as
 *  the leading tool, so the student gets the subject's interface AND can hand
 *  Nikki their assignment. A writing-composition lesson gets the dedicated
 *  writing studio only (its own prompt + paragraph area). */
function toolsFor(subject: string, homeworkMode: boolean, composition: boolean): Tool[] {
  if (composition) return ['write']
  if (subject === 'homework') return ['home']
  // Reading: Flashcards is primary; the note tool is a simple write + snap-a-page.
  const base: Tool[] = subject === 'reading' ? ['cards', 'note'] : subject === 'science' ? ['note', 'cards'] : ['note']
  return homeworkMode ? ['home', ...base] : base
}

/** The note tool is labelled per subject (a full notepad vs. a simple writing area). */
function noteLabel(subject: string): string {
  return subject === 'reading' ? '✏️ Write / Snap a page' : '✏️ Notepad'
}

const TAB_LABEL: Record<Tool, string> = {
  note: '✏️ Notepad',
  cards: '🃏 Flashcards',
  home: '📄 Homework',
  write: '✍️ Writing',
}

interface SessionWorkspaceProps {
  subject: string
  childName: string
  grade: string
  level: string
  /** Whether the Workspace pane is the active/visible pane. Gates mounting the
   *  MathLive math-field so its global keyboard listener can't eat the chat
   *  spacebar while the Chat pane is showing. */
  paneActive: boolean
  /** Homework flow: surface the photo/PDF upload alongside the subject tools. */
  homeworkMode?: boolean
  /** Writing-composition lesson: the original prompt for the writing studio.
   *  When set, the workspace is the dedicated writing space. */
  writingPrompt?: string | null
  onSendText: (text: string) => void
  onSendImage: (turn: ImageTurn) => void
}

export function SessionWorkspace({
  subject,
  childName,
  grade,
  level,
  paneActive,
  homeworkMode = false,
  writingPrompt = null,
  onSendText,
  onSendImage,
}: SessionWorkspaceProps) {
  const composition = !!writingPrompt
  const tools = toolsFor(subject, homeworkMode, composition)
  const [tab, setTab] = useState<Tool>(tools[0])
  const active = tools.includes(tab) ? tab : tools[0]

  return (
    <div className="wspane">
      {tools.length > 1 && (
        <div className="wstabs">
          {tools.map((t) => (
            <button key={t} type="button" className={active === t ? 'on' : ''} onClick={() => setTab(t)}>
              {t === 'note' ? noteLabel(subject) : TAB_LABEL[t]}
            </button>
          ))}
        </div>
      )}
      <div className="wsbody">
        <div className="wsbody-inner">
          {active === 'write' && writingPrompt && (
            <WritingSpace prompt={writingPrompt} onSendText={onSendText} />
          )}
          {active === 'note' && (
            <Notepad subject={subject} paneActive={paneActive} onSendText={onSendText} onSendImage={onSendImage} />
          )}
          {active === 'cards' && <Flashcards childName={childName} grade={grade} level={level} />}
          {active === 'home' && <HomeworkUpload onSendImage={onSendImage} />}
        </div>
      </div>
    </div>
  )
}
