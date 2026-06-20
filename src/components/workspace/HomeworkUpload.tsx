import { useRef, useState } from 'react'
import { fileToDataURL, splitDataUrl, type ImageTurn } from '@/lib/image'
import { pdfFirstPageDataUrl } from '@/lib/pdf'

export function HomeworkUpload({ onSendImage }: { onSendImage: (turn: ImageTurn) => void }) {
  const [img, setImg] = useState<string | null>(null)
  const [error, setError] = useState('')
  const fileRef = useRef<HTMLInputElement>(null)

  const onFile = async (file: File | undefined) => {
    if (!file) return
    setError('')
    try {
      if (file.type === 'application/pdf') {
        setError('Reading your PDF…')
        setImg(await pdfFirstPageDataUrl(file))
        setError('')
      } else {
        setImg(await fileToDataURL(file))
      }
    } catch {
      setError("I couldn't open that file. A clear photo works best.")
    }
  }

  const use = () => {
    if (!img) return
    const { data, mediaType } = splitDataUrl(img)
    onSendImage({
      placeholder: '(I uploaded my homework)',
      prompt:
        'This is a photo of my homework. First say hi and tell me what you see — what the assignment is asking. Then help me work through it step by step with hints and a little practice. Never just give me the answers.',
      imageB64: data,
      mediaType,
    })
  }

  return (
    <>
      <p className="wshint">
        Upload a photo or PDF of an assignment. Nikki will look at it and help you work through it and make practice
        problems, without just giving answers.
      </p>
      <div className="upbox">
        <div className="upi">
          <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#003078" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <path d="M12 16V4M7 9l5-5 5 5M5 20h14" />
          </svg>
        </div>
        <button type="button" className="btn btn-soft" style={{ width: 'auto', margin: '0 auto' }} onClick={() => fileRef.current?.click()}>
          Choose a photo or PDF
        </button>
        <input
          ref={fileRef}
          type="file"
          accept="image/*,application/pdf"
          style={{ display: 'none' }}
          onChange={(e) => onFile(e.target.files?.[0])}
        />
      </div>
      {img && (
        <>
          <div className="preview" style={{ marginTop: 12 }}>
            <img src={img} alt="Homework" />
          </div>
          <button type="button" className="btn btn-primary" style={{ marginTop: 12 }} onClick={use}>
            Work on this with Nikki
          </button>
        </>
      )}
      {error && <div className="err">{error}</div>}
    </>
  )
}
