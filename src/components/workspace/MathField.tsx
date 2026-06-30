import { forwardRef, useEffect, useImperativeHandle, useRef } from 'react'
import type { MathfieldElement } from 'mathlive'

export interface MathFieldHandle {
  /** Current expression as LaTeX. */
  getLatex: () => string
  /** Reset the field to empty. */
  clear: () => void
  /** Insert a LaTeX snippet at the cursor (supports #@ selection / #? placeholder). */
  insert: (latex: string) => void
}

/**
 * MODE A — a structured math input field backed by MathLive's <math-field> web
 * component: real fraction/exponent/root boxes and MathLive's built-in virtual
 * keyboard (including the fraction key). The value is LaTeX, read on submit.
 *
 * Created imperatively (rather than as a JSX custom element) to avoid web-
 * component JSX typing, and MathLive is dynamic-imported so it code-splits out
 * of the main bundle and only loads when a student opens the math editor.
 */
export const MathField = forwardRef<MathFieldHandle>(function MathField(_props, ref) {
  const hostRef = useRef<HTMLDivElement>(null)
  const fieldRef = useRef<MathfieldElement | null>(null)

  useImperativeHandle(
    ref,
    () => ({
      getLatex: () => fieldRef.current?.value ?? '',
      clear: () => {
        if (fieldRef.current) fieldRef.current.value = ''
      },
      insert: (latex: string) => {
        fieldRef.current?.insert(latex, { focus: true })
      },
    }),
    [],
  )

  useEffect(() => {
    let disposed = false
    void import('mathlive').then(({ MathfieldElement }) => {
      if (disposed || !hostRef.current) return
      // Serve MathLive's fonts from the CDN and disable sounds so nothing 404s
      // under the Vite build (the package's default relative paths won't resolve).
      MathfieldElement.fontsDirectory = 'https://unpkg.com/mathlive@0.110.0/dist/fonts'
      MathfieldElement.soundsDirectory = null

      const mf = new MathfieldElement()
      // Show MathLive's built-in virtual keyboard (with the fraction key) on
      // focus — on desktop, tablet, and phone alike.
      mf.mathVirtualKeyboardPolicy = 'onfocus'
      mf.className = 'mathfield'
      mf.setAttribute('aria-label', 'Math expression')
      hostRef.current.appendChild(mf)
      fieldRef.current = mf
      // Do NOT auto-focus on mount: focusing arms MathLive's virtual keyboard,
      // which installs a global capture-phase window keydown listener that
      // swallows the spacebar across the whole page (including the chat box).
      // The student focuses the field by tapping it (or a fraction/power/root
      // button, which inserts with focus), so the editor still works.
    })
    return () => {
      disposed = true
      fieldRef.current?.remove()
      fieldRef.current = null
    }
  }, [])

  return <div ref={hostRef} className="mathfield-host" />
})
