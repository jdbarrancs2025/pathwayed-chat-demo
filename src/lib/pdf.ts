import * as pdfjsLib from 'pdfjs-dist'
import workerUrl from 'pdfjs-dist/build/pdf.worker.min.mjs?url'

pdfjsLib.GlobalWorkerOptions.workerSrc = workerUrl

/** Render the first page of a PDF to a PNG data URL (for vision). */
export async function pdfFirstPageDataUrl(file: File): Promise<string> {
  const data = await file.arrayBuffer()
  const pdf = await pdfjsLib.getDocument({ data }).promise
  const page = await pdf.getPage(1)
  const viewport = page.getViewport({ scale: 1.6 })
  const canvas = document.createElement('canvas')
  canvas.width = viewport.width
  canvas.height = viewport.height
  const canvasContext = canvas.getContext('2d')
  if (!canvasContext) throw new Error('No 2D context')
  const params: Parameters<typeof page.render>[0] = { canvas, canvasContext, viewport }
  await page.render(params).promise
  return canvas.toDataURL('image/png')
}

/** Extract text from the first few pages of a PDF (for flashcard generation). */
export async function extractPdfText(file: File): Promise<string> {
  const data = await file.arrayBuffer()
  const pdf = await pdfjsLib.getDocument({ data }).promise
  const max = Math.min(pdf.numPages, 6)
  let out = ''
  for (let i = 1; i <= max; i++) {
    const page = await pdf.getPage(i)
    const content = await page.getTextContent()
    out += content.items.map((item) => ('str' in item ? item.str : '')).join(' ') + '\n'
  }
  return out.trim()
}
