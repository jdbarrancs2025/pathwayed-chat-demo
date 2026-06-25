import { useEffect, useRef, useState } from 'react'
import { MathField, type MathFieldHandle } from '@/components/workspace/MathField'
import { fileToDataURL, splitDataUrl, type ImageTurn } from '@/lib/image'

interface NotepadProps {
  subject: string
  onSendText: (text: string) => void
  onSendImage: (turn: ImageTurn) => void
}

type Mode = 'type' | 'draw' | 'editor'

/** Paint a white graph-paper grid into the canvas (math handwriting mode). */
function paintGrid(ctx: CanvasRenderingContext2D, w: number, h: number) {
  ctx.save()
  ctx.fillStyle = '#ffffff'
  ctx.fillRect(0, 0, w, h)
  ctx.strokeStyle = '#dce6f2'
  ctx.lineWidth = 1
  ctx.beginPath()
  const step = 28
  for (let x = step; x < w; x += step) {
    ctx.moveTo(x, 0)
    ctx.lineTo(x, h)
  }
  for (let y = step; y < h; y += step) {
    ctx.moveTo(0, y)
    ctx.lineTo(w, y)
  }
  ctx.stroke()
  ctx.restore()
}

export function Notepad({ subject, onSendText, onSendImage }: NotepadProps) {
  const mathy = subject === 'math' || subject === 'science'
  // Math: structured editor (MODE A) vs handwriting grid (MODE B).
  // Non-math: unchanged type vs draw/photo.
  const [mode, setMode] = useState<Mode>(mathy ? 'editor' : 'type')
  const [typed, setTyped] = useState('')
  const [noteImg, setNoteImg] = useState<string | null>(null)
  const [error, setError] = useState('')
  const taRef = useRef<HTMLTextAreaElement>(null)
  const canvasRef = useRef<HTMLCanvasElement>(null)
  const fileRef = useRef<HTMLInputElement>(null)
  const mathRef = useRef<MathFieldHandle>(null)
  const hasInkRef = useRef(false)

  const upload = async (file: File | undefined) => {
    if (!file) return
    setError('')
    try {
      setNoteImg(await fileToDataURL(file))
    } catch {
      setError("I couldn't open that photo. Try another one.")
    }
  }

  const check = () => {
    if (mode === 'editor') {
      const latex = (mathRef.current?.getLatex() ?? '').trim()
      if (latex) {
        onSendText(latex)
        mathRef.current?.clear()
      }
      return
    }
    if (mode === 'draw') {
      if (noteImg) {
        const { data, mediaType } = splitDataUrl(noteImg)
        onSendImage({
          placeholder: '(I shared a photo of my work)',
          prompt:
            'Here is a photo of the work I did by hand. Please read it, tell me what looks good, and help me with the next step.',
          imageB64: data,
          mediaType,
        })
      } else if (hasInkRef.current && canvasRef.current) {
        const { data, mediaType } = splitDataUrl(canvasRef.current.toDataURL('image/png'))
        onSendImage({
          placeholder: '(I shared my handwritten work)',
          prompt:
            'Here is the work I wrote by hand. Please read it, tell me what looks good, and help me with the next step.',
          imageB64: data,
          mediaType,
        })
      }
    } else {
      const t = typed.trim()
      if (t) {
        onSendText(t)
        setTyped('')
      } else {
        taRef.current?.focus()
      }
    }
  }

  // Freehand drawing — sizes to the element (and re-sizes when it becomes visible).
  useEffect(() => {
    if (mode !== 'draw' || noteImg) return
    const canvas = canvasRef.current
    if (!canvas) return
    const ctx = canvas.getContext('2d')
    if (!ctx) return

    const configure = () => {
      const dpr = window.devicePixelRatio || 1
      const rect = canvas.getBoundingClientRect()
      if (rect.width === 0) return
      canvas.width = rect.width * dpr
      canvas.height = rect.height * dpr
      ctx.setTransform(1, 0, 0, 1, 0, 0)
      ctx.scale(dpr, dpr)
      // Math handwriting gets graph-paper so the captured image reads as grid work.
      if (mathy) paintGrid(ctx, rect.width, rect.height)
      ctx.lineWidth = 2.6
      ctx.lineCap = 'round'
      ctx.lineJoin = 'round'
      ctx.strokeStyle = '#1C2230'
      hasInkRef.current = false
    }
    configure()
    const ro = new ResizeObserver(() => configure())
    ro.observe(canvas)

    let drawing = false
    let lx = 0
    let ly = 0
    const pos = (e: MouseEvent | TouchEvent): [number, number] => {
      const r = canvas.getBoundingClientRect()
      const p = 'touches' in e ? e.touches[0] : e
      return [p.clientX - r.left, p.clientY - r.top]
    }
    const down = (e: MouseEvent | TouchEvent) => {
      e.preventDefault()
      drawing = true
      ;[lx, ly] = pos(e)
    }
    const move = (e: MouseEvent | TouchEvent) => {
      if (!drawing) return
      e.preventDefault()
      const [x, y] = pos(e)
      ctx.beginPath()
      ctx.moveTo(lx, ly)
      ctx.lineTo(x, y)
      ctx.stroke()
      lx = x
      ly = y
      hasInkRef.current = true
    }
    const up = () => {
      drawing = false
    }
    canvas.addEventListener('mousedown', down)
    canvas.addEventListener('mousemove', move)
    window.addEventListener('mouseup', up)
    canvas.addEventListener('touchstart', down, { passive: false })
    canvas.addEventListener('touchmove', move, { passive: false })
    canvas.addEventListener('touchend', up)
    return () => {
      ro.disconnect()
      canvas.removeEventListener('mousedown', down)
      canvas.removeEventListener('mousemove', move)
      window.removeEventListener('mouseup', up)
      canvas.removeEventListener('touchstart', down)
      canvas.removeEventListener('touchmove', move)
      canvas.removeEventListener('touchend', up)
    }
  }, [mode, noteImg, mathy])

  const clearCanvas = () => {
    const canvas = canvasRef.current
    const ctx = canvas?.getContext('2d')
    if (canvas && ctx) {
      ctx.save()
      ctx.setTransform(1, 0, 0, 1, 0, 0)
      ctx.clearRect(0, 0, canvas.width, canvas.height)
      ctx.restore()
      if (mathy) {
        const rect = canvas.getBoundingClientRect()
        paintGrid(ctx, rect.width, rect.height)
      }
    }
    hasInkRef.current = false
  }

  const hint =
    mode === 'editor'
      ? 'Build your math with the editor — tap the keyboard for fractions, powers, and roots. Then tap Ask Nikki to check it.'
      : mode === 'draw'
        ? mathy
          ? 'Write your math by hand on the grid, or upload a photo. Then tap Ask Nikki to check it.'
          : 'Write your work by hand, or upload a photo of problems you did on paper. Then tap Ask Nikki to check it.'
        : 'Type your answer here, then tap Ask Nikki to check it.'

  return (
    <>
      <p className="wshint">{hint}</p>
      <div className="seg">
        {mathy ? (
          <>
            <button type="button" className={`seg-b ${mode === 'editor' ? 'on' : ''}`} onClick={() => setMode('editor')}>
              Math editor
            </button>
            <button type="button" className={`seg-b ${mode === 'draw' ? 'on' : ''}`} onClick={() => setMode('draw')}>
              Write by hand
            </button>
          </>
        ) : (
          <>
            <button type="button" className={`seg-b ${mode === 'type' ? 'on' : ''}`} onClick={() => setMode('type')}>
              Type
            </button>
            <button type="button" className={`seg-b ${mode === 'draw' ? 'on' : ''}`} onClick={() => setMode('draw')}>
              Draw or photo
            </button>
          </>
        )}
      </div>

      {mode === 'editor' ? (
        <MathField ref={mathRef} />
      ) : mode === 'type' ? (
        <textarea
          ref={taRef}
          className="bigtype"
          placeholder="Start writing here..."
          value={typed}
          onChange={(e) => setTyped(e.target.value)}
        />
      ) : noteImg ? (
        <>
          <button type="button" className="btn btn-soft" style={{ marginBottom: 10 }} onClick={() => fileRef.current?.click()}>
            Use a different photo
          </button>
          <div className="preview">
            <img src={noteImg} alt="Your work" />
          </div>
          <button type="button" className="link" style={{ display: 'block', margin: '10px auto 0' }} onClick={() => setNoteImg(null)}>
            Remove photo and {mathy ? 'write instead' : 'draw instead'}
          </button>
        </>
      ) : (
        <>
          <button type="button" className="btn btn-soft" style={{ marginBottom: 10 }} onClick={() => fileRef.current?.click()}>
            📷 Upload a photo of your work
          </button>
          <div className="note-tools">
            <span className="chip">Pen</span>
            <span className="sp" />
            <button type="button" className="link" onClick={clearCanvas}>
              Clear
            </button>
          </div>
          <canvas ref={canvasRef} className="pad" />
        </>
      )}

      <input
        ref={fileRef}
        type="file"
        accept="image/*"
        capture="environment"
        style={{ display: 'none' }}
        onChange={(e) => upload(e.target.files?.[0])}
      />

      <button type="button" className="btn btn-primary" style={{ marginTop: 12 }} onClick={check}>
        Ask Nikki to check it
      </button>
      {error && <div className="err">{error}</div>}
    </>
  )
}
