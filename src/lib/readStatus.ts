/**
 * A read failure, reported separately from an empty result.
 *
 * Most of our reads are deliberately best-effort: they log and return an empty
 * value rather than throwing, so a serving path degrades instead of breaking.
 * That is right for the tutor, and wrong for the parent dashboard, where the two
 * outcomes carry opposite meanings:
 *
 *   []  from a clean read  -> "nothing has happened yet"  (true, and fine to say)
 *   []  from a failed read -> "we could not look"         (must be said out loud)
 *
 * Pass a ReadStatus to a reader that supports it and check `failed` afterwards.
 * It is an optional out-parameter rather than a changed return type so the
 * serving paths that legitimately do not care stay untouched, and it is
 * per-call rather than module state so concurrent reads cannot cross wires.
 */
export interface ReadStatus {
  failed: boolean
}

/** A fresh status to hand to a reader. */
export const readStatus = (): ReadStatus => ({ failed: false })
