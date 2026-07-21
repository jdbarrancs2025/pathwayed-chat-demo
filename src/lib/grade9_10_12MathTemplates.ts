/**
 * Grade 9, 10 & 12 math (Algebra 1 / Geometry / Precalculus) — CURATED POOL (16 skills, 20 items each), same shape
 * and served path as gapMathTemplates.ts. Generated from reviewed authored JSON;
 * every answer key is verified in the morning review before the seed is run.
 */
import type { GapMathSkill } from '@/lib/gapMathTemplates'

const LINEAR_EQUATIONS: GapMathSkill = {
  slug: "linear-equations",
  name: "Linear Equations",
  subject: 'math',
  ccssGrade: "9",
  ccssGradeNum: 9,
  ccssCode: "CCSS.MATH.CONTENT.HSA.REI.B.3",
  satAlignment: "algebra",
  gradeBand: "9-12",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "Solve for $x$: $2x + 5 = 13$.",
      "choices": [
        {
          "text": "4",
          "is_correct": true
        },
        {
          "text": "9",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracted"
        },
        {
          "text": "8",
          "is_correct": false,
          "misconception_token": "skipped-division"
        },
        {
          "text": "1.5",
          "is_correct": false,
          "misconception_token": "divided-before-subtracting"
        }
      ],
      "solution": "Subtract 5 from both sides: $2x = 8$. Divide by 2: $x = 4$."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "Solve for $x$: $5x - 3 = 22$.",
      "choices": [
        {
          "text": "5",
          "is_correct": true
        },
        {
          "text": "3.8",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-added"
        },
        {
          "text": "19",
          "is_correct": false,
          "misconception_token": "skipped-division"
        },
        {
          "text": "4.4",
          "is_correct": false,
          "misconception_token": "divided-before-adding"
        }
      ],
      "solution": "Add 3 to both sides: $5x = 25$. Divide by 5: $x = 5$."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "Solve for $x$: $3x + 7 = x + 15$.",
      "choices": [
        {
          "text": "4",
          "is_correct": true
        },
        {
          "text": "2",
          "is_correct": false,
          "misconception_token": "added-variables-instead-of-subtracting"
        },
        {
          "text": "11",
          "is_correct": false,
          "misconception_token": "added-constants-instead-of-subtracting"
        },
        {
          "text": "8",
          "is_correct": false,
          "misconception_token": "skipped-division"
        }
      ],
      "solution": "Subtract $x$ from both sides and subtract 7: $2x = 8$. Divide by 2: $x = 4$."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "Solve for $x$: $\\frac{x}{4} = 6$.",
      "choices": [
        {
          "text": "24",
          "is_correct": true
        },
        {
          "text": "1.5",
          "is_correct": false,
          "misconception_token": "divided-instead-of-multiplied"
        },
        {
          "text": "2",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-multiplied"
        },
        {
          "text": "10",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        }
      ],
      "solution": "Multiply both sides by 4: $x = 6 \\times 4 = 24$."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "Solve for $x$: $2(x + 3) = 14$.",
      "choices": [
        {
          "text": "4",
          "is_correct": true
        },
        {
          "text": "5.5",
          "is_correct": false,
          "misconception_token": "distributed-to-first-term-only"
        },
        {
          "text": "10",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracting"
        },
        {
          "text": "7",
          "is_correct": false,
          "misconception_token": "forgot-constant-term"
        }
      ],
      "solution": "Distribute: $2x + 6 = 14$. Subtract 6: $2x = 8$. Divide by 2: $x = 4$."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "Solve for $x$: $-4x = 20$.",
      "choices": [
        {
          "text": "-5",
          "is_correct": true
        },
        {
          "text": "5",
          "is_correct": false,
          "misconception_token": "ignored-negative-sign"
        },
        {
          "text": "-80",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-divided"
        },
        {
          "text": "-16",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-dividing"
        }
      ],
      "solution": "Divide both sides by $-4$: $x = 20 \\div (-4) = -5$."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "Solve for $x$: $\\frac{2}{3}x = 8$.",
      "choices": [
        {
          "text": "12",
          "is_correct": true
        },
        {
          "text": "$\\frac{16}{3}$",
          "is_correct": false,
          "misconception_token": "multiplied-by-fraction-not-reciprocal"
        },
        {
          "text": "4",
          "is_correct": false,
          "misconception_token": "divided-by-numerator-only"
        },
        {
          "text": "24",
          "is_correct": false,
          "misconception_token": "multiplied-by-denominator-only"
        }
      ],
      "solution": "Multiply both sides by the reciprocal $\\frac{3}{2}$: $x = 8 \\times \\frac{3}{2} = 12$."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "Solve for $x$: $6x - 4 = 2x + 8$.",
      "choices": [
        {
          "text": "3",
          "is_correct": true
        },
        {
          "text": "1",
          "is_correct": false,
          "misconception_token": "subtracted-constants-instead-of-adding"
        },
        {
          "text": "1.5",
          "is_correct": false,
          "misconception_token": "added-variables-instead-of-subtracting"
        },
        {
          "text": "12",
          "is_correct": false,
          "misconception_token": "skipped-division"
        }
      ],
      "solution": "Subtract $2x$ and add 4: $4x = 12$. Divide by 4: $x = 3$."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "Solve for $x$: $3(2x - 1) + 4 = 2(x + 5) + 3x$.",
      "choices": [
        {
          "text": "9",
          "is_correct": true
        },
        {
          "text": "3",
          "is_correct": false,
          "misconception_token": "sign-error-in-distribution"
        },
        {
          "text": "4",
          "is_correct": false,
          "misconception_token": "distributed-to-first-term-only"
        },
        {
          "text": "11",
          "is_correct": false,
          "misconception_token": "added-constants-instead-of-subtracting"
        }
      ],
      "solution": "Left side: $6x - 3 + 4 = 6x + 1$. Right side: $2x + 10 + 3x = 5x + 10$. So $6x + 1 = 5x + 10$, giving $x = 9$."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "The perimeter of a rectangle is 54 cm. Its length is 3 cm more than twice its width. What is the width, in cm?",
      "choices": [
        {
          "text": "8",
          "is_correct": true
        },
        {
          "text": "19",
          "is_correct": false,
          "misconception_token": "found-length-not-width"
        },
        {
          "text": "17",
          "is_correct": false,
          "misconception_token": "forgot-to-double-perimeter"
        },
        {
          "text": "9",
          "is_correct": false,
          "misconception_token": "ignored-constant-term"
        }
      ],
      "solution": "Let width be $w$; length is $2w + 3$. Perimeter: $2(2w + 3 + w) = 54$, so $6w + 6 = 54$, $6w = 48$, $w = 8$."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "Solve for $x$: $\\frac{x}{2} + \\frac{x}{3} = 10$.",
      "choices": [
        {
          "text": "12",
          "is_correct": true
        },
        {
          "text": "50",
          "is_correct": false,
          "misconception_token": "added-denominators"
        },
        {
          "text": "2",
          "is_correct": false,
          "misconception_token": "forgot-to-multiply-constant-by-lcd"
        },
        {
          "text": "60",
          "is_correct": false,
          "misconception_token": "skipped-division"
        }
      ],
      "solution": "Multiply through by 6: $3x + 2x = 60$, so $5x = 60$ and $x = 12$."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "A taxi charges a 4 dollar base fare plus 2 dollars per mile. A ride cost 30 dollars. How many miles was the ride?",
      "choices": [
        {
          "text": "13",
          "is_correct": true
        },
        {
          "text": "15",
          "is_correct": false,
          "misconception_token": "ignored-base-fare"
        },
        {
          "text": "26",
          "is_correct": false,
          "misconception_token": "skipped-division"
        },
        {
          "text": "17",
          "is_correct": false,
          "misconception_token": "added-base-instead-of-subtracting"
        }
      ],
      "solution": "Let $m$ be miles: $4 + 2m = 30$. Subtract 4: $2m = 26$. Divide by 2: $m = 13$."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "Solve for $x$: $0.4x + 1.2 = 0.1x + 3$.",
      "choices": [
        {
          "text": "6",
          "is_correct": true
        },
        {
          "text": "14",
          "is_correct": false,
          "misconception_token": "added-constants-instead-of-subtracting"
        },
        {
          "text": "3.6",
          "is_correct": false,
          "misconception_token": "added-variables-instead-of-subtracting"
        },
        {
          "text": "1.8",
          "is_correct": false,
          "misconception_token": "skipped-division"
        }
      ],
      "solution": "Subtract $0.1x$ and $1.2$: $0.3x = 1.8$. Divide by $0.3$: $x = 6$."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "Maria is 3 times as old as her brother. In 6 years, the sum of their ages will be 44. How old is her brother now?",
      "choices": [
        {
          "text": "8",
          "is_correct": true
        },
        {
          "text": "24",
          "is_correct": false,
          "misconception_token": "found-maria-not-brother"
        },
        {
          "text": "9.5",
          "is_correct": false,
          "misconception_token": "added-years-to-one-person-only"
        },
        {
          "text": "11",
          "is_correct": false,
          "misconception_token": "ignored-future-years"
        }
      ],
      "solution": "Let brother be $b$, Maria $3b$. In 6 years: $(b + 6) + (3b + 6) = 44$, so $4b + 12 = 44$, $4b = 32$, $b = 8$."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "Solve for $x$: $\\frac{2x - 1}{3} = 5$.",
      "choices": [
        {
          "text": "8",
          "is_correct": true
        },
        {
          "text": "3",
          "is_correct": false,
          "misconception_token": "forgot-to-multiply-both-sides"
        },
        {
          "text": "7",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-adding"
        },
        {
          "text": "16",
          "is_correct": false,
          "misconception_token": "skipped-division"
        }
      ],
      "solution": "Multiply both sides by 3: $2x - 1 = 15$. Add 1: $2x = 16$. Divide by 2: $x = 8$."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "A phone plan costs 20 dollars per month plus 10 dollars for each gigabyte over the limit. Sam's bill was 70 dollars. How many gigabytes over the limit was he?",
      "choices": [
        {
          "text": "5",
          "is_correct": true
        },
        {
          "text": "7",
          "is_correct": false,
          "misconception_token": "ignored-monthly-base"
        },
        {
          "text": "9",
          "is_correct": false,
          "misconception_token": "added-base-instead-of-subtracting"
        },
        {
          "text": "50",
          "is_correct": false,
          "misconception_token": "skipped-division"
        }
      ],
      "solution": "Let $g$ be gigabytes over: $20 + 10g = 70$. Subtract 20: $10g = 50$. Divide by 10: $g = 5$."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "Solve for $x$: $\\frac{x + 2}{3} - \\frac{x - 1}{4} = 2$.",
      "choices": [
        {
          "text": "13",
          "is_correct": true
        },
        {
          "text": "19",
          "is_correct": false,
          "misconception_token": "sign-error-in-distribution"
        },
        {
          "text": "-9",
          "is_correct": false,
          "misconception_token": "forgot-to-multiply-constant-by-lcd"
        },
        {
          "text": "23",
          "is_correct": false,
          "misconception_token": "forgot-to-distribute"
        }
      ],
      "solution": "Multiply through by 12: $4(x + 2) - 3(x - 1) = 24$, so $4x + 8 - 3x + 3 = 24$, giving $x + 11 = 24$ and $x = 13$."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "Two trains leave the same station traveling in opposite directions, one at 60 mph and the other at 45 mph. After how many hours are they 420 miles apart?",
      "choices": [
        {
          "text": "4",
          "is_correct": true
        },
        {
          "text": "28",
          "is_correct": false,
          "misconception_token": "used-speed-difference"
        },
        {
          "text": "7",
          "is_correct": false,
          "misconception_token": "used-one-speed-only"
        },
        {
          "text": "8",
          "is_correct": false,
          "misconception_token": "used-average-speed"
        }
      ],
      "solution": "Moving apart, the gap grows at $60 + 45 = 105$ mph. Solve $105t = 420$: $t = 4$."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "Solve for $x$: $4(x - 3) - 2(x + 1) = 3(x - 5) - 4$.",
      "choices": [
        {
          "text": "5",
          "is_correct": true
        },
        {
          "text": "9",
          "is_correct": false,
          "misconception_token": "sign-error-in-distribution"
        },
        {
          "text": "-1",
          "is_correct": false,
          "misconception_token": "added-variables-instead-of-subtracting"
        },
        {
          "text": "14",
          "is_correct": false,
          "misconception_token": "distributed-to-first-term-only"
        }
      ],
      "solution": "Left: $4x - 12 - 2x - 2 = 2x - 14$. Right: $3x - 15 - 4 = 3x - 19$. So $2x - 14 = 3x - 19$, giving $x = 5$."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "The length of a garden is 48 feet, which is one-third longer than its width. Find the width, in feet.",
      "choices": [
        {
          "text": "36",
          "is_correct": true
        },
        {
          "text": "16",
          "is_correct": false,
          "misconception_token": "took-fraction-of-total"
        },
        {
          "text": "32",
          "is_correct": false,
          "misconception_token": "subtracted-fraction-of-total"
        },
        {
          "text": "64",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-divided"
        }
      ],
      "solution": "Let width be $w$. One-third longer means $w + \\frac{1}{3}w = 48$, so $\\frac{4}{3}w = 48$ and $w = 48 \\times \\frac{3}{4} = 36$."
    }
  ],
}

const LINEAR_INEQUALITIES: GapMathSkill = {
  slug: "linear-inequalities",
  name: "Linear Inequalities",
  subject: 'math',
  ccssGrade: "9",
  ccssGradeNum: 9,
  ccssCode: "CCSS.MATH.CONTENT.HSA.REI.B.3",
  satAlignment: "algebra",
  gradeBand: "9-12",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "Solve for $x$: $x + 5 < 12$.",
      "choices": [
        {
          "text": "$x < 7$",
          "is_correct": true
        },
        {
          "text": "$x < 17$",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracted"
        },
        {
          "text": "$x > 7$",
          "is_correct": false,
          "misconception_token": "flipped-sign-unnecessarily"
        },
        {
          "text": "$x \\leq 7$",
          "is_correct": false,
          "misconception_token": "changed-strictness"
        }
      ],
      "solution": "Subtract 5 from both sides: $x < 12 - 5$, so $x < 7$."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "Solve for $x$: $x - 3 \\geq 4$.",
      "choices": [
        {
          "text": "$x \\geq 7$",
          "is_correct": true
        },
        {
          "text": "$x \\geq 1$",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-added"
        },
        {
          "text": "$x \\leq 7$",
          "is_correct": false,
          "misconception_token": "flipped-sign-unnecessarily"
        },
        {
          "text": "$x > 7$",
          "is_correct": false,
          "misconception_token": "changed-strictness"
        }
      ],
      "solution": "Add 3 to both sides: $x \\geq 4 + 3$, so $x \\geq 7$."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "Solve for $x$: $3x < 15$.",
      "choices": [
        {
          "text": "$x < 5$",
          "is_correct": true
        },
        {
          "text": "$x < 45$",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-divided"
        },
        {
          "text": "$x < 12$",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-divided"
        },
        {
          "text": "$x > 5$",
          "is_correct": false,
          "misconception_token": "flipped-sign-unnecessarily"
        }
      ],
      "solution": "Divide both sides by 3: $x < \\frac{15}{3}$, so $x < 5$."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "Solve for $x$: $\\frac{x}{2} \\geq 6$.",
      "choices": [
        {
          "text": "$x \\geq 12$",
          "is_correct": true
        },
        {
          "text": "$x \\geq 3$",
          "is_correct": false,
          "misconception_token": "divided-instead-of-multiplied"
        },
        {
          "text": "$x \\geq 8$",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        },
        {
          "text": "$x \\leq 12$",
          "is_correct": false,
          "misconception_token": "flipped-sign-unnecessarily"
        }
      ],
      "solution": "Multiply both sides by 2: $x \\geq 6 \\times 2$, so $x \\geq 12$."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "Solve for $x$: $-x > 4$.",
      "choices": [
        {
          "text": "$x < -4$",
          "is_correct": true
        },
        {
          "text": "$x > -4$",
          "is_correct": false,
          "misconception_token": "forgot-to-flip-sign"
        },
        {
          "text": "$x < 4$",
          "is_correct": false,
          "misconception_token": "dropped-negative-sign"
        },
        {
          "text": "$x > 4$",
          "is_correct": false,
          "misconception_token": "ignored-negative-and-flip"
        }
      ],
      "solution": "Divide (or multiply) both sides by $-1$, which flips the inequality: $x < -4$."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "Solve for $x$: $-2x \\leq 10$.",
      "choices": [
        {
          "text": "$x \\geq -5$",
          "is_correct": true
        },
        {
          "text": "$x \\leq -5$",
          "is_correct": false,
          "misconception_token": "forgot-to-flip-sign"
        },
        {
          "text": "$x \\geq 5$",
          "is_correct": false,
          "misconception_token": "dropped-negative-sign"
        },
        {
          "text": "$x \\leq 5$",
          "is_correct": false,
          "misconception_token": "ignored-negative-and-flip"
        }
      ],
      "solution": "Divide both sides by $-2$ and flip the inequality: $x \\geq \\frac{10}{-2}$, so $x \\geq -5$."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "Solve for $x$: $x + 8 \\leq 3$.",
      "choices": [
        {
          "text": "$x \\leq -5$",
          "is_correct": true
        },
        {
          "text": "$x \\leq 11$",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracted"
        },
        {
          "text": "$x \\leq 5$",
          "is_correct": false,
          "misconception_token": "dropped-negative-sign"
        },
        {
          "text": "$x \\geq -5$",
          "is_correct": false,
          "misconception_token": "flipped-sign-unnecessarily"
        }
      ],
      "solution": "Subtract 8 from both sides: $x \\leq 3 - 8$, so $x \\leq -5$."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "Solve for $x$: $5x > 20$.",
      "choices": [
        {
          "text": "$x > 4$",
          "is_correct": true
        },
        {
          "text": "$x > 100$",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-divided"
        },
        {
          "text": "$x > 15$",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-divided"
        },
        {
          "text": "$x < 4$",
          "is_correct": false,
          "misconception_token": "flipped-sign-unnecessarily"
        }
      ],
      "solution": "Divide both sides by 5: $x > \\frac{20}{5}$, so $x > 4$."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "Solve for $x$: $2x + 3 < 11$.",
      "choices": [
        {
          "text": "$x < 4$",
          "is_correct": true
        },
        {
          "text": "$x < 8$",
          "is_correct": false,
          "misconception_token": "forgot-to-divide"
        },
        {
          "text": "$x < 7$",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracted"
        },
        {
          "text": "$x > 4$",
          "is_correct": false,
          "misconception_token": "flipped-sign-unnecessarily"
        }
      ],
      "solution": "Subtract 3: $2x < 8$. Divide by 2: $x < 4$."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "Solve for $x$: $4x - 5 \\geq 7$.",
      "choices": [
        {
          "text": "$x \\geq 3$",
          "is_correct": true
        },
        {
          "text": "$x \\geq 12$",
          "is_correct": false,
          "misconception_token": "forgot-to-divide"
        },
        {
          "text": "$x \\geq 0.5$",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-added"
        },
        {
          "text": "$x \\leq 3$",
          "is_correct": false,
          "misconception_token": "flipped-sign-unnecessarily"
        }
      ],
      "solution": "Add 5: $4x \\geq 12$. Divide by 4: $x \\geq 3$."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "Solve for $x$: $-3x + 2 > 11$.",
      "choices": [
        {
          "text": "$x < -3$",
          "is_correct": true
        },
        {
          "text": "$x > -3$",
          "is_correct": false,
          "misconception_token": "forgot-to-flip-sign"
        },
        {
          "text": "$x < 3$",
          "is_correct": false,
          "misconception_token": "dropped-negative-sign"
        },
        {
          "text": "$x > 3$",
          "is_correct": false,
          "misconception_token": "ignored-negative-and-flip"
        }
      ],
      "solution": "Subtract 2: $-3x > 9$. Divide by $-3$ and flip the sign: $x < -3$."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "Solve for $x$: $\\frac{x}{3} - 4 \\leq 2$.",
      "choices": [
        {
          "text": "$x \\leq 18$",
          "is_correct": true
        },
        {
          "text": "$x \\leq 6$",
          "is_correct": false,
          "misconception_token": "forgot-to-multiply"
        },
        {
          "text": "$x \\leq -6$",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-added"
        },
        {
          "text": "$x \\geq 18$",
          "is_correct": false,
          "misconception_token": "flipped-sign-unnecessarily"
        }
      ],
      "solution": "Add 4: $\\frac{x}{3} \\leq 6$. Multiply by 3: $x \\leq 18$."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "Solve for $x$: $5x - 3 > 2x + 9$.",
      "choices": [
        {
          "text": "$x > 4$",
          "is_correct": true
        },
        {
          "text": "$x > 12$",
          "is_correct": false,
          "misconception_token": "forgot-to-divide"
        },
        {
          "text": "$x > 2$",
          "is_correct": false,
          "misconception_token": "combined-constants-wrong"
        },
        {
          "text": "$x < 4$",
          "is_correct": false,
          "misconception_token": "flipped-sign-unnecessarily"
        }
      ],
      "solution": "Subtract $2x$: $3x - 3 > 9$. Add 3: $3x > 12$. Divide by 3: $x > 4$."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "A taxi ride costs 3 dollars plus 2 dollars for each mile. If Sam can spend at most 15 dollars, which inequality shows the possible number of miles $m$ he can ride?",
      "choices": [
        {
          "text": "$m \\leq 6$",
          "is_correct": true
        },
        {
          "text": "$m \\leq 12$",
          "is_correct": false,
          "misconception_token": "forgot-to-divide"
        },
        {
          "text": "$m \\leq 7.5$",
          "is_correct": false,
          "misconception_token": "forgot-to-subtract-fee"
        },
        {
          "text": "$m \\geq 6$",
          "is_correct": false,
          "misconception_token": "flipped-sign-unnecessarily"
        }
      ],
      "solution": "Set up $3 + 2m \\leq 15$. Subtract 3: $2m \\leq 12$. Divide by 2: $m \\leq 6$."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "Five more than twice a number $n$ is at least 17. Which inequality shows all possible values of $n$?",
      "choices": [
        {
          "text": "$n \\geq 6$",
          "is_correct": true
        },
        {
          "text": "$n \\geq 11$",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracted"
        },
        {
          "text": "$n \\geq 12$",
          "is_correct": false,
          "misconception_token": "forgot-to-divide"
        },
        {
          "text": "$n \\leq 6$",
          "is_correct": false,
          "misconception_token": "flipped-sign-unnecessarily"
        }
      ],
      "solution": "Set up $2n + 5 \\geq 17$. Subtract 5: $2n \\geq 12$. Divide by 2: $n \\geq 6$."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "On his first test a student scored 78. He wants his average over two tests to be at least 85. Which inequality shows the scores $x$ he can earn on the second test to reach his goal?",
      "choices": [
        {
          "text": "$x \\geq 92$",
          "is_correct": true
        },
        {
          "text": "$x \\geq 85$",
          "is_correct": false,
          "misconception_token": "used-target-as-answer"
        },
        {
          "text": "$x \\geq 7$",
          "is_correct": false,
          "misconception_token": "forgot-to-double"
        },
        {
          "text": "$x \\leq 92$",
          "is_correct": false,
          "misconception_token": "flipped-sign-unnecessarily"
        }
      ],
      "solution": "Set up $\\frac{78 + x}{2} \\geq 85$. Multiply by 2: $78 + x \\geq 170$. Subtract 78: $x \\geq 92$."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "Solve for $x$: $\\frac{2x - 1}{3} \\geq 5$.",
      "choices": [
        {
          "text": "$x \\geq 8$",
          "is_correct": true
        },
        {
          "text": "$x \\geq 3$",
          "is_correct": false,
          "misconception_token": "forgot-to-multiply"
        },
        {
          "text": "$x \\geq 7$",
          "is_correct": false,
          "misconception_token": "wrong-sign-on-constant"
        },
        {
          "text": "$x \\leq 8$",
          "is_correct": false,
          "misconception_token": "flipped-sign-unnecessarily"
        }
      ],
      "solution": "Multiply both sides by 3: $2x - 1 \\geq 15$. Add 1: $2x \\geq 16$. Divide by 2: $x \\geq 8$."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "Solve for $x$: $8 - 3x \\geq 20$.",
      "choices": [
        {
          "text": "$x \\leq -4$",
          "is_correct": true
        },
        {
          "text": "$x \\geq -4$",
          "is_correct": false,
          "misconception_token": "forgot-to-flip-sign"
        },
        {
          "text": "$x \\leq 4$",
          "is_correct": false,
          "misconception_token": "dropped-negative-sign"
        },
        {
          "text": "$x \\geq 4$",
          "is_correct": false,
          "misconception_token": "ignored-negative-and-flip"
        }
      ],
      "solution": "Subtract 8: $-3x \\geq 12$. Divide by $-3$ and flip the sign: $x \\leq -4$."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "A gym charges 25 dollars to join plus 15 dollars each month. If Maria has 130 dollars to spend, which inequality shows the number of months $m$ she can afford?",
      "choices": [
        {
          "text": "$m \\leq 7$",
          "is_correct": true
        },
        {
          "text": "$m \\leq 105$",
          "is_correct": false,
          "misconception_token": "forgot-to-divide"
        },
        {
          "text": "$m \\leq 8$",
          "is_correct": false,
          "misconception_token": "forgot-to-subtract-fee"
        },
        {
          "text": "$m \\geq 7$",
          "is_correct": false,
          "misconception_token": "flipped-sign-unnecessarily"
        }
      ],
      "solution": "Set up $25 + 15m \\leq 130$. Subtract 25: $15m \\leq 105$. Divide by 15: $m \\leq 7$."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "Solve for $x$: $3(x - 2) < 5x + 4$.",
      "choices": [
        {
          "text": "$x > -5$",
          "is_correct": true
        },
        {
          "text": "$x < -5$",
          "is_correct": false,
          "misconception_token": "forgot-to-flip-sign"
        },
        {
          "text": "$x > 5$",
          "is_correct": false,
          "misconception_token": "dropped-negative-sign"
        },
        {
          "text": "$x < 5$",
          "is_correct": false,
          "misconception_token": "ignored-negative-and-flip"
        }
      ],
      "solution": "Distribute: $3x - 6 < 5x + 4$. Subtract $5x$: $-2x - 6 < 4$. Add 6: $-2x < 10$. Divide by $-2$ and flip the sign: $x > -5$."
    }
  ],
}

const GRAPHING_LINEAR_FUNCTIONS: GapMathSkill = {
  slug: "graphing-linear-functions",
  name: "Graphing Linear Functions",
  subject: 'math',
  ccssGrade: "9",
  ccssGradeNum: 9,
  ccssCode: "CCSS.MATH.CONTENT.HSF.IF.C.7",
  satAlignment: "algebra",
  gradeBand: "9-12",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "What is the slope of the line $y = 3x + 5$?",
      "choices": [
        {
          "text": "3",
          "is_correct": true
        },
        {
          "text": "5",
          "is_correct": false,
          "misconception_token": "used-y-intercept"
        },
        {
          "text": "-3",
          "is_correct": false,
          "misconception_token": "negated-slope"
        },
        {
          "text": "8",
          "is_correct": false,
          "misconception_token": "added-m-and-b"
        }
      ],
      "solution": "In slope-intercept form $y = mx + b$, the slope is the coefficient of $x$, so the slope is 3."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "What is the $y$-intercept of the line $y = 2x - 7$?",
      "choices": [
        {
          "text": "-7",
          "is_correct": true
        },
        {
          "text": "2",
          "is_correct": false,
          "misconception_token": "used-slope-as-intercept"
        },
        {
          "text": "7",
          "is_correct": false,
          "misconception_token": "dropped-negative-sign"
        },
        {
          "text": "-2",
          "is_correct": false,
          "misconception_token": "negated-slope"
        }
      ],
      "solution": "In $y = mx + b$, the $y$-intercept is $b$. Here $b = -7$."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "What is the slope of the line through the points $(1, 2)$ and $(3, 8)$?",
      "choices": [
        {
          "text": "3",
          "is_correct": true
        },
        {
          "text": "\\frac{1}{3}",
          "is_correct": false,
          "misconception_token": "inverted-slope-ratio"
        },
        {
          "text": "-3",
          "is_correct": false,
          "misconception_token": "negated-slope"
        },
        {
          "text": "6",
          "is_correct": false,
          "misconception_token": "used-numerator-only"
        }
      ],
      "solution": "Slope $= \\frac{8 - 2}{3 - 1} = \\frac{6}{2} = 3$."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "What is the slope of the line $y = -4x + 9$?",
      "choices": [
        {
          "text": "-4",
          "is_correct": true
        },
        {
          "text": "4",
          "is_correct": false,
          "misconception_token": "dropped-negative-sign"
        },
        {
          "text": "9",
          "is_correct": false,
          "misconception_token": "used-y-intercept"
        },
        {
          "text": "-9",
          "is_correct": false,
          "misconception_token": "negated-y-intercept"
        }
      ],
      "solution": "The slope is the coefficient of $x$ in $y = mx + b$, so the slope is $-4$."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "What is the $x$-intercept of the line $y = 2x - 6$?",
      "choices": [
        {
          "text": "3",
          "is_correct": true
        },
        {
          "text": "-3",
          "is_correct": false,
          "misconception_token": "sign-error-solving"
        },
        {
          "text": "6",
          "is_correct": false,
          "misconception_token": "forgot-to-divide"
        },
        {
          "text": "-6",
          "is_correct": false,
          "misconception_token": "used-constant-term"
        }
      ],
      "solution": "Set $y = 0$: $0 = 2x - 6$, so $2x = 6$ and $x = 3$."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "What is the slope of the line $y = \\frac{1}{2}x + 4$?",
      "choices": [
        {
          "text": "\\frac{1}{2}",
          "is_correct": true
        },
        {
          "text": "4",
          "is_correct": false,
          "misconception_token": "used-y-intercept"
        },
        {
          "text": "2",
          "is_correct": false,
          "misconception_token": "inverted-slope"
        },
        {
          "text": "-\\frac{1}{2}",
          "is_correct": false,
          "misconception_token": "negated-slope"
        }
      ],
      "solution": "The slope is the coefficient of $x$, which is $\\frac{1}{2}$."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "A line passes through $(0, 1)$ and $(2, 5)$. What is its slope?",
      "choices": [
        {
          "text": "2",
          "is_correct": true
        },
        {
          "text": "\\frac{1}{2}",
          "is_correct": false,
          "misconception_token": "inverted-slope-ratio"
        },
        {
          "text": "1",
          "is_correct": false,
          "misconception_token": "used-y-intercept"
        },
        {
          "text": "-2",
          "is_correct": false,
          "misconception_token": "negated-slope"
        }
      ],
      "solution": "Slope $= \\frac{5 - 1}{2 - 0} = \\frac{4}{2} = 2$."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "Which equation has slope $3$ and $y$-intercept $-2$?",
      "choices": [
        {
          "text": "$y = 3x - 2$",
          "is_correct": true
        },
        {
          "text": "$y = -2x + 3$",
          "is_correct": false,
          "misconception_token": "swapped-slope-and-intercept"
        },
        {
          "text": "$y = 3x + 2$",
          "is_correct": false,
          "misconception_token": "wrong-sign-on-intercept"
        },
        {
          "text": "$y = -3x - 2$",
          "is_correct": false,
          "misconception_token": "negated-slope"
        }
      ],
      "solution": "Slope-intercept form is $y = mx + b$ with $m = 3$ and $b = -2$, giving $y = 3x - 2$."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "What is the slope of the line through $(-2, 3)$ and $(4, -9)$?",
      "choices": [
        {
          "text": "-2",
          "is_correct": true
        },
        {
          "text": "2",
          "is_correct": false,
          "misconception_token": "dropped-negative-sign"
        },
        {
          "text": "-\\frac{1}{2}",
          "is_correct": false,
          "misconception_token": "inverted-slope-ratio"
        },
        {
          "text": "-12",
          "is_correct": false,
          "misconception_token": "used-numerator-only"
        }
      ],
      "solution": "Slope $= \\frac{-9 - 3}{4 - (-2)} = \\frac{-12}{6} = -2$."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "What is the equation of the line with slope $2$ that passes through $(3, 1)$?",
      "choices": [
        {
          "text": "$y = 2x - 5$",
          "is_correct": true
        },
        {
          "text": "$y = 2x + 5$",
          "is_correct": false,
          "misconception_token": "wrong-sign-on-intercept"
        },
        {
          "text": "$y = 2x + 1$",
          "is_correct": false,
          "misconception_token": "used-point-y-as-intercept"
        },
        {
          "text": "$y = 2x + 7$",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracted"
        }
      ],
      "solution": "Using $b = y - mx = 1 - 2(3) = -5$, the equation is $y = 2x - 5$."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "A plant is 4 cm tall and grows 3 cm each week. Which equation gives the height $h$ in centimeters after $w$ weeks?",
      "choices": [
        {
          "text": "$h = 3w + 4$",
          "is_correct": true
        },
        {
          "text": "$h = 4w + 3$",
          "is_correct": false,
          "misconception_token": "swapped-rate-and-start"
        },
        {
          "text": "$h = 3w - 4$",
          "is_correct": false,
          "misconception_token": "wrong-sign-on-start"
        },
        {
          "text": "$h = 7w$",
          "is_correct": false,
          "misconception_token": "added-rate-and-start"
        }
      ],
      "solution": "The growth rate 3 is the slope and the starting height 4 is the $y$-intercept, so $h = 3w + 4$."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "A taxi ride costs $c = 2.5m + 4$ dollars, where $m$ is the number of miles. What does the number $2.5$ represent?",
      "choices": [
        {
          "text": "The cost per mile",
          "is_correct": true
        },
        {
          "text": "The base fee",
          "is_correct": false,
          "misconception_token": "confused-with-intercept"
        },
        {
          "text": "The total cost of the ride",
          "is_correct": false,
          "misconception_token": "confused-with-output"
        },
        {
          "text": "The number of miles driven",
          "is_correct": false,
          "misconception_token": "confused-with-input"
        }
      ],
      "solution": "As the slope (coefficient of $m$), $2.5$ is the rate of change: the cost added per mile."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "What is the $x$-intercept of the line $y = -3x + 12$?",
      "choices": [
        {
          "text": "4",
          "is_correct": true
        },
        {
          "text": "-4",
          "is_correct": false,
          "misconception_token": "sign-error-solving"
        },
        {
          "text": "12",
          "is_correct": false,
          "misconception_token": "used-y-intercept"
        },
        {
          "text": "9",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-dividing"
        }
      ],
      "solution": "Set $y = 0$: $0 = -3x + 12$, so $3x = 12$ and $x = 4$."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "A linear function has $y = 5$ when $x = 1$, and $y = 11$ when $x = 3$. What is its rate of change?",
      "choices": [
        {
          "text": "3",
          "is_correct": true
        },
        {
          "text": "\\frac{1}{3}",
          "is_correct": false,
          "misconception_token": "inverted-rate"
        },
        {
          "text": "6",
          "is_correct": false,
          "misconception_token": "used-numerator-only"
        },
        {
          "text": "-3",
          "is_correct": false,
          "misconception_token": "negated-rate"
        }
      ],
      "solution": "Rate of change $= \\frac{11 - 5}{3 - 1} = \\frac{6}{2} = 3$."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "What is the equation of the line through $(0, 2)$ and $(4, 10)$?",
      "choices": [
        {
          "text": "$y = 2x + 2$",
          "is_correct": true
        },
        {
          "text": "$y = 2x + 10$",
          "is_correct": false,
          "misconception_token": "used-second-point-y-as-intercept"
        },
        {
          "text": "$y = \\frac{1}{2}x + 2$",
          "is_correct": false,
          "misconception_token": "inverted-slope"
        },
        {
          "text": "$y = 2x - 2$",
          "is_correct": false,
          "misconception_token": "wrong-sign-on-intercept"
        }
      ],
      "solution": "Slope $= \\frac{10 - 2}{4 - 0} = 2$, and the point $(0, 2)$ gives $b = 2$, so $y = 2x + 2$."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "A gym charges a 50 dollar signup fee plus 20 dollars per month. The total cost after $m$ months is $C = 20m + 50$. What is the total cost after 6 months?",
      "choices": [
        {
          "text": "170 dollars",
          "is_correct": true
        },
        {
          "text": "120 dollars",
          "is_correct": false,
          "misconception_token": "forgot-signup-fee"
        },
        {
          "text": "70 dollars",
          "is_correct": false,
          "misconception_token": "used-one-month"
        },
        {
          "text": "420 dollars",
          "is_correct": false,
          "misconception_token": "applied-fee-monthly"
        }
      ],
      "solution": "Substitute $m = 6$: $C = 20(6) + 50 = 120 + 50 = 170$ dollars."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "What is the slope of the line through $(2, -3)$ and $(-4, 6)$?",
      "choices": [
        {
          "text": "-\\frac{3}{2}",
          "is_correct": true
        },
        {
          "text": "\\frac{3}{2}",
          "is_correct": false,
          "misconception_token": "dropped-negative-sign"
        },
        {
          "text": "-\\frac{2}{3}",
          "is_correct": false,
          "misconception_token": "inverted-slope-ratio"
        },
        {
          "text": "\\frac{2}{3}",
          "is_correct": false,
          "misconception_token": "dropped-sign-and-inverted"
        }
      ],
      "solution": "Slope $= \\frac{6 - (-3)}{-4 - 2} = \\frac{9}{-6} = -\\frac{3}{2}$."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "What is the equation of the line through $(-1, 5)$ and $(3, -3)$?",
      "choices": [
        {
          "text": "$y = -2x + 3$",
          "is_correct": true
        },
        {
          "text": "$y = -2x + 5$",
          "is_correct": false,
          "misconception_token": "used-point-y-as-intercept"
        },
        {
          "text": "$y = 2x + 3$",
          "is_correct": false,
          "misconception_token": "dropped-slope-sign"
        },
        {
          "text": "$y = -2x - 3$",
          "is_correct": false,
          "misconception_token": "wrong-sign-on-intercept"
        }
      ],
      "solution": "Slope $= \\frac{-3 - 5}{3 - (-1)} = \\frac{-8}{4} = -2$; then $b = 5 - (-2)(-1) = 3$, so $y = -2x + 3$."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "A candle burns at a constant rate. After 2 hours it is 18 cm tall, and after 5 hours it is 9 cm tall. What is the rate of change of its height in centimeters per hour?",
      "choices": [
        {
          "text": "-3",
          "is_correct": true
        },
        {
          "text": "3",
          "is_correct": false,
          "misconception_token": "dropped-negative-sign"
        },
        {
          "text": "-9",
          "is_correct": false,
          "misconception_token": "used-numerator-only"
        },
        {
          "text": "-\\frac{1}{3}",
          "is_correct": false,
          "misconception_token": "inverted-rate"
        }
      ],
      "solution": "Rate of change $= \\frac{9 - 18}{5 - 2} = \\frac{-9}{3} = -3$ cm per hour."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "A tank of water is modeled by $g = 240 - 15t$, where $g$ is the gallons remaining and $t$ is the time in minutes. After how many minutes is the tank empty?",
      "choices": [
        {
          "text": "16",
          "is_correct": true
        },
        {
          "text": "15",
          "is_correct": false,
          "misconception_token": "used-drain-rate"
        },
        {
          "text": "240",
          "is_correct": false,
          "misconception_token": "used-start-amount"
        },
        {
          "text": "3600",
          "is_correct": false,
          "misconception_token": "multiplied-values"
        }
      ],
      "solution": "Set $g = 0$: $0 = 240 - 15t$, so $15t = 240$ and $t = 16$ minutes."
    }
  ],
}

const SYSTEMS_LINEAR: GapMathSkill = {
  slug: "systems-linear",
  name: "Systems of Linear Equations",
  subject: 'math',
  ccssGrade: "9",
  ccssGradeNum: 9,
  ccssCode: "CCSS.MATH.CONTENT.HSA.REI.C.6",
  satAlignment: "algebra",
  gradeBand: "9-12",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "Solve the system $y = 2x$ and $x + y = 9$.",
      "choices": [
        {
          "text": "$(3, 6)$",
          "is_correct": true
        },
        {
          "text": "$(6, 3)$",
          "is_correct": false,
          "misconception_token": "swapped-coordinates"
        },
        {
          "text": "$(9, 18)$",
          "is_correct": false,
          "misconception_token": "ignored-second-equation"
        },
        {
          "text": "$(3, 3)$",
          "is_correct": false,
          "misconception_token": "substituted-x-for-y"
        }
      ],
      "solution": "Substitute $y = 2x$ into $x + y = 9$: $x + 2x = 9$, so $3x = 9$ and $x = 3$. Then $y = 2(3) = 6$, giving $(3, 6)$."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "Solve the system $y = x - 1$ and $x + y = 7$.",
      "choices": [
        {
          "text": "$(4, 3)$",
          "is_correct": true
        },
        {
          "text": "$(3, 4)$",
          "is_correct": false,
          "misconception_token": "swapped-coordinates"
        },
        {
          "text": "$(4, 5)$",
          "is_correct": false,
          "misconception_token": "flipped-sign-in-substitution"
        },
        {
          "text": "$(4, 4)$",
          "is_correct": false,
          "misconception_token": "forgot-to-subtract-one"
        }
      ],
      "solution": "Substitute $y = x - 1$ into $x + y = 7$: $x + (x - 1) = 7$, so $2x - 1 = 7$, $2x = 8$, $x = 4$. Then $y = 4 - 1 = 3$, giving $(4, 3)$."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "Solve the system $x + y = 10$ and $x - y = 4$ by elimination.",
      "choices": [
        {
          "text": "$(7, 3)$",
          "is_correct": true
        },
        {
          "text": "$(3, 7)$",
          "is_correct": false,
          "misconception_token": "swapped-coordinates"
        },
        {
          "text": "$(7, -3)$",
          "is_correct": false,
          "misconception_token": "sign-error-on-y"
        },
        {
          "text": "$(14, 3)$",
          "is_correct": false,
          "misconception_token": "forgot-to-divide-by-2"
        }
      ],
      "solution": "Add the equations: $(x + y) + (x - y) = 10 + 4$, so $2x = 14$ and $x = 7$. Then $7 + y = 10$ gives $y = 3$, so $(7, 3)$."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "Solve the system $2x + y = 7$ and $x - y = 2$ by elimination.",
      "choices": [
        {
          "text": "$(3, 1)$",
          "is_correct": true
        },
        {
          "text": "$(1, 3)$",
          "is_correct": false,
          "misconception_token": "swapped-coordinates"
        },
        {
          "text": "$(3, -1)$",
          "is_correct": false,
          "misconception_token": "sign-error-on-y"
        },
        {
          "text": "$(9, 1)$",
          "is_correct": false,
          "misconception_token": "forgot-to-divide-by-3"
        }
      ],
      "solution": "Add the equations: $(2x + y) + (x - y) = 7 + 2$, so $3x = 9$ and $x = 3$. Then $3 - y = 2$ gives $y = 1$, so $(3, 1)$."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "At what point do the lines $y = x + 2$ and $y = -x + 4$ intersect?",
      "choices": [
        {
          "text": "$(1, 3)$",
          "is_correct": true
        },
        {
          "text": "$(3, 1)$",
          "is_correct": false,
          "misconception_token": "swapped-coordinates"
        },
        {
          "text": "$(2, 4)$",
          "is_correct": false,
          "misconception_token": "forgot-to-divide-by-2"
        },
        {
          "text": "$(0, 2)$",
          "is_correct": false,
          "misconception_token": "used-y-intercept"
        }
      ],
      "solution": "Set the expressions equal: $x + 2 = -x + 4$, so $2x = 2$ and $x = 1$. Then $y = 1 + 2 = 3$, giving $(1, 3)$."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "How many solutions does the system $y = 3x + 1$ and $y = 3x - 4$ have?",
      "choices": [
        {
          "text": "No solution",
          "is_correct": true
        },
        {
          "text": "One solution",
          "is_correct": false,
          "misconception_token": "assumed-intersection"
        },
        {
          "text": "Infinitely many solutions",
          "is_correct": false,
          "misconception_token": "assumed-same-line"
        },
        {
          "text": "Exactly two solutions",
          "is_correct": false,
          "misconception_token": "linear-cannot-have-two"
        }
      ],
      "solution": "Both lines have slope $3$ but different y-intercepts ($1$ and $-4$), so they are parallel and never cross: no solution."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "How many solutions does the system $y = 2x + 5$ and $2y = 4x + 10$ have?",
      "choices": [
        {
          "text": "Infinitely many solutions",
          "is_correct": true
        },
        {
          "text": "One solution",
          "is_correct": false,
          "misconception_token": "assumed-single-intersection"
        },
        {
          "text": "No solution",
          "is_correct": false,
          "misconception_token": "assumed-parallel-lines"
        },
        {
          "text": "Exactly two solutions",
          "is_correct": false,
          "misconception_token": "linear-cannot-have-two"
        }
      ],
      "solution": "Dividing the second equation by $2$ gives $y = 2x + 5$, which is identical to the first equation, so every point on the line works: infinitely many solutions."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "Solve the system $x = 4$ and $2x + y = 11$.",
      "choices": [
        {
          "text": "$(4, 3)$",
          "is_correct": true
        },
        {
          "text": "$(4, 11)$",
          "is_correct": false,
          "misconception_token": "forgot-to-subtract-2x"
        },
        {
          "text": "$(4, 7)$",
          "is_correct": false,
          "misconception_token": "forgot-to-double-x"
        },
        {
          "text": "$(3, 4)$",
          "is_correct": false,
          "misconception_token": "swapped-coordinates"
        }
      ],
      "solution": "Substitute $x = 4$ into $2x + y = 11$: $2(4) + y = 11$, so $8 + y = 11$ and $y = 3$, giving $(4, 3)$."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "Solve the system $2x + 3y = 12$ and $x - y = 1$.",
      "choices": [
        {
          "text": "$(3, 2)$",
          "is_correct": true
        },
        {
          "text": "$(2, 3)$",
          "is_correct": false,
          "misconception_token": "swapped-coordinates"
        },
        {
          "text": "$(1, 2)$",
          "is_correct": false,
          "misconception_token": "flipped-subtraction"
        },
        {
          "text": "$(3, -2)$",
          "is_correct": false,
          "misconception_token": "sign-error-on-y"
        }
      ],
      "solution": "From $x - y = 1$, $x = y + 1$. Substitute: $2(y + 1) + 3y = 12$, so $5y + 2 = 12$, $y = 2$. Then $x = 3$, giving $(3, 2)$."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "Solve the system $3x + 4y = 10$ and $2x + 3y = 7$.",
      "choices": [
        {
          "text": "$(2, 1)$",
          "is_correct": true
        },
        {
          "text": "$(1, 2)$",
          "is_correct": false,
          "misconception_token": "swapped-coordinates"
        },
        {
          "text": "$(2, -1)$",
          "is_correct": false,
          "misconception_token": "sign-error-on-y"
        },
        {
          "text": "$(-2, 1)$",
          "is_correct": false,
          "misconception_token": "sign-error-on-x"
        }
      ],
      "solution": "Multiply the first by $3$ and the second by $4$: $9x + 12y = 30$ and $8x + 12y = 28$. Subtract to get $x = 2$, then $3(2) + 4y = 10$ gives $y = 1$, so $(2, 1)$."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "Two adult tickets and three child tickets cost 32 dollars. One adult ticket and one child ticket cost 13 dollars. How much does one child ticket cost?",
      "choices": [
        {
          "text": "6 dollars",
          "is_correct": true
        },
        {
          "text": "7 dollars",
          "is_correct": false,
          "misconception_token": "solved-for-wrong-variable"
        },
        {
          "text": "5 dollars",
          "is_correct": false,
          "misconception_token": "arithmetic-error"
        },
        {
          "text": "13 dollars",
          "is_correct": false,
          "misconception_token": "used-combined-total"
        }
      ],
      "solution": "Let $a$ and $c$ be the ticket prices: $2a + 3c = 32$ and $a + c = 13$. So $a = 13 - c$, and $2(13 - c) + 3c = 32$ gives $26 + c = 32$, so $c = 6$ dollars."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "The sum of two numbers is 24 and their difference is 6. What is the larger number?",
      "choices": [
        {
          "text": "15",
          "is_correct": true
        },
        {
          "text": "9",
          "is_correct": false,
          "misconception_token": "found-smaller-number"
        },
        {
          "text": "18",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-averaging"
        },
        {
          "text": "12",
          "is_correct": false,
          "misconception_token": "used-half-of-sum"
        }
      ],
      "solution": "Let the numbers be $x$ and $y$ with $x + y = 24$ and $x - y = 6$. Adding gives $2x = 30$, so $x = 15$, the larger number."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "A jar holds 20 coins that are only nickels and dimes, worth 1.60 dollars in all. How many dimes are in the jar?",
      "choices": [
        {
          "text": "12",
          "is_correct": true
        },
        {
          "text": "8",
          "is_correct": false,
          "misconception_token": "found-nickels-instead"
        },
        {
          "text": "10",
          "is_correct": false,
          "misconception_token": "assumed-equal-split"
        },
        {
          "text": "20",
          "is_correct": false,
          "misconception_token": "used-total-count"
        }
      ],
      "solution": "Let $n$ nickels and $d$ dimes: $n + d = 20$ and $0.05n + 0.10d = 1.60$. Multiplying the value equation by $20$ gives $n + 2d = 32$; subtracting $n + d = 20$ gives $d = 12$."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "At what point do the lines $y = -2x + 7$ and $y = x - 2$ intersect?",
      "choices": [
        {
          "text": "$(3, 1)$",
          "is_correct": true
        },
        {
          "text": "$(1, 3)$",
          "is_correct": false,
          "misconception_token": "swapped-coordinates"
        },
        {
          "text": "$(3, -1)$",
          "is_correct": false,
          "misconception_token": "sign-error-on-y"
        },
        {
          "text": "$(9, 1)$",
          "is_correct": false,
          "misconception_token": "forgot-to-divide-by-3"
        }
      ],
      "solution": "Set them equal: $-2x + 7 = x - 2$, so $9 = 3x$ and $x = 3$. Then $y = 3 - 2 = 1$, giving $(3, 1)$."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "Three times a first number plus twice a second number equals $23$, and the two numbers add to $9$. Written as (first, second), what are the numbers?",
      "choices": [
        {
          "text": "$(5, 4)$",
          "is_correct": true
        },
        {
          "text": "$(4, 5)$",
          "is_correct": false,
          "misconception_token": "swapped-coordinates"
        },
        {
          "text": "$(5, -4)$",
          "is_correct": false,
          "misconception_token": "sign-error-on-second"
        },
        {
          "text": "$(9, 0)$",
          "is_correct": false,
          "misconception_token": "ignored-first-equation"
        }
      ],
      "solution": "Let the numbers be $x$ and $y$: $3x + 2y = 23$ and $x + y = 9$. So $y = 9 - x$, and $3x + 2(9 - x) = 23$ gives $x + 18 = 23$, $x = 5$, $y = 4$, so $(5, 4)$."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "A store sells pens for 2 dollars each and notebooks for 3 dollars each. Maria buys 10 items and spends 26 dollars. How many notebooks does she buy?",
      "choices": [
        {
          "text": "6",
          "is_correct": true
        },
        {
          "text": "4",
          "is_correct": false,
          "misconception_token": "found-pen-count"
        },
        {
          "text": "10",
          "is_correct": false,
          "misconception_token": "used-total-item-count"
        },
        {
          "text": "8",
          "is_correct": false,
          "misconception_token": "arithmetic-error"
        }
      ],
      "solution": "Let $p$ pens and $n$ notebooks: $p + n = 10$ and $2p + 3n = 26$. Substituting $p = 10 - n$ gives $2(10 - n) + 3n = 26$, so $20 + n = 26$ and $n = 6$."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "A chemist mixes a 10 percent acid solution with a 30 percent acid solution to make 20 liters of a 25 percent acid solution. How many liters of the 30 percent solution are needed?",
      "choices": [
        {
          "text": "15 liters",
          "is_correct": true
        },
        {
          "text": "5 liters",
          "is_correct": false,
          "misconception_token": "solved-for-other-solution"
        },
        {
          "text": "10 liters",
          "is_correct": false,
          "misconception_token": "assumed-equal-split"
        },
        {
          "text": "8 liters",
          "is_correct": false,
          "misconception_token": "arithmetic-error"
        }
      ],
      "solution": "Let $x$ be liters of the 30 percent solution and $y$ the 10 percent: $x + y = 20$ and $0.30x + 0.10y = 0.25(20) = 5$. Substituting $y = 20 - x$ gives $0.20x = 3$, so $x = 15$ liters."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "How many solutions does the system $2x - y = 4$ and $-4x + 2y = -8$ have?",
      "choices": [
        {
          "text": "Infinitely many solutions",
          "is_correct": true
        },
        {
          "text": "No solution",
          "is_correct": false,
          "misconception_token": "assumed-parallel-lines"
        },
        {
          "text": "Exactly one solution",
          "is_correct": false,
          "misconception_token": "assumed-single-intersection"
        },
        {
          "text": "No real solution",
          "is_correct": false,
          "misconception_token": "confused-with-quadratic"
        }
      ],
      "solution": "Multiplying the first equation by $-2$ gives $-4x + 2y = -8$, which is exactly the second equation, so the two lines coincide: infinitely many solutions."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "A theater sells adult tickets for 8 dollars and student tickets for 5 dollars. One night it sold 200 tickets and collected 1330 dollars. How many student tickets were sold?",
      "choices": [
        {
          "text": "90",
          "is_correct": true
        },
        {
          "text": "110",
          "is_correct": false,
          "misconception_token": "found-adult-count"
        },
        {
          "text": "100",
          "is_correct": false,
          "misconception_token": "assumed-equal-split"
        },
        {
          "text": "200",
          "is_correct": false,
          "misconception_token": "used-total-tickets"
        }
      ],
      "solution": "Let $a$ adults and $s$ students: $a + s = 200$ and $8a + 5s = 1330$. Substituting $a = 200 - s$ gives $1600 - 3s = 1330$, so $3s = 270$ and $s = 90$."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "Solve the system $5x - 3y = 1$ and $2x + 7y = 25$.",
      "choices": [
        {
          "text": "$(2, 3)$",
          "is_correct": true
        },
        {
          "text": "$(3, 2)$",
          "is_correct": false,
          "misconception_token": "swapped-coordinates"
        },
        {
          "text": "$(2, -3)$",
          "is_correct": false,
          "misconception_token": "sign-error-on-y"
        },
        {
          "text": "$(-2, 3)$",
          "is_correct": false,
          "misconception_token": "sign-error-on-x"
        }
      ],
      "solution": "Multiply the first by $7$ and the second by $3$: $35x - 21y = 7$ and $6x + 21y = 75$. Adding gives $41x = 82$, so $x = 2$; then $2(2) + 7y = 25$ gives $y = 3$, so $(2, 3)$."
    }
  ],
}

const EXPONENT_RULES: GapMathSkill = {
  slug: "exponent-rules",
  name: "Exponent Rules",
  subject: 'math',
  ccssGrade: "9",
  ccssGradeNum: 9,
  ccssCode: "CCSS.MATH.CONTENT.HSA.SSE.A.2",
  satAlignment: "advanced-math",
  gradeBand: "9-12",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "Simplify $x^5 \\cdot x^2$.",
      "choices": [
        {
          "text": "$x^7$",
          "is_correct": true
        },
        {
          "text": "$x^{10}$",
          "is_correct": false,
          "misconception_token": "multiplied-exponents"
        },
        {
          "text": "$x^3$",
          "is_correct": false,
          "misconception_token": "subtracted-exponents"
        },
        {
          "text": "$2x^7$",
          "is_correct": false,
          "misconception_token": "combined-bases"
        }
      ],
      "solution": "With the same base, add the exponents: $x^{5+2} = x^7$."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "Simplify $\\frac{x^9}{x^3}$.",
      "choices": [
        {
          "text": "$x^6$",
          "is_correct": true
        },
        {
          "text": "$x^{12}$",
          "is_correct": false,
          "misconception_token": "added-exponents"
        },
        {
          "text": "$x^{27}$",
          "is_correct": false,
          "misconception_token": "multiplied-exponents"
        },
        {
          "text": "$x^3$",
          "is_correct": false,
          "misconception_token": "divided-exponents"
        }
      ],
      "solution": "When dividing with the same base, subtract the exponents: $x^{9-3} = x^6$."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "Simplify $(x^3)^4$.",
      "choices": [
        {
          "text": "$x^{12}$",
          "is_correct": true
        },
        {
          "text": "$x^7$",
          "is_correct": false,
          "misconception_token": "added-exponents"
        },
        {
          "text": "$x^{81}$",
          "is_correct": false,
          "misconception_token": "raised-inner-to-outer"
        },
        {
          "text": "$x^{64}$",
          "is_correct": false,
          "misconception_token": "raised-outer-to-inner"
        }
      ],
      "solution": "For a power of a power, multiply the exponents: $x^{3 \\times 4} = x^{12}$."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "What is $6^0$?",
      "choices": [
        {
          "text": "1",
          "is_correct": true
        },
        {
          "text": "0",
          "is_correct": false,
          "misconception_token": "answered-zero"
        },
        {
          "text": "6",
          "is_correct": false,
          "misconception_token": "returned-base"
        },
        {
          "text": "undefined",
          "is_correct": false,
          "misconception_token": "called-undefined"
        }
      ],
      "solution": "Any nonzero number raised to the power $0$ equals $1$, so $6^0 = 1$."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "Evaluate $2^{-3}$.",
      "choices": [
        {
          "text": "$\\frac{1}{8}$",
          "is_correct": true
        },
        {
          "text": "$-8$",
          "is_correct": false,
          "misconception_token": "negated-result"
        },
        {
          "text": "$-6$",
          "is_correct": false,
          "misconception_token": "multiplied-base-by-exponent"
        },
        {
          "text": "$8$",
          "is_correct": false,
          "misconception_token": "ignored-negative"
        }
      ],
      "solution": "A negative exponent means take the reciprocal: $2^{-3} = \\frac{1}{2^3} = \\frac{1}{8}$."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "Simplify $(2x)^3$.",
      "choices": [
        {
          "text": "$8x^3$",
          "is_correct": true
        },
        {
          "text": "$6x^3$",
          "is_correct": false,
          "misconception_token": "multiplied-coefficient-by-exponent"
        },
        {
          "text": "$2x^3$",
          "is_correct": false,
          "misconception_token": "raised-variable-only"
        },
        {
          "text": "$8x$",
          "is_correct": false,
          "misconception_token": "raised-coefficient-only"
        }
      ],
      "solution": "Raise each factor to the third power: $2^3 x^3 = 8x^3$."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "Evaluate $2^3 \\cdot 2^2$.",
      "choices": [
        {
          "text": "$32$",
          "is_correct": true
        },
        {
          "text": "$64$",
          "is_correct": false,
          "misconception_token": "multiplied-exponents"
        },
        {
          "text": "$1024$",
          "is_correct": false,
          "misconception_token": "multiplied-bases"
        },
        {
          "text": "$12$",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        }
      ],
      "solution": "Same base, so add the exponents: $2^{3+2} = 2^5 = 32$."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "Simplify $\\frac{5^6}{5^4}$.",
      "choices": [
        {
          "text": "$5^2$",
          "is_correct": true
        },
        {
          "text": "$5^{10}$",
          "is_correct": false,
          "misconception_token": "added-exponents"
        },
        {
          "text": "$5^{24}$",
          "is_correct": false,
          "misconception_token": "multiplied-exponents"
        },
        {
          "text": "$5^{-2}$",
          "is_correct": false,
          "misconception_token": "subtracted-reverse"
        }
      ],
      "solution": "Subtract the exponents when dividing: $5^{6-4} = 5^2$."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "Simplify $\\frac{x^7 y^3}{x^2 y}$.",
      "choices": [
        {
          "text": "$x^5 y^2$",
          "is_correct": true
        },
        {
          "text": "$x^9 y^4$",
          "is_correct": false,
          "misconception_token": "added-exponents"
        },
        {
          "text": "$x^5 y^3$",
          "is_correct": false,
          "misconception_token": "forgot-to-subtract-y"
        },
        {
          "text": "$x^{14} y^2$",
          "is_correct": false,
          "misconception_token": "multiplied-x-exponents"
        }
      ],
      "solution": "Subtract exponents on each base, treating $y$ as $y^1$: $x^{7-2} y^{3-1} = x^5 y^2$."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "Rewrite $3x^{-2}$ using only positive exponents.",
      "choices": [
        {
          "text": "$\\frac{3}{x^2}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{1}{3x^2}$",
          "is_correct": false,
          "misconception_token": "moved-coefficient-down"
        },
        {
          "text": "$-3x^2$",
          "is_correct": false,
          "misconception_token": "negated-instead-of-reciprocal"
        },
        {
          "text": "$3x^2$",
          "is_correct": false,
          "misconception_token": "ignored-negative-exponent"
        }
      ],
      "solution": "Only the factor with the negative exponent moves: $3x^{-2} = \\frac{3}{x^2}$."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "Simplify $(2x^3)^4$.",
      "choices": [
        {
          "text": "$16x^{12}$",
          "is_correct": true
        },
        {
          "text": "$8x^{12}$",
          "is_correct": false,
          "misconception_token": "wrong-coefficient-power"
        },
        {
          "text": "$2x^{12}$",
          "is_correct": false,
          "misconception_token": "forgot-coefficient-power"
        },
        {
          "text": "$16x^7$",
          "is_correct": false,
          "misconception_token": "added-exponents"
        }
      ],
      "solution": "Raise each factor to the fourth power: $2^4 x^{3 \\times 4} = 16x^{12}$."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "A square has side length $x^4$ units. What is its area?",
      "choices": [
        {
          "text": "$x^8$",
          "is_correct": true
        },
        {
          "text": "$x^6$",
          "is_correct": false,
          "misconception_token": "added-exponents"
        },
        {
          "text": "$x^{16}$",
          "is_correct": false,
          "misconception_token": "exponentiated-the-exponent"
        },
        {
          "text": "$2x^4$",
          "is_correct": false,
          "misconception_token": "multiplied-by-two"
        }
      ],
      "solution": "Area of a square is the side squared: $(x^4)^2 = x^{4 \\times 2} = x^8$."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "A rectangle is $x^2$ units wide and $x^5$ units long. What is its area?",
      "choices": [
        {
          "text": "$x^7$",
          "is_correct": true
        },
        {
          "text": "$x^{10}$",
          "is_correct": false,
          "misconception_token": "multiplied-exponents"
        },
        {
          "text": "$2x^7$",
          "is_correct": false,
          "misconception_token": "added-a-coefficient"
        },
        {
          "text": "$x^3$",
          "is_correct": false,
          "misconception_token": "subtracted-exponents"
        }
      ],
      "solution": "Area is length times width: $x^2 \\cdot x^5 = x^{2+5} = x^7$."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "Simplify $\\frac{(x^2)^3}{x^4}$.",
      "choices": [
        {
          "text": "$x^2$",
          "is_correct": true
        },
        {
          "text": "$x^{10}$",
          "is_correct": false,
          "misconception_token": "added-in-quotient"
        },
        {
          "text": "$x^{-2}$",
          "is_correct": false,
          "misconception_token": "reversed-subtraction"
        },
        {
          "text": "$x^1$",
          "is_correct": false,
          "misconception_token": "added-power-of-power"
        }
      ],
      "solution": "First $(x^2)^3 = x^6$, then $\\frac{x^6}{x^4} = x^{6-4} = x^2$."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "A cube has edge length $2a^2$ units. What is its volume?",
      "choices": [
        {
          "text": "$8a^6$",
          "is_correct": true
        },
        {
          "text": "$6a^6$",
          "is_correct": false,
          "misconception_token": "multiplied-coefficient-by-exponent"
        },
        {
          "text": "$8a^5$",
          "is_correct": false,
          "misconception_token": "added-exponents"
        },
        {
          "text": "$2a^6$",
          "is_correct": false,
          "misconception_token": "forgot-coefficient-power"
        }
      ],
      "solution": "Volume is the edge cubed: $(2a^2)^3 = 2^3 a^{2 \\times 3} = 8a^6$."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "Evaluate $2^{-2} \\cdot 2^{5}$.",
      "choices": [
        {
          "text": "$8$",
          "is_correct": true
        },
        {
          "text": "$128$",
          "is_correct": false,
          "misconception_token": "ignored-negative-exponent"
        },
        {
          "text": "$\\frac{1}{1024}$",
          "is_correct": false,
          "misconception_token": "multiplied-exponents"
        },
        {
          "text": "$\\frac{1}{128}$",
          "is_correct": false,
          "misconception_token": "subtracted-exponents"
        }
      ],
      "solution": "Same base, so add the exponents: $2^{-2+5} = 2^3 = 8$."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "Simplify $\\left(\\frac{x^3 y^{-2}}{x^{-1} y^4}\\right)^2$.",
      "choices": [
        {
          "text": "$\\frac{x^8}{y^{12}}$",
          "is_correct": true
        },
        {
          "text": "$x^4 y^4$",
          "is_correct": false,
          "misconception_token": "added-exponents"
        },
        {
          "text": "$\\frac{x^4}{y^6}$",
          "is_correct": false,
          "misconception_token": "forgot-outer-power"
        },
        {
          "text": "$x^8 y^{12}$",
          "is_correct": false,
          "misconception_token": "kept-y-in-numerator"
        }
      ],
      "solution": "Inside, subtract exponents: $x^{3-(-1)} y^{-2-4} = x^4 y^{-6}$; squaring gives $x^8 y^{-12} = \\frac{x^8}{y^{12}}$."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "A colony of bacteria is modeled by $P = 3 \\cdot 2^{t}$, where $t$ is the time in hours. How many times larger is the colony at $t = 5$ than at $t = 2$?",
      "choices": [
        {
          "text": "$8$",
          "is_correct": true
        },
        {
          "text": "$128$",
          "is_correct": false,
          "misconception_token": "added-exponents"
        },
        {
          "text": "$1024$",
          "is_correct": false,
          "misconception_token": "multiplied-exponents"
        },
        {
          "text": "$32$",
          "is_correct": false,
          "misconception_token": "used-only-numerator"
        }
      ],
      "solution": "The ratio is $\\frac{3 \\cdot 2^5}{3 \\cdot 2^2} = 2^{5-2} = 2^3 = 8$."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "Simplify $\\frac{(2x^2 y)^3 (x y^2)}{4 x^3 y^4}$.",
      "choices": [
        {
          "text": "$2x^4 y$",
          "is_correct": true
        },
        {
          "text": "$2x^{10} y^9$",
          "is_correct": false,
          "misconception_token": "added-exponents-in-division"
        },
        {
          "text": "$\\frac{2x^4}{y}$",
          "is_correct": false,
          "misconception_token": "incomplete-power-distribution"
        },
        {
          "text": "$8x^4 y$",
          "is_correct": false,
          "misconception_token": "forgot-to-divide-coefficient"
        }
      ],
      "solution": "$(2x^2 y)^3 = 8x^6 y^3$; times $x y^2$ gives $8x^7 y^5$; dividing by $4x^3 y^4$: $\\frac{8}{4} x^{7-3} y^{5-4} = 2x^4 y$."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "One cube has edge length $x^2$ and another has edge length $x^5$. The volume of the larger cube is how many times the volume of the smaller cube?",
      "choices": [
        {
          "text": "$x^9$",
          "is_correct": true
        },
        {
          "text": "$x^3$",
          "is_correct": false,
          "misconception_token": "forgot-to-cube-ratio"
        },
        {
          "text": "$x^{21}$",
          "is_correct": false,
          "misconception_token": "added-volume-exponents"
        },
        {
          "text": "$x^{13}$",
          "is_correct": false,
          "misconception_token": "cubed-only-larger"
        }
      ],
      "solution": "The volumes are $(x^5)^3 = x^{15}$ and $(x^2)^3 = x^6$; the ratio is $\\frac{x^{15}}{x^6} = x^9$."
    }
  ],
}

const DATA_STATISTICS: GapMathSkill = {
  slug: "data-statistics",
  name: "Data & Statistics",
  subject: 'math',
  ccssGrade: "9",
  ccssGradeNum: 9,
  ccssCode: "CCSS.MATH.CONTENT.HSS.ID.A.2",
  satAlignment: "problem-solving-data-analysis",
  gradeBand: "9-12",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "Find the mean of the data set: 2, 4, 9.",
      "choices": [
        {
          "text": "5",
          "is_correct": true
        },
        {
          "text": "4",
          "is_correct": false,
          "misconception_token": "used-median"
        },
        {
          "text": "15",
          "is_correct": false,
          "misconception_token": "forgot-to-divide"
        },
        {
          "text": "7",
          "is_correct": false,
          "misconception_token": "used-range"
        }
      ],
      "solution": "The mean is the sum divided by the count: $(2 + 4 + 9) \\div 3 = 15 \\div 3 = 5$."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "Find the median of the data set: 8, 2, 6, 1, 4.",
      "choices": [
        {
          "text": "4",
          "is_correct": true
        },
        {
          "text": "6",
          "is_correct": false,
          "misconception_token": "didnt-sort-first"
        },
        {
          "text": "4.2",
          "is_correct": false,
          "misconception_token": "used-mean"
        },
        {
          "text": "7",
          "is_correct": false,
          "misconception_token": "used-range"
        }
      ],
      "solution": "Sort the values: 1, 2, 4, 6, 8. The middle value of these five numbers is 4."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "Find the mode of the data set: 2, 5, 5, 5, 9, 9.",
      "choices": [
        {
          "text": "5",
          "is_correct": true
        },
        {
          "text": "9",
          "is_correct": false,
          "misconception_token": "chose-highest-value"
        },
        {
          "text": "3",
          "is_correct": false,
          "misconception_token": "used-frequency-count"
        },
        {
          "text": "2",
          "is_correct": false,
          "misconception_token": "chose-lowest-value"
        }
      ],
      "solution": "The mode is the value that appears most often. The value 5 appears three times, more than any other, so the mode is 5."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "Find the range of the data set: 12, 4, 9, 15, 7.",
      "choices": [
        {
          "text": "11",
          "is_correct": true
        },
        {
          "text": "15",
          "is_correct": false,
          "misconception_token": "used-maximum"
        },
        {
          "text": "19",
          "is_correct": false,
          "misconception_token": "added-min-and-max"
        },
        {
          "text": "4",
          "is_correct": false,
          "misconception_token": "used-minimum"
        }
      ],
      "solution": "The range is the maximum minus the minimum: $15 - 4 = 11$."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "A bag holds 3 red marbles and 5 blue marbles. If one marble is drawn at random, what is the probability it is red?",
      "choices": [
        {
          "text": "$\\frac{3}{8}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{3}{5}$",
          "is_correct": false,
          "misconception_token": "used-part-to-part"
        },
        {
          "text": "$\\frac{5}{8}$",
          "is_correct": false,
          "misconception_token": "used-other-color"
        },
        {
          "text": "$\\frac{1}{8}$",
          "is_correct": false,
          "misconception_token": "used-one-over-total"
        }
      ],
      "solution": "There are $3 + 5 = 8$ marbles total and 3 are red, so the probability of red is $\\frac{3}{8}$."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "A fair six-sided die is rolled once. What is the probability of rolling a 4?",
      "choices": [
        {
          "text": "$\\frac{1}{6}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{4}{6}$",
          "is_correct": false,
          "misconception_token": "put-value-over-total"
        },
        {
          "text": "$\\frac{1}{4}$",
          "is_correct": false,
          "misconception_token": "used-value-as-denominator"
        },
        {
          "text": "$\\frac{5}{6}$",
          "is_correct": false,
          "misconception_token": "used-complement"
        }
      ],
      "solution": "Exactly one of the 6 equally likely faces is a 4, so the probability is $\\frac{1}{6}$."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "On three tests a student scored 80, 90, and 100. What is the mean score?",
      "choices": [
        {
          "text": "90",
          "is_correct": true
        },
        {
          "text": "270",
          "is_correct": false,
          "misconception_token": "forgot-to-divide"
        },
        {
          "text": "100",
          "is_correct": false,
          "misconception_token": "used-maximum"
        },
        {
          "text": "20",
          "is_correct": false,
          "misconception_token": "used-range"
        }
      ],
      "solution": "The mean is $(80 + 90 + 100) \\div 3 = 270 \\div 3 = 90$."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "A dot plot shows the number of pets each student has: 0 pets has 3 dots, 1 pet has 5 dots, and 2 pets has 2 dots. How many students have exactly 1 pet?",
      "choices": [
        {
          "text": "5",
          "is_correct": true
        },
        {
          "text": "1",
          "is_correct": false,
          "misconception_token": "used-pet-number"
        },
        {
          "text": "3",
          "is_correct": false,
          "misconception_token": "read-wrong-category"
        },
        {
          "text": "10",
          "is_correct": false,
          "misconception_token": "used-total-students"
        }
      ],
      "solution": "Each dot in the '1 pet' row is one student, and that row has 5 dots, so 5 students have exactly 1 pet."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "The mean of 4 numbers is 10. Three of the numbers are 8, 12, and 6. What is the fourth number?",
      "choices": [
        {
          "text": "14",
          "is_correct": true
        },
        {
          "text": "10",
          "is_correct": false,
          "misconception_token": "used-mean-as-value"
        },
        {
          "text": "26",
          "is_correct": false,
          "misconception_token": "used-sum-of-three"
        },
        {
          "text": "8.67",
          "is_correct": false,
          "misconception_token": "averaged-known-three"
        }
      ],
      "solution": "The total of all 4 numbers is $10 \\times 4 = 40$. The three known numbers sum to $8 + 12 + 6 = 26$, so the fourth is $40 - 26 = 14$."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "Find the median of the data set: 1, 2, 3, 4, 5, 20.",
      "choices": [
        {
          "text": "3.5",
          "is_correct": true
        },
        {
          "text": "3",
          "is_correct": false,
          "misconception_token": "chose-lower-middle"
        },
        {
          "text": "4",
          "is_correct": false,
          "misconception_token": "chose-upper-middle"
        },
        {
          "text": "7",
          "is_correct": false,
          "misconception_token": "forgot-to-average-middles"
        }
      ],
      "solution": "The data are already in order. With 6 values, the median is the mean of the two middle values: $(3 + 4) \\div 2 = 3.5$."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "A store recorded these shoe sizes sold: 7, 8, 8, 9, 10, 8, 7. What is the mode of the sizes?",
      "choices": [
        {
          "text": "8",
          "is_correct": true
        },
        {
          "text": "7",
          "is_correct": false,
          "misconception_token": "chose-second-most-frequent"
        },
        {
          "text": "10",
          "is_correct": false,
          "misconception_token": "chose-largest-value"
        },
        {
          "text": "3",
          "is_correct": false,
          "misconception_token": "used-frequency-count"
        }
      ],
      "solution": "Size 8 appears three times, more than any other size, so the mode is 8."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "The recorded temperatures one week were -3, 5, 8, -1, and 12 degrees. What is the range of the temperatures?",
      "choices": [
        {
          "text": "15",
          "is_correct": true
        },
        {
          "text": "9",
          "is_correct": false,
          "misconception_token": "treated-min-as-positive"
        },
        {
          "text": "12",
          "is_correct": false,
          "misconception_token": "used-maximum"
        },
        {
          "text": "-15",
          "is_correct": false,
          "misconception_token": "subtracted-in-wrong-order"
        }
      ],
      "solution": "The maximum is 12 and the minimum is -3, so the range is $12 - (-3) = 15$."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "A spinner has 6 equal sections numbered 1 through 6. What is the probability of landing on a multiple of 3?",
      "choices": [
        {
          "text": "$\\frac{1}{3}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{1}{6}$",
          "is_correct": false,
          "misconception_token": "counted-one-multiple"
        },
        {
          "text": "$\\frac{1}{2}$",
          "is_correct": false,
          "misconception_token": "counted-even-numbers"
        },
        {
          "text": "$\\frac{2}{3}$",
          "is_correct": false,
          "misconception_token": "found-complement"
        }
      ],
      "solution": "The multiples of 3 from 1 to 6 are 3 and 6, giving 2 favorable outcomes out of 6: $\\frac{2}{6} = \\frac{1}{3}$."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "A student has quiz scores of 7, 9, 8, and 8. What score on a fifth quiz is needed for a mean of 8.4?",
      "choices": [
        {
          "text": "10",
          "is_correct": true
        },
        {
          "text": "8.4",
          "is_correct": false,
          "misconception_token": "used-target-mean"
        },
        {
          "text": "8",
          "is_correct": false,
          "misconception_token": "used-current-mean"
        },
        {
          "text": "42",
          "is_correct": false,
          "misconception_token": "gave-total-needed"
        }
      ],
      "solution": "The five scores must total $8.4 \\times 5 = 42$. The first four sum to $7 + 9 + 8 + 8 = 32$, so the fifth must be $42 - 32 = 10$."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "The ages of nine students are 12, 13, 11, 14, 12, 15, 13, 12, and 16. What is the median age?",
      "choices": [
        {
          "text": "13",
          "is_correct": true
        },
        {
          "text": "12",
          "is_correct": false,
          "misconception_token": "chose-the-mode"
        },
        {
          "text": "5",
          "is_correct": false,
          "misconception_token": "used-position-number"
        },
        {
          "text": "16",
          "is_correct": false,
          "misconception_token": "used-maximum"
        }
      ],
      "solution": "Sorted, the ages are 11, 12, 12, 12, 13, 13, 14, 15, 16. With 9 values, the median is the 5th value, which is 13."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "A jar contains 4 green, 6 yellow, and 10 red marbles. If one marble is drawn at random, what is the probability it is NOT green?",
      "choices": [
        {
          "text": "$\\frac{4}{5}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{1}{5}$",
          "is_correct": false,
          "misconception_token": "found-green-probability"
        },
        {
          "text": "$\\frac{1}{4}$",
          "is_correct": false,
          "misconception_token": "inverted-fraction"
        },
        {
          "text": "$\\frac{1}{2}$",
          "is_correct": false,
          "misconception_token": "used-single-color"
        }
      ],
      "solution": "There are $4 + 6 + 10 = 20$ marbles, and $20 - 4 = 16$ are not green, so the probability is $\\frac{16}{20} = \\frac{4}{5}$."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "The mean of 5 numbers is 14. When one number is removed, the mean of the remaining 4 numbers is 12. What was the number that was removed?",
      "choices": [
        {
          "text": "22",
          "is_correct": true
        },
        {
          "text": "2",
          "is_correct": false,
          "misconception_token": "subtracted-the-means"
        },
        {
          "text": "26",
          "is_correct": false,
          "misconception_token": "added-the-means"
        },
        {
          "text": "12",
          "is_correct": false,
          "misconception_token": "used-remaining-mean"
        }
      ],
      "solution": "The 5 numbers total $14 \\times 5 = 70$ and the remaining 4 total $12 \\times 4 = 48$, so the removed number is $70 - 48 = 22$."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "For the data set 3, 5, 6, 6, 100, by how much does the mean exceed the median?",
      "choices": [
        {
          "text": "18",
          "is_correct": true
        },
        {
          "text": "24",
          "is_correct": false,
          "misconception_token": "reported-mean-only"
        },
        {
          "text": "6",
          "is_correct": false,
          "misconception_token": "reported-median-only"
        },
        {
          "text": "94",
          "is_correct": false,
          "misconception_token": "used-max-minus-median"
        }
      ],
      "solution": "The mean is $(3 + 5 + 6 + 6 + 100) \\div 5 = 120 \\div 5 = 24$ and the median is 6, so the mean exceeds the median by $24 - 6 = 18$."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "A standard deck has 52 cards, including 12 face cards (jack, queen, king in each of the 4 suits). If one card is drawn at random, what is the probability it is a face card?",
      "choices": [
        {
          "text": "$\\frac{3}{13}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{1}{13}$",
          "is_correct": false,
          "misconception_token": "counted-four-face-cards"
        },
        {
          "text": "$\\frac{3}{52}$",
          "is_correct": false,
          "misconception_token": "counted-three-face-cards"
        },
        {
          "text": "$\\frac{4}{13}$",
          "is_correct": false,
          "misconception_token": "included-aces-as-face"
        }
      ],
      "solution": "There are 12 face cards out of 52, so the probability is $\\frac{12}{52} = \\frac{3}{13}$."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "A data set of 6 values written in increasing order is 8, 11, 15, x, 20, 24. If the median is 16, what is the value of x?",
      "choices": [
        {
          "text": "17",
          "is_correct": true
        },
        {
          "text": "16",
          "is_correct": false,
          "misconception_token": "used-median-directly"
        },
        {
          "text": "32",
          "is_correct": false,
          "misconception_token": "used-doubled-median"
        },
        {
          "text": "1",
          "is_correct": false,
          "misconception_token": "subtracted-values"
        }
      ],
      "solution": "With 6 values, the median is the mean of the 3rd and 4th values: $(15 + x) \\div 2 = 16$, so $15 + x = 32$ and $x = 17$."
    }
  ],
}

const GEOMETRY_PROOFS: GapMathSkill = {
  slug: "geometry-proofs",
  name: "Geometry Proofs",
  subject: 'math',
  ccssGrade: "10",
  ccssGradeNum: 10,
  ccssCode: "CCSS.MATH.CONTENT.HSG.CO.C.9",
  satAlignment: "geometry-trigonometry",
  gradeBand: "9-12",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "Two lines intersect, forming vertical angles. One of the angles measures $65^\\circ$. What is the measure of the angle vertical to it?",
      "choices": [
        {
          "text": "$65^\\circ$",
          "is_correct": true
        },
        {
          "text": "$115^\\circ$",
          "is_correct": false,
          "misconception_token": "used-supplement"
        },
        {
          "text": "$25^\\circ$",
          "is_correct": false,
          "misconception_token": "used-complement"
        },
        {
          "text": "$295^\\circ$",
          "is_correct": false,
          "misconception_token": "subtracted-from-360"
        }
      ],
      "solution": "Vertical angles are congruent, so the angle vertical to a $65^\\circ$ angle also measures $65^\\circ$."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "Two angles form a linear pair. One of the angles measures $70^\\circ$. What is the measure of the other angle?",
      "choices": [
        {
          "text": "$110^\\circ$",
          "is_correct": true
        },
        {
          "text": "$20^\\circ$",
          "is_correct": false,
          "misconception_token": "found-complement"
        },
        {
          "text": "$290^\\circ$",
          "is_correct": false,
          "misconception_token": "used-360"
        },
        {
          "text": "$70^\\circ$",
          "is_correct": false,
          "misconception_token": "assumed-vertical-equal"
        }
      ],
      "solution": "A linear pair is supplementary, so the other angle is $180^\\circ - 70^\\circ = 110^\\circ$."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "What is the measure of the angle complementary to $35^\\circ$?",
      "choices": [
        {
          "text": "$55^\\circ$",
          "is_correct": true
        },
        {
          "text": "$145^\\circ$",
          "is_correct": false,
          "misconception_token": "used-supplement"
        },
        {
          "text": "$325^\\circ$",
          "is_correct": false,
          "misconception_token": "used-360"
        },
        {
          "text": "$35^\\circ$",
          "is_correct": false,
          "misconception_token": "copied-given"
        }
      ],
      "solution": "Complementary angles sum to $90^\\circ$, so the angle is $90^\\circ - 35^\\circ = 55^\\circ$."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "What is the measure of the angle supplementary to $40^\\circ$?",
      "choices": [
        {
          "text": "$140^\\circ$",
          "is_correct": true
        },
        {
          "text": "$50^\\circ$",
          "is_correct": false,
          "misconception_token": "found-complement"
        },
        {
          "text": "$320^\\circ$",
          "is_correct": false,
          "misconception_token": "used-360"
        },
        {
          "text": "$40^\\circ$",
          "is_correct": false,
          "misconception_token": "copied-given"
        }
      ],
      "solution": "Supplementary angles sum to $180^\\circ$, so the angle is $180^\\circ - 40^\\circ = 140^\\circ$."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "Two parallel lines are cut by a transversal. One angle measures $75^\\circ$. What is the measure of its corresponding angle?",
      "choices": [
        {
          "text": "$75^\\circ$",
          "is_correct": true
        },
        {
          "text": "$105^\\circ$",
          "is_correct": false,
          "misconception_token": "used-supplement"
        },
        {
          "text": "$15^\\circ$",
          "is_correct": false,
          "misconception_token": "used-complement"
        },
        {
          "text": "$285^\\circ$",
          "is_correct": false,
          "misconception_token": "subtracted-from-360"
        }
      ],
      "solution": "Corresponding angles formed by parallel lines are congruent, so the angle measures $75^\\circ$."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "Two parallel lines are cut by a transversal. One interior angle measures $110^\\circ$. What is the measure of its alternate interior angle?",
      "choices": [
        {
          "text": "$110^\\circ$",
          "is_correct": true
        },
        {
          "text": "$70^\\circ$",
          "is_correct": false,
          "misconception_token": "used-supplement"
        },
        {
          "text": "$250^\\circ$",
          "is_correct": false,
          "misconception_token": "subtracted-from-360"
        },
        {
          "text": "$220^\\circ$",
          "is_correct": false,
          "misconception_token": "doubled-angle"
        }
      ],
      "solution": "Alternate interior angles formed by parallel lines are congruent, so the angle measures $110^\\circ$."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "Two parallel lines are cut by a transversal. One interior angle measures $65^\\circ$. What is the measure of the co-interior (same-side interior) angle?",
      "choices": [
        {
          "text": "$115^\\circ$",
          "is_correct": true
        },
        {
          "text": "$65^\\circ$",
          "is_correct": false,
          "misconception_token": "treated-as-equal"
        },
        {
          "text": "$25^\\circ$",
          "is_correct": false,
          "misconception_token": "found-complement"
        },
        {
          "text": "$295^\\circ$",
          "is_correct": false,
          "misconception_token": "used-360"
        }
      ],
      "solution": "Co-interior (same-side interior) angles are supplementary, so the angle is $180^\\circ - 65^\\circ = 115^\\circ$."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "Two lines intersect at a point. $\\angle 1$ and $\\angle 3$ are the non-adjacent angles opposite each other. Which relationship justifies the statement that $\\angle 1$ and $\\angle 3$ are equal?",
      "choices": [
        {
          "text": "Vertical angles",
          "is_correct": true
        },
        {
          "text": "Linear pair",
          "is_correct": false,
          "misconception_token": "chose-linear-pair"
        },
        {
          "text": "Complementary angles",
          "is_correct": false,
          "misconception_token": "chose-complementary"
        },
        {
          "text": "Corresponding angles",
          "is_correct": false,
          "misconception_token": "chose-corresponding"
        }
      ],
      "solution": "Angles opposite each other at the intersection of two lines are vertical angles, which are always congruent."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "Two vertical angles measure $(2x + 10)^\\circ$ and $50^\\circ$. What is the value of $x$?",
      "choices": [
        {
          "text": "20",
          "is_correct": true
        },
        {
          "text": "25",
          "is_correct": false,
          "misconception_token": "forgot-constant"
        },
        {
          "text": "60",
          "is_correct": false,
          "misconception_token": "used-supplementary"
        },
        {
          "text": "30",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracting"
        }
      ],
      "solution": "Vertical angles are equal: $2x + 10 = 50$, so $2x = 40$ and $x = 20$."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "Two angles that form a linear pair measure $(3x)^\\circ$ and $(x + 20)^\\circ$. What is the value of $x$?",
      "choices": [
        {
          "text": "40",
          "is_correct": true
        },
        {
          "text": "10",
          "is_correct": false,
          "misconception_token": "treated-as-vertical"
        },
        {
          "text": "45",
          "is_correct": false,
          "misconception_token": "forgot-constant"
        },
        {
          "text": "85",
          "is_correct": false,
          "misconception_token": "used-360"
        }
      ],
      "solution": "A linear pair is supplementary: $3x + (x + 20) = 180$, so $4x = 160$ and $x = 40$."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "Two parallel lines are cut by a transversal. A pair of corresponding angles measure $(3x - 15)^\\circ$ and $60^\\circ$. What is the value of $x$?",
      "choices": [
        {
          "text": "25",
          "is_correct": true
        },
        {
          "text": "15",
          "is_correct": false,
          "misconception_token": "subtracted-constant"
        },
        {
          "text": "45",
          "is_correct": false,
          "misconception_token": "used-supplementary"
        },
        {
          "text": "75",
          "is_correct": false,
          "misconception_token": "forgot-to-divide"
        }
      ],
      "solution": "Corresponding angles are equal: $3x - 15 = 60$, so $3x = 75$ and $x = 25$."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "Two angles are complementary. The larger angle is $30^\\circ$ more than the smaller angle. What is the measure of the larger angle?",
      "choices": [
        {
          "text": "$60^\\circ$",
          "is_correct": true
        },
        {
          "text": "$30^\\circ$",
          "is_correct": false,
          "misconception_token": "gave-smaller-angle"
        },
        {
          "text": "$105^\\circ$",
          "is_correct": false,
          "misconception_token": "used-supplementary"
        },
        {
          "text": "$45^\\circ$",
          "is_correct": false,
          "misconception_token": "split-evenly"
        }
      ],
      "solution": "Let the smaller angle be $s$; then $s + (s + 30) = 90$, so $2s = 60$, $s = 30$, and the larger angle is $60^\\circ$."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "Two angles are supplementary. One angle is twice the measure of the other. What is the measure of the smaller angle?",
      "choices": [
        {
          "text": "$60^\\circ$",
          "is_correct": true
        },
        {
          "text": "$120^\\circ$",
          "is_correct": false,
          "misconception_token": "gave-larger-angle"
        },
        {
          "text": "$30^\\circ$",
          "is_correct": false,
          "misconception_token": "used-90"
        },
        {
          "text": "$90^\\circ$",
          "is_correct": false,
          "misconception_token": "split-evenly"
        }
      ],
      "solution": "Let the smaller angle be $x$; then $x + 2x = 180$, so $3x = 180$ and $x = 60^\\circ$."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "Lines $m$ and $n$ are parallel and cut by a transversal. $\\angle 1$ measures $115^\\circ$. $\\angle 1$ and $\\angle 2$ are co-interior angles, and $\\angle 2$ and $\\angle 3$ are vertical angles. What is the measure of $\\angle 3$?",
      "choices": [
        {
          "text": "$65^\\circ$",
          "is_correct": true
        },
        {
          "text": "$115^\\circ$",
          "is_correct": false,
          "misconception_token": "assumed-all-equal"
        },
        {
          "text": "$245^\\circ$",
          "is_correct": false,
          "misconception_token": "used-360"
        },
        {
          "text": "$25^\\circ$",
          "is_correct": false,
          "misconception_token": "found-complement"
        }
      ],
      "solution": "The co-interior angle to $\\angle 1$ is $180^\\circ - 115^\\circ = 65^\\circ$, and $\\angle 3$ is vertical to that angle, so $\\angle 3 = 65^\\circ$."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "Two parallel lines are cut by a transversal. $\\angle 4$ and $\\angle 6$ lie between the two parallel lines on opposite sides of the transversal, and $\\angle 4 = \\angle 6$. Which relationship justifies this?",
      "choices": [
        {
          "text": "Alternate interior angles",
          "is_correct": true
        },
        {
          "text": "Co-interior angles",
          "is_correct": false,
          "misconception_token": "chose-co-interior"
        },
        {
          "text": "Corresponding angles",
          "is_correct": false,
          "misconception_token": "chose-corresponding"
        },
        {
          "text": "Vertical angles",
          "is_correct": false,
          "misconception_token": "chose-vertical"
        }
      ],
      "solution": "The two angles lie between the parallel lines on opposite sides of the transversal, which defines alternate interior angles; these are congruent."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "Three angles lie on one side of a straight line and together form a straight angle. Their measures are $x^\\circ$, $(2x)^\\circ$, and $60^\\circ$. What is the value of $x$?",
      "choices": [
        {
          "text": "40",
          "is_correct": true
        },
        {
          "text": "60",
          "is_correct": false,
          "misconception_token": "forgot-constant"
        },
        {
          "text": "100",
          "is_correct": false,
          "misconception_token": "used-360"
        },
        {
          "text": "120",
          "is_correct": false,
          "misconception_token": "ignored-2x-term"
        }
      ],
      "solution": "The three angles form a straight angle: $x + 2x + 60 = 180$, so $3x = 120$ and $x = 40$."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "Two parallel lines are cut by a transversal. A pair of co-interior angles measure $(3x + 15)^\\circ$ and $(x + 45)^\\circ$. What is the value of $x$?",
      "choices": [
        {
          "text": "30",
          "is_correct": true
        },
        {
          "text": "15",
          "is_correct": false,
          "misconception_token": "treated-as-equal"
        },
        {
          "text": "45",
          "is_correct": false,
          "misconception_token": "forgot-constant"
        },
        {
          "text": "75",
          "is_correct": false,
          "misconception_token": "used-360"
        }
      ],
      "solution": "Co-interior angles are supplementary: $(3x + 15) + (x + 45) = 180$, so $4x + 60 = 180$, $4x = 120$, and $x = 30$."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "Two parallel lines are cut by a transversal. An angle measures $(2x)^\\circ$ and its corresponding angle measures $(x + 40)^\\circ$. What is the measure of the angle?",
      "choices": [
        {
          "text": "$80^\\circ$",
          "is_correct": true
        },
        {
          "text": "$40^\\circ$",
          "is_correct": false,
          "misconception_token": "gave-x-not-angle"
        },
        {
          "text": "$100^\\circ$",
          "is_correct": false,
          "misconception_token": "used-supplement"
        },
        {
          "text": "$160^\\circ$",
          "is_correct": false,
          "misconception_token": "doubled-angle"
        }
      ],
      "solution": "Corresponding angles are equal: $2x = x + 40$, so $x = 40$; the angle measures $2x = 80^\\circ$."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "Two lines intersect. One angle measures $x^\\circ$, and the angle vertical to it measures $(3x - 80)^\\circ$. What is the value of $x$?",
      "choices": [
        {
          "text": "40",
          "is_correct": true
        },
        {
          "text": "65",
          "is_correct": false,
          "misconception_token": "used-supplementary"
        },
        {
          "text": "20",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracting"
        },
        {
          "text": "80",
          "is_correct": false,
          "misconception_token": "forgot-to-divide"
        }
      ],
      "solution": "Vertical angles are equal: $x = 3x - 80$, so $2x = 80$ and $x = 40$."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "Two parallel lines are cut by a transversal. Angle $A$ and angle $B$ are co-interior angles. Angle $A$ measures $(4x + 10)^\\circ$ and angle $B$ measures $(6x)^\\circ$. What is the measure of angle $B$?",
      "choices": [
        {
          "text": "$102^\\circ$",
          "is_correct": true
        },
        {
          "text": "$30^\\circ$",
          "is_correct": false,
          "misconception_token": "treated-as-equal"
        },
        {
          "text": "$78^\\circ$",
          "is_correct": false,
          "misconception_token": "gave-other-angle"
        },
        {
          "text": "$17^\\circ$",
          "is_correct": false,
          "misconception_token": "gave-x-not-angle"
        }
      ],
      "solution": "Co-interior angles are supplementary: $(4x + 10) + 6x = 180$, so $10x + 10 = 180$, $10x = 170$, and $x = 17$; angle $B = 6x = 102^\\circ$."
    }
  ],
}

const TRIANGLE_CONGRUENCE: GapMathSkill = {
  slug: "triangle-congruence",
  name: "Triangle Congruence",
  subject: 'math',
  ccssGrade: "10",
  ccssGradeNum: 10,
  ccssCode: "CCSS.MATH.CONTENT.HSG.CO.B.8",
  satAlignment: "geometry-trigonometry",
  gradeBand: "9-12",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "Two angles of a triangle measure $50^\\circ$ and $60^\\circ$. What is the measure of the third angle?",
      "choices": [
        {
          "text": "$70^\\circ$",
          "is_correct": true
        },
        {
          "text": "$110^\\circ$",
          "is_correct": false,
          "misconception_token": "added-the-two-angles"
        },
        {
          "text": "$130^\\circ$",
          "is_correct": false,
          "misconception_token": "subtracted-only-first-angle"
        },
        {
          "text": "$120^\\circ$",
          "is_correct": false,
          "misconception_token": "subtracted-only-second-angle"
        }
      ],
      "solution": "The angles of a triangle sum to $180^\\circ$, so the third angle is $180^\\circ - 50^\\circ - 60^\\circ = 70^\\circ$."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "In two triangles, all three pairs of corresponding sides are congruent. Which criterion proves the triangles congruent?",
      "choices": [
        {
          "text": "SSS",
          "is_correct": true
        },
        {
          "text": "SAS",
          "is_correct": false,
          "misconception_token": "confused-with-two-sides-one-angle"
        },
        {
          "text": "ASA",
          "is_correct": false,
          "misconception_token": "confused-sides-with-angles"
        },
        {
          "text": "AAS",
          "is_correct": false,
          "misconception_token": "confused-with-two-angles-one-side"
        }
      ],
      "solution": "Three pairs of congruent sides matches the Side-Side-Side (SSS) congruence criterion."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "All three angles of an equilateral triangle are equal. What is the measure of each angle?",
      "choices": [
        {
          "text": "$60^\\circ$",
          "is_correct": true
        },
        {
          "text": "$90^\\circ$",
          "is_correct": false,
          "misconception_token": "assumed-right-angle"
        },
        {
          "text": "$45^\\circ$",
          "is_correct": false,
          "misconception_token": "divided-total-by-four"
        },
        {
          "text": "$120^\\circ$",
          "is_correct": false,
          "misconception_token": "used-exterior-angle"
        }
      ],
      "solution": "The three equal angles sum to $180^\\circ$, so each measures $180^\\circ \\div 3 = 60^\\circ$."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "In two triangles, two pairs of sides and the pair of angles between those sides are congruent. Which criterion proves the triangles congruent?",
      "choices": [
        {
          "text": "SAS",
          "is_correct": true
        },
        {
          "text": "SSS",
          "is_correct": false,
          "misconception_token": "ignored-the-angle"
        },
        {
          "text": "ASA",
          "is_correct": false,
          "misconception_token": "swapped-sides-and-angles"
        },
        {
          "text": "HL",
          "is_correct": false,
          "misconception_token": "assumed-right-triangle"
        }
      ],
      "solution": "Two sides with the included angle between them matches the Side-Angle-Side (SAS) congruence criterion."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "An isosceles triangle has a vertex angle of $40^\\circ$ and two equal base angles. What is the measure of each base angle?",
      "choices": [
        {
          "text": "$70^\\circ$",
          "is_correct": true
        },
        {
          "text": "$140^\\circ$",
          "is_correct": false,
          "misconception_token": "forgot-to-halve-remainder"
        },
        {
          "text": "$40^\\circ$",
          "is_correct": false,
          "misconception_token": "reused-vertex-angle"
        },
        {
          "text": "$20^\\circ$",
          "is_correct": false,
          "misconception_token": "halved-the-vertex-angle"
        }
      ],
      "solution": "The two base angles share $180^\\circ - 40^\\circ = 140^\\circ$, so each base angle is $140^\\circ \\div 2 = 70^\\circ$."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "In two triangles, two pairs of angles and the pair of sides between those angles are congruent. Which criterion proves the triangles congruent?",
      "choices": [
        {
          "text": "ASA",
          "is_correct": true
        },
        {
          "text": "AAS",
          "is_correct": false,
          "misconception_token": "used-non-included-side"
        },
        {
          "text": "SAS",
          "is_correct": false,
          "misconception_token": "swapped-angles-and-sides"
        },
        {
          "text": "SSS",
          "is_correct": false,
          "misconception_token": "ignored-the-angles"
        }
      ],
      "solution": "Two angles with the included side between them matches the Angle-Side-Angle (ASA) congruence criterion."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "A right triangle has a right angle and one acute angle of $35^\\circ$. What is the measure of the other acute angle?",
      "choices": [
        {
          "text": "$55^\\circ$",
          "is_correct": true
        },
        {
          "text": "$145^\\circ$",
          "is_correct": false,
          "misconception_token": "forgot-the-right-angle"
        },
        {
          "text": "$45^\\circ$",
          "is_correct": false,
          "misconception_token": "assumed-45-45-right-triangle"
        },
        {
          "text": "$35^\\circ$",
          "is_correct": false,
          "misconception_token": "copied-the-given-acute-angle"
        }
      ],
      "solution": "The angles sum to $180^\\circ$, so the other acute angle is $180^\\circ - 90^\\circ - 35^\\circ = 55^\\circ$."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "Triangle $ABC$ is congruent to triangle $DEF$, with $AB = 8$, $BC = 6$, and $CA = 5$. What is the length of $EF$?",
      "choices": [
        {
          "text": "$6$",
          "is_correct": true
        },
        {
          "text": "$8$",
          "is_correct": false,
          "misconception_token": "used-side-ab"
        },
        {
          "text": "$5$",
          "is_correct": false,
          "misconception_token": "used-side-ca"
        },
        {
          "text": "$19$",
          "is_correct": false,
          "misconception_token": "summed-all-sides"
        }
      ],
      "solution": "In $ABC \\cong DEF$, side $EF$ corresponds to side $BC$, so $EF = BC = 6$."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "The three angles of a triangle can be written as $x$, $2x$, and $3x$. What is the measure of the largest angle?",
      "choices": [
        {
          "text": "$90^\\circ$",
          "is_correct": true
        },
        {
          "text": "$30^\\circ$",
          "is_correct": false,
          "misconception_token": "gave-value-of-x"
        },
        {
          "text": "$60^\\circ$",
          "is_correct": false,
          "misconception_token": "gave-middle-angle"
        },
        {
          "text": "$180^\\circ$",
          "is_correct": false,
          "misconception_token": "gave-the-total"
        }
      ],
      "solution": "Since $x + 2x + 3x = 6x = 180^\\circ$, we get $x = 30^\\circ$, so the largest angle is $3x = 90^\\circ$."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "Two right triangles have congruent hypotenuses and one pair of congruent legs. Which criterion proves the triangles congruent?",
      "choices": [
        {
          "text": "HL",
          "is_correct": true
        },
        {
          "text": "SSA",
          "is_correct": false,
          "misconception_token": "used-invalid-ssa"
        },
        {
          "text": "SAS",
          "is_correct": false,
          "misconception_token": "treated-right-angle-as-included"
        },
        {
          "text": "AAS",
          "is_correct": false,
          "misconception_token": "confused-legs-with-angles"
        }
      ],
      "solution": "A congruent hypotenuse and one congruent leg in right triangles matches the Hypotenuse-Leg (HL) criterion."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "An exterior angle of a triangle is formed at one vertex. Its two remote interior angles measure $45^\\circ$ and $70^\\circ$. What is the measure of that exterior angle?",
      "choices": [
        {
          "text": "$115^\\circ$",
          "is_correct": true
        },
        {
          "text": "$65^\\circ$",
          "is_correct": false,
          "misconception_token": "used-supplement-of-sum"
        },
        {
          "text": "$90^\\circ$",
          "is_correct": false,
          "misconception_token": "assumed-right-angle"
        },
        {
          "text": "$25^\\circ$",
          "is_correct": false,
          "misconception_token": "subtracted-remote-angles"
        }
      ],
      "solution": "An exterior angle equals the sum of its two remote interior angles: $45^\\circ + 70^\\circ = 115^\\circ$."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "Triangle $ABC$ is congruent to triangle $DEF$, so $AB = DE$. If $AB = 2x + 3$ and $DE = 15$, what is the value of $x$?",
      "choices": [
        {
          "text": "$6$",
          "is_correct": true
        },
        {
          "text": "$9$",
          "is_correct": false,
          "misconception_token": "added-3-instead-of-subtracting"
        },
        {
          "text": "$7.5$",
          "is_correct": false,
          "misconception_token": "ignored-the-constant"
        },
        {
          "text": "$12$",
          "is_correct": false,
          "misconception_token": "forgot-to-divide-by-2"
        }
      ],
      "solution": "Set $2x + 3 = 15$, so $2x = 12$ and $x = 6$."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "A triangular sail has two of its angles measuring $63^\\circ$ and $48^\\circ$. What is the measure of the third angle?",
      "choices": [
        {
          "text": "$69^\\circ$",
          "is_correct": true
        },
        {
          "text": "$111^\\circ$",
          "is_correct": false,
          "misconception_token": "added-the-two-angles"
        },
        {
          "text": "$117^\\circ$",
          "is_correct": false,
          "misconception_token": "subtracted-only-first-angle"
        },
        {
          "text": "$132^\\circ$",
          "is_correct": false,
          "misconception_token": "subtracted-only-second-angle"
        }
      ],
      "solution": "The angles sum to $180^\\circ$, so the third angle is $180^\\circ - 63^\\circ - 48^\\circ = 69^\\circ$."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "In triangles $ABC$ and $XYZ$, it is given that $AB = XY$, $BC = YZ$, and $\\angle B = \\angle Y$. Which criterion proves the triangles congruent?",
      "choices": [
        {
          "text": "SAS",
          "is_correct": true
        },
        {
          "text": "SSS",
          "is_correct": false,
          "misconception_token": "counted-angle-as-side"
        },
        {
          "text": "ASA",
          "is_correct": false,
          "misconception_token": "miscounted-angles-and-sides"
        },
        {
          "text": "AAS",
          "is_correct": false,
          "misconception_token": "misidentified-parts-given"
        }
      ],
      "solution": "Sides $AB$ and $BC$ meet at $\\angle B$, so the given angle is included between the two sides, matching SAS."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "In triangles $ABC$ and $DEF$, it is given that $\\angle A = \\angle D$, $\\angle B = \\angle E$, and $BC = EF$. Since $BC$ is not between the two given angles, which criterion proves the triangles congruent?",
      "choices": [
        {
          "text": "AAS",
          "is_correct": true
        },
        {
          "text": "ASA",
          "is_correct": false,
          "misconception_token": "treated-side-as-included"
        },
        {
          "text": "SAS",
          "is_correct": false,
          "misconception_token": "miscounted-sides-and-angles"
        },
        {
          "text": "SSS",
          "is_correct": false,
          "misconception_token": "ignored-the-angles"
        }
      ],
      "solution": "Two angles and a non-included side ($BC$ is opposite $\\angle A$, not between the angles) match the Angle-Angle-Side (AAS) criterion."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "An isosceles triangle has a vertex angle of $80^\\circ$ and two equal base angles each measuring $x$. What is the value of $x$?",
      "choices": [
        {
          "text": "$50^\\circ$",
          "is_correct": true
        },
        {
          "text": "$100^\\circ$",
          "is_correct": false,
          "misconception_token": "forgot-to-divide-by-2"
        },
        {
          "text": "$40^\\circ$",
          "is_correct": false,
          "misconception_token": "halved-the-vertex-angle"
        },
        {
          "text": "$80^\\circ$",
          "is_correct": false,
          "misconception_token": "reused-vertex-angle"
        }
      ],
      "solution": "From $2x + 80^\\circ = 180^\\circ$, we get $2x = 100^\\circ$, so $x = 50^\\circ$."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "The three angles of a triangle are in the ratio $3 : 4 : 5$. What is the measure of the largest angle?",
      "choices": [
        {
          "text": "$75^\\circ$",
          "is_correct": true
        },
        {
          "text": "$45^\\circ$",
          "is_correct": false,
          "misconception_token": "used-smallest-ratio-part"
        },
        {
          "text": "$60^\\circ$",
          "is_correct": false,
          "misconception_token": "used-middle-ratio-part"
        },
        {
          "text": "$36^\\circ$",
          "is_correct": false,
          "misconception_token": "divided-total-by-largest-ratio"
        }
      ],
      "solution": "The parts total $3x + 4x + 5x = 12x = 180^\\circ$, so $x = 15^\\circ$ and the largest angle is $5x = 75^\\circ$."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "In triangles $ABC$ and $DEF$, it is given that $\\angle A = \\angle D$, $\\angle B = \\angle E$, and $\\angle C = \\angle F$, with no side information. Which criterion proves the triangles congruent?",
      "choices": [
        {
          "text": "None; equal angles alone do not prove congruence",
          "is_correct": true
        },
        {
          "text": "ASA",
          "is_correct": false,
          "misconception_token": "invented-a-side-for-asa"
        },
        {
          "text": "AAS",
          "is_correct": false,
          "misconception_token": "invented-a-side-for-aas"
        },
        {
          "text": "SSS",
          "is_correct": false,
          "misconception_token": "assumed-sides-from-angles"
        }
      ],
      "solution": "Three pairs of equal angles (AAA) only guarantee similar shapes, not congruence, because no side length is fixed; there is no valid congruence criterion here."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "In a right triangle, one angle is $90^\\circ$ and the two acute angles are in the ratio $2 : 3$. What is the measure of the larger acute angle?",
      "choices": [
        {
          "text": "$54^\\circ$",
          "is_correct": true
        },
        {
          "text": "$36^\\circ$",
          "is_correct": false,
          "misconception_token": "used-smaller-ratio-part"
        },
        {
          "text": "$108^\\circ$",
          "is_correct": false,
          "misconception_token": "split-180-instead-of-90"
        },
        {
          "text": "$45^\\circ$",
          "is_correct": false,
          "misconception_token": "assumed-equal-acute-angles"
        }
      ],
      "solution": "The two acute angles share $180^\\circ - 90^\\circ = 90^\\circ$; with ratio $2 : 3$, each part is $90^\\circ \\div 5 = 18^\\circ$, so the larger acute angle is $3 \\times 18^\\circ = 54^\\circ$."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "Triangle $ABC$ is congruent to triangle $PQR$. In triangle $ABC$, $\\angle A = 50^\\circ$ and $\\angle B = 60^\\circ$. What is the measure of $\\angle R$?",
      "choices": [
        {
          "text": "$70^\\circ$",
          "is_correct": true
        },
        {
          "text": "$50^\\circ$",
          "is_correct": false,
          "misconception_token": "used-angle-a"
        },
        {
          "text": "$60^\\circ$",
          "is_correct": false,
          "misconception_token": "used-angle-b"
        },
        {
          "text": "$110^\\circ$",
          "is_correct": false,
          "misconception_token": "summed-angles-a-and-b"
        }
      ],
      "solution": "First $\\angle C = 180^\\circ - 50^\\circ - 60^\\circ = 70^\\circ$; since $\\angle R$ corresponds to $\\angle C$, $\\angle R = 70^\\circ$."
    }
  ],
}

const SIMILARITY_RIGHT_TRIANGLES: GapMathSkill = {
  slug: "similarity-right-triangles",
  name: "Similarity & Right Triangles",
  subject: 'math',
  ccssGrade: "10",
  ccssGradeNum: 10,
  ccssCode: "CCSS.MATH.CONTENT.HSG.SRT.C.8",
  satAlignment: "geometry-trigonometry",
  gradeBand: "9-12",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "A right triangle has legs of length $3$ and $4$. What is the length of the hypotenuse?",
      "choices": [
        {
          "text": "5",
          "is_correct": true
        },
        {
          "text": "7",
          "is_correct": false,
          "misconception_token": "added-legs"
        },
        {
          "text": "25",
          "is_correct": false,
          "misconception_token": "forgot-square-root"
        },
        {
          "text": "$\\sqrt{7}$",
          "is_correct": false,
          "misconception_token": "subtracted-squares"
        }
      ],
      "solution": "By the Pythagorean theorem, $3^2 + 4^2 = 9 + 16 = 25$, so the hypotenuse is $\\sqrt{25} = 5$."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "A right triangle has legs of length $5$ and $12$. What is the length of the hypotenuse?",
      "choices": [
        {
          "text": "13",
          "is_correct": true
        },
        {
          "text": "17",
          "is_correct": false,
          "misconception_token": "added-legs"
        },
        {
          "text": "169",
          "is_correct": false,
          "misconception_token": "forgot-square-root"
        },
        {
          "text": "$\\sqrt{119}$",
          "is_correct": false,
          "misconception_token": "subtracted-squares"
        }
      ],
      "solution": "By the Pythagorean theorem, $5^2 + 12^2 = 25 + 144 = 169$, so the hypotenuse is $\\sqrt{169} = 13$."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "Two triangles are similar. A side of length $4$ in the smaller triangle corresponds to a side of length $12$ in the larger triangle. What is the scale factor from the smaller to the larger triangle?",
      "choices": [
        {
          "text": "3",
          "is_correct": true
        },
        {
          "text": "8",
          "is_correct": false,
          "misconception_token": "subtracted-lengths"
        },
        {
          "text": "$\\frac{1}{3}$",
          "is_correct": false,
          "misconception_token": "inverted-ratio"
        },
        {
          "text": "48",
          "is_correct": false,
          "misconception_token": "multiplied-lengths"
        }
      ],
      "solution": "The scale factor is the ratio of the larger side to the smaller side: $\\frac{12}{4} = 3$."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "Two triangles are similar. A side of length $5$ in the smaller triangle corresponds to a side of length $10$ in the larger triangle. Another side of the smaller triangle has length $7$. What is the length of the corresponding side in the larger triangle?",
      "choices": [
        {
          "text": "14",
          "is_correct": true
        },
        {
          "text": "12",
          "is_correct": false,
          "misconception_token": "added-scale-difference"
        },
        {
          "text": "3.5",
          "is_correct": false,
          "misconception_token": "divided-instead-of-multiplied"
        },
        {
          "text": "9",
          "is_correct": false,
          "misconception_token": "added-scale-factor"
        }
      ],
      "solution": "The scale factor is $\\frac{10}{5} = 2$, so the corresponding side is $7 \\times 2 = 14$."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "In a right triangle, the side opposite angle $A$ has length $3$ and the hypotenuse has length $5$. What is $\\sin A$?",
      "choices": [
        {
          "text": "$\\frac{3}{5}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{5}{3}$",
          "is_correct": false,
          "misconception_token": "inverted-ratio"
        },
        {
          "text": "$\\frac{4}{5}$",
          "is_correct": false,
          "misconception_token": "used-adjacent-cosine"
        },
        {
          "text": "$\\frac{3}{4}$",
          "is_correct": false,
          "misconception_token": "used-tangent-ratio"
        }
      ],
      "solution": "Sine is opposite over hypotenuse, so $\\sin A = \\frac{3}{5}$."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "In a right triangle, the side opposite angle $B$ has length $4$ and the side adjacent to angle $B$ has length $3$. What is $\\tan B$?",
      "choices": [
        {
          "text": "$\\frac{4}{3}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{3}{4}$",
          "is_correct": false,
          "misconception_token": "inverted-ratio"
        },
        {
          "text": "$\\frac{4}{5}$",
          "is_correct": false,
          "misconception_token": "used-hypotenuse-sine"
        },
        {
          "text": "$\\frac{3}{5}$",
          "is_correct": false,
          "misconception_token": "used-hypotenuse-cosine"
        }
      ],
      "solution": "Tangent is opposite over adjacent, so $\\tan B = \\frac{4}{3}$."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "A $45^\\circ$-$45^\\circ$-$90^\\circ$ triangle has legs of length $7$. What is the length of the hypotenuse?",
      "choices": [
        {
          "text": "$7\\sqrt{2}$",
          "is_correct": true
        },
        {
          "text": "14",
          "is_correct": false,
          "misconception_token": "doubled-leg"
        },
        {
          "text": "7",
          "is_correct": false,
          "misconception_token": "used-leg-length"
        },
        {
          "text": "$\\frac{7}{\\sqrt{2}}$",
          "is_correct": false,
          "misconception_token": "divided-by-root-two"
        }
      ],
      "solution": "In a $45^\\circ$-$45^\\circ$-$90^\\circ$ triangle the hypotenuse is a leg times $\\sqrt{2}$, so it is $7\\sqrt{2}$."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "In a $30^\\circ$-$60^\\circ$-$90^\\circ$ triangle, the hypotenuse has length $10$. What is the length of the side opposite the $30^\\circ$ angle?",
      "choices": [
        {
          "text": "5",
          "is_correct": true
        },
        {
          "text": "$10\\sqrt{3}$",
          "is_correct": false,
          "misconception_token": "multiplied-by-root-three"
        },
        {
          "text": "$5\\sqrt{3}$",
          "is_correct": false,
          "misconception_token": "used-long-leg"
        },
        {
          "text": "20",
          "is_correct": false,
          "misconception_token": "doubled-hypotenuse"
        }
      ],
      "solution": "The side opposite the $30^\\circ$ angle is half the hypotenuse: $\\frac{10}{2} = 5$."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "A right triangle has a hypotenuse of length $13$ and one leg of length $5$. What is the length of the other leg?",
      "choices": [
        {
          "text": "12",
          "is_correct": true
        },
        {
          "text": "$\\sqrt{194}$",
          "is_correct": false,
          "misconception_token": "added-squares"
        },
        {
          "text": "8",
          "is_correct": false,
          "misconception_token": "subtracted-lengths"
        },
        {
          "text": "144",
          "is_correct": false,
          "misconception_token": "forgot-square-root"
        }
      ],
      "solution": "The missing leg is $\\sqrt{13^2 - 5^2} = \\sqrt{169 - 25} = \\sqrt{144} = 12$."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "A $13$-foot ladder leans against a wall with its base $5$ feet from the wall. How high up the wall does the ladder reach?",
      "choices": [
        {
          "text": "12 feet",
          "is_correct": true
        },
        {
          "text": "8 feet",
          "is_correct": false,
          "misconception_token": "subtracted-lengths"
        },
        {
          "text": "18 feet",
          "is_correct": false,
          "misconception_token": "added-lengths"
        },
        {
          "text": "144 feet",
          "is_correct": false,
          "misconception_token": "forgot-square-root"
        }
      ],
      "solution": "The wall height is $\\sqrt{13^2 - 5^2} = \\sqrt{169 - 25} = \\sqrt{144} = 12$ feet."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "A $4$-foot-tall person casts a $6$-foot shadow. At the same time, a nearby tree casts a $24$-foot shadow. How tall is the tree?",
      "choices": [
        {
          "text": "16 feet",
          "is_correct": true
        },
        {
          "text": "24 feet",
          "is_correct": false,
          "misconception_token": "used-shadow-as-height"
        },
        {
          "text": "36 feet",
          "is_correct": false,
          "misconception_token": "inverted-ratio"
        },
        {
          "text": "34 feet",
          "is_correct": false,
          "misconception_token": "added-all-lengths"
        }
      ],
      "solution": "The triangles are similar, so $\\frac{4}{6} = \\frac{h}{24}$, giving $h = \\frac{4 \\times 24}{6} = 16$ feet."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "Two triangles are similar with a scale factor of $3$. The smaller triangle has a perimeter of $12$. What is the perimeter of the larger triangle?",
      "choices": [
        {
          "text": "36",
          "is_correct": true
        },
        {
          "text": "15",
          "is_correct": false,
          "misconception_token": "added-scale-factor"
        },
        {
          "text": "108",
          "is_correct": false,
          "misconception_token": "used-area-factor"
        },
        {
          "text": "4",
          "is_correct": false,
          "misconception_token": "divided-instead-of-multiplied"
        }
      ],
      "solution": "Perimeter scales by the same factor as the sides, so the larger perimeter is $12 \\times 3 = 36$."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "In a right triangle, one acute angle measures $30^\\circ$ and the hypotenuse has length $12$. What is the length of the side opposite the $30^\\circ$ angle?",
      "choices": [
        {
          "text": "6",
          "is_correct": true
        },
        {
          "text": "$6\\sqrt{3}$",
          "is_correct": false,
          "misconception_token": "used-adjacent-side"
        },
        {
          "text": "$12\\sqrt{3}$",
          "is_correct": false,
          "misconception_token": "multiplied-by-root-three"
        },
        {
          "text": "24",
          "is_correct": false,
          "misconception_token": "divided-by-half"
        }
      ],
      "solution": "The opposite side is $12 \\sin 30^\\circ = 12 \\times \\frac{1}{2} = 6$."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "From a point on the ground, the angle of elevation to the top of a flagpole is $45^\\circ$. The point is $30$ feet from the base of the flagpole. How tall is the flagpole?",
      "choices": [
        {
          "text": "30 feet",
          "is_correct": true
        },
        {
          "text": "$30\\sqrt{2}$ feet",
          "is_correct": false,
          "misconception_token": "used-hypotenuse-relationship"
        },
        {
          "text": "15 feet",
          "is_correct": false,
          "misconception_token": "halved-distance"
        },
        {
          "text": "60 feet",
          "is_correct": false,
          "misconception_token": "doubled-distance"
        }
      ],
      "solution": "The height is $30 \\tan 45^\\circ = 30 \\times 1 = 30$ feet."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "Two triangles are similar. The first triangle has sides $8$, $12$, and $16$. In the second triangle, the side corresponding to $8$ has length $12$. What is the length of the side corresponding to $16$?",
      "choices": [
        {
          "text": "24",
          "is_correct": true
        },
        {
          "text": "20",
          "is_correct": false,
          "misconception_token": "added-difference"
        },
        {
          "text": "$\\frac{32}{3}$",
          "is_correct": false,
          "misconception_token": "inverted-ratio"
        },
        {
          "text": "32",
          "is_correct": false,
          "misconception_token": "doubled-side"
        }
      ],
      "solution": "The scale factor is $\\frac{12}{8} = \\frac{3}{2}$, so the side is $16 \\times \\frac{3}{2} = 24$."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "A person walks $9$ meters east and then $12$ meters north. How far is the person from the starting point?",
      "choices": [
        {
          "text": "15 meters",
          "is_correct": true
        },
        {
          "text": "21 meters",
          "is_correct": false,
          "misconception_token": "added-lengths"
        },
        {
          "text": "$\\sqrt{63}$ meters",
          "is_correct": false,
          "misconception_token": "subtracted-squares"
        },
        {
          "text": "225 meters",
          "is_correct": false,
          "misconception_token": "forgot-square-root"
        }
      ],
      "solution": "The distance is $\\sqrt{9^2 + 12^2} = \\sqrt{81 + 144} = \\sqrt{225} = 15$ meters."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "In a $30^\\circ$-$60^\\circ$-$90^\\circ$ triangle, the hypotenuse has length $8$. What is the length of the side opposite the $60^\\circ$ angle?",
      "choices": [
        {
          "text": "$4\\sqrt{3}$",
          "is_correct": true
        },
        {
          "text": "4",
          "is_correct": false,
          "misconception_token": "used-short-leg"
        },
        {
          "text": "$4\\sqrt{2}$",
          "is_correct": false,
          "misconception_token": "used-45-45-90-ratio"
        },
        {
          "text": "$8\\sqrt{3}$",
          "is_correct": false,
          "misconception_token": "multiplied-hypotenuse-by-root-three"
        }
      ],
      "solution": "The side opposite $60^\\circ$ is $8 \\sin 60^\\circ = 8 \\times \\frac{\\sqrt{3}}{2} = 4\\sqrt{3}$."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "A vertical pole is $15$ feet tall. When the sun's angle of elevation is $60^\\circ$, how long is the pole's shadow on the ground?",
      "choices": [
        {
          "text": "$5\\sqrt{3}$ feet",
          "is_correct": true
        },
        {
          "text": "$15\\sqrt{3}$ feet",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-divided"
        },
        {
          "text": "15 feet",
          "is_correct": false,
          "misconception_token": "used-45-degrees"
        },
        {
          "text": "$\\frac{15}{2}$ feet",
          "is_correct": false,
          "misconception_token": "used-sine-half"
        }
      ],
      "solution": "Since $\\tan 60^\\circ = \\frac{15}{\\text{shadow}}$, the shadow is $\\frac{15}{\\sqrt{3}} = 5\\sqrt{3}$ feet."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "A rectangular field is $30$ meters long and $40$ meters wide. What is the length of the diagonal path across the field?",
      "choices": [
        {
          "text": "50 meters",
          "is_correct": true
        },
        {
          "text": "70 meters",
          "is_correct": false,
          "misconception_token": "added-lengths"
        },
        {
          "text": "2500 meters",
          "is_correct": false,
          "misconception_token": "forgot-square-root"
        },
        {
          "text": "10 meters",
          "is_correct": false,
          "misconception_token": "subtracted-lengths"
        }
      ],
      "solution": "The diagonal is $\\sqrt{30^2 + 40^2} = \\sqrt{900 + 1600} = \\sqrt{2500} = 50$ meters."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "A guy wire runs from the top of a $12$-meter pole to a point on the ground $5$ meters from the base of the pole. If $\\theta$ is the angle the wire makes with the ground, what is $\\cos\\theta$?",
      "choices": [
        {
          "text": "$\\frac{5}{13}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{12}{13}$",
          "is_correct": false,
          "misconception_token": "used-opposite-sine"
        },
        {
          "text": "$\\frac{5}{12}$",
          "is_correct": false,
          "misconception_token": "used-tangent-ratio"
        },
        {
          "text": "$\\frac{13}{5}$",
          "is_correct": false,
          "misconception_token": "inverted-ratio"
        }
      ],
      "solution": "The wire length is $\\sqrt{12^2 + 5^2} = \\sqrt{169} = 13$, so $\\cos\\theta = \\frac{\\text{adjacent}}{\\text{hypotenuse}} = \\frac{5}{13}$."
    }
  ],
}

const CIRCLE_GEOMETRY: GapMathSkill = {
  slug: "circle-geometry",
  name: "Circle Geometry",
  subject: 'math',
  ccssGrade: "10",
  ccssGradeNum: 10,
  ccssCode: "CCSS.MATH.CONTENT.HSG.C.A.2",
  satAlignment: "geometry-trigonometry",
  gradeBand: "9-12",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "A circle has a diameter of $14$ cm. What is the length of its radius?",
      "choices": [
        {
          "text": "7 cm",
          "is_correct": true
        },
        {
          "text": "14 cm",
          "is_correct": false,
          "misconception_token": "used-diameter-as-radius"
        },
        {
          "text": "28 cm",
          "is_correct": false,
          "misconception_token": "doubled-instead-of-halved"
        },
        {
          "text": "3.5 cm",
          "is_correct": false,
          "misconception_token": "halved-twice"
        }
      ],
      "solution": "The radius is half the diameter: $14 \\div 2 = 7$ cm."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "A circle has a radius of $9$ in. What is the length of its diameter?",
      "choices": [
        {
          "text": "18 in",
          "is_correct": true
        },
        {
          "text": "9 in",
          "is_correct": false,
          "misconception_token": "used-radius-as-diameter"
        },
        {
          "text": "4.5 in",
          "is_correct": false,
          "misconception_token": "halved-radius"
        },
        {
          "text": "81 in",
          "is_correct": false,
          "misconception_token": "squared-radius"
        }
      ],
      "solution": "The diameter is twice the radius: $2 \\times 9 = 18$ in."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "What is the circumference of a circle with radius $6$, left in terms of $\\pi$?",
      "choices": [
        {
          "text": "$12\\pi$",
          "is_correct": true
        },
        {
          "text": "$36\\pi$",
          "is_correct": false,
          "misconception_token": "used-area-formula"
        },
        {
          "text": "$6\\pi$",
          "is_correct": false,
          "misconception_token": "forgot-factor-2"
        },
        {
          "text": "$3\\pi$",
          "is_correct": false,
          "misconception_token": "halved-radius"
        }
      ],
      "solution": "Circumference is $2\\pi r = 2\\pi(6) = 12\\pi$."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "What is the area of a circle with radius $4$, left in terms of $\\pi$?",
      "choices": [
        {
          "text": "$16\\pi$",
          "is_correct": true
        },
        {
          "text": "$8\\pi$",
          "is_correct": false,
          "misconception_token": "used-circumference-formula"
        },
        {
          "text": "$4\\pi$",
          "is_correct": false,
          "misconception_token": "forgot-to-square-radius"
        },
        {
          "text": "$64\\pi$",
          "is_correct": false,
          "misconception_token": "squared-diameter"
        }
      ],
      "solution": "Area is $\\pi r^2 = \\pi(4)^2 = 16\\pi$."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "Using $\\pi \\approx 3.14$, what is the circumference of a circle with radius $10$?",
      "choices": [
        {
          "text": "62.8",
          "is_correct": true
        },
        {
          "text": "31.4",
          "is_correct": false,
          "misconception_token": "forgot-factor-2"
        },
        {
          "text": "314",
          "is_correct": false,
          "misconception_token": "used-area-formula"
        },
        {
          "text": "20",
          "is_correct": false,
          "misconception_token": "used-2r-only"
        }
      ],
      "solution": "Circumference is $2\\pi r \\approx 2(3.14)(10) = 62.8$."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "Using $\\pi \\approx 3.14$, what is the area of a circle with radius $5$?",
      "choices": [
        {
          "text": "78.5",
          "is_correct": true
        },
        {
          "text": "31.4",
          "is_correct": false,
          "misconception_token": "used-circumference-formula"
        },
        {
          "text": "15.7",
          "is_correct": false,
          "misconception_token": "forgot-to-square-radius"
        },
        {
          "text": "314",
          "is_correct": false,
          "misconception_token": "squared-diameter"
        }
      ],
      "solution": "Area is $\\pi r^2 \\approx 3.14(5)^2 = 3.14(25) = 78.5$."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "A central angle of a circle measures $70^\\circ$. What is the measure of the arc it intercepts?",
      "choices": [
        {
          "text": "$70^\\circ$",
          "is_correct": true
        },
        {
          "text": "$35^\\circ$",
          "is_correct": false,
          "misconception_token": "applied-inscribed-halving"
        },
        {
          "text": "$140^\\circ$",
          "is_correct": false,
          "misconception_token": "doubled-angle"
        },
        {
          "text": "$110^\\circ$",
          "is_correct": false,
          "misconception_token": "used-supplement"
        }
      ],
      "solution": "An intercepted arc has the same measure as its central angle, so the arc is $70^\\circ$."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "A line is tangent to a circle at point $P$. What is the measure of the angle between the tangent line and the radius drawn to $P$?",
      "choices": [
        {
          "text": "$90^\\circ$",
          "is_correct": true
        },
        {
          "text": "$180^\\circ$",
          "is_correct": false,
          "misconception_token": "used-straight-angle"
        },
        {
          "text": "$45^\\circ$",
          "is_correct": false,
          "misconception_token": "used-half-of-right-angle"
        },
        {
          "text": "$0^\\circ$",
          "is_correct": false,
          "misconception_token": "assumed-parallel"
        }
      ],
      "solution": "A tangent line is perpendicular to the radius at the point of tangency, so the angle is $90^\\circ$."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "A central angle intercepts the same arc as an inscribed angle. If the central angle is $80^\\circ$, what is the inscribed angle?",
      "choices": [
        {
          "text": "$40^\\circ$",
          "is_correct": true
        },
        {
          "text": "$80^\\circ$",
          "is_correct": false,
          "misconception_token": "set-angles-equal"
        },
        {
          "text": "$160^\\circ$",
          "is_correct": false,
          "misconception_token": "doubled-instead-of-halved"
        },
        {
          "text": "$20^\\circ$",
          "is_correct": false,
          "misconception_token": "quartered-angle"
        }
      ],
      "solution": "An inscribed angle is half of the central angle on the same arc: $80 \\div 2 = 40^\\circ$."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "An inscribed angle intercepts an arc measuring $100^\\circ$. What is the measure of the inscribed angle?",
      "choices": [
        {
          "text": "$50^\\circ$",
          "is_correct": true
        },
        {
          "text": "$100^\\circ$",
          "is_correct": false,
          "misconception_token": "set-angle-equal-to-arc"
        },
        {
          "text": "$200^\\circ$",
          "is_correct": false,
          "misconception_token": "doubled-the-arc"
        },
        {
          "text": "$25^\\circ$",
          "is_correct": false,
          "misconception_token": "quartered-the-arc"
        }
      ],
      "solution": "An inscribed angle is half its intercepted arc: $100 \\div 2 = 50^\\circ$."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "A chord of length $24$ is drawn in a circle with radius $13$. How far is the chord from the center of the circle?",
      "choices": [
        {
          "text": "5",
          "is_correct": true
        },
        {
          "text": "12",
          "is_correct": false,
          "misconception_token": "used-half-chord-as-distance"
        },
        {
          "text": "1",
          "is_correct": false,
          "misconception_token": "subtracted-lengths"
        },
        {
          "text": "25",
          "is_correct": false,
          "misconception_token": "forgot-square-root"
        }
      ],
      "solution": "The perpendicular from the center bisects the chord, giving a right triangle with legs $d$ and $12$ and hypotenuse $13$: $d = \\sqrt{13^2 - 12^2} = \\sqrt{25} = 5$."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "A circular garden has a diameter of $20$ feet. Using $\\pi \\approx 3.14$, what is its circumference in feet?",
      "choices": [
        {
          "text": "62.8",
          "is_correct": true
        },
        {
          "text": "31.4",
          "is_correct": false,
          "misconception_token": "used-radius-in-formula"
        },
        {
          "text": "314",
          "is_correct": false,
          "misconception_token": "used-area-formula"
        },
        {
          "text": "125.6",
          "is_correct": false,
          "misconception_token": "doubled-diameter"
        }
      ],
      "solution": "Circumference is $\\pi d \\approx 3.14(20) = 62.8$ feet."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "A circular pizza has a radius of $7$ inches. Using $\\pi \\approx 3.14$, what is its area in square inches?",
      "choices": [
        {
          "text": "153.86",
          "is_correct": true
        },
        {
          "text": "43.96",
          "is_correct": false,
          "misconception_token": "used-circumference-formula"
        },
        {
          "text": "21.98",
          "is_correct": false,
          "misconception_token": "forgot-to-square-radius"
        },
        {
          "text": "615.44",
          "is_correct": false,
          "misconception_token": "squared-diameter"
        }
      ],
      "solution": "Area is $\\pi r^2 \\approx 3.14(7)^2 = 3.14(49) = 153.86$ square inches."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "A sector has a central angle of $90^\\circ$ in a circle of radius $10$. What is the arc length of the sector, in terms of $\\pi$?",
      "choices": [
        {
          "text": "$5\\pi$",
          "is_correct": true
        },
        {
          "text": "$25\\pi$",
          "is_correct": false,
          "misconception_token": "used-area-formula"
        },
        {
          "text": "$20\\pi$",
          "is_correct": false,
          "misconception_token": "ignored-central-angle"
        },
        {
          "text": "$2.5\\pi$",
          "is_correct": false,
          "misconception_token": "forgot-factor-2"
        }
      ],
      "solution": "Arc length is $\\frac{90}{360} \\times 2\\pi r = \\frac{1}{4}(2\\pi)(10) = 5\\pi$."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "A sector has a central angle of $120^\\circ$ in a circle of radius $6$. What is the area of the sector, in terms of $\\pi$?",
      "choices": [
        {
          "text": "$12\\pi$",
          "is_correct": true
        },
        {
          "text": "$4\\pi$",
          "is_correct": false,
          "misconception_token": "used-arc-length-formula"
        },
        {
          "text": "$36\\pi$",
          "is_correct": false,
          "misconception_token": "ignored-central-angle"
        },
        {
          "text": "$2\\pi$",
          "is_correct": false,
          "misconception_token": "forgot-to-square-radius"
        }
      ],
      "solution": "Sector area is $\\frac{120}{360} \\times \\pi r^2 = \\frac{1}{3}\\pi(6)^2 = \\frac{1}{3}(36\\pi) = 12\\pi$."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "From a point $13$ units from the center of a circle, a tangent line is drawn to the circle. If the radius is $5$, how long is the tangent segment from the external point to the point of tangency?",
      "choices": [
        {
          "text": "12",
          "is_correct": true
        },
        {
          "text": "8",
          "is_correct": false,
          "misconception_token": "subtracted-radius-from-distance"
        },
        {
          "text": "18",
          "is_correct": false,
          "misconception_token": "added-radius-to-distance"
        },
        {
          "text": "144",
          "is_correct": false,
          "misconception_token": "forgot-square-root"
        }
      ],
      "solution": "The tangent is perpendicular to the radius, forming a right triangle with legs $t$ and $5$ and hypotenuse $13$: $t = \\sqrt{13^2 - 5^2} = \\sqrt{144} = 12$."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "In a circle, $AB$ is a diameter and $C$ is a point on the circle. If $\\angle A = 35^\\circ$, what is the measure of $\\angle B$ in triangle $ABC$?",
      "choices": [
        {
          "text": "$55^\\circ$",
          "is_correct": true
        },
        {
          "text": "$90^\\circ$",
          "is_correct": false,
          "misconception_token": "chose-the-right-angle"
        },
        {
          "text": "$35^\\circ$",
          "is_correct": false,
          "misconception_token": "set-equal-to-given"
        },
        {
          "text": "$145^\\circ$",
          "is_correct": false,
          "misconception_token": "took-supplement-of-given"
        }
      ],
      "solution": "An angle inscribed in a semicircle is a right angle, so $\\angle C = 90^\\circ$. Then $\\angle B = 180 - 90 - 35 = 55^\\circ$."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "A quadrilateral is inscribed in a circle. One angle measures $110^\\circ$. What is the measure of the angle opposite to it?",
      "choices": [
        {
          "text": "$70^\\circ$",
          "is_correct": true
        },
        {
          "text": "$110^\\circ$",
          "is_correct": false,
          "misconception_token": "set-opposite-angles-equal"
        },
        {
          "text": "$250^\\circ$",
          "is_correct": false,
          "misconception_token": "used-360-instead-of-180"
        },
        {
          "text": "$90^\\circ$",
          "is_correct": false,
          "misconception_token": "assumed-right-angle"
        }
      ],
      "solution": "Opposite angles of a cyclic quadrilateral are supplementary: $180 - 110 = 70^\\circ$."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "A circular running track has a radius of $50$ meters. A runner travels three-quarters of the way around the track. Using $\\pi \\approx 3.14$, how many meters does the runner travel?",
      "choices": [
        {
          "text": "235.5",
          "is_correct": true
        },
        {
          "text": "314",
          "is_correct": false,
          "misconception_token": "used-whole-circumference"
        },
        {
          "text": "78.5",
          "is_correct": false,
          "misconception_token": "used-one-quarter"
        },
        {
          "text": "157",
          "is_correct": false,
          "misconception_token": "used-one-half"
        }
      ],
      "solution": "Full circumference is $2\\pi r \\approx 2(3.14)(50) = 314$; three-quarters is $\\frac{3}{4}(314) = 235.5$ meters."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "Two chords intersect inside a circle. They intercept arcs measuring $70^\\circ$ and $30^\\circ$. What is the measure of the angle formed at their intersection?",
      "choices": [
        {
          "text": "$50^\\circ$",
          "is_correct": true
        },
        {
          "text": "$100^\\circ$",
          "is_correct": false,
          "misconception_token": "forgot-to-halve"
        },
        {
          "text": "$20^\\circ$",
          "is_correct": false,
          "misconception_token": "used-difference-instead-of-sum"
        },
        {
          "text": "$70^\\circ$",
          "is_correct": false,
          "misconception_token": "used-single-arc"
        }
      ],
      "solution": "The angle formed by two intersecting chords is half the sum of the intercepted arcs: $\\frac{1}{2}(70 + 30) = \\frac{1}{2}(100) = 50^\\circ$."
    }
  ],
}

const COORDINATE_GEOMETRY: GapMathSkill = {
  slug: "coordinate-geometry",
  name: "Coordinate Geometry",
  subject: 'math',
  ccssGrade: "10",
  ccssGradeNum: 10,
  ccssCode: "CCSS.MATH.CONTENT.HSG.GPE.B.7",
  satAlignment: "geometry-trigonometry",
  gradeBand: "9-12",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "What is the distance between the points $(0,0)$ and $(3,4)$?",
      "choices": [
        {
          "text": "5",
          "is_correct": true
        },
        {
          "text": "25",
          "is_correct": false,
          "misconception_token": "forgot-square-root"
        },
        {
          "text": "7",
          "is_correct": false,
          "misconception_token": "added-legs"
        },
        {
          "text": "$\\sqrt{7}$",
          "is_correct": false,
          "misconception_token": "rooted-sum-of-legs"
        }
      ],
      "solution": "Distance $=\\sqrt{(3-0)^2+(4-0)^2}=\\sqrt{9+16}=\\sqrt{25}=5$."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "What is the midpoint of the segment joining $(2,3)$ and $(8,7)$?",
      "choices": [
        {
          "text": "$(5,5)$",
          "is_correct": true
        },
        {
          "text": "$(10,10)$",
          "is_correct": false,
          "misconception_token": "summed-without-halving"
        },
        {
          "text": "$(6,4)$",
          "is_correct": false,
          "misconception_token": "used-difference"
        },
        {
          "text": "$(3,2)$",
          "is_correct": false,
          "misconception_token": "used-difference-halved"
        }
      ],
      "solution": "Midpoint $=\\left(\\frac{2+8}{2},\\frac{3+7}{2}\\right)=(5,5)$."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "What is the slope of the line through $(1,2)$ and $(4,8)$?",
      "choices": [
        {
          "text": "2",
          "is_correct": true
        },
        {
          "text": "$\\frac{1}{2}$",
          "is_correct": false,
          "misconception_token": "inverted-slope"
        },
        {
          "text": "-2",
          "is_correct": false,
          "misconception_token": "sign-error"
        },
        {
          "text": "6",
          "is_correct": false,
          "misconception_token": "used-rise-only"
        }
      ],
      "solution": "Slope $=\\frac{8-2}{4-1}=\\frac{6}{3}=2$."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "What is the distance between $(2,5)$ and $(2,-3)$?",
      "choices": [
        {
          "text": "8",
          "is_correct": true
        },
        {
          "text": "2",
          "is_correct": false,
          "misconception_token": "dropped-negative"
        },
        {
          "text": "-8",
          "is_correct": false,
          "misconception_token": "kept-sign-in-distance"
        },
        {
          "text": "64",
          "is_correct": false,
          "misconception_token": "forgot-square-root"
        }
      ],
      "solution": "The points share the same $x$-value, so distance $=|5-(-3)|=8$."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "What is the midpoint of the segment joining $(-4,2)$ and $(6,-8)$?",
      "choices": [
        {
          "text": "$(1,-3)$",
          "is_correct": true
        },
        {
          "text": "$(2,-6)$",
          "is_correct": false,
          "misconception_token": "summed-without-halving"
        },
        {
          "text": "$(5,-5)$",
          "is_correct": false,
          "misconception_token": "used-difference"
        },
        {
          "text": "$(-1,3)$",
          "is_correct": false,
          "misconception_token": "flipped-signs"
        }
      ],
      "solution": "Midpoint $=\\left(\\frac{-4+6}{2},\\frac{2+(-8)}{2}\\right)=(1,-3)$."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "What is the slope of the line through $(-2,3)$ and $(4,-9)$?",
      "choices": [
        {
          "text": "-2",
          "is_correct": true
        },
        {
          "text": "2",
          "is_correct": false,
          "misconception_token": "dropped-negative"
        },
        {
          "text": "$-\\frac{1}{2}$",
          "is_correct": false,
          "misconception_token": "inverted-slope"
        },
        {
          "text": "$\\frac{1}{2}$",
          "is_correct": false,
          "misconception_token": "inverted-and-dropped-negative"
        }
      ],
      "solution": "Slope $=\\frac{-9-3}{4-(-2)}=\\frac{-12}{6}=-2$."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "A line has slope $3$. What is the slope of any line parallel to it?",
      "choices": [
        {
          "text": "3",
          "is_correct": true
        },
        {
          "text": "$-\\frac{1}{3}$",
          "is_correct": false,
          "misconception_token": "used-perpendicular-slope"
        },
        {
          "text": "-3",
          "is_correct": false,
          "misconception_token": "negated-slope"
        },
        {
          "text": "$\\frac{1}{3}$",
          "is_correct": false,
          "misconception_token": "used-reciprocal"
        }
      ],
      "solution": "Parallel lines have equal slopes, so the slope is $3$."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "A line has slope $\\frac{2}{5}$. What is the slope of any line perpendicular to it?",
      "choices": [
        {
          "text": "$-\\frac{5}{2}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{5}{2}$",
          "is_correct": false,
          "misconception_token": "forgot-negative-reciprocal"
        },
        {
          "text": "$-\\frac{2}{5}$",
          "is_correct": false,
          "misconception_token": "negated-not-reciprocal"
        },
        {
          "text": "$\\frac{2}{5}$",
          "is_correct": false,
          "misconception_token": "used-same-slope"
        }
      ],
      "solution": "The perpendicular slope is the negative reciprocal of $\\frac{2}{5}$, which is $-\\frac{5}{2}$."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "What is the distance between $(0,0)$ and $(2,2)$?",
      "choices": [
        {
          "text": "$2\\sqrt{2}$",
          "is_correct": true
        },
        {
          "text": "8",
          "is_correct": false,
          "misconception_token": "forgot-square-root"
        },
        {
          "text": "4",
          "is_correct": false,
          "misconception_token": "added-legs"
        },
        {
          "text": "2",
          "is_correct": false,
          "misconception_token": "used-single-difference"
        }
      ],
      "solution": "Distance $=\\sqrt{2^2+2^2}=\\sqrt{8}=2\\sqrt{2}$."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "A straight path connects a school at $(3,4)$ and a library at $(11,10)$. A bus stop is placed at the midpoint of the path. What are its coordinates?",
      "choices": [
        {
          "text": "$(7,7)$",
          "is_correct": true
        },
        {
          "text": "$(14,14)$",
          "is_correct": false,
          "misconception_token": "summed-without-halving"
        },
        {
          "text": "$(8,6)$",
          "is_correct": false,
          "misconception_token": "used-difference"
        },
        {
          "text": "$(4,3)$",
          "is_correct": false,
          "misconception_token": "used-difference-halved"
        }
      ],
      "solution": "Midpoint $=\\left(\\frac{3+11}{2},\\frac{4+10}{2}\\right)=(7,7)$."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "A ramp rises in a straight line from the point $(2,1)$ to the point $(10,7)$. What is the slope of the ramp?",
      "choices": [
        {
          "text": "$\\frac{3}{4}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{4}{3}$",
          "is_correct": false,
          "misconception_token": "inverted-slope"
        },
        {
          "text": "$-\\frac{4}{3}$",
          "is_correct": false,
          "misconception_token": "inverted-and-negated"
        },
        {
          "text": "$-\\frac{3}{4}$",
          "is_correct": false,
          "misconception_token": "sign-error"
        }
      ],
      "solution": "Slope $=\\frac{7-1}{10-2}=\\frac{6}{8}=\\frac{3}{4}$."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "Line $j$ passes through $(0,0)$ and $(2,6)$. Line $k$ passes through $(0,1)$ and $(3,0)$. What is the relationship between the two lines?",
      "choices": [
        {
          "text": "Perpendicular",
          "is_correct": true
        },
        {
          "text": "Parallel",
          "is_correct": false,
          "misconception_token": "assumed-equal-slopes"
        },
        {
          "text": "Neither parallel nor perpendicular",
          "is_correct": false,
          "misconception_token": "missed-negative-reciprocal"
        },
        {
          "text": "The same line",
          "is_correct": false,
          "misconception_token": "assumed-coincident"
        }
      ],
      "solution": "Line $j$ has slope $\\frac{6}{2}=3$ and line $k$ has slope $\\frac{0-1}{3-0}=-\\frac{1}{3}$; since $3\\cdot\\left(-\\frac{1}{3}\\right)=-1$, the lines are perpendicular."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "A rectangle has vertices $(1,1)$, $(6,1)$, $(6,4)$, and $(1,4)$. What is its perimeter?",
      "choices": [
        {
          "text": "16",
          "is_correct": true
        },
        {
          "text": "15",
          "is_correct": false,
          "misconception_token": "computed-area"
        },
        {
          "text": "8",
          "is_correct": false,
          "misconception_token": "added-sides-once"
        },
        {
          "text": "30",
          "is_correct": false,
          "misconception_token": "doubled-area"
        }
      ],
      "solution": "The width is $6-1=5$ and the height is $4-1=3$, so the perimeter is $2(5+3)=16$."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "A triangle has vertices $(0,0)$, $(6,0)$, and $(0,4)$. What is its area?",
      "choices": [
        {
          "text": "12",
          "is_correct": true
        },
        {
          "text": "24",
          "is_correct": false,
          "misconception_token": "forgot-one-half"
        },
        {
          "text": "10",
          "is_correct": false,
          "misconception_token": "added-legs"
        },
        {
          "text": "5",
          "is_correct": false,
          "misconception_token": "half-of-sum"
        }
      ],
      "solution": "The legs along the axes have lengths $6$ and $4$, so area $=\\frac{1}{2}\\cdot 6\\cdot 4=12$."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "On a map grid, a drone flies in a straight line from $(1,2)$ to $(5,5)$. How many units does it travel?",
      "choices": [
        {
          "text": "5",
          "is_correct": true
        },
        {
          "text": "7",
          "is_correct": false,
          "misconception_token": "added-legs"
        },
        {
          "text": "25",
          "is_correct": false,
          "misconception_token": "forgot-square-root"
        },
        {
          "text": "$\\sqrt{7}$",
          "is_correct": false,
          "misconception_token": "rooted-sum-of-legs"
        }
      ],
      "solution": "Distance $=\\sqrt{(5-1)^2+(5-2)^2}=\\sqrt{16+9}=\\sqrt{25}=5$."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "The midpoint of segment $AB$ is $(4,3)$. If $A=(1,2)$, what are the coordinates of $B$?",
      "choices": [
        {
          "text": "$(7,4)$",
          "is_correct": true
        },
        {
          "text": "$(3,1)$",
          "is_correct": false,
          "misconception_token": "subtracted-a-from-midpoint"
        },
        {
          "text": "$(5,5)$",
          "is_correct": false,
          "misconception_token": "added-a-to-midpoint"
        },
        {
          "text": "$(2.5,2.5)$",
          "is_correct": false,
          "misconception_token": "averaged-a-and-midpoint"
        }
      ],
      "solution": "Set $\\frac{1+x}{2}=4$ and $\\frac{2+y}{2}=3$, giving $x=7$ and $y=4$, so $B=(7,4)$."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "A triangle has vertices $(0,0)$, $(3,0)$, and $(0,3)$. What is its perimeter?",
      "choices": [
        {
          "text": "$6+3\\sqrt{2}$",
          "is_correct": true
        },
        {
          "text": "12",
          "is_correct": false,
          "misconception_token": "added-legs-as-hypotenuse"
        },
        {
          "text": "24",
          "is_correct": false,
          "misconception_token": "forgot-square-root-hypotenuse"
        },
        {
          "text": "$3+3\\sqrt{2}$",
          "is_correct": false,
          "misconception_token": "missed-one-leg"
        }
      ],
      "solution": "The two legs each have length $3$ and the hypotenuse is $\\sqrt{3^2+3^2}=3\\sqrt{2}$, so the perimeter is $6+3\\sqrt{2}$."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "A parking lot is shaped like a parallelogram with vertices $(1,1)$, $(5,1)$, $(6,4)$, and $(2,4)$. What is its area?",
      "choices": [
        {
          "text": "12",
          "is_correct": true
        },
        {
          "text": "16",
          "is_correct": false,
          "misconception_token": "used-y-coordinate-as-height"
        },
        {
          "text": "7",
          "is_correct": false,
          "misconception_token": "added-base-and-height"
        },
        {
          "text": "24",
          "is_correct": false,
          "misconception_token": "doubled-the-area"
        }
      ],
      "solution": "The base from $(1,1)$ to $(5,1)$ has length $4$ and the vertical height between $y=1$ and $y=4$ is $3$, so area $=4\\cdot 3=12$."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "Points $A(-2,1)$, $B(2,3)$, and $C(4,k)$ are given. For what value of $k$ is segment $BC$ perpendicular to segment $AB$?",
      "choices": [
        {
          "text": "-1",
          "is_correct": true
        },
        {
          "text": "4",
          "is_correct": false,
          "misconception_token": "used-parallel-slope"
        },
        {
          "text": "7",
          "is_correct": false,
          "misconception_token": "forgot-negative-reciprocal"
        },
        {
          "text": "2",
          "is_correct": false,
          "misconception_token": "negated-not-reciprocal"
        }
      ],
      "solution": "Slope $AB=\\frac{3-1}{2-(-2)}=\\frac{1}{2}$, so $BC$ needs slope $-2$; solving $\\frac{k-3}{4-2}=-2$ gives $k=-1$."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "A triangular garden has corners at $(2,1)$, $(8,1)$, and $(4,6)$. What is its area?",
      "choices": [
        {
          "text": "15",
          "is_correct": true
        },
        {
          "text": "30",
          "is_correct": false,
          "misconception_token": "forgot-one-half"
        },
        {
          "text": "11",
          "is_correct": false,
          "misconception_token": "added-base-and-height"
        },
        {
          "text": "18",
          "is_correct": false,
          "misconception_token": "used-y-coordinate-as-height"
        }
      ],
      "solution": "The base from $(2,1)$ to $(8,1)$ has length $6$ and the height from $y=1$ up to $y=6$ is $5$, so area $=\\frac{1}{2}\\cdot 6\\cdot 5=15$."
    }
  ],
}

const TRIGONOMETRIC_FUNCTIONS: GapMathSkill = {
  slug: "trigonometric-functions",
  name: "Trigonometric Functions",
  subject: 'math',
  ccssGrade: "12",
  ccssGradeNum: 12,
  ccssCode: "CCSS.MATH.CONTENT.HSF.TF.A.2",
  satAlignment: "advanced-math",
  gradeBand: "9-12",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "Convert $180^\\circ$ to radians.",
      "choices": [
        {
          "text": "$\\pi$",
          "is_correct": true
        },
        {
          "text": "$2\\pi$",
          "is_correct": false,
          "misconception_token": "used-360-not-180"
        },
        {
          "text": "$\\frac{\\pi}{2}$",
          "is_correct": false,
          "misconception_token": "confused-with-90-degrees"
        },
        {
          "text": "$180\\pi$",
          "is_correct": false,
          "misconception_token": "forgot-to-divide-by-180"
        }
      ],
      "solution": "Multiply by $\\frac{\\pi}{180}$: $180 \\times \\frac{\\pi}{180} = \\pi$."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "Convert $90^\\circ$ to radians.",
      "choices": [
        {
          "text": "$\\frac{\\pi}{2}$",
          "is_correct": true
        },
        {
          "text": "$\\pi$",
          "is_correct": false,
          "misconception_token": "used-180-not-90"
        },
        {
          "text": "$\\frac{\\pi}{4}$",
          "is_correct": false,
          "misconception_token": "halved-twice"
        },
        {
          "text": "$90\\pi$",
          "is_correct": false,
          "misconception_token": "forgot-to-divide-by-180"
        }
      ],
      "solution": "Multiply by $\\frac{\\pi}{180}$: $90 \\times \\frac{\\pi}{180} = \\frac{\\pi}{2}$."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "Convert $\\frac{\\pi}{6}$ radians to degrees.",
      "choices": [
        {
          "text": "$30^\\circ$",
          "is_correct": true
        },
        {
          "text": "$60^\\circ$",
          "is_correct": false,
          "misconception_token": "confused-pi-over-6-with-pi-over-3"
        },
        {
          "text": "$45^\\circ$",
          "is_correct": false,
          "misconception_token": "confused-with-pi-over-4"
        },
        {
          "text": "$15^\\circ$",
          "is_correct": false,
          "misconception_token": "halved-the-result"
        }
      ],
      "solution": "Multiply by $\\frac{180}{\\pi}$: $\\frac{\\pi}{6} \\times \\frac{180}{\\pi} = 30^\\circ$."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "What is $\\sin 30^\\circ$?",
      "choices": [
        {
          "text": "$\\frac{1}{2}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{\\sqrt{3}}{2}$",
          "is_correct": false,
          "misconception_token": "used-cosine-value"
        },
        {
          "text": "$\\frac{\\sqrt{2}}{2}$",
          "is_correct": false,
          "misconception_token": "used-forty-five-value"
        },
        {
          "text": "$1$",
          "is_correct": false,
          "misconception_token": "used-ninety-value"
        }
      ],
      "solution": "On the unit circle, $\\sin 30^\\circ = \\frac{1}{2}$."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "What is $\\cos 60^\\circ$?",
      "choices": [
        {
          "text": "$\\frac{1}{2}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{\\sqrt{3}}{2}$",
          "is_correct": false,
          "misconception_token": "used-cosine-of-thirty"
        },
        {
          "text": "$\\frac{\\sqrt{2}}{2}$",
          "is_correct": false,
          "misconception_token": "used-forty-five-value"
        },
        {
          "text": "$0$",
          "is_correct": false,
          "misconception_token": "used-ninety-value"
        }
      ],
      "solution": "On the unit circle, $\\cos 60^\\circ = \\frac{1}{2}$."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "What is $\\tan 45^\\circ$?",
      "choices": [
        {
          "text": "$1$",
          "is_correct": true
        },
        {
          "text": "$0$",
          "is_correct": false,
          "misconception_token": "used-zero-value"
        },
        {
          "text": "$\\sqrt{3}$",
          "is_correct": false,
          "misconception_token": "used-sixty-value"
        },
        {
          "text": "$\\frac{\\sqrt{3}}{3}$",
          "is_correct": false,
          "misconception_token": "used-thirty-value"
        }
      ],
      "solution": "$\\tan 45^\\circ = \\frac{\\sin 45^\\circ}{\\cos 45^\\circ} = \\frac{\\sqrt{2}/2}{\\sqrt{2}/2} = 1$."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "What is $\\cos 0^\\circ$?",
      "choices": [
        {
          "text": "$1$",
          "is_correct": true
        },
        {
          "text": "$0$",
          "is_correct": false,
          "misconception_token": "confused-with-sine-of-zero"
        },
        {
          "text": "$\\frac{1}{2}$",
          "is_correct": false,
          "misconception_token": "used-sixty-value"
        },
        {
          "text": "$-1$",
          "is_correct": false,
          "misconception_token": "used-one-eighty-value"
        }
      ],
      "solution": "At $0^\\circ$ the point on the unit circle is $(1, 0)$, so $\\cos 0^\\circ = 1$."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "What is $\\sin 90^\\circ$?",
      "choices": [
        {
          "text": "$1$",
          "is_correct": true
        },
        {
          "text": "$0$",
          "is_correct": false,
          "misconception_token": "confused-with-sine-of-zero"
        },
        {
          "text": "$\\frac{1}{2}$",
          "is_correct": false,
          "misconception_token": "used-thirty-value"
        },
        {
          "text": "$\\frac{\\sqrt{2}}{2}$",
          "is_correct": false,
          "misconception_token": "used-forty-five-value"
        }
      ],
      "solution": "At $90^\\circ$ the point on the unit circle is $(0, 1)$, so $\\sin 90^\\circ = 1$."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "Convert $240^\\circ$ to radians.",
      "choices": [
        {
          "text": "$\\frac{4\\pi}{3}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{2\\pi}{3}$",
          "is_correct": false,
          "misconception_token": "used-one-twenty-degrees"
        },
        {
          "text": "$\\frac{5\\pi}{3}$",
          "is_correct": false,
          "misconception_token": "used-three-hundred-degrees"
        },
        {
          "text": "$\\frac{3\\pi}{2}$",
          "is_correct": false,
          "misconception_token": "used-two-seventy-degrees"
        }
      ],
      "solution": "Multiply by $\\frac{\\pi}{180}$: $240 \\times \\frac{\\pi}{180} = \\frac{4\\pi}{3}$."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "Convert $\\frac{5\\pi}{4}$ radians to degrees.",
      "choices": [
        {
          "text": "$225^\\circ$",
          "is_correct": true
        },
        {
          "text": "$45^\\circ$",
          "is_correct": false,
          "misconception_token": "ignored-the-coefficient"
        },
        {
          "text": "$135^\\circ$",
          "is_correct": false,
          "misconception_token": "used-three-pi-over-four"
        },
        {
          "text": "$315^\\circ$",
          "is_correct": false,
          "misconception_token": "used-seven-pi-over-four"
        }
      ],
      "solution": "Multiply by $\\frac{180}{\\pi}$: $\\frac{5\\pi}{4} \\times \\frac{180}{\\pi} = 5 \\times 45 = 225^\\circ$."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "In which quadrant is $\\sin\\theta > 0$ and $\\cos\\theta < 0$?",
      "choices": [
        {
          "text": "Quadrant II",
          "is_correct": true
        },
        {
          "text": "Quadrant I",
          "is_correct": false,
          "misconception_token": "both-functions-positive"
        },
        {
          "text": "Quadrant III",
          "is_correct": false,
          "misconception_token": "both-functions-negative"
        },
        {
          "text": "Quadrant IV",
          "is_correct": false,
          "misconception_token": "cosine-positive-sine-negative"
        }
      ],
      "solution": "Sine is positive above the $x$-axis and cosine is negative left of the $y$-axis, which together is Quadrant II."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "What is $\\sin 210^\\circ$?",
      "choices": [
        {
          "text": "$-\\frac{1}{2}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{1}{2}$",
          "is_correct": false,
          "misconception_token": "forgot-negative-sign"
        },
        {
          "text": "$-\\frac{\\sqrt{3}}{2}$",
          "is_correct": false,
          "misconception_token": "used-sixty-reference"
        },
        {
          "text": "$\\frac{\\sqrt{3}}{2}$",
          "is_correct": false,
          "misconception_token": "wrong-sign-and-reference"
        }
      ],
      "solution": "$210^\\circ$ is in Quadrant III with reference angle $30^\\circ$, and sine is negative there, so $\\sin 210^\\circ = -\\frac{1}{2}$."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "What is $\\tan 120^\\circ$?",
      "choices": [
        {
          "text": "$-\\sqrt{3}$",
          "is_correct": true
        },
        {
          "text": "$\\sqrt{3}$",
          "is_correct": false,
          "misconception_token": "forgot-negative-sign"
        },
        {
          "text": "$-\\frac{\\sqrt{3}}{3}$",
          "is_correct": false,
          "misconception_token": "used-thirty-reference"
        },
        {
          "text": "$\\frac{\\sqrt{3}}{3}$",
          "is_correct": false,
          "misconception_token": "wrong-sign-and-reference"
        }
      ],
      "solution": "$120^\\circ$ is in Quadrant II with reference angle $60^\\circ$, and tangent is negative there, so $\\tan 120^\\circ = -\\sqrt{3}$."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "What is $\\cos 135^\\circ$?",
      "choices": [
        {
          "text": "$-\\frac{\\sqrt{2}}{2}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{\\sqrt{2}}{2}$",
          "is_correct": false,
          "misconception_token": "forgot-negative-sign"
        },
        {
          "text": "$-\\frac{1}{2}$",
          "is_correct": false,
          "misconception_token": "used-sixty-reference"
        },
        {
          "text": "$-\\frac{\\sqrt{3}}{2}$",
          "is_correct": false,
          "misconception_token": "used-thirty-reference"
        }
      ],
      "solution": "$135^\\circ$ is in Quadrant II with reference angle $45^\\circ$, and cosine is negative there, so $\\cos 135^\\circ = -\\frac{\\sqrt{2}}{2}$."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "A right triangle has an acute angle $\\theta$ with $\\sin\\theta = \\frac{3}{5}$. What is $\\cos\\theta$?",
      "choices": [
        {
          "text": "$\\frac{4}{5}$",
          "is_correct": true
        },
        {
          "text": "$-\\frac{4}{5}$",
          "is_correct": false,
          "misconception_token": "chose-negative-root"
        },
        {
          "text": "$\\frac{2}{5}$",
          "is_correct": false,
          "misconception_token": "subtracted-fractions-wrong"
        },
        {
          "text": "$\\frac{16}{25}$",
          "is_correct": false,
          "misconception_token": "forgot-square-root"
        }
      ],
      "solution": "Since $\\theta$ is acute, $\\cos\\theta = \\sqrt{1 - \\sin^2\\theta} = \\sqrt{1 - \\frac{9}{25}} = \\sqrt{\\frac{16}{25}} = \\frac{4}{5}$."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "A point on the unit circle corresponds to an angle of $60^\\circ$. What is the $y$-coordinate of this point?",
      "choices": [
        {
          "text": "$\\frac{\\sqrt{3}}{2}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{1}{2}$",
          "is_correct": false,
          "misconception_token": "gave-x-coordinate"
        },
        {
          "text": "$\\frac{\\sqrt{2}}{2}$",
          "is_correct": false,
          "misconception_token": "used-forty-five-value"
        },
        {
          "text": "$1$",
          "is_correct": false,
          "misconception_token": "used-radius-as-coordinate"
        }
      ],
      "solution": "On the unit circle the $y$-coordinate equals the sine, so it is $\\sin 60^\\circ = \\frac{\\sqrt{3}}{2}$."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "Convert $\\frac{7\\pi}{12}$ radians to degrees.",
      "choices": [
        {
          "text": "$105^\\circ$",
          "is_correct": true
        },
        {
          "text": "$75^\\circ$",
          "is_correct": false,
          "misconception_token": "used-five-pi-over-twelve"
        },
        {
          "text": "$150^\\circ$",
          "is_correct": false,
          "misconception_token": "used-five-pi-over-six"
        },
        {
          "text": "$210^\\circ$",
          "is_correct": false,
          "misconception_token": "doubled-the-angle"
        }
      ],
      "solution": "Multiply by $\\frac{180}{\\pi}$: $\\frac{7\\pi}{12} \\times \\frac{180}{\\pi} = 7 \\times 15 = 105^\\circ$."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "What is $\\tan 300^\\circ$?",
      "choices": [
        {
          "text": "$-\\sqrt{3}$",
          "is_correct": true
        },
        {
          "text": "$\\sqrt{3}$",
          "is_correct": false,
          "misconception_token": "forgot-negative-sign"
        },
        {
          "text": "$-\\frac{\\sqrt{3}}{3}$",
          "is_correct": false,
          "misconception_token": "used-thirty-reference"
        },
        {
          "text": "$\\frac{\\sqrt{3}}{3}$",
          "is_correct": false,
          "misconception_token": "wrong-sign-and-reference"
        }
      ],
      "solution": "$300^\\circ$ is in Quadrant IV with reference angle $60^\\circ$, and tangent is negative there, so $\\tan 300^\\circ = -\\sqrt{3}$."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "For an angle $\\theta$ in Quadrant II, $\\cos\\theta = -\\frac{4}{5}$. What is $\\tan\\theta$?",
      "choices": [
        {
          "text": "$-\\frac{3}{4}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{3}{4}$",
          "is_correct": false,
          "misconception_token": "forgot-negative-sign"
        },
        {
          "text": "$-\\frac{4}{3}$",
          "is_correct": false,
          "misconception_token": "inverted-the-ratio"
        },
        {
          "text": "$\\frac{4}{3}$",
          "is_correct": false,
          "misconception_token": "inverted-and-wrong-sign"
        }
      ],
      "solution": "In Quadrant II sine is positive, so $\\sin\\theta = \\frac{3}{5}$, and $\\tan\\theta = \\frac{\\sin\\theta}{\\cos\\theta} = \\frac{3/5}{-4/5} = -\\frac{3}{4}$."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "What is the exact value of $\\sin 30^\\circ \\cos 60^\\circ + \\cos 30^\\circ \\sin 60^\\circ$?",
      "choices": [
        {
          "text": "$1$",
          "is_correct": true
        },
        {
          "text": "$\\frac{1}{4}$",
          "is_correct": false,
          "misconception_token": "only-first-product"
        },
        {
          "text": "$\\frac{3}{4}$",
          "is_correct": false,
          "misconception_token": "only-second-product"
        },
        {
          "text": "$\\frac{1}{2}$",
          "is_correct": false,
          "misconception_token": "averaged-the-products"
        }
      ],
      "solution": "$\\sin 30^\\circ \\cos 60^\\circ + \\cos 30^\\circ \\sin 60^\\circ = \\frac{1}{2}\\cdot\\frac{1}{2} + \\frac{\\sqrt{3}}{2}\\cdot\\frac{\\sqrt{3}}{2} = \\frac{1}{4} + \\frac{3}{4} = 1$."
    }
  ],
}

const SEQUENCES_SERIES: GapMathSkill = {
  slug: "sequences-series",
  name: "Sequences & Series",
  subject: 'math',
  ccssGrade: "12",
  ccssGradeNum: 12,
  ccssCode: "CCSS.MATH.CONTENT.HSF.BF.A.2",
  satAlignment: "advanced-math",
  gradeBand: "9-12",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "What is the common difference of the arithmetic sequence $3, 7, 11, 15, \\dots$?",
      "choices": [
        {
          "text": "4",
          "is_correct": true
        },
        {
          "text": "3",
          "is_correct": false,
          "misconception_token": "used-first-term"
        },
        {
          "text": "7",
          "is_correct": false,
          "misconception_token": "used-second-term"
        },
        {
          "text": "-4",
          "is_correct": false,
          "misconception_token": "subtracted-wrong-order"
        }
      ],
      "solution": "The common difference is any term minus the previous term: $7 - 3 = 4$."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "What is the common ratio of the geometric sequence $2, 6, 18, 54, \\dots$?",
      "choices": [
        {
          "text": "3",
          "is_correct": true
        },
        {
          "text": "4",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-divided"
        },
        {
          "text": "2",
          "is_correct": false,
          "misconception_token": "used-first-term"
        },
        {
          "text": "9",
          "is_correct": false,
          "misconception_token": "divided-nonadjacent-terms"
        }
      ],
      "solution": "The common ratio is any term divided by the previous term: $6 \\div 2 = 3$."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "What is the next term of the arithmetic sequence $5, 9, 13, \\dots$?",
      "choices": [
        {
          "text": "17",
          "is_correct": true
        },
        {
          "text": "13",
          "is_correct": false,
          "misconception_token": "forgot-to-add-difference"
        },
        {
          "text": "16",
          "is_correct": false,
          "misconception_token": "added-three-not-four"
        },
        {
          "text": "18",
          "is_correct": false,
          "misconception_token": "added-five-not-four"
        }
      ],
      "solution": "The common difference is $4$, so the next term is $13 + 4 = 17$."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "What is the next term of the geometric sequence $3, 6, 12, \\dots$?",
      "choices": [
        {
          "text": "24",
          "is_correct": true
        },
        {
          "text": "18",
          "is_correct": false,
          "misconception_token": "added-difference-instead-of-multiply"
        },
        {
          "text": "36",
          "is_correct": false,
          "misconception_token": "used-wrong-ratio"
        },
        {
          "text": "14",
          "is_correct": false,
          "misconception_token": "added-two-instead"
        }
      ],
      "solution": "The common ratio is $2$, so the next term is $12 \\times 2 = 24$."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "Which type of sequence is $4, 8, 16, 32, \\dots$?",
      "choices": [
        {
          "text": "Geometric",
          "is_correct": true
        },
        {
          "text": "Arithmetic",
          "is_correct": false,
          "misconception_token": "mistook-ratio-for-difference"
        },
        {
          "text": "Neither",
          "is_correct": false,
          "misconception_token": "thinks-no-pattern"
        },
        {
          "text": "Both arithmetic and geometric",
          "is_correct": false,
          "misconception_token": "thinks-both-apply"
        }
      ],
      "solution": "Each term is the previous term times $2$ (a constant ratio), so the sequence is geometric."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "Which type of sequence is $5, 8, 11, 14, \\dots$?",
      "choices": [
        {
          "text": "Arithmetic",
          "is_correct": true
        },
        {
          "text": "Geometric",
          "is_correct": false,
          "misconception_token": "mistook-difference-for-ratio"
        },
        {
          "text": "Neither",
          "is_correct": false,
          "misconception_token": "thinks-no-pattern"
        },
        {
          "text": "Constant",
          "is_correct": false,
          "misconception_token": "thinks-values-constant"
        }
      ],
      "solution": "Each term is the previous term plus $3$ (a constant difference), so the sequence is arithmetic."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "An arithmetic sequence has first term $a_1 = 2$ and common difference $d = 5$. What is $a_4$?",
      "choices": [
        {
          "text": "17",
          "is_correct": true
        },
        {
          "text": "22",
          "is_correct": false,
          "misconception_token": "used-n-not-n-minus-1"
        },
        {
          "text": "12",
          "is_correct": false,
          "misconception_token": "used-n-minus-2"
        },
        {
          "text": "15",
          "is_correct": false,
          "misconception_token": "dropped-first-term"
        }
      ],
      "solution": "Using $a_n = a_1 + (n-1)d$, we get $a_4 = 2 + (4-1)(5) = 2 + 15 = 17$."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "A geometric sequence has first term $a_1 = 3$ and common ratio $r = 2$. What is $a_4$?",
      "choices": [
        {
          "text": "24",
          "is_correct": true
        },
        {
          "text": "48",
          "is_correct": false,
          "misconception_token": "used-exponent-n"
        },
        {
          "text": "12",
          "is_correct": false,
          "misconception_token": "used-exponent-n-minus-2"
        },
        {
          "text": "8",
          "is_correct": false,
          "misconception_token": "dropped-first-term"
        }
      ],
      "solution": "Using $a_n = a_1 r^{n-1}$, we get $a_4 = 3 \\cdot 2^{4-1} = 3 \\cdot 8 = 24$."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "An arithmetic sequence has first term $a_1 = 7$ and common difference $d = 4$. What is $a_{10}$?",
      "choices": [
        {
          "text": "43",
          "is_correct": true
        },
        {
          "text": "47",
          "is_correct": false,
          "misconception_token": "used-n-not-n-minus-1"
        },
        {
          "text": "40",
          "is_correct": false,
          "misconception_token": "forgot-first-term"
        },
        {
          "text": "36",
          "is_correct": false,
          "misconception_token": "dropped-first-term"
        }
      ],
      "solution": "Using $a_n = a_1 + (n-1)d$, we get $a_{10} = 7 + (10-1)(4) = 7 + 36 = 43$."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "A geometric sequence has first term $a_1 = 5$ and common ratio $r = 3$. What is $a_5$?",
      "choices": [
        {
          "text": "405",
          "is_correct": true
        },
        {
          "text": "1215",
          "is_correct": false,
          "misconception_token": "used-exponent-n"
        },
        {
          "text": "135",
          "is_correct": false,
          "misconception_token": "used-exponent-n-minus-2"
        },
        {
          "text": "81",
          "is_correct": false,
          "misconception_token": "dropped-first-term"
        }
      ],
      "solution": "Using $a_n = a_1 r^{n-1}$, we get $a_5 = 5 \\cdot 3^{5-1} = 5 \\cdot 81 = 405$."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "In an arithmetic sequence, $a_1 = 1$ and $a_7 = 43$. What is the common difference $d$?",
      "choices": [
        {
          "text": "7",
          "is_correct": true
        },
        {
          "text": "6",
          "is_correct": false,
          "misconception_token": "divided-by-n-not-n-minus-1"
        },
        {
          "text": "42",
          "is_correct": false,
          "misconception_token": "forgot-to-divide"
        },
        {
          "text": "21",
          "is_correct": false,
          "misconception_token": "divided-by-wrong-count"
        }
      ],
      "solution": "Since $a_7 = a_1 + 6d$, we have $43 = 1 + 6d$, so $6d = 42$ and $d = 7$."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "What is the sum of the first $10$ terms of the arithmetic sequence $3, 7, 11, \\dots$?",
      "choices": [
        {
          "text": "210",
          "is_correct": true
        },
        {
          "text": "420",
          "is_correct": false,
          "misconception_token": "used-n-not-half-n"
        },
        {
          "text": "195",
          "is_correct": false,
          "misconception_token": "dropped-first-term"
        },
        {
          "text": "42",
          "is_correct": false,
          "misconception_token": "forgot-to-multiply-count"
        }
      ],
      "solution": "The tenth term is $a_{10} = 3 + 9(4) = 39$, so $S_{10} = \\frac{10}{2}(3 + 39) = 5 \\cdot 42 = 210$."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "Maria saves 50 dollars the first week and increases her savings by 15 dollars each week after that. How many dollars does she save in the eighth week?",
      "choices": [
        {
          "text": "155",
          "is_correct": true
        },
        {
          "text": "170",
          "is_correct": false,
          "misconception_token": "used-n-not-n-minus-1"
        },
        {
          "text": "105",
          "is_correct": false,
          "misconception_token": "forgot-starting-amount"
        },
        {
          "text": "140",
          "is_correct": false,
          "misconception_token": "used-n-minus-2"
        }
      ],
      "solution": "This is arithmetic with $a_1 = 50$ and $d = 15$, so $a_8 = 50 + (8-1)(15) = 50 + 105 = 155$."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "A colony starts with $20$ bacteria and the population doubles every hour. How many bacteria are there after $5$ hours?",
      "choices": [
        {
          "text": "640",
          "is_correct": true
        },
        {
          "text": "320",
          "is_correct": false,
          "misconception_token": "used-exponent-n-minus-1"
        },
        {
          "text": "200",
          "is_correct": false,
          "misconception_token": "multiplied-by-count"
        },
        {
          "text": "100",
          "is_correct": false,
          "misconception_token": "added-instead-of-doubled"
        }
      ],
      "solution": "The population is $20 \\cdot 2^5 = 20 \\cdot 32 = 640$ after $5$ doublings."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "How many terms are in the arithmetic sequence $4, 7, 10, \\dots, 49$?",
      "choices": [
        {
          "text": "16",
          "is_correct": true
        },
        {
          "text": "15",
          "is_correct": false,
          "misconception_token": "forgot-to-add-one"
        },
        {
          "text": "17",
          "is_correct": false,
          "misconception_token": "added-two-instead"
        },
        {
          "text": "45",
          "is_correct": false,
          "misconception_token": "forgot-to-divide"
        }
      ],
      "solution": "With $d = 3$, solving $49 = 4 + (n-1)(3)$ gives $n - 1 = 15$, so $n = 16$."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "A theater has $20$ seats in the first row, and each row after that has $4$ more seats than the one before. How many seats are in the twelfth row?",
      "choices": [
        {
          "text": "64",
          "is_correct": true
        },
        {
          "text": "68",
          "is_correct": false,
          "misconception_token": "used-n-not-n-minus-1"
        },
        {
          "text": "48",
          "is_correct": false,
          "misconception_token": "forgot-first-row"
        },
        {
          "text": "60",
          "is_correct": false,
          "misconception_token": "used-n-minus-2"
        }
      ],
      "solution": "This is arithmetic with $a_1 = 20$ and $d = 4$, so $a_{12} = 20 + (12-1)(4) = 20 + 44 = 64$."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "A student saves 10 dollars on the first day and doubles the amount saved each day. How many dollars has the student saved in total after $7$ days?",
      "choices": [
        {
          "text": "1270",
          "is_correct": true
        },
        {
          "text": "1280",
          "is_correct": false,
          "misconception_token": "forgot-minus-one"
        },
        {
          "text": "640",
          "is_correct": false,
          "misconception_token": "used-last-term-only"
        },
        {
          "text": "127",
          "is_correct": false,
          "misconception_token": "forgot-first-term-factor"
        }
      ],
      "solution": "This is a geometric sum with $a_1 = 10$, $r = 2$, $n = 7$: $S_7 = \\frac{10(2^7 - 1)}{2 - 1} = 10 \\cdot 127 = 1270$."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "What is the sum of the first $5$ terms of the geometric sequence $16, 8, 4, \\dots$?",
      "choices": [
        {
          "text": "31",
          "is_correct": true
        },
        {
          "text": "30",
          "is_correct": false,
          "misconception_token": "dropped-last-term"
        },
        {
          "text": "15",
          "is_correct": false,
          "misconception_token": "dropped-first-term"
        },
        {
          "text": "62",
          "is_correct": false,
          "misconception_token": "doubled-the-sum"
        }
      ],
      "solution": "With $a_1 = 16$ and $r = \\frac{1}{2}$, the terms are $16, 8, 4, 2, 1$, so $S_5 = 16 + 8 + 4 + 2 + 1 = 31$."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "A ball is dropped from a height of $64$ feet, and each bounce reaches $\\frac{3}{4}$ of the previous height. How high, in feet, does the ball rise after the third bounce?",
      "choices": [
        {
          "text": "27",
          "is_correct": true
        },
        {
          "text": "36",
          "is_correct": false,
          "misconception_token": "used-second-bounce"
        },
        {
          "text": "48",
          "is_correct": false,
          "misconception_token": "used-first-bounce"
        },
        {
          "text": "20.25",
          "is_correct": false,
          "misconception_token": "used-fourth-bounce"
        }
      ],
      "solution": "The bounce heights form a geometric sequence: $64 \\cdot \\left(\\frac{3}{4}\\right)^3 = 64 \\cdot \\frac{27}{64} = 27$ feet."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "An auditorium has $15$ seats in the first row, and each row has $3$ more seats than the row before. How many seats are there in total across the first $20$ rows?",
      "choices": [
        {
          "text": "870",
          "is_correct": true
        },
        {
          "text": "900",
          "is_correct": false,
          "misconception_token": "used-n-not-n-minus-1"
        },
        {
          "text": "1740",
          "is_correct": false,
          "misconception_token": "forgot-to-halve"
        },
        {
          "text": "720",
          "is_correct": false,
          "misconception_token": "dropped-first-term"
        }
      ],
      "solution": "The last row has $a_{20} = 15 + 19(3) = 72$ seats, so $S_{20} = \\frac{20}{2}(15 + 72) = 10 \\cdot 87 = 870$."
    }
  ],
}

const RATIONAL_FUNCTIONS: GapMathSkill = {
  slug: "rational-functions",
  name: "Rational Functions",
  subject: 'math',
  ccssGrade: "12",
  ccssGradeNum: 12,
  ccssCode: "CCSS.MATH.CONTENT.HSF.IF.C.7",
  satAlignment: "advanced-math",
  gradeBand: "9-12",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "For the function $f(x) = \\frac{x+2}{x-3}$, which value of $x$ is excluded from the domain?",
      "choices": [
        {
          "text": "$x = 3$",
          "is_correct": true
        },
        {
          "text": "$x = -3$",
          "is_correct": false,
          "misconception_token": "opposite-sign-on-denominator"
        },
        {
          "text": "$x = -2$",
          "is_correct": false,
          "misconception_token": "used-numerator-zero"
        },
        {
          "text": "$x = 2$",
          "is_correct": false,
          "misconception_token": "opposite-sign-on-numerator"
        }
      ],
      "solution": "The denominator is zero when $x - 3 = 0$, so $x = 3$ is excluded from the domain."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "What is the vertical asymptote of $f(x) = \\frac{1}{x-5}$?",
      "choices": [
        {
          "text": "$x = 5$",
          "is_correct": true
        },
        {
          "text": "$x = -5$",
          "is_correct": false,
          "misconception_token": "opposite-sign"
        },
        {
          "text": "$x = 1$",
          "is_correct": false,
          "misconception_token": "used-numerator"
        },
        {
          "text": "$y = 0$",
          "is_correct": false,
          "misconception_token": "gave-horizontal-asymptote"
        }
      ],
      "solution": "Set the denominator equal to zero: $x - 5 = 0$ gives the vertical asymptote $x = 5$."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "Which value of $x$ is not in the domain of $f(x) = \\frac{x-1}{x+4}$?",
      "choices": [
        {
          "text": "$x = -4$",
          "is_correct": true
        },
        {
          "text": "$x = 4$",
          "is_correct": false,
          "misconception_token": "opposite-sign"
        },
        {
          "text": "$x = 1$",
          "is_correct": false,
          "misconception_token": "used-numerator-zero"
        },
        {
          "text": "$x = -1$",
          "is_correct": false,
          "misconception_token": "opposite-sign-on-numerator"
        }
      ],
      "solution": "The denominator is zero when $x + 4 = 0$, so $x = -4$ is not in the domain."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "What is the $x$-intercept of $f(x) = \\frac{x-6}{x+2}$?",
      "choices": [
        {
          "text": "$x = 6$",
          "is_correct": true
        },
        {
          "text": "$x = -6$",
          "is_correct": false,
          "misconception_token": "opposite-sign"
        },
        {
          "text": "$x = -2$",
          "is_correct": false,
          "misconception_token": "used-denominator-zero"
        },
        {
          "text": "$x = 2$",
          "is_correct": false,
          "misconception_token": "opposite-sign-on-denominator"
        }
      ],
      "solution": "An x-intercept occurs where the numerator is zero: $x - 6 = 0$, so $x = 6$."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "What is the horizontal asymptote of $f(x) = \\frac{2x+1}{x-4}$?",
      "choices": [
        {
          "text": "$y = 2$",
          "is_correct": true
        },
        {
          "text": "$y = 0$",
          "is_correct": false,
          "misconception_token": "assumed-numerator-smaller-degree"
        },
        {
          "text": "$y = \\frac{1}{2}$",
          "is_correct": false,
          "misconception_token": "inverted-coefficient-ratio"
        },
        {
          "text": "$y = 4$",
          "is_correct": false,
          "misconception_token": "used-denominator-constant"
        }
      ],
      "solution": "The numerator and denominator both have degree 1, so the horizontal asymptote is the ratio of leading coefficients: $y = \\frac{2}{1} = 2$."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "What is the horizontal asymptote of $f(x) = \\frac{3}{x+7}$?",
      "choices": [
        {
          "text": "$y = 0$",
          "is_correct": true
        },
        {
          "text": "$y = 3$",
          "is_correct": false,
          "misconception_token": "used-numerator-constant"
        },
        {
          "text": "$y = -7$",
          "is_correct": false,
          "misconception_token": "used-vertical-asymptote"
        },
        {
          "text": "$y = 7$",
          "is_correct": false,
          "misconception_token": "used-denominator-constant"
        }
      ],
      "solution": "The numerator's degree (0) is less than the denominator's degree (1), so the horizontal asymptote is $y = 0$."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "What is the vertical asymptote of $f(x) = \\frac{x-1}{x+8}$?",
      "choices": [
        {
          "text": "$x = -8$",
          "is_correct": true
        },
        {
          "text": "$x = 8$",
          "is_correct": false,
          "misconception_token": "opposite-sign"
        },
        {
          "text": "$x = 1$",
          "is_correct": false,
          "misconception_token": "used-numerator-zero"
        },
        {
          "text": "$x = -1$",
          "is_correct": false,
          "misconception_token": "opposite-sign-on-numerator"
        }
      ],
      "solution": "Set the denominator equal to zero: $x + 8 = 0$ gives the vertical asymptote $x = -8$."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "What is the zero of $f(x) = \\frac{2x-10}{x+3}$?",
      "choices": [
        {
          "text": "$x = 5$",
          "is_correct": true
        },
        {
          "text": "$x = 10$",
          "is_correct": false,
          "misconception_token": "forgot-to-divide-by-coefficient"
        },
        {
          "text": "$x = -3$",
          "is_correct": false,
          "misconception_token": "used-denominator-zero"
        },
        {
          "text": "$x = -5$",
          "is_correct": false,
          "misconception_token": "opposite-sign"
        }
      ],
      "solution": "Set the numerator to zero: $2x - 10 = 0$, so $2x = 10$ and $x = 5$."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "The graph of $f(x) = \\frac{x^2-4}{x-2}$ has a hole. At which $x$-value does the hole occur?",
      "choices": [
        {
          "text": "$x = 2$",
          "is_correct": true
        },
        {
          "text": "$x = -2$",
          "is_correct": false,
          "misconception_token": "picked-other-root"
        },
        {
          "text": "$x = 4$",
          "is_correct": false,
          "misconception_token": "used-square-not-root"
        },
        {
          "text": "$x = 0$",
          "is_correct": false,
          "misconception_token": "used-y-intercept"
        }
      ],
      "solution": "Factor the numerator: $\\frac{(x-2)(x+2)}{x-2}$. The common factor $x-2$ cancels, so the hole is at $x = 2$."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "For $x \\neq 1$, which expression is $f(x) = \\frac{x^2-1}{x-1}$ in simplest form?",
      "choices": [
        {
          "text": "$x + 1$",
          "is_correct": true
        },
        {
          "text": "$x - 1$",
          "is_correct": false,
          "misconception_token": "kept-denominator-factor"
        },
        {
          "text": "$x$",
          "is_correct": false,
          "misconception_token": "canceled-constants-only"
        },
        {
          "text": "$x^2 - 1$",
          "is_correct": false,
          "misconception_token": "did-not-factor"
        }
      ],
      "solution": "Factor the numerator: $\\frac{(x-1)(x+1)}{x-1}$. Canceling $x-1$ gives $x + 1$."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "What are the vertical asymptotes of $f(x) = \\frac{x+1}{x^2-9}$?",
      "choices": [
        {
          "text": "$x = 3$ and $x = -3$",
          "is_correct": true
        },
        {
          "text": "$x = 9$ and $x = -9$",
          "is_correct": false,
          "misconception_token": "did-not-square-root"
        },
        {
          "text": "$x = 3$",
          "is_correct": false,
          "misconception_token": "found-only-one-root"
        },
        {
          "text": "$x = -1$",
          "is_correct": false,
          "misconception_token": "used-numerator-zero"
        }
      ],
      "solution": "Set the denominator to zero: $x^2 - 9 = (x-3)(x+3) = 0$, giving $x = 3$ and $x = -3$."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "Which statement best describes the horizontal asymptote of $f(x) = \\frac{x^2+1}{x-2}$?",
      "choices": [
        {
          "text": "There is no horizontal asymptote.",
          "is_correct": true
        },
        {
          "text": "$y = 0$",
          "is_correct": false,
          "misconception_token": "assumed-y-equals-zero"
        },
        {
          "text": "$y = 1$",
          "is_correct": false,
          "misconception_token": "used-leading-coefficients-of-unequal-degrees"
        },
        {
          "text": "$y = 2$",
          "is_correct": false,
          "misconception_token": "used-denominator-constant"
        }
      ],
      "solution": "The numerator's degree (2) is greater than the denominator's degree (1), so there is no horizontal asymptote."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "Which values of $x$ are excluded from the domain of $f(x) = \\frac{x+5}{x^2-x-6}$?",
      "choices": [
        {
          "text": "$x = 3$ and $x = -2$",
          "is_correct": true
        },
        {
          "text": "$x = -3$ and $x = 2$",
          "is_correct": false,
          "misconception_token": "sign-error-on-both-roots"
        },
        {
          "text": "$x = 6$ and $x = -1$",
          "is_correct": false,
          "misconception_token": "used-coefficients-not-roots"
        },
        {
          "text": "$x = -5$",
          "is_correct": false,
          "misconception_token": "used-numerator-zero"
        }
      ],
      "solution": "Factor the denominator: $x^2 - x - 6 = (x-3)(x+2)$, which is zero at $x = 3$ and $x = -2$."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "What is the vertical asymptote of $f(x) = \\frac{(x-2)(x+3)}{(x-2)(x-5)}$?",
      "choices": [
        {
          "text": "$x = 5$",
          "is_correct": true
        },
        {
          "text": "$x = 2$",
          "is_correct": false,
          "misconception_token": "used-canceled-factor-as-asymptote"
        },
        {
          "text": "$x = -3$",
          "is_correct": false,
          "misconception_token": "used-numerator-factor"
        },
        {
          "text": "$x = -5$",
          "is_correct": false,
          "misconception_token": "opposite-sign"
        }
      ],
      "solution": "The factor $x-2$ cancels, creating a hole. The remaining denominator factor gives the vertical asymptote $x - 5 = 0$, so $x = 5$."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "A company's average cost per item is $C(x) = \\frac{500 + 2x}{x}$ dollars, where $x$ is the number of items produced. As $x$ grows very large, the average cost approaches what value?",
      "choices": [
        {
          "text": "2 dollars",
          "is_correct": true
        },
        {
          "text": "0 dollars",
          "is_correct": false,
          "misconception_token": "assumed-approaches-zero"
        },
        {
          "text": "500 dollars",
          "is_correct": false,
          "misconception_token": "used-fixed-cost"
        },
        {
          "text": "502 dollars",
          "is_correct": false,
          "misconception_token": "added-all-constants"
        }
      ],
      "solution": "As $x \\to \\infty$, $\\frac{500+2x}{x}$ approaches the ratio of leading coefficients $\\frac{2}{1} = 2$, so the average cost approaches 2 dollars."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "The concentration of a drug is modeled by $C(t) = \\frac{5t}{t+10}$, where $t$ is time in hours. As $t$ increases without bound, the concentration approaches what value?",
      "choices": [
        {
          "text": "$5$",
          "is_correct": true
        },
        {
          "text": "$0$",
          "is_correct": false,
          "misconception_token": "assumed-approaches-zero"
        },
        {
          "text": "$10$",
          "is_correct": false,
          "misconception_token": "used-denominator-constant"
        },
        {
          "text": "$\\frac{1}{2}$",
          "is_correct": false,
          "misconception_token": "divided-numerator-coefficient-by-constant"
        }
      ],
      "solution": "For large $t$, the degrees are equal, so $\\frac{5t}{t+10}$ approaches the ratio of leading coefficients $\\frac{5}{1} = 5$."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "The graph of $f(x) = \\frac{x^2-4}{x^2-3x+2}$ has a hole. What are the coordinates of the hole?",
      "choices": [
        {
          "text": "$(2, 4)$",
          "is_correct": true
        },
        {
          "text": "$(2, 0)$",
          "is_correct": false,
          "misconception_token": "assumed-hole-on-x-axis"
        },
        {
          "text": "$(-2, 0)$",
          "is_correct": false,
          "misconception_token": "used-other-numerator-root"
        },
        {
          "text": "$(1, 0)$",
          "is_correct": false,
          "misconception_token": "used-vertical-asymptote-x-value"
        }
      ],
      "solution": "Factor: $\\frac{(x-2)(x+2)}{(x-1)(x-2)}$; cancel $x-2$ to get $\\frac{x+2}{x-1}$. The hole is at $x = 2$, where $\\frac{2+2}{2-1} = 4$, so the hole is at $(2, 4)$."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "An engineer models a signal with $g(x) = \\frac{x^2-5x+6}{x^2-4}$. At which $x$-value does the graph have a vertical asymptote rather than a hole?",
      "choices": [
        {
          "text": "$x = -2$",
          "is_correct": true
        },
        {
          "text": "$x = 2$",
          "is_correct": false,
          "misconception_token": "chose-the-hole"
        },
        {
          "text": "$x = 3$",
          "is_correct": false,
          "misconception_token": "used-numerator-root"
        },
        {
          "text": "$x = 4$",
          "is_correct": false,
          "misconception_token": "did-not-square-root-denominator"
        }
      ],
      "solution": "Factor: $\\frac{(x-2)(x-3)}{(x-2)(x+2)}$. The $x-2$ cancels, giving a hole at $x=2$. The remaining factor $x+2 = 0$ gives the vertical asymptote $x = -2$."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "What is the horizontal asymptote of $f(x) = \\frac{3x^2+2}{6x^2-x}$?",
      "choices": [
        {
          "text": "$y = \\frac{1}{2}$",
          "is_correct": true
        },
        {
          "text": "$y = 2$",
          "is_correct": false,
          "misconception_token": "inverted-coefficient-ratio"
        },
        {
          "text": "$y = 0$",
          "is_correct": false,
          "misconception_token": "assumed-approaches-zero"
        },
        {
          "text": "$y = 3$",
          "is_correct": false,
          "misconception_token": "used-numerator-leading-coefficient-only"
        }
      ],
      "solution": "Both numerator and denominator have degree 2, so the horizontal asymptote is the ratio of leading coefficients: $y = \\frac{3}{6} = \\frac{1}{2}$."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "Which expression is $f(x) = \\frac{2x^2-2}{x^2+2x-3}$ in fully simplified form?",
      "choices": [
        {
          "text": "$\\frac{2(x+1)}{x+3}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{2(x-1)}{x+3}$",
          "is_correct": false,
          "misconception_token": "canceled-wrong-numerator-factor"
        },
        {
          "text": "$\\frac{2(x+1)}{x-3}$",
          "is_correct": false,
          "misconception_token": "sign-error-in-denominator-factor"
        },
        {
          "text": "$\\frac{x+1}{x+3}$",
          "is_correct": false,
          "misconception_token": "dropped-numerator-coefficient"
        }
      ],
      "solution": "Factor: $\\frac{2(x-1)(x+1)}{(x+3)(x-1)}$; cancel $x-1$ to get $\\frac{2(x+1)}{x+3}$."
    }
  ],
}

const CONIC_SECTIONS: GapMathSkill = {
  slug: "conic-sections",
  name: "Conic Sections",
  subject: 'math',
  ccssGrade: "12",
  ccssGradeNum: 12,
  ccssCode: "CCSS.MATH.CONTENT.HSG.GPE.A.1",
  satAlignment: "advanced-math",
  gradeBand: "9-12",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "The equation of a circle is $(x-3)^2 + (y+2)^2 = 25$. What is the center of the circle?",
      "choices": [
        {
          "text": "$(3, -2)$",
          "is_correct": true
        },
        {
          "text": "$(-3, 2)$",
          "is_correct": false,
          "misconception_token": "negated-both-coordinates"
        },
        {
          "text": "$(3, 2)$",
          "is_correct": false,
          "misconception_token": "kept-sign-of-y"
        },
        {
          "text": "$(-3, -2)$",
          "is_correct": false,
          "misconception_token": "kept-sign-of-x"
        }
      ],
      "solution": "In $(x-h)^2 + (y-k)^2 = r^2$ the center is $(h, k)$; here $h = 3$ and $k = -2$, so the center is $(3, -2)$."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "For the circle $(x-1)^2 + (y-4)^2 = 49$, what is the radius?",
      "choices": [
        {
          "text": "$7$",
          "is_correct": true
        },
        {
          "text": "$49$",
          "is_correct": false,
          "misconception_token": "used-r-squared-as-radius"
        },
        {
          "text": "$14$",
          "is_correct": false,
          "misconception_token": "used-diameter"
        },
        {
          "text": "$24.5$",
          "is_correct": false,
          "misconception_token": "halved-r-squared"
        }
      ],
      "solution": "The right side equals $r^2$, so $r = \\sqrt{49} = 7$."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "What is the radius of the circle $(x+5)^2 + (y-2)^2 = 36$?",
      "choices": [
        {
          "text": "$6$",
          "is_correct": true
        },
        {
          "text": "$36$",
          "is_correct": false,
          "misconception_token": "used-r-squared-as-radius"
        },
        {
          "text": "$12$",
          "is_correct": false,
          "misconception_token": "used-diameter"
        },
        {
          "text": "$18$",
          "is_correct": false,
          "misconception_token": "halved-r-squared"
        }
      ],
      "solution": "$r^2 = 36$, so $r = \\sqrt{36} = 6$."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "What is the center of the circle $(x+7)^2 + (y+1)^2 = 16$?",
      "choices": [
        {
          "text": "$(-7, -1)$",
          "is_correct": true
        },
        {
          "text": "$(7, 1)$",
          "is_correct": false,
          "misconception_token": "negated-both-coordinates"
        },
        {
          "text": "$(7, -1)$",
          "is_correct": false,
          "misconception_token": "kept-sign-of-x"
        },
        {
          "text": "$(-7, 1)$",
          "is_correct": false,
          "misconception_token": "kept-sign-of-y"
        }
      ],
      "solution": "Write it as $(x-(-7))^2 + (y-(-1))^2 = 16$; the center $(h, k)$ is $(-7, -1)$."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "The parabola $y = (x-4)^2 + 3$ is written in vertex form. What is its vertex?",
      "choices": [
        {
          "text": "$(4, 3)$",
          "is_correct": true
        },
        {
          "text": "$(-4, 3)$",
          "is_correct": false,
          "misconception_token": "negated-x-of-vertex"
        },
        {
          "text": "$(4, -3)$",
          "is_correct": false,
          "misconception_token": "negated-y-of-vertex"
        },
        {
          "text": "$(-4, -3)$",
          "is_correct": false,
          "misconception_token": "negated-both-coordinates"
        }
      ],
      "solution": "In $y = (x-h)^2 + k$ the vertex is $(h, k)$; here $h = 4$ and $k = 3$, so the vertex is $(4, 3)$."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "In which direction does the parabola $y = -2(x-1)^2 + 5$ open?",
      "choices": [
        {
          "text": "Downward",
          "is_correct": true
        },
        {
          "text": "Upward",
          "is_correct": false,
          "misconception_token": "ignored-negative-leading-coefficient"
        },
        {
          "text": "To the right",
          "is_correct": false,
          "misconception_token": "treated-as-horizontal-parabola-right"
        },
        {
          "text": "To the left",
          "is_correct": false,
          "misconception_token": "treated-as-horizontal-parabola-left"
        }
      ],
      "solution": "For $y = a(x-h)^2 + k$ the parabola opens up when $a > 0$ and down when $a < 0$; since $a = -2 < 0$, it opens downward."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "Which type of conic section is represented by $x^2 + y^2 = 9$?",
      "choices": [
        {
          "text": "Circle",
          "is_correct": true
        },
        {
          "text": "Ellipse",
          "is_correct": false,
          "misconception_token": "mistook-equal-coefficients-for-ellipse"
        },
        {
          "text": "Parabola",
          "is_correct": false,
          "misconception_token": "ignored-second-squared-term"
        },
        {
          "text": "Hyperbola",
          "is_correct": false,
          "misconception_token": "assumed-difference-of-squares"
        }
      ],
      "solution": "Both variables are squared with equal positive coefficients and the same sign, matching $x^2 + y^2 = r^2$, a circle with $r = 3$."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "What is the center of the ellipse $\\frac{(x-2)^2}{9} + \\frac{(y-5)^2}{4} = 1$?",
      "choices": [
        {
          "text": "$(2, 5)$",
          "is_correct": true
        },
        {
          "text": "$(-2, -5)$",
          "is_correct": false,
          "misconception_token": "negated-both-coordinates"
        },
        {
          "text": "$(-2, 5)$",
          "is_correct": false,
          "misconception_token": "negated-x-of-center"
        },
        {
          "text": "$(2, -5)$",
          "is_correct": false,
          "misconception_token": "negated-y-of-center"
        }
      ],
      "solution": "In $\\frac{(x-h)^2}{a^2} + \\frac{(y-k)^2}{b^2} = 1$ the center is $(h, k) = (2, 5)$."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "A circle has center $(-3, 4)$ and radius $5$. Which equation represents this circle?",
      "choices": [
        {
          "text": "$(x+3)^2 + (y-4)^2 = 25$",
          "is_correct": true
        },
        {
          "text": "$(x-3)^2 + (y+4)^2 = 25$",
          "is_correct": false,
          "misconception_token": "negated-center-signs"
        },
        {
          "text": "$(x+3)^2 + (y-4)^2 = 5$",
          "is_correct": false,
          "misconception_token": "forgot-to-square-radius"
        },
        {
          "text": "$(x+3)^2 + (y-4)^2 = 10$",
          "is_correct": false,
          "misconception_token": "doubled-radius-instead-of-squaring"
        }
      ],
      "solution": "Standard form is $(x-h)^2 + (y-k)^2 = r^2$ with $h = -3$, $k = 4$, $r = 5$, giving $(x+3)^2 + (y-4)^2 = 25$."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "Complete the square to find the center of the circle $x^2 + y^2 - 6x + 8y + 9 = 0$.",
      "choices": [
        {
          "text": "$(3, -4)$",
          "is_correct": true
        },
        {
          "text": "$(-3, 4)$",
          "is_correct": false,
          "misconception_token": "negated-completed-square-values"
        },
        {
          "text": "$(6, -8)$",
          "is_correct": false,
          "misconception_token": "used-full-linear-coefficients"
        },
        {
          "text": "$(3, 4)$",
          "is_correct": false,
          "misconception_token": "wrong-sign-on-y"
        }
      ],
      "solution": "Grouping gives $(x-3)^2 + (y+4)^2 = -9 + 9 + 16 = 16$, so the center is $(3, -4)$."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "Find the radius of the circle $x^2 + y^2 + 4x - 2y - 11 = 0$.",
      "choices": [
        {
          "text": "$4$",
          "is_correct": true
        },
        {
          "text": "$16$",
          "is_correct": false,
          "misconception_token": "used-r-squared-as-radius"
        },
        {
          "text": "$8$",
          "is_correct": false,
          "misconception_token": "used-diameter"
        },
        {
          "text": "$11$",
          "is_correct": false,
          "misconception_token": "used-constant-term"
        }
      ],
      "solution": "Completing the square gives $(x+2)^2 + (y-1)^2 = 11 + 4 + 1 = 16$, so $r = \\sqrt{16} = 4$."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "What are the vertices of the ellipse $\\frac{x^2}{25} + \\frac{y^2}{9} = 1$?",
      "choices": [
        {
          "text": "$(5, 0)$ and $(-5, 0)$",
          "is_correct": true
        },
        {
          "text": "$(0, 5)$ and $(0, -5)$",
          "is_correct": false,
          "misconception_token": "used-wrong-axis"
        },
        {
          "text": "$(3, 0)$ and $(-3, 0)$",
          "is_correct": false,
          "misconception_token": "used-minor-axis-value"
        },
        {
          "text": "$(25, 0)$ and $(-25, 0)$",
          "is_correct": false,
          "misconception_token": "forgot-to-take-square-root"
        }
      ],
      "solution": "The larger denominator $25$ is under $x^2$, so $a = 5$ along the x-axis and the vertices are $(\\pm 5, 0)$."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "A circular garden is centered at $(5, -2)$ on a map and has a radius of $4$ units. Which equation represents its boundary?",
      "choices": [
        {
          "text": "$(x-5)^2 + (y+2)^2 = 16$",
          "is_correct": true
        },
        {
          "text": "$(x+5)^2 + (y-2)^2 = 16$",
          "is_correct": false,
          "misconception_token": "negated-center-signs"
        },
        {
          "text": "$(x-5)^2 + (y+2)^2 = 4$",
          "is_correct": false,
          "misconception_token": "forgot-to-square-radius"
        },
        {
          "text": "$(x-5)^2 + (y+2)^2 = 8$",
          "is_correct": false,
          "misconception_token": "doubled-radius-instead-of-squaring"
        }
      ],
      "solution": "With center $(5, -2)$ and $r = 4$, standard form gives $(x-5)^2 + (y+2)^2 = 4^2 = 16$."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "The parabola $y = 3(x+2)^2 - 7$ opens upward. What is its minimum value?",
      "choices": [
        {
          "text": "$-7$",
          "is_correct": true
        },
        {
          "text": "$7$",
          "is_correct": false,
          "misconception_token": "negated-minimum-value"
        },
        {
          "text": "$-2$",
          "is_correct": false,
          "misconception_token": "used-x-coordinate-of-vertex"
        },
        {
          "text": "$3$",
          "is_correct": false,
          "misconception_token": "used-leading-coefficient"
        }
      ],
      "solution": "The vertex of $y = a(x-h)^2 + k$ is $(h, k)$; since it opens upward, the minimum value is $k = -7$."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "Which type of conic section is represented by $4x^2 + 9y^2 = 36$?",
      "choices": [
        {
          "text": "Ellipse",
          "is_correct": true
        },
        {
          "text": "Circle",
          "is_correct": false,
          "misconception_token": "assumed-both-squares-mean-circle"
        },
        {
          "text": "Parabola",
          "is_correct": false,
          "misconception_token": "ignored-one-squared-term"
        },
        {
          "text": "Hyperbola",
          "is_correct": false,
          "misconception_token": "assumed-difference-of-squares"
        }
      ],
      "solution": "Dividing by $36$ gives $\\frac{x^2}{9} + \\frac{y^2}{4} = 1$; two squared terms with unequal positive coefficients and the same sign form an ellipse."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "What are the vertices of the ellipse $\\frac{(x-4)^2}{4} + \\frac{(y-1)^2}{25} = 1$?",
      "choices": [
        {
          "text": "$(4, 6)$ and $(4, -4)$",
          "is_correct": true
        },
        {
          "text": "$(9, 1)$ and $(-1, 1)$",
          "is_correct": false,
          "misconception_token": "used-wrong-axis"
        },
        {
          "text": "$(4, 3)$ and $(4, -1)$",
          "is_correct": false,
          "misconception_token": "used-minor-axis-value"
        },
        {
          "text": "$(0, 5)$ and $(0, -5)$",
          "is_correct": false,
          "misconception_token": "ignored-center-translation"
        }
      ],
      "solution": "The larger denominator $25$ is under $(y-1)^2$, so the major axis is vertical with $a = 5$; from center $(4, 1)$ the vertices are $(4, 1 \\pm 5) = (4, 6)$ and $(4, -4)$."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "Find the radius of the circle $2x^2 + 2y^2 - 8x + 12y - 6 = 0$.",
      "choices": [
        {
          "text": "$4$",
          "is_correct": true
        },
        {
          "text": "$16$",
          "is_correct": false,
          "misconception_token": "used-r-squared-as-radius"
        },
        {
          "text": "$2$",
          "is_correct": false,
          "misconception_token": "used-leading-coefficient"
        },
        {
          "text": "$8$",
          "is_correct": false,
          "misconception_token": "used-diameter"
        }
      ],
      "solution": "Divide by $2$ to get $x^2 + y^2 - 4x + 6y - 3 = 0$, then $(x-2)^2 + (y+3)^2 = 3 + 4 + 9 = 16$, so $r = \\sqrt{16} = 4$."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "An elliptical track is modeled by $\\frac{x^2}{144} + \\frac{y^2}{81} = 1$, with distances in meters. What is the length of the major axis?",
      "choices": [
        {
          "text": "$24$",
          "is_correct": true
        },
        {
          "text": "$12$",
          "is_correct": false,
          "misconception_token": "used-semi-major-axis"
        },
        {
          "text": "$18$",
          "is_correct": false,
          "misconception_token": "used-minor-axis-length"
        },
        {
          "text": "$144$",
          "is_correct": false,
          "misconception_token": "used-a-squared"
        }
      ],
      "solution": "The larger denominator gives $a^2 = 144$, so $a = 12$; the major axis length is $2a = 24$ meters."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "A ball's height in feet is $h = -16(t-2)^2 + 64$, where $t$ is time in seconds. What is the maximum height of the ball?",
      "choices": [
        {
          "text": "$64$",
          "is_correct": true
        },
        {
          "text": "$-64$",
          "is_correct": false,
          "misconception_token": "negated-maximum-value"
        },
        {
          "text": "$2$",
          "is_correct": false,
          "misconception_token": "used-time-coordinate"
        },
        {
          "text": "$48$",
          "is_correct": false,
          "misconception_token": "subtracted-coefficient-from-vertex"
        }
      ],
      "solution": "In vertex form $h = a(t-h_0)^2 + k$ with $a = -16 < 0$ the parabola opens downward, so the maximum height is the vertex value $k = 64$ feet."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "Which type of conic section is represented by $x^2 + 4y^2 - 2x + 8y + 1 = 0$?",
      "choices": [
        {
          "text": "Ellipse",
          "is_correct": true
        },
        {
          "text": "Circle",
          "is_correct": false,
          "misconception_token": "assumed-both-squares-mean-circle"
        },
        {
          "text": "Parabola",
          "is_correct": false,
          "misconception_token": "thought-only-one-variable-squared"
        },
        {
          "text": "Hyperbola",
          "is_correct": false,
          "misconception_token": "assumed-difference-of-squares"
        }
      ],
      "solution": "Both variables are squared with positive unequal coefficients ($1$ and $4$); completing the square gives $(x-1)^2 + 4(y+1)^2 = 4$, a real ellipse."
    }
  ],
}

const COMBINATORICS_PROBABILITY: GapMathSkill = {
  slug: "combinatorics-probability",
  name: "Combinatorics & Probability",
  subject: 'math',
  ccssGrade: "12",
  ccssGradeNum: 12,
  ccssCode: "CCSS.MATH.CONTENT.HSS.CP.B.9",
  satAlignment: "problem-solving-data-analysis",
  gradeBand: "9-12",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "What is the value of $5!$?",
      "choices": [
        {
          "text": "120",
          "is_correct": true
        },
        {
          "text": "25",
          "is_correct": false,
          "misconception_token": "squared-the-number"
        },
        {
          "text": "20",
          "is_correct": false,
          "misconception_token": "multiplied-first-two-only"
        },
        {
          "text": "15",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        }
      ],
      "solution": "A factorial multiplies all positive integers down to 1: $5! = 5 \\times 4 \\times 3 \\times 2 \\times 1 = 120$."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "A diner offers $4$ appetizers, $3$ entrees, and $2$ desserts. How many different three-course meals are possible?",
      "choices": [
        {
          "text": "24",
          "is_correct": true
        },
        {
          "text": "9",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        },
        {
          "text": "12",
          "is_correct": false,
          "misconception_token": "dropped-a-factor"
        },
        {
          "text": "6",
          "is_correct": false,
          "misconception_token": "used-two-factors-only"
        }
      ],
      "solution": "By the fundamental counting principle, multiply the choices: $4 \\times 3 \\times 2 = 24$."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "Evaluate $_5P_2$.",
      "choices": [
        {
          "text": "20",
          "is_correct": true
        },
        {
          "text": "10",
          "is_correct": false,
          "misconception_token": "computed-combination-instead"
        },
        {
          "text": "25",
          "is_correct": false,
          "misconception_token": "squared-n"
        },
        {
          "text": "7",
          "is_correct": false,
          "misconception_token": "added-n-and-r"
        }
      ],
      "solution": "A permutation of $2$ from $5$ is $_5P_2 = 5 \\times 4 = 20$."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "Evaluate $_6C_2$.",
      "choices": [
        {
          "text": "15",
          "is_correct": true
        },
        {
          "text": "30",
          "is_correct": false,
          "misconception_token": "computed-permutation-instead"
        },
        {
          "text": "12",
          "is_correct": false,
          "misconception_token": "multiplied-n-and-r"
        },
        {
          "text": "8",
          "is_correct": false,
          "misconception_token": "added-n-and-r"
        }
      ],
      "solution": "A combination of $2$ from $6$ is $_6C_2 = \\frac{6 \\times 5}{2 \\times 1} = 15$."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "A fair six-sided die is rolled once. What is the probability of rolling a $4$?",
      "choices": [
        {
          "text": "$\\frac{1}{6}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{4}{6}$",
          "is_correct": false,
          "misconception_token": "used-face-value-as-count"
        },
        {
          "text": "$\\frac{1}{2}$",
          "is_correct": false,
          "misconception_token": "guessed-half"
        },
        {
          "text": "$\\frac{5}{6}$",
          "is_correct": false,
          "misconception_token": "took-complement"
        }
      ],
      "solution": "There is $1$ favorable outcome out of $6$ equally likely outcomes, so the probability is $\\frac{1}{6}$."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "A single card is drawn from a standard deck of $52$ cards. What is the probability that it is a heart?",
      "choices": [
        {
          "text": "$\\frac{1}{4}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{1}{13}$",
          "is_correct": false,
          "misconception_token": "used-ranks-as-denominator"
        },
        {
          "text": "$\\frac{1}{52}$",
          "is_correct": false,
          "misconception_token": "counted-one-card"
        },
        {
          "text": "$\\frac{1}{2}$",
          "is_correct": false,
          "misconception_token": "guessed-half"
        }
      ],
      "solution": "There are $13$ hearts among $52$ cards, so the probability is $\\frac{13}{52} = \\frac{1}{4}$."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "A fair coin is flipped twice. What is the probability of getting heads both times?",
      "choices": [
        {
          "text": "$\\frac{1}{4}$",
          "is_correct": true
        },
        {
          "text": "$1$",
          "is_correct": false,
          "misconception_token": "added-probabilities"
        },
        {
          "text": "$\\frac{1}{3}$",
          "is_correct": false,
          "misconception_token": "miscounted-outcomes"
        },
        {
          "text": "$\\frac{1}{2}$",
          "is_correct": false,
          "misconception_token": "used-one-flip-only"
        }
      ],
      "solution": "The flips are independent, so $\\frac{1}{2} \\times \\frac{1}{2} = \\frac{1}{4}$."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "A fair six-sided die is rolled once. What is the probability of rolling a $2$ or a $5$?",
      "choices": [
        {
          "text": "$\\frac{1}{3}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{1}{36}$",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-added"
        },
        {
          "text": "$\\frac{1}{6}$",
          "is_correct": false,
          "misconception_token": "counted-one-outcome"
        },
        {
          "text": "$\\frac{2}{5}$",
          "is_correct": false,
          "misconception_token": "used-wrong-total"
        }
      ],
      "solution": "The events are mutually exclusive, so add: $\\frac{1}{6} + \\frac{1}{6} = \\frac{2}{6} = \\frac{1}{3}$."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "How many different ways can the letters of the word MATH be arranged?",
      "choices": [
        {
          "text": "24",
          "is_correct": true
        },
        {
          "text": "12",
          "is_correct": false,
          "misconception_token": "used-two-positions-only"
        },
        {
          "text": "16",
          "is_correct": false,
          "misconception_token": "squared-the-count"
        },
        {
          "text": "256",
          "is_correct": false,
          "misconception_token": "used-n-to-the-n"
        }
      ],
      "solution": "There are $4$ distinct letters, so the number of arrangements is $4! = 24$."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "A committee of $3$ people is selected from a group of $10$. How many different committees are possible?",
      "choices": [
        {
          "text": "120",
          "is_correct": true
        },
        {
          "text": "720",
          "is_correct": false,
          "misconception_token": "used-permutation-order-matters"
        },
        {
          "text": "30",
          "is_correct": false,
          "misconception_token": "multiplied-n-and-r"
        },
        {
          "text": "1000",
          "is_correct": false,
          "misconception_token": "cubed-n"
        }
      ],
      "solution": "Order does not matter for a committee, so $_{10}C_3 = \\frac{10 \\times 9 \\times 8}{3 \\times 2 \\times 1} = 120$."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "A president, a vice-president, and a treasurer are chosen from $8$ club members, with no one holding two offices. In how many ways can this be done?",
      "choices": [
        {
          "text": "336",
          "is_correct": true
        },
        {
          "text": "56",
          "is_correct": false,
          "misconception_token": "used-combination-ignored-order"
        },
        {
          "text": "24",
          "is_correct": false,
          "misconception_token": "multiplied-n-and-r"
        },
        {
          "text": "512",
          "is_correct": false,
          "misconception_token": "cubed-n"
        }
      ],
      "solution": "The offices are distinct, so order matters: $_8P_3 = 8 \\times 7 \\times 6 = 336$."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "How many distinct arrangements are there of the letters in the word BANANA?",
      "choices": [
        {
          "text": "60",
          "is_correct": true
        },
        {
          "text": "720",
          "is_correct": false,
          "misconception_token": "treated-all-letters-distinct"
        },
        {
          "text": "360",
          "is_correct": false,
          "misconception_token": "divided-by-one-repeat-only"
        },
        {
          "text": "120",
          "is_correct": false,
          "misconception_token": "divided-by-other-repeat-only"
        }
      ],
      "solution": "BANANA has $6$ letters with A repeated $3$ times and N repeated $2$ times: $\\frac{6!}{3! \\, 2!} = \\frac{720}{12} = 60$."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "A fair coin is flipped and a fair six-sided die is rolled. What is the probability of getting heads and a $3$?",
      "choices": [
        {
          "text": "$\\frac{1}{12}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{1}{2}$",
          "is_correct": false,
          "misconception_token": "ignored-the-die"
        },
        {
          "text": "$\\frac{1}{6}$",
          "is_correct": false,
          "misconception_token": "ignored-the-coin"
        },
        {
          "text": "$\\frac{2}{3}$",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        }
      ],
      "solution": "The events are independent, so multiply: $\\frac{1}{2} \\times \\frac{1}{6} = \\frac{1}{12}$."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "One card is drawn from a standard deck of $52$ cards. What is the probability that it is a king or a queen?",
      "choices": [
        {
          "text": "$\\frac{2}{13}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{1}{13}$",
          "is_correct": false,
          "misconception_token": "counted-one-rank-only"
        },
        {
          "text": "$\\frac{1}{169}$",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-added"
        },
        {
          "text": "$\\frac{8}{13}$",
          "is_correct": false,
          "misconception_token": "used-wrong-denominator"
        }
      ],
      "solution": "There are $4$ kings and $4$ queens, and these are mutually exclusive: $\\frac{4}{52} + \\frac{4}{52} = \\frac{8}{52} = \\frac{2}{13}$."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "A team must include $2$ boys chosen from $5$ boys and $2$ girls chosen from $4$ girls. How many such teams are possible?",
      "choices": [
        {
          "text": "60",
          "is_correct": true
        },
        {
          "text": "16",
          "is_correct": false,
          "misconception_token": "added-the-two-counts"
        },
        {
          "text": "126",
          "is_correct": false,
          "misconception_token": "pooled-ignored-split"
        },
        {
          "text": "20",
          "is_correct": false,
          "misconception_token": "multiplied-raw-numbers"
        }
      ],
      "solution": "Choose the boys and girls separately, then multiply: $_5C_2 \\times _4C_2 = 10 \\times 6 = 60$."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "A committee of $3$ is chosen at random from $4$ women and $5$ men. What is the probability that all $3$ chosen are women?",
      "choices": [
        {
          "text": "$\\frac{1}{21}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{4}{9}$",
          "is_correct": false,
          "misconception_token": "used-simple-ratio"
        },
        {
          "text": "$\\frac{1}{84}$",
          "is_correct": false,
          "misconception_token": "forgot-to-count-selections"
        },
        {
          "text": "$\\frac{1}{3}$",
          "is_correct": false,
          "misconception_token": "used-size-over-total"
        }
      ],
      "solution": "There are $_4C_3 = 4$ all-women committees out of $_9C_3 = 84$ total, so the probability is $\\frac{4}{84} = \\frac{1}{21}$."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "In how many ways can $5$ people be seated in a row if $2$ particular people must sit next to each other?",
      "choices": [
        {
          "text": "48",
          "is_correct": true
        },
        {
          "text": "120",
          "is_correct": false,
          "misconception_token": "ignored-the-restriction"
        },
        {
          "text": "24",
          "is_correct": false,
          "misconception_token": "forgot-to-swap-the-pair"
        },
        {
          "text": "240",
          "is_correct": false,
          "misconception_token": "double-counted-the-block"
        }
      ],
      "solution": "Treat the pair as one block, giving $4!$ arrangements, and the pair can be ordered $2$ ways: $2 \\times 4! = 2 \\times 24 = 48$."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "A fair coin is flipped $3$ times. What is the probability of getting at least one head?",
      "choices": [
        {
          "text": "$\\frac{7}{8}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{1}{8}$",
          "is_correct": false,
          "misconception_token": "found-probability-of-no-heads"
        },
        {
          "text": "$\\frac{3}{8}$",
          "is_correct": false,
          "misconception_token": "used-exactly-one-head"
        },
        {
          "text": "$\\frac{1}{2}$",
          "is_correct": false,
          "misconception_token": "guessed-half"
        }
      ],
      "solution": "Use the complement: $P(\\text{at least one head}) = 1 - \\left(\\frac{1}{2}\\right)^3 = 1 - \\frac{1}{8} = \\frac{7}{8}$."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "Two cards are drawn without replacement from a standard deck of $52$ cards. What is the probability that both are hearts?",
      "choices": [
        {
          "text": "$\\frac{1}{17}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{1}{16}$",
          "is_correct": false,
          "misconception_token": "assumed-replacement"
        },
        {
          "text": "$\\frac{1}{4}$",
          "is_correct": false,
          "misconception_token": "used-one-draw-only"
        },
        {
          "text": "$\\frac{4}{17}$",
          "is_correct": false,
          "misconception_token": "used-second-draw-only"
        }
      ],
      "solution": "The draws are dependent: $\\frac{13}{52} \\times \\frac{12}{51} = \\frac{1}{4} \\times \\frac{4}{17} = \\frac{1}{17}$."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "In a lottery you choose $5$ different numbers from $1$ to $20$. What is the probability of matching all $5$ winning numbers?",
      "choices": [
        {
          "text": "$\\frac{1}{15504}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{1}{1860480}$",
          "is_correct": false,
          "misconception_token": "used-permutation-order-matters"
        },
        {
          "text": "$\\frac{1}{4}$",
          "is_correct": false,
          "misconception_token": "used-simple-ratio"
        },
        {
          "text": "$\\frac{1}{3200000}$",
          "is_correct": false,
          "misconception_token": "allowed-repeats"
        }
      ],
      "solution": "Order does not matter, so there are $_{20}C_5 = 15504$ equally likely tickets and only one wins: $\\frac{1}{15504}$."
    }
  ],
}

export const GRADE_9_10_12_MATH_SKILLS: GapMathSkill[] = [
  LINEAR_EQUATIONS,
  LINEAR_INEQUALITIES,
  GRAPHING_LINEAR_FUNCTIONS,
  SYSTEMS_LINEAR,
  EXPONENT_RULES,
  DATA_STATISTICS,
  GEOMETRY_PROOFS,
  TRIANGLE_CONGRUENCE,
  SIMILARITY_RIGHT_TRIANGLES,
  CIRCLE_GEOMETRY,
  COORDINATE_GEOMETRY,
  TRIGONOMETRIC_FUNCTIONS,
  SEQUENCES_SERIES,
  RATIONAL_FUNCTIONS,
  CONIC_SECTIONS,
  COMBINATORICS_PROBABILITY,
]
