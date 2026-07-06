import { useState } from 'react'
import { NikkiFace } from '@/components/NikkiFace'
import type { AvatarMode } from '@/lib/students'

const RATINGS: [string, string, string][] = [
  ['great', 'Great!', '😀'],
  ['ok', 'Okay', '🙂'],
  ['confusing', 'Confusing', '😕'],
]

interface SessionFeedbackProps {
  childName: string
  mode?: AvatarMode
  saving: boolean
  onDone: (rating: string, note: string) => void
  onKeepLearning: () => void
}

/** End-of-session feedback: rating + optional note (written to the feedback table). */
export function SessionFeedback({ childName, mode = 'video', saving, onDone, onKeepLearning }: SessionFeedbackProps) {
  const [rating, setRating] = useState<string | null>(null)
  const [note, setNote] = useState('')

  return (
    <div className="feedback-overlay">
      <div className="feedback-card">
        <NikkiFace mode={mode} size={84} />

        <h1 style={{ fontSize: 23, margin: '20px 0 4px' }}>Nice work, {childName}!</h1>
        <p className="muted" style={{ margin: 0 }}>
          How did that go?
        </p>

        <div className="rate">
          {RATINGS.map(([key, label, face]) => (
            <button key={key} type="button" className={rating === key ? 'on' : ''} onClick={() => setRating(key)}>
              <span className="face">{face}</span>
              {label}
            </button>
          ))}
        </div>

        <div className="field">
          <label htmlFor="fb-note">Anything to add? (optional)</label>
          <textarea
            id="fb-note"
            className="input"
            rows={2}
            placeholder="What worked, what didn't..."
            value={note}
            onChange={(e) => setNote(e.target.value)}
          />
        </div>

        <button
          type="button"
          className="btn btn-primary"
          disabled={!rating || saving}
          onClick={() => rating && onDone(rating, note)}
        >
          {saving ? 'Saving…' : 'Done'}
        </button>
        <button type="button" className="link" style={{ display: 'block', margin: '12px auto 0' }} onClick={onKeepLearning}>
          Keep learning
        </button>
      </div>
    </div>
  )
}
