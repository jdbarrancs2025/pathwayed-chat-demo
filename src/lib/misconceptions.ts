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

  // division-basic
  'quotient-too-high':
    'So close — that is a little too high. Ask yourself: how many times does the smaller number fit into the bigger one?',
  'quotient-too-low':
    'So close — that is a little too low. Count how many times the smaller number fits into the bigger one.',
  'subtracted-instead-of-divided':
    'It looks like you subtracted. This one asks you to divide — how many equal groups can you make?',
  'answered-the-divisor':
    'That is the number you are dividing by, not the answer. Try: how many of it fit into the total?',

  // fraction-of-number
  'numerator-too-high':
    'Close! That is a bit too much. Split the number into equal parts first, then take exactly the number of parts on top of the fraction.',
  'numerator-too-low':
    'So close — that is a bit too little. Take one more of the equal parts.',
  'part-size-too-small':
    'So close — just a little low. Find the size of one part by dividing the number by the bottom of the fraction, then take the top-number of them.',
  'part-size-too-big':
    'So close — just a little high. Find the size of one part by dividing the number by the bottom of the fraction, then take the top-number of them.',
  'used-the-other-part':
    'That is the other part of the whole. The top number of the fraction tells you how many parts to take — count those.',
  'answered-the-whole':
    'That is the whole amount. The fraction asks for just part of it — split it into equal parts first, then take some.',

  // rectangle-area
  'miscounted-a-row':
    'Almost! It looks like you counted one extra row. Multiply the exact length and width.',
  'miscounted-a-column':
    'Almost! It looks like you missed a column. Multiply the exact length and width.',
  'confused-area-perimeter':
    'That is the perimeter — the distance around the edge. Area is the space inside: multiply length times width.',

  // retired percent tokens (kept so pre-Stage-6 questions / historical attempts
  // still get a targeted explanation)
  'decimal-place-error':
    'Careful with the decimal — this answer is 10 times too big. A percent means out of 100, so divide by 100, not 10.',
  'halved-the-base':
    'Close! It looks like you divided by 50 instead of 100. A percent is always out of 100.',

  // ratios (ratio-scale)
  'inverted-the-ratio':
    'It looks like you swapped the two parts of the ratio. Match each number to the right color — the first number goes with the first color.',
  'ratio-scaled-too-far':
    'So close — that is one scale-step too high. Find how many times bigger the real count is, then use that same amount for the other part.',
  'ratio-scaled-too-short':
    'So close — that is one scale-step too low. Find how many times bigger the real count is, then use that same amount for the other part.',
  'added-instead-of-scaled':
    'Ratios and rates scale by multiplying, not adding. Find how many times bigger the amount is, then multiply the other part by that same number.',
  'answered-the-ratio-part':
    'That is just the number from the ratio. You still need to scale it up to match the real count.',

  // proportional-reasoning (proportion-scale)
  'rate-scaled-too-far':
    'So close — a little too high. Find the amount for one first, then multiply by how many you need.',
  'rate-scaled-too-short':
    'So close — a little too low. Find the amount for one first, then multiply by how many you need.',
  'answered-the-total':
    'That is the amount you started with. Find the amount for just one first, then scale up to the new number.',
  'answered-the-unit-rate':
    'That is the amount for just one. Multiply it by how many you need.',

  // data-analysis (mean-from-total)
  'mean-too-high':
    'So close — a little high. The mean is the total shared equally: total divided by the number of games.',
  'mean-too-low':
    'So close — a little low. The mean is the total shared equally: total divided by the number of games.',
  'forgot-to-divide-total':
    'That is the total. To get the mean, share it equally: divide the total by the number of games.',
  'answered-the-count':
    'That is the number of games, not the average. Divide the total points by the number of games.',

  // expressions / algebra (evaluate a*x + b, a*x + b*y)
  'wrong-order-of-operations':
    'Careful with the order — multiply before you add. Work out the times part first, then add the extra number.',
  'dropped-the-constant':
    'So close — it looks like you left off the number being added at the end. Do the multiply, then add it back.',
  'coefficient-too-high':
    'So close — just a little high. Double-check the number in front of the variable and multiply by exactly that.',
  'coefficient-too-low':
    'So close — just a little low. Double-check the number in front of the variable and multiply by exactly that.',
  'added-the-coefficient':
    'It looks like you added the number in front instead of multiplying. "3x" means 3 times x.',
  'doubled-the-constant':
    'Close — it looks like the number on the end got added twice. Add it just once.',
  'swapped-the-variables':
    'It looks like the two numbers in front got matched to the wrong variables. Keep each one with its own letter.',
  'dropped-a-term':
    'So close — it looks like one whole term was left out. Work out both parts, then add them together.',
  'added-everything':
    'It looks like all the numbers were added. Multiply each variable by its own number first, then add those results.',

  // functions / advanced functions (evaluate x^2 + b, a*x^2 + c)
  'multiplied-instead-of-squared':
    'Squaring means the number times itself, not times 2. For example, $5^2 = 5 \\times 5 = 25$, not $10$.',
  'base-too-high':
    'So close — a little high. Square exactly the number given, not one more than it.',
  'base-too-low':
    'So close — a little low. Square exactly the number given, not one less than it.',
  'squared-the-coefficient':
    'Only the variable is squared, not the number in front. Square the variable first, then multiply by the number.',

  // hs-geometry (triangle area)
  'forgot-to-halve':
    'That is the whole rectangle. A triangle is half of it — divide base times height by 2.',
  'base-too-short':
    'So close — a little low. Use the exact base length, then take half of base times height.',
  'base-too-long':
    'So close — a little high. Use the exact base length, then take half of base times height.',
  'height-too-tall':
    'So close — a little high. Use the exact height, then take half of base times height.',

  // algebra-2 (solve x^2 = k)
  'answered-the-square':
    'That is the number being squared, not x. You need the number that, times itself, gives it.',
  'root-too-high':
    'So close — a little high. Find the number that multiplied by itself gives exactly that value.',
  'root-too-low':
    'So close — a little low. Find the number that multiplied by itself gives exactly that value.',
  'doubled-the-root':
    'To undo a square you take the square root, not divide the exponent to get double. Find the number whose square is given.',
  'root-way-too-high':
    'That is too big — the number times itself would be much larger than the value shown. Try a smaller number.',
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
