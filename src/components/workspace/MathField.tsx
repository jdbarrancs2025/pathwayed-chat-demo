import { forwardRef, useEffect, useImperativeHandle, useRef } from 'react'
import type { MathfieldElement } from 'mathlive'

export interface MathFieldHandle {
  /** Current expression as LaTeX. */
  getLatex: () => string
  /** Reset the field to empty. */
  clear: () => void
  /** Insert a LaTeX snippet at the cursor (supports #@ selection / #? placeholder). */
  insert: (latex: string) => void
  /** Focus the field and show MathLive's virtual keyboard. Backs the visible
   *  "Math keyboard" button in the Notepad: focus alone shows the keyboard
   *  under the onfocus policy, and the explicit show() covers the case where
   *  the field is already focused but the student dismissed the keyboard. */
  openKeyboard: () => void
}

interface MathFieldProps {
  /** LaTeX to restore into the field on mount (preserves input across tab switches). */
  initialValue?: string
  /** Fired on the field's native `input` event with the current LaTeX. */
  onInput?: (latex: string) => void
}

/**
 * MODE A — a structured math input field backed by MathLive's <math-field> web
 * component: real fraction/exponent/root boxes and MathLive's built-in virtual
 * keyboard (including the fraction key). The value is LaTeX, read on submit and
 * mirrored out on the field's `input` event (never driven by a React value prop).
 *
 * Created imperatively (rather than as a JSX custom element) to avoid web-
 * component JSX typing, and MathLive is dynamic-imported so it code-splits out
 * of the main bundle and only loads when a student opens the math editor.
 */
export const MathField = forwardRef<MathFieldHandle, MathFieldProps>(function MathField(
  { initialValue = '', onInput },
  ref,
) {
  const hostRef = useRef<HTMLDivElement>(null)
  const fieldRef = useRef<MathfieldElement | null>(null)
  // Keep the latest onInput without re-running the mount effect (which would
  // tear down and recreate the field).
  const onInputRef = useRef(onInput)
  onInputRef.current = onInput
  // Captured once so the mount effect can restore it without depending on the prop.
  const initialValueRef = useRef(initialValue)

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
      openKeyboard: () => {
        fieldRef.current?.focus()
        // Typed loosely because mathlive is dynamic-imported; its window
        // augmentation isn't guaranteed to be in scope here.
        const w = window as unknown as { mathVirtualKeyboard?: { show?: () => void } }
        w.mathVirtualKeyboard?.show?.()
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
      // focus — on desktop, tablet, and phone alike. Physical-keyboard typing
      // works regardless of the virtual keyboard.
      mf.mathVirtualKeyboardPolicy = 'onfocus'
      mf.className = 'mathfield'
      // Answer framing, not problem framing: the student is here to work the
      // problem Nikki gave them, then "Ask Nikki to check it".
      mf.setAttribute('aria-label', 'Your answer')
      mf.setAttribute('placeholder', 'Type your answer here')
      // Restore any preserved expression (e.g. after switching to Write by hand
      // and back).
      if (initialValueRef.current) mf.value = initialValueRef.current
      // Mirror the value out on every change via the field's own input event.
      mf.addEventListener('input', () => onInputRef.current?.(mf.value))
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
