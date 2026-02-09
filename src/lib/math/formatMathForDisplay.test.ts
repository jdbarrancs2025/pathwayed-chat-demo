import { describe, expect, it } from "vitest"
import { formatMathForDisplay } from "./formatMathForDisplay"

interface TestCase {
  name: string
  input: string
  expected: string
}

const cases: TestCase[] = [
  {
    name: "repairs nested dollar delimiters inside bracket delimiters",
    input: String.raw`Solve for x: \[$\frac{2x - 3}{4}$ =\]`,
    expected: String.raw`Solve for x: $$\frac{2x - 3}{4} =$$`,
  },
  {
    name: "repairs malformed dollars inside existing block math",
    input: String.raw`Solve for x: $$\frac{2x - 3}{4}$ =$$`,
    expected: String.raw`Solve for x: $$\frac{2x - 3}{4} =$$`,
  },
  {
    name: "keeps valid inline and block math unchanged",
    input: String.raw`Already valid: $x^2 + 1$ and $$\sqrt{16}$$`,
    expected: String.raw`Already valid: $x^2 + 1$ and $$\sqrt{16}$$`,
  },
  {
    name: "wraps bare latex commands outside math regions",
    input: String.raw`Solve: \frac{3}{4} + 1`,
    expected: String.raw`Solve: $\frac{3}{4}$ + 1`,
  },
  {
    name: "repairs nested inline delimiters when converting parenthesis delimiters",
    input: String.raw`Solve: \( $x + 2$ = 5 \)`,
    expected: String.raw`Solve: $x + 2 = 5$`,
  },
  {
    name: "preserves escaped dollar signs inside math",
    input: String.raw`Balance: \[\$5 + x\]`,
    expected: String.raw`Balance: $$\$5 + x$$`,
  },
  {
    name: "keeps non-math currency text unchanged",
    input: "Cost is $5.00 today",
    expected: "Cost is $5.00 today",
  },
]

describe("formatMathForDisplay", () => {
  for (const testCase of cases) {
    it(testCase.name, () => {
      expect(formatMathForDisplay(testCase.input)).toBe(testCase.expected)
    })
  }
})
