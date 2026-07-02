/**
 * Question Engine, Stage 4 — explanation-by-misconception.
 *
 * Maps the misconception token recorded on a wrong answer (the
 * `chosen_misconception_token` carried on each served choice and stored on
 * question_attempts) to a short, encouraging, kid-appropriate nudge that targets
 * THAT specific mistake — not a generic "the answer is N". Tokens are defined per
 * template in src/lib/mathTemplates.ts; every token there has an entry here (a
 * unit test asserts coverage so the two can't drift). Plain text only (rendered
 * as-is, no math/markdown). Returns null for an unknown/absent token so the
 * caller falls back to the plain verdict + worked solution.
 */

const EXPLANATIONS: Record<string, string> = {
  // percent-of
  'overstated-the-percent':
    'Close! It looks like you used a percent a little higher than the one in the question. Re-read the percent, then take that much of the number.',
  'understated-the-percent':
    'Close! It looks like you used a percent a little lower than the one in the question. Re-read the percent, then take that much of the number.',
  'complement-instead-of-percent':
    'That is how much would be left over after taking the percent away. The question asks for the percent OF the number — turn the percent into a fraction over 100 and multiply by the number.',
  'answered-the-percent':
    'That is the percent from the question, not the amount. Turn the percent into a fraction over 100, then multiply by the number.',

  // linear-equation-solve
  'forgot-to-divide':
    "You're almost there! That is the value of a times x. Now divide by the number in front of x to get x by itself.",
  'sign-error':
    'Watch the sign! It looks like a plus or minus flipped. When you move a number to the other side of the equals sign, its sign changes.',
  'mishandled-constant':
    'Good start! First move the constant to the other side (add or subtract it), and then divide.',

  // multiplication-basic
  'skip-count-error':
    'So close — that is one group off. Try counting one more (or one fewer) group of the number.',
  'off-by-one-factor':
    'Almost! That is like using one group too many. Multiply the exact two numbers shown.',
  'added-instead-of-multiplied':
    'It looks like you added the two numbers. This one asks you to multiply them — think of it as groups of.',

  // retired percent tokens (kept so pre-Stage-6 questions / historical attempts
  // still get a targeted explanation)
  'decimal-place-error':
    'Careful with the decimal — this answer is 10 times too big. A percent means out of 100, so divide by 100, not 10.',
  'halved-the-base':
    'Close! It looks like you divided by 50 instead of 100. A percent is always out of 100.',
}

/**
 * A targeted, encouraging explanation for the misconception behind a wrong
 * answer, or null when the token is absent/unknown (caller shows the generic
 * verdict + solution instead).
 */
export function explainMisconception(token: string | null | undefined): string | null {
  if (!token) return null
  return EXPLANATIONS[token] ?? null
}
