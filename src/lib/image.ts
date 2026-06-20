/** A vision turn: a visible placeholder line, the real prompt, and the image. */
export interface ImageTurn {
  placeholder: string
  prompt: string
  imageB64: string
  mediaType: string
}

export function fileToDataURL(file: File): Promise<string> {
  return new Promise((resolve, reject) => {
    const reader = new FileReader()
    reader.onload = () => resolve(reader.result as string)
    reader.onerror = reject
    reader.readAsDataURL(file)
  })
}

/** Split a `data:` URL into its base64 payload and media type. */
export function splitDataUrl(dataUrl: string): { data: string; mediaType: string } {
  const match = /^data:([^;]+);base64,(.*)$/.exec(dataUrl)
  if (match) return { mediaType: match[1], data: match[2] }
  const comma = dataUrl.indexOf(',')
  return { mediaType: 'image/png', data: comma >= 0 ? dataUrl.slice(comma + 1) : dataUrl }
}
