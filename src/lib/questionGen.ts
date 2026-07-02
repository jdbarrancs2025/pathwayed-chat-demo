/**
 * Question Engine, Stage 2 — deterministic MATH template generator.
 *
 * PURE and NO-LLM: `generateQuestion(spec, distractors, seed)` fills slot
 * variables from a seed, COMPUTES the correct answer, and builds distractors
 * from misconception patterns. Same seed -> identical question; different seeds
 * vary. Produces ORIGINAL items from the public blueprint (solve ax+b=c, p% of
 * n) — never reproduces real/copyrighted SAT text.
 *
 * Formulas (answer, derived values, distractors, constraints) are evaluated by
 * the tiny recursive-descent evaluator below — NOT eval(): only numbers, the
 * spec's own slot/derived identifiers, + - * /, unary minus, and parentheses.
 */

// --- Spec types (mirror question_templates.generation_spec / distractor_spec) -

export interface SlotSpec {
  name: string
  min: number
  max: number
  step?: number // default 1
  exclude?: number[]
}

export interface DerivedSpec {
  name: string
  formula: string // evaluated over slots + earlier-derived vars
}

export type ResponseType = 'multiple_choice' | 'grid_in'
export type AnswerFormat = 'integer'

export interface MathGenerationSpec {
  kind: 'template_math'
  schemaVersion: 1
  responseType: ResponseType
  stemTemplate: string
  slots: SlotSpec[]
  derived?: DerivedSpec[]
  answerFormula: string
  answerFormat: AnswerFormat
  constraints?: string[] // boolean: lhs <comparator> rhs
  solutionTemplate?: string
}

export interface DistractorPattern {
  formula: string
  misconception_token: string // kebab-case ^[a-z][a-z0-9-]*$
}
export type MathDistractorSpec = DistractorPattern[]

// --- Generated output (matches generated_questions.choices/correct_answer) ---

export interface GeneratedChoice {
  text: string
  is_correct: boolean
  misconception_token?: string
}

export interface GeneratedQuestion {
  stem: string
  choices: GeneratedChoice[] // [] for grid_in
  correct_answer: string
  solution: string | null
}

// We require 1 correct + 3 distinct distractors for multiple choice.
const DISTRACTORS_NEEDED = 3
export const MAX_ATTEMPTS = 100

// --- Safe arithmetic evaluator (recursive descent) ---------------------------

type Tok = { t: 'num'; v: number } | { t: 'id'; v: string } | { t: 'op'; v: string }

function tokenize(src: string): Tok[] {
  const toks: Tok[] = []
  let i = 0
  while (i < src.length) {
    const c = src[i]
    if (c === ' ' || c === '\t') {
      i++
      continue
    }
    if ((c >= '0' && c <= '9') || c === '.') {
      let j = i + 1
      while (j < src.length && ((src[j] >= '0' && src[j] <= '9') || src[j] === '.')) j++
      toks.push({ t: 'num', v: Number(src.slice(i, j)) })
      i = j
      continue
    }
    if (/[a-zA-Z_]/.test(c)) {
      let j = i + 1
      while (j < src.length && /[a-zA-Z0-9_]/.test(src[j])) j++
      toks.push({ t: 'id', v: src.slice(i, j) })
      i = j
      continue
    }
    if ('+-*/(),'.includes(c)) {
      toks.push({ t: 'op', v: c })
      i++
      continue
    }
    throw new Error(`evalFormula: unexpected character '${c}' in '${src}'`)
  }
  return toks
}

function gcd2(x: number, y: number): number {
  let a = Math.abs(Math.trunc(x))
  let b = Math.abs(Math.trunc(y))
  while (b) [a, b] = [b, a % b]
  return a
}

// Whitelisted formula functions. Additive: formulas without a call parse exactly
// as before, so existing templates are unaffected.
function callFn(name: string, args: number[], src: string): number {
  if (name === 'gcd') {
    if (args.length !== 2) throw new Error(`evalFormula: gcd expects 2 args in '${src}'`)
    return gcd2(args[0], args[1])
  }
  throw new Error(`evalFormula: unknown function '${name}' in '${src}'`)
}

/** Evaluate a whitelisted arithmetic expression over `vars`. Supports +,-,*,/,
 *  unary minus, parentheses, and whitelisted function calls (e.g. gcd(a, b)). */
export function evalFormula(src: string, vars: Record<string, number>): number {
  const toks = tokenize(src)
  let pos = 0
  const peek = (): Tok | undefined => toks[pos]
  const eat = (): Tok => toks[pos++]

  function parseExpr(): number {
    let v = parseTerm()
    for (let t = peek(); t && t.t === 'op' && (t.v === '+' || t.v === '-'); t = peek()) {
      const op = eat().v
      const r = parseTerm()
      v = op === '+' ? v + r : v - r
    }
    return v
  }
  function parseTerm(): number {
    let v = parseFactor()
    for (let t = peek(); t && t.t === 'op' && (t.v === '*' || t.v === '/'); t = peek()) {
      const op = eat().v
      const r = parseFactor()
      v = op === '*' ? v * r : v / r
    }
    return v
  }
  function parseFactor(): number {
    const t = peek()
    if (!t) throw new Error(`evalFormula: unexpected end of '${src}'`)
    if (t.t === 'op' && t.v === '-') {
      eat()
      return -parseFactor()
    }
    if (t.t === 'op' && t.v === '(') {
      eat()
      const v = parseExpr()
      const close = eat()
      if (!close || close.t !== 'op' || close.v !== ')') throw new Error(`evalFormula: missing ')' in '${src}'`)
      return v
    }
    if (t.t === 'num') {
      eat()
      return t.v
    }
    if (t.t === 'id') {
      eat()
      // Function call: id '(' expr (',' expr)* ')'
      const next = peek()
      if (next && next.t === 'op' && next.v === '(') {
        eat() // '('
        const args: number[] = []
        if (!(peek()?.t === 'op' && peek()?.v === ')')) {
          args.push(parseExpr())
          for (let n = peek(); n && n.t === 'op' && n.v === ','; n = peek()) {
            eat()
            args.push(parseExpr())
          }
        }
        const close = eat()
        if (!close || close.t !== 'op' || close.v !== ')') throw new Error(`evalFormula: missing ')' in '${src}'`)
        return callFn(t.v, args, src)
      }
      if (!(t.v in vars)) throw new Error(`evalFormula: unknown variable '${t.v}' in '${src}'`)
      return vars[t.v]
    }
    throw new Error(`evalFormula: unexpected token in '${src}'`)
  }

  const result = parseExpr()
  if (pos !== toks.length) throw new Error(`evalFormula: trailing tokens in '${src}'`)
  return result
}

const COMPARATOR = /^(.*?)(==|!=|>=|<=|>|<)(.*)$/

function evalConstraint(src: string, vars: Record<string, number>): boolean {
  const m = src.match(COMPARATOR)
  if (!m) throw new Error(`evalConstraint: no comparator in '${src}'`)
  const l = evalFormula(m[1], vars)
  const r = evalFormula(m[3], vars)
  switch (m[2]) {
    case '==':
      return l === r
    case '!=':
      return l !== r
    case '>':
      return l > r
    case '<':
      return l < r
    case '>=':
      return l >= r
    case '<=':
      return l <= r
    default:
      return false
  }
}

// --- Placeholder filling -----------------------------------------------------

function requireVar(vars: Record<string, number>, name: string): number {
  if (!(name in vars)) throw new Error(`fill: unknown placeholder '{${name}}'`)
  return vars[name]
}

/** {name} -> value; {±name} -> a signed term (" + 4" / " - 4"). Numeric braces
 *  like {100} (LaTeX) are left untouched since they don't start with a letter. */
function fill(tpl: string, vars: Record<string, number>): string {
  return tpl
    .replace(/\{±([a-zA-Z][\w]*)\}/g, (_m, name: string) => {
      const v = requireVar(vars, name)
      return v >= 0 ? ` + ${v}` : ` - ${Math.abs(v)}`
    })
    .replace(/\{([a-zA-Z][\w]*)\}/g, (_m, name: string) => String(requireVar(vars, name)))
}

// --- Seedable PRNG -----------------------------------------------------------

function mulberry32(a: number): () => number {
  return function () {
    a |= 0
    a = (a + 0x6d2b79f5) | 0
    let t = Math.imul(a ^ (a >>> 15), 1 | a)
    t = (t + Math.imul(t ^ (t >>> 7), 61 | t)) ^ t
    return ((t ^ (t >>> 14)) >>> 0) / 4294967296
  }
}

function allowedValues(s: SlotSpec): number[] {
  const step = s.step ?? 1
  const out: number[] = []
  for (let v = s.min; v <= s.max; v += step) {
    if (!s.exclude?.includes(v)) out.push(v)
  }
  if (!out.length) throw new Error(`slot '${s.name}' has no allowed values`)
  return out
}

function drawSlots(slots: SlotSpec[], rng: () => number): Record<string, number> {
  const vars: Record<string, number> = {}
  for (const s of slots) {
    const vals = allowedValues(s)
    vars[s.name] = vals[Math.floor(rng() * vals.length)]
  }
  return vars
}

function shuffle<T>(arr: T[], rng: () => number): void {
  for (let i = arr.length - 1; i > 0; i--) {
    const j = Math.floor(rng() * (i + 1))
    ;[arr[i], arr[j]] = [arr[j], arr[i]]
  }
}

// --- Build one question from a concrete slot assignment ----------------------

/**
 * Pure single attempt. Returns the question, or null if this slot assignment
 * fails a constraint, yields a non-integer answer, or can't produce enough
 * distinct distractors (distinct from the answer AND from each other). The
 * caller (generateQuestion) reseeds on null. Exported for collision tests.
 */
export function buildFromSlots(
  spec: MathGenerationSpec,
  distractors: MathDistractorSpec,
  slotVars: Record<string, number>,
  rng: () => number,
): GeneratedQuestion | null {
  const vars: Record<string, number> = { ...slotVars }
  for (const d of spec.derived ?? []) vars[d.name] = evalFormula(d.formula, vars)
  for (const c of spec.constraints ?? []) if (!evalConstraint(c, vars)) return null

  const answer = evalFormula(spec.answerFormula, vars)
  if (spec.answerFormat === 'integer' && !Number.isInteger(answer)) return null
  vars.answer = answer

  // Distinct from the answer AND from each other.
  const used = new Set<number>([answer])
  const picked: { value: number; token: string }[] = []
  for (const d of distractors) {
    let val: number
    try {
      val = evalFormula(d.formula, vars)
    } catch {
      continue
    }
    if (!Number.isFinite(val)) continue
    if (spec.answerFormat === 'integer' && !Number.isInteger(val)) continue
    if (used.has(val)) continue
    used.add(val)
    picked.push({ value: val, token: d.misconception_token })
    if (picked.length === DISTRACTORS_NEEDED) break
  }

  const stem = fill(spec.stemTemplate, vars)
  const solution = spec.solutionTemplate ? fill(spec.solutionTemplate, vars) : null
  const correct_answer = String(answer)

  if (spec.responseType === 'grid_in') {
    return { stem, choices: [], correct_answer, solution }
  }

  if (picked.length < DISTRACTORS_NEEDED) return null
  const choices: GeneratedChoice[] = [
    { text: String(answer), is_correct: true },
    ...picked.map((p) => ({ text: String(p.value), is_correct: false, misconception_token: p.token })),
  ]
  shuffle(choices, rng)
  return { stem, choices, correct_answer, solution }
}

export interface GenerateDebug {
  question: GeneratedQuestion
  slots: Record<string, number>
}

/** Like generateQuestion, but also returns the drawn slot values (for tests). */
export function generateQuestionDebug(
  spec: MathGenerationSpec,
  distractors: MathDistractorSpec,
  seed: number,
): GenerateDebug {
  const rng = mulberry32(seed >>> 0)
  for (let i = 0; i < MAX_ATTEMPTS; i++) {
    const slots = drawSlots(spec.slots, rng)
    const question = buildFromSlots(spec, distractors, slots, rng)
    if (question) return { question, slots }
  }
  // A template that can't yield distinct choices within the cap is broken.
  throw new Error(
    `generateQuestion: template failed to produce ${
      spec.responseType === 'multiple_choice' ? '4 distinct choices' : 'a valid item'
    } within ${MAX_ATTEMPTS} attempts (bad template)`,
  )
}

/**
 * Deterministic, pure generator: fills slots from `seed`, computes the correct
 * answer, builds distractors, and reseeds past any collision/constraint failure
 * (up to MAX_ATTEMPTS, then throws loudly).
 */
export function generateQuestion(
  spec: MathGenerationSpec,
  distractors: MathDistractorSpec,
  seed: number,
): GeneratedQuestion {
  return generateQuestionDebug(spec, distractors, seed).question
}
