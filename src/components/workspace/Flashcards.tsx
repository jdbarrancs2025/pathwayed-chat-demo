import { useRef, useState } from 'react'
import {
  generateFromImage,
  generateFromText,
  generateFromTopic,
  type CardContext,
  type Flashcard,
} from '@/lib/flashcards'
import { fileToDataURL, splitDataUrl } from '@/lib/image'
import { extractPdfText } from '@/lib/pdf'

export function Flashcards({ childName, grade, level }: { childName: string; grade: string; level: string }) {
  const ctx: CardContext = { childName, grade, level }
  const [cards, setCards] = useState<Flashcard[]>([])
  const [idx, setIdx] = useState(0)
  const [flipped, setFlipped] = useState(false)
  const [topic, setTopic] = useState('')
  const [cardImg, setCardImg] = useState<string | null>(null)
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const fileRef = useRef<HTMLInputElement>(null)

  const say = (text: string) => {
    // TODO(Prompt 12): play via the ElevenLabs voice; browser speechSynthesis is the fallback for now.
    if (!('speechSynthesis' in window)) return
    window.speechSynthesis.cancel()
    const u = new SpeechSynthesisUtterance(text)
    u.rate = 1
    u.pitch = 1.05
    window.speechSynthesis.speak(u)
  }

  const run = async (fn: () => Promise<Flashcard[]>, failMsg: string): Promise<Flashcard[]> => {
    setBusy(true)
    setError('')
    try {
      const result = await fn()
      if (!result.length) {
        setError("I couldn't make cards just now. Try again in a moment.")
      } else {
        setCards(result)
        setIdx(0)
        setFlipped(false)
      }
      return result
    } catch {
      setError(failMsg)
      return []
    } finally {
      setBusy(false)
    }
  }

  const onFile = async (file: File | undefined) => {
    if (!file) return
    setError('')
    try {
      if (file.type === 'application/pdf') {
        setError('Reading your PDF…')
        const text = await extractPdfText(file)
        setCardImg(null)
        await run(() => generateFromText(ctx, text), "I couldn't read that file. Try a photo, or type the words.")
      } else {
        setCardImg(await fileToDataURL(file))
      }
    } catch {
      setError("I couldn't open that file. A clear photo or a text PDF works best.")
    }
  }

  if (cards.length) {
    const card = cards[idx]
    return (
      <>
        <div className="flash">
          <div className={`flash-inner ${flipped ? 'flip' : ''}`} onClick={() => setFlipped((f) => !f)}>
            <div className="flash-face flash-front">{card.front}</div>
            <div className="flash-face flash-back">{card.back}</div>
          </div>
        </div>
        <p className="center" style={{ margin: '0 0 10px' }}>
          <button type="button" className="chip" onClick={() => say(card.front)}>
            🔊 Hear the word
          </button>{' '}
          <span className="muted" style={{ fontSize: 12 }}>
            Tap card to flip
          </span>
        </p>
        <div className="flash-nav">
          <button
            type="button"
            className="chip"
            onClick={() => {
              setIdx((i) => (i - 1 + cards.length) % cards.length)
              setFlipped(false)
            }}
          >
            ‹ Back
          </button>
          <span className="cnt">
            {idx + 1} of {cards.length}
          </span>
          <button
            type="button"
            className="chip"
            onClick={() => {
              setIdx((i) => (i + 1) % cards.length)
              setFlipped(false)
            }}
          >
            Next ›
          </button>
        </div>
        <button
          type="button"
          className="link"
          style={{ display: 'block', margin: '16px auto 0' }}
          onClick={() => {
            setCards([])
            setIdx(0)
            setFlipped(false)
          }}
        >
          Make a new set
        </button>
      </>
    )
  }

  if (cardImg) {
    return (
      <>
        <p className="wshint">Here are your words. Make a flashcard set from this, or choose a different picture.</p>
        <div className="preview">
          <img src={cardImg} alt="Words" />
        </div>
        <button
          type="button"
          className="btn btn-navy"
          style={{ marginTop: 12 }}
          disabled={busy}
          onClick={async () => {
            const { data, mediaType } = splitDataUrl(cardImg)
            const result = await run(
              () => generateFromImage(ctx, data, mediaType),
              "I couldn't read the words clearly. Try a clearer photo.",
            )
            if (result.length) setCardImg(null)
          }}
        >
          {busy ? 'Making your cards…' : 'Make flashcards from this'}
        </button>
        <button type="button" className="link" style={{ display: 'block', margin: '10px auto 0' }} onClick={() => setCardImg(null)}>
          Choose a different one
        </button>
        {error && <div className="err">{error}</div>}
      </>
    )
  }

  return (
    <>
      <p className="wshint">
        Flashcards for sight words and vocabulary. Type a word list or topic, let Nikki choose for you, or upload a
        photo or PDF of words or an assignment — Nikki turns it into a set.
      </p>
      <div className="field" style={{ marginTop: 0 }}>
        <label htmlFor="flash-topic">Words or topic (optional)</label>
        <input
          id="flash-topic"
          className="input"
          placeholder="e.g. sight words, or: cat, dog, run"
          value={topic}
          onChange={(e) => setTopic(e.target.value)}
        />
      </div>
      <button
        type="button"
        className="btn btn-navy"
        disabled={busy}
        onClick={() => run(() => generateFromTopic(ctx, topic), "I couldn't make cards just now. Try again in a moment.")}
      >
        {busy ? 'Making your cards…' : topic.trim() ? 'Make flashcards' : 'Let Nikki choose'}
      </button>
      <div className="oranote">or</div>
      <button type="button" className="btn btn-soft" onClick={() => fileRef.current?.click()}>
        📷 Take or upload a picture or PDF of words
      </button>
      <input
        ref={fileRef}
        type="file"
        accept="image/*,application/pdf"
        style={{ display: 'none' }}
        onChange={(e) => onFile(e.target.files?.[0])}
      />
      {error && <div className="err">{error}</div>}
    </>
  )
}
