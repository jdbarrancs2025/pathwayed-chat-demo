import { useState } from 'react'
import { NikkiOrb } from '@/components/NikkiOrb'

const PHOTOS: Record<string, string> = { p1: '/nikki1.jpg', p2: '/nikki2.jpg', p3: '/nikki3.jpg' }

const RATINGS: [string, string, string][] = [
  ['great', 'Great!', '😀'],
  ['ok', 'Okay', '🙂'],
  ['confusing', 'Confusing', '😕'],
]

interface SessionFeedbackProps {
  childName: string
  nikki: string
  saving: boolean
  onDone: (rating: string, note: string) => void
  onKeepLearning: () => void
}

/** End-of-session feedback: rating + optional note (written to the feedback table). */
export function SessionFeedback({ childName, nikki, saving, onDone, onKeepLearning }: SessionFeedbackProps) {
  const [rating, setRating] = useState<string | null>(null)
  const [note, setNote] = useState('')
  const photo = PHOTOS[nikki]

  return (
    <div className="feedback-overlay">
      <div className="feedback-card">
        {nikki === 'orb' || !photo ? (
          <NikkiOrb size={84} />
        ) : (
          <span
            style={{
              display: 'block',
              width: 84,
              height: 84,
              borderRadius: '50%',
              overflow: 'hidden',
              margin: '0 auto',
              boxShadow: '0 12px 30px rgba(28,34,48,.2)',
            }}
          >
            <img src={photo} alt="Nikki" style={{ width: '100%', height: '100%', objectFit: 'cover', display: 'block' }} />
          </span>
        )}

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
