/**
 * The single sizing wrapper for every inline-SVG question diagram.
 *
 * Both question flows (Diagnostic/evaluation and Practice/lessons) render the
 * same shared visual components, so putting the sizing here means there is one
 * copy of the rule rather than one per flow. The child SVG must carry a viewBox
 * and must NOT carry width/height attributes: `.qfig > svg` sets width to 100%
 * and height to auto, so the viewBox aspect ratio drives the height and the
 * figure scales with the question card.
 *
 * `maxWidth` is the per-figure ceiling in CSS px. It exists so a simple shape
 * (a hexagon the child just has to count the sides of) does not inflate to the
 * full width of a desktop card, while a dense unit grid is allowed more room.
 */
export function QuestionFigure({
  children,
  maxWidth,
}: {
  children: React.ReactNode
  /** Ceiling in px for this figure. Denser figures pass a larger value. */
  maxWidth: number
}) {
  return (
    <figure className="qfig" style={{ maxWidth: `${maxWidth}px` }} aria-hidden="true">
      {children}
    </figure>
  )
}
