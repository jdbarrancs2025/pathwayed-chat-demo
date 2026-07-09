import { useState } from 'react'

interface WritingSpaceProps {
  /** The original writing prompt to respond to (shown above the writing area). */
  prompt: string
  /** Send the student's paragraph to Nikki (routed through the session chat). */
  onSendText: (text: string) => void
}

/**
 * The writing studio for a composition lesson: an original writing PROMPT and a
 * real multi-line area sized for a paragraph, with a "Share with Nikki" submit.
 * Not the math editor and not a single chat line — a dedicated writing space. The
 * student's text stays after sharing so they can revise and share again as many
 * times as they like; Nikki coaches each version (see the paragraph-writing
 * module). The visible message is just their paragraph; Nikki already has the
 * prompt from the session context.
 */
export function WritingSpace({ prompt, onSendText }: WritingSpaceProps) {
  const [text, setText] = useState('')
  const [shared, setShared] = useState(false)

  const share = () => {
    const paragraph = text.trim()
    if (!paragraph) return
    onSendText(`Here's my paragraph:\n\n${paragraph}`)
    setShared(true)
    // Keep the text so the student can revise it and share again.
  }

  return (
    <div className="writing-space">
      <div className="writing-prompt">
        <div className="writing-prompt-label">Your writing prompt</div>
        <p className="writing-prompt-text">{prompt}</p>
      </div>
      <p className="wshint">
        Write your paragraph below. When you’re ready, share it with Nikki — you can keep making it better and share
        again as many times as you like.
      </p>
      <textarea
        className="bigtype writing-area"
        placeholder="Write your paragraph here..."
        value={text}
        onChange={(e) => {
          setText(e.target.value)
          if (shared) setShared(false)
        }}
      />
      <button type="button" className="btn btn-primary" style={{ marginTop: 12 }} disabled={!text.trim()} onClick={share}>
        {shared ? 'Share again with Nikki' : 'Share with Nikki'}
      </button>
      {shared && <div className="writing-shared">Shared! Nikki is reading your paragraph.</div>}
    </div>
  )
}
