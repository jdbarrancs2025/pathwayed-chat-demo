/**
 * Grade 5 & 6 math (top-up toward the grade-3 shape) — CURATED POOL (11 skills, 20 items each), same shape
 * and served path as gapMathTemplates.ts. Generated from reviewed authored JSON;
 * every answer key is verified in the morning review before the seed is run.
 */
import type { GapMathSkill } from '@/lib/gapMathTemplates'

const DECIMAL_PLACE_VALUE: GapMathSkill = {
  slug: "decimal-place-value",
  name: "Decimal Place Value",
  subject: 'math',
  ccssGrade: "5",
  ccssGradeNum: 5,
  ccssCode: "CCSS.MATH.CONTENT.5.NBT.A.3",
  satAlignment: "problem-solving-data-analysis",
  gradeBand: "3-5",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "In the number $2.463$, what is the value of the digit $4$?",
      "choices": [
        {
          "text": "$0.4$",
          "is_correct": true
        },
        {
          "text": "$0.04$",
          "is_correct": false,
          "misconception_token": "read-as-hundredths"
        },
        {
          "text": "$4$",
          "is_correct": false,
          "misconception_token": "ignored-place-value"
        },
        {
          "text": "$0.004$",
          "is_correct": false,
          "misconception_token": "read-as-thousandths"
        }
      ],
      "solution": "The digit $4$ is in the tenths place, so its value is $4 \\times 0.1 = 0.4$."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "How do you read the decimal $0.35$?",
      "choices": [
        {
          "text": "Thirty-five hundredths",
          "is_correct": true
        },
        {
          "text": "Thirty-five tenths",
          "is_correct": false,
          "misconception_token": "read-as-tenths"
        },
        {
          "text": "Thirty-five thousandths",
          "is_correct": false,
          "misconception_token": "read-as-thousandths"
        },
        {
          "text": "Three hundred five",
          "is_correct": false,
          "misconception_token": "misread-digits"
        }
      ],
      "solution": "In $0.35$ the last digit is in the hundredths place, so it is read \"thirty-five hundredths.\""
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "Which number is equal to six and seven tenths?",
      "choices": [
        {
          "text": "$6.7$",
          "is_correct": true
        },
        {
          "text": "$6.07$",
          "is_correct": false,
          "misconception_token": "wrote-tenths-as-hundredths"
        },
        {
          "text": "$0.67$",
          "is_correct": false,
          "misconception_token": "misplaced-decimal"
        },
        {
          "text": "$67$",
          "is_correct": false,
          "misconception_token": "ignored-decimal"
        }
      ],
      "solution": "Six and seven tenths is $6 + 0.7 = 6.7$."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "Which statement is true?",
      "choices": [
        {
          "text": "$0.6 = 0.60$",
          "is_correct": true
        },
        {
          "text": "$0.6 < 0.60$",
          "is_correct": false,
          "misconception_token": "thinks-fewer-digits-smaller"
        },
        {
          "text": "$0.6 > 0.60$",
          "is_correct": false,
          "misconception_token": "thinks-fewer-digits-larger"
        },
        {
          "text": "$0.06 = 0.6$",
          "is_correct": false,
          "misconception_token": "ignored-place-value"
        }
      ],
      "solution": "Adding a trailing zero does not change a decimal's value, so $0.6 = 0.60$."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "Which of these decimals is the greatest?",
      "choices": [
        {
          "text": "$0.5$",
          "is_correct": true
        },
        {
          "text": "$0.45$",
          "is_correct": false,
          "misconception_token": "compared-digits-ignoring-place"
        },
        {
          "text": "$0.409$",
          "is_correct": false,
          "misconception_token": "longer-is-larger"
        },
        {
          "text": "$0.051$",
          "is_correct": false,
          "misconception_token": "ignored-leading-place"
        }
      ],
      "solution": "Aligning place values, $0.500 > 0.450 > 0.409 > 0.051$, so $0.5$ is greatest."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "Round $3.47$ to the nearest tenth.",
      "choices": [
        {
          "text": "$3.5$",
          "is_correct": true
        },
        {
          "text": "$3.4$",
          "is_correct": false,
          "misconception_token": "rounded-down-instead"
        },
        {
          "text": "$3.47$",
          "is_correct": false,
          "misconception_token": "did-not-round"
        },
        {
          "text": "$4$",
          "is_correct": false,
          "misconception_token": "rounded-to-whole"
        }
      ],
      "solution": "The hundredths digit is $7$, which is $\\geq 5$, so round the tenths up: $3.47 \\approx 3.5$."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "Round $6.2$ to the nearest whole number.",
      "choices": [
        {
          "text": "$6$",
          "is_correct": true
        },
        {
          "text": "$7$",
          "is_correct": false,
          "misconception_token": "rounded-up-instead"
        },
        {
          "text": "$6.2$",
          "is_correct": false,
          "misconception_token": "did-not-round"
        },
        {
          "text": "$6.5$",
          "is_correct": false,
          "misconception_token": "rounded-to-half"
        }
      ],
      "solution": "The tenths digit is $2$, which is $< 5$, so round down: $6.2 \\approx 6$."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "Which expanded form is equal to $0.24$?",
      "choices": [
        {
          "text": "$0.2 + 0.04$",
          "is_correct": true
        },
        {
          "text": "$0.2 + 0.4$",
          "is_correct": false,
          "misconception_token": "wrong-hundredths-place"
        },
        {
          "text": "$2 + 4$",
          "is_correct": false,
          "misconception_token": "ignored-decimal-places"
        },
        {
          "text": "$0.02 + 0.004$",
          "is_correct": false,
          "misconception_token": "shifted-places-right"
        }
      ],
      "solution": "The value $0.24$ is two tenths and four hundredths, so $0.24 = 0.2 + 0.04$."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "In $0.66$, how does the value of the $6$ in the tenths place compare to the value of the $6$ in the hundredths place?",
      "choices": [
        {
          "text": "It is $10$ times as great.",
          "is_correct": true
        },
        {
          "text": "It is $\\frac{1}{10}$ as great.",
          "is_correct": false,
          "misconception_token": "reversed-the-relationship"
        },
        {
          "text": "It is $100$ times as great.",
          "is_correct": false,
          "misconception_token": "used-100-instead-of-10"
        },
        {
          "text": "It is the same value.",
          "is_correct": false,
          "misconception_token": "thinks-places-equal"
        }
      ],
      "solution": "A digit is $10$ times the value of the same digit one place to its right, so the tenths $6$ is $10$ times the hundredths $6$."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "Which decimal represents nine and fifty-three thousandths?",
      "choices": [
        {
          "text": "$9.053$",
          "is_correct": true
        },
        {
          "text": "$9.53$",
          "is_correct": false,
          "misconception_token": "fifty-three-as-hundredths"
        },
        {
          "text": "$9.0053$",
          "is_correct": false,
          "misconception_token": "over-shifted-place"
        },
        {
          "text": "$9.530$",
          "is_correct": false,
          "misconception_token": "appended-trailing-zero"
        }
      ],
      "solution": "Thousandths is the third decimal place; $53$ thousandths is $0.053$, so the number is $9.053$."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "Which comparison is correct?",
      "choices": [
        {
          "text": "$0.125 < 0.13$",
          "is_correct": true
        },
        {
          "text": "$0.125 > 0.13$",
          "is_correct": false,
          "misconception_token": "more-digits-larger"
        },
        {
          "text": "$0.4 < 0.375$",
          "is_correct": false,
          "misconception_token": "longer-is-larger"
        },
        {
          "text": "$0.09 > 0.1$",
          "is_correct": false,
          "misconception_token": "ignored-place-value"
        }
      ],
      "solution": "Writing $0.13$ as $0.130$, we compare $125$ and $130$; since $125 < 130$, $0.125 < 0.13$."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "Round $5.837$ to the nearest hundredth.",
      "choices": [
        {
          "text": "$5.84$",
          "is_correct": true
        },
        {
          "text": "$5.83$",
          "is_correct": false,
          "misconception_token": "truncated-instead-of-rounding"
        },
        {
          "text": "$5.8$",
          "is_correct": false,
          "misconception_token": "rounded-to-tenth"
        },
        {
          "text": "$5.85$",
          "is_correct": false,
          "misconception_token": "over-rounded"
        }
      ],
      "solution": "The thousandths digit is $7$, which is $\\geq 5$, so round the hundredths up: $5.837 \\approx 5.84$."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "Which expanded form is equal to $0.507$?",
      "choices": [
        {
          "text": "$0.5 + 0.007$",
          "is_correct": true
        },
        {
          "text": "$0.5 + 0.07$",
          "is_correct": false,
          "misconception_token": "seven-in-hundredths"
        },
        {
          "text": "$0.5 + 0.7$",
          "is_correct": false,
          "misconception_token": "seven-in-tenths"
        },
        {
          "text": "$0.05 + 0.007$",
          "is_correct": false,
          "misconception_token": "five-in-hundredths"
        }
      ],
      "solution": "The value $0.507$ is five tenths, zero hundredths, and seven thousandths, so $0.507 = 0.5 + 0.007$."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "What number is equal to $3 + 0.4 + 0.06 + 0.002$?",
      "choices": [
        {
          "text": "$3.462$",
          "is_correct": true
        },
        {
          "text": "$3.46$",
          "is_correct": false,
          "misconception_token": "dropped-thousandths"
        },
        {
          "text": "$3.4062$",
          "is_correct": false,
          "misconception_token": "misaligned-places"
        },
        {
          "text": "$34.62$",
          "is_correct": false,
          "misconception_token": "ignored-decimal"
        }
      ],
      "solution": "Combining the place values, $3 + 0.4 + 0.06 + 0.002 = 3.462$."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "A runner's time was $12.08$ seconds. Written in words, this time is:",
      "choices": [
        {
          "text": "twelve and eight hundredths",
          "is_correct": true
        },
        {
          "text": "twelve and eight tenths",
          "is_correct": false,
          "misconception_token": "read-as-tenths"
        },
        {
          "text": "twelve and eight thousandths",
          "is_correct": false,
          "misconception_token": "read-as-thousandths"
        },
        {
          "text": "twelve and eighty hundredths",
          "is_correct": false,
          "misconception_token": "misread-zero"
        }
      ],
      "solution": "In $12.08$ the digit $8$ is in the hundredths place, so it is \"twelve and eight hundredths.\""
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "Three ribbons measure $0.8$ m, $0.75$ m, and $0.709$ m. Which ribbon is the longest?",
      "choices": [
        {
          "text": "The $0.8$ m ribbon",
          "is_correct": true
        },
        {
          "text": "The $0.75$ m ribbon",
          "is_correct": false,
          "misconception_token": "most-digits-longest"
        },
        {
          "text": "The $0.709$ m ribbon",
          "is_correct": false,
          "misconception_token": "longer-decimal-larger"
        },
        {
          "text": "They are all equal",
          "is_correct": false,
          "misconception_token": "thinks-all-equal"
        }
      ],
      "solution": "Aligning places, $0.800 > 0.750 > 0.709$, so the $0.8$ m ribbon is longest."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "A scientist measures a sample at $4.0863$ grams and rounds it to the nearest hundredth of a gram. What is the rounded mass?",
      "choices": [
        {
          "text": "$4.09$ grams",
          "is_correct": true
        },
        {
          "text": "$4.08$ grams",
          "is_correct": false,
          "misconception_token": "truncated-instead-of-rounding"
        },
        {
          "text": "$4.10$ grams",
          "is_correct": false,
          "misconception_token": "over-carried-rounding"
        },
        {
          "text": "$4.087$ grams",
          "is_correct": false,
          "misconception_token": "rounded-to-thousandth"
        }
      ],
      "solution": "The thousandths digit is $6$, which is $\\geq 5$, so the hundredths digit $8$ rounds up to $9$: $4.0863 \\approx 4.09$."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "In the number $7.077$, the digit $7$ appears in the ones place and in the thousandths place. How many times as great is the value of the $7$ in the ones place as the value of the $7$ in the thousandths place?",
      "choices": [
        {
          "text": "$1000$ times",
          "is_correct": true
        },
        {
          "text": "$100$ times",
          "is_correct": false,
          "misconception_token": "counted-two-place-jumps"
        },
        {
          "text": "$10$ times",
          "is_correct": false,
          "misconception_token": "counted-one-place-jump"
        },
        {
          "text": "$3$ times",
          "is_correct": false,
          "misconception_token": "counted-digit-positions"
        }
      ],
      "solution": "The ones place is three places left of the thousandths place, and each place is $10$ times the next, so $10 \\times 10 \\times 10 = 1000$ times as great."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "Which number is equal to $(2 \\times 1) + (6 \\times \\frac{1}{100}) + (3 \\times \\frac{1}{1000})$?",
      "choices": [
        {
          "text": "$2.063$",
          "is_correct": true
        },
        {
          "text": "$2.63$",
          "is_correct": false,
          "misconception_token": "dropped-zero-placeholder"
        },
        {
          "text": "$20.063$",
          "is_correct": false,
          "misconception_token": "misread-ones-as-tens"
        },
        {
          "text": "$2.0603$",
          "is_correct": false,
          "misconception_token": "misplaced-thousandths"
        }
      ],
      "solution": "This equals $2 + 0.06 + 0.003 = 2.063$; the tenths place is $0$ as a placeholder."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "Four students recorded these distances in kilometers: $3.4$, $3.399$, $3.41$, and $3.04$. Ordered from greatest to least, which list is correct?",
      "choices": [
        {
          "text": "$3.41, 3.4, 3.399, 3.04$",
          "is_correct": true
        },
        {
          "text": "$3.399, 3.41, 3.4, 3.04$",
          "is_correct": false,
          "misconception_token": "longer-decimal-first"
        },
        {
          "text": "$3.04, 3.399, 3.4, 3.41$",
          "is_correct": false,
          "misconception_token": "ordered-least-to-greatest"
        },
        {
          "text": "$3.4, 3.41, 3.399, 3.04$",
          "is_correct": false,
          "misconception_token": "fewer-digits-larger"
        }
      ],
      "solution": "Aligning places, $3.410 > 3.400 > 3.399 > 3.040$, so greatest to least is $3.41, 3.4, 3.399, 3.04$."
    }
  ],
}

const DECIMAL_OPERATIONS: GapMathSkill = {
  slug: "decimal-operations",
  name: "Decimal Operations",
  subject: 'math',
  ccssGrade: "5",
  ccssGradeNum: 5,
  ccssCode: "CCSS.MATH.CONTENT.5.NBT.B.7",
  satAlignment: "problem-solving-data-analysis",
  gradeBand: "3-5",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "What is $0.6 + 0.3$?",
      "choices": [
        {
          "text": "0.9",
          "is_correct": true
        },
        {
          "text": "0.3",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-added"
        },
        {
          "text": "0.18",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-added"
        },
        {
          "text": "0.09",
          "is_correct": false,
          "misconception_token": "misplaced-decimal"
        }
      ],
      "solution": "Add the tenths: $0.6 + 0.3 = 0.9$."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "What is $0.8 - 0.5$?",
      "choices": [
        {
          "text": "0.3",
          "is_correct": true
        },
        {
          "text": "1.3",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracted"
        },
        {
          "text": "0.4",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-subtracted"
        },
        {
          "text": "0.03",
          "is_correct": false,
          "misconception_token": "misplaced-decimal"
        }
      ],
      "solution": "Subtract the tenths: $0.8 - 0.5 = 0.3$."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "What is $0.45 + 0.24$?",
      "choices": [
        {
          "text": "0.69",
          "is_correct": true
        },
        {
          "text": "0.21",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-added"
        },
        {
          "text": "0.108",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-added"
        },
        {
          "text": "6.9",
          "is_correct": false,
          "misconception_token": "misplaced-decimal"
        }
      ],
      "solution": "Line up the decimals and add: $0.45 + 0.24 = 0.69$."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "What is $0.72 - 0.31$?",
      "choices": [
        {
          "text": "0.41",
          "is_correct": true
        },
        {
          "text": "1.03",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracted"
        },
        {
          "text": "0.2232",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-subtracted"
        },
        {
          "text": "4.1",
          "is_correct": false,
          "misconception_token": "misplaced-decimal"
        }
      ],
      "solution": "Line up the decimals and subtract: $0.72 - 0.31 = 0.41$."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "What is $0.4 \\times 3$?",
      "choices": [
        {
          "text": "1.2",
          "is_correct": true
        },
        {
          "text": "12",
          "is_correct": false,
          "misconception_token": "dropped-decimal-point"
        },
        {
          "text": "0.12",
          "is_correct": false,
          "misconception_token": "too-many-decimal-places"
        },
        {
          "text": "3.4",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        }
      ],
      "solution": "Multiply $4 \\times 3 = 12$, then place one decimal digit: $0.4 \\times 3 = 1.2$."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "What is $0.8 \\div 4$?",
      "choices": [
        {
          "text": "0.2",
          "is_correct": true
        },
        {
          "text": "2",
          "is_correct": false,
          "misconception_token": "misplaced-decimal"
        },
        {
          "text": "3.2",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-divided"
        },
        {
          "text": "0.4",
          "is_correct": false,
          "misconception_token": "used-wrong-divisor"
        }
      ],
      "solution": "Divide $8 \\div 4 = 2$, keeping one decimal digit: $0.8 \\div 4 = 0.2$."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "What is $0.5 + 0.25$?",
      "choices": [
        {
          "text": "0.75",
          "is_correct": true
        },
        {
          "text": "0.3",
          "is_correct": false,
          "misconception_token": "misaligned-place-value"
        },
        {
          "text": "0.125",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-added"
        },
        {
          "text": "0.25",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-added"
        }
      ],
      "solution": "Write $0.5$ as $0.50$ and add: $0.50 + 0.25 = 0.75$."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "A pencil costs 0.40 dollars and an eraser costs 0.35 dollars. How much do they cost together?",
      "choices": [
        {
          "text": "0.75",
          "is_correct": true
        },
        {
          "text": "0.05",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-added"
        },
        {
          "text": "0.14",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-added"
        },
        {
          "text": "7.5",
          "is_correct": false,
          "misconception_token": "misplaced-decimal"
        }
      ],
      "solution": "Add the two prices: $0.40 + 0.35 = 0.75$, so they cost 0.75 dollars together."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "What is $3.6 + 2.75$?",
      "choices": [
        {
          "text": "6.35",
          "is_correct": true
        },
        {
          "text": "0.85",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-added"
        },
        {
          "text": "9.9",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-added"
        },
        {
          "text": "5.81",
          "is_correct": false,
          "misconception_token": "misaligned-place-value"
        }
      ],
      "solution": "Write $3.6$ as $3.60$ and add: $3.60 + 2.75 = 6.35$."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "What is $5.4 - 2.85$?",
      "choices": [
        {
          "text": "2.55",
          "is_correct": true
        },
        {
          "text": "8.25",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracted"
        },
        {
          "text": "15.39",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-subtracted"
        },
        {
          "text": "3.45",
          "is_correct": false,
          "misconception_token": "subtract-smaller-from-larger"
        }
      ],
      "solution": "Write $5.4$ as $5.40$ and subtract with regrouping: $5.40 - 2.85 = 2.55$."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "What is $0.6 \\times 0.4$?",
      "choices": [
        {
          "text": "0.24",
          "is_correct": true
        },
        {
          "text": "2.4",
          "is_correct": false,
          "misconception_token": "too-few-decimal-places"
        },
        {
          "text": "1.0",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        },
        {
          "text": "0.024",
          "is_correct": false,
          "misconception_token": "too-many-decimal-places"
        }
      ],
      "solution": "Multiply $6 \\times 4 = 24$, then place two decimal digits: $0.6 \\times 0.4 = 0.24$."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "What is $1.2 \\times 0.5$?",
      "choices": [
        {
          "text": "0.6",
          "is_correct": true
        },
        {
          "text": "6",
          "is_correct": false,
          "misconception_token": "dropped-decimal-point"
        },
        {
          "text": "0.06",
          "is_correct": false,
          "misconception_token": "too-many-decimal-places"
        },
        {
          "text": "1.7",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        }
      ],
      "solution": "Multiply $12 \\times 5 = 60$, then place two decimal digits: $1.2 \\times 0.5 = 0.6$."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "What is $4.5 \\div 5$?",
      "choices": [
        {
          "text": "0.9",
          "is_correct": true
        },
        {
          "text": "9",
          "is_correct": false,
          "misconception_token": "misplaced-decimal"
        },
        {
          "text": "0.09",
          "is_correct": false,
          "misconception_token": "too-many-decimal-places"
        },
        {
          "text": "22.5",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-divided"
        }
      ],
      "solution": "Divide $45 \\div 5 = 9$, keeping one decimal digit: $4.5 \\div 5 = 0.9$."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "Maria buys 3 notebooks that each cost 1.25 dollars. How much does she spend in all?",
      "choices": [
        {
          "text": "3.75",
          "is_correct": true
        },
        {
          "text": "4.25",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        },
        {
          "text": "0.375",
          "is_correct": false,
          "misconception_token": "misplaced-decimal"
        },
        {
          "text": "3.6",
          "is_correct": false,
          "misconception_token": "dropped-hundredths"
        }
      ],
      "solution": "Multiply the price by the count: $3 \\times 1.25 = 3.75$, so she spends 3.75 dollars."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "A ribbon is 2.4 meters long. Jed cuts off 0.85 meters. How long is the ribbon now?",
      "choices": [
        {
          "text": "1.55",
          "is_correct": true
        },
        {
          "text": "3.25",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracted"
        },
        {
          "text": "2.04",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-subtracted"
        },
        {
          "text": "2.45",
          "is_correct": false,
          "misconception_token": "subtract-smaller-from-larger"
        }
      ],
      "solution": "Write $2.4$ as $2.40$ and subtract: $2.40 - 0.85 = 1.55$ meters."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "Ken pays for a 6.50 dollar lunch with a 10 dollar bill. How much change should he get?",
      "choices": [
        {
          "text": "3.50",
          "is_correct": true
        },
        {
          "text": "16.50",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracted"
        },
        {
          "text": "4.50",
          "is_correct": false,
          "misconception_token": "subtract-smaller-from-larger"
        },
        {
          "text": "65",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-subtracted"
        }
      ],
      "solution": "Write $10$ as $10.00$ and subtract: $10.00 - 6.50 = 3.50$, so his change is 3.50 dollars."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "What is $12.5 \\times 0.4$?",
      "choices": [
        {
          "text": "5",
          "is_correct": true
        },
        {
          "text": "50",
          "is_correct": false,
          "misconception_token": "dropped-decimal-point"
        },
        {
          "text": "0.5",
          "is_correct": false,
          "misconception_token": "too-many-decimal-places"
        },
        {
          "text": "12.9",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        }
      ],
      "solution": "Multiply $125 \\times 4 = 500$, then place two decimal digits: $12.5 \\times 0.4 = 5.00 = 5$."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "A store sells apples for 0.75 dollars each. Dana buys 4 apples and pays with a 5 dollar bill. How much change should she get?",
      "choices": [
        {
          "text": "2.00",
          "is_correct": true
        },
        {
          "text": "3.00",
          "is_correct": false,
          "misconception_token": "gave-total-cost-not-change"
        },
        {
          "text": "4.25",
          "is_correct": false,
          "misconception_token": "subtracted-one-item-only"
        },
        {
          "text": "8.00",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracted"
        }
      ],
      "solution": "The apples cost $4 \\times 0.75 = 3.00$, so the change is $5 - 3.00 = 2.00$ dollars."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "A rope 7.5 meters long is cut into 6 equal pieces. How long is each piece?",
      "choices": [
        {
          "text": "1.25",
          "is_correct": true
        },
        {
          "text": "45",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-divided"
        },
        {
          "text": "12.5",
          "is_correct": false,
          "misconception_token": "misplaced-decimal"
        },
        {
          "text": "1.5",
          "is_correct": false,
          "misconception_token": "used-wrong-divisor"
        }
      ],
      "solution": "Divide the length by the number of pieces: $7.5 \\div 6 = 1.25$ meters each."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "Liam has 20 dollars. He buys a book for 8.75 dollars and a pen for 2.40 dollars. How much money does he have left?",
      "choices": [
        {
          "text": "8.85",
          "is_correct": true
        },
        {
          "text": "11.15",
          "is_correct": false,
          "misconception_token": "gave-total-spent-not-remaining"
        },
        {
          "text": "31.15",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracted"
        },
        {
          "text": "8.95",
          "is_correct": false,
          "misconception_token": "addition-error-in-subtotal"
        }
      ],
      "solution": "He spends $8.75 + 2.40 = 11.15$, so he has $20 - 11.15 = 8.85$ dollars left."
    }
  ],
}

const MULTIPLY_DIVIDE_WHOLE_5: GapMathSkill = {
  slug: "multiply-divide-whole-5",
  name: "Multiply & Divide Whole Numbers",
  subject: 'math',
  ccssGrade: "5",
  ccssGradeNum: 5,
  ccssCode: "CCSS.MATH.CONTENT.5.NBT.B.5",
  satAlignment: "problem-solving-data-analysis",
  gradeBand: "3-5",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "What is $23 \\times 14$?",
      "choices": [
        {
          "text": "322",
          "is_correct": true
        },
        {
          "text": "92",
          "is_correct": false,
          "misconception_token": "multiplied-only-by-ones"
        },
        {
          "text": "230",
          "is_correct": false,
          "misconception_token": "multiplied-only-by-tens"
        },
        {
          "text": "312",
          "is_correct": false,
          "misconception_token": "carry-error"
        }
      ],
      "solution": "$23 \\times 14 = (23 \\times 10) + (23 \\times 4) = 230 + 92 = 322$."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "What is $246 \\times 3$?",
      "choices": [
        {
          "text": "738",
          "is_correct": true
        },
        {
          "text": "628",
          "is_correct": false,
          "misconception_token": "dropped-all-carries"
        },
        {
          "text": "249",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        },
        {
          "text": "7380",
          "is_correct": false,
          "misconception_token": "appended-extra-zero"
        }
      ],
      "solution": "$246 \\times 3$: ones $6 \\times 3 = 18$ (write 8, carry 1), tens $4 \\times 3 = 12 + 1 = 13$ (write 3, carry 1), hundreds $2 \\times 3 = 6 + 1 = 7$, giving 738."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "What is $84 \\div 12$?",
      "choices": [
        {
          "text": "7",
          "is_correct": true
        },
        {
          "text": "6",
          "is_correct": false,
          "misconception_token": "off-by-one-low"
        },
        {
          "text": "8",
          "is_correct": false,
          "misconception_token": "off-by-one-high"
        },
        {
          "text": "72",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-divided"
        }
      ],
      "solution": "$12 \\times 7 = 84$, so $84 \\div 12 = 7$."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "What is $120 \\times 30$?",
      "choices": [
        {
          "text": "3600",
          "is_correct": true
        },
        {
          "text": "360",
          "is_correct": false,
          "misconception_token": "dropped-a-zero"
        },
        {
          "text": "36000",
          "is_correct": false,
          "misconception_token": "added-extra-zero"
        },
        {
          "text": "150",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        }
      ],
      "solution": "$12 \\times 3 = 36$, then attach the two zeros from 120 and 30: $120 \\times 30 = 3600$."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "What is $50 \\div 15$? Give the quotient and remainder.",
      "choices": [
        {
          "text": "3 R5",
          "is_correct": true
        },
        {
          "text": "3 R0",
          "is_correct": false,
          "misconception_token": "ignored-remainder"
        },
        {
          "text": "2 R20",
          "is_correct": false,
          "misconception_token": "remainder-larger-than-divisor"
        },
        {
          "text": "5 R3",
          "is_correct": false,
          "misconception_token": "swapped-quotient-and-remainder"
        }
      ],
      "solution": "$15 \\times 3 = 45$ and $50 - 45 = 5$, and $5 < 15$, so $50 \\div 15 = 3$ remainder $5$."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "What is $45 \\times 12$?",
      "choices": [
        {
          "text": "540",
          "is_correct": true
        },
        {
          "text": "90",
          "is_correct": false,
          "misconception_token": "multiplied-only-by-ones"
        },
        {
          "text": "450",
          "is_correct": false,
          "misconception_token": "multiplied-only-by-tens"
        },
        {
          "text": "490",
          "is_correct": false,
          "misconception_token": "missing-partial-product"
        }
      ],
      "solution": "$45 \\times 12 = (45 \\times 10) + (45 \\times 2) = 450 + 90 = 540$."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "A theater has 18 rows with 24 seats in each row. How many seats are there in all?",
      "choices": [
        {
          "text": "432",
          "is_correct": true
        },
        {
          "text": "42",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        },
        {
          "text": "360",
          "is_correct": false,
          "misconception_token": "multiplied-only-by-tens"
        },
        {
          "text": "72",
          "is_correct": false,
          "misconception_token": "multiplied-only-by-ones"
        }
      ],
      "solution": "$18 \\times 24 = (18 \\times 20) + (18 \\times 4) = 360 + 72 = 432$ seats."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "What is $144 \\div 12$?",
      "choices": [
        {
          "text": "12",
          "is_correct": true
        },
        {
          "text": "11",
          "is_correct": false,
          "misconception_token": "off-by-one-low"
        },
        {
          "text": "13",
          "is_correct": false,
          "misconception_token": "off-by-one-high"
        },
        {
          "text": "132",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-divided"
        }
      ],
      "solution": "$12 \\times 12 = 144$, so $144 \\div 12 = 12$."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "What is $326 \\times 14$?",
      "choices": [
        {
          "text": "4564",
          "is_correct": true
        },
        {
          "text": "1304",
          "is_correct": false,
          "misconception_token": "multiplied-only-by-ones"
        },
        {
          "text": "3260",
          "is_correct": false,
          "misconception_token": "multiplied-only-by-tens"
        },
        {
          "text": "1630",
          "is_correct": false,
          "misconception_token": "did-not-shift-partial-product"
        }
      ],
      "solution": "$326 \\times 14 = (326 \\times 10) + (326 \\times 4) = 3260 + 1304 = 4564$."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "What is $408 \\times 25$?",
      "choices": [
        {
          "text": "10200",
          "is_correct": true
        },
        {
          "text": "2040",
          "is_correct": false,
          "misconception_token": "multiplied-only-by-ones"
        },
        {
          "text": "8160",
          "is_correct": false,
          "misconception_token": "multiplied-only-by-tens"
        },
        {
          "text": "10000",
          "is_correct": false,
          "misconception_token": "ignored-ones-digit"
        }
      ],
      "solution": "$408 \\times 25 = (400 \\times 25) + (8 \\times 25) = 10000 + 200 = 10200$."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "What is $1348 \\div 24$? Give the quotient and remainder.",
      "choices": [
        {
          "text": "56 R4",
          "is_correct": true
        },
        {
          "text": "56 R0",
          "is_correct": false,
          "misconception_token": "ignored-remainder"
        },
        {
          "text": "55 R28",
          "is_correct": false,
          "misconception_token": "remainder-larger-than-divisor"
        },
        {
          "text": "56 R8",
          "is_correct": false,
          "misconception_token": "subtraction-error"
        }
      ],
      "solution": "$24 \\times 56 = 1344$ and $1348 - 1344 = 4$, and $4 < 24$, so $1348 \\div 24 = 56$ remainder $4$."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "A factory produces 156 toys each hour. How many toys does it produce in 24 hours?",
      "choices": [
        {
          "text": "3744",
          "is_correct": true
        },
        {
          "text": "180",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        },
        {
          "text": "624",
          "is_correct": false,
          "misconception_token": "multiplied-only-by-ones"
        },
        {
          "text": "3120",
          "is_correct": false,
          "misconception_token": "multiplied-only-by-tens"
        }
      ],
      "solution": "$156 \\times 24 = (156 \\times 20) + (156 \\times 4) = 3120 + 624 = 3744$ toys."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "A school has 1250 students to seat in buses that hold 48 students each. How many buses are completely full, and how many students are left over?",
      "choices": [
        {
          "text": "26 full, 2 left over",
          "is_correct": true
        },
        {
          "text": "26 full, 0 left over",
          "is_correct": false,
          "misconception_token": "ignored-remainder"
        },
        {
          "text": "25 full, 50 left over",
          "is_correct": false,
          "misconception_token": "remainder-larger-than-divisor"
        },
        {
          "text": "26 full, 12 left over",
          "is_correct": false,
          "misconception_token": "subtraction-error"
        }
      ],
      "solution": "$48 \\times 26 = 1248$ and $1250 - 1248 = 2$, so 26 buses are full with 2 students left over."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "What is $234 \\times 56$?",
      "choices": [
        {
          "text": "13104",
          "is_correct": true
        },
        {
          "text": "1404",
          "is_correct": false,
          "misconception_token": "multiplied-only-by-ones"
        },
        {
          "text": "11700",
          "is_correct": false,
          "misconception_token": "multiplied-only-by-tens"
        },
        {
          "text": "2574",
          "is_correct": false,
          "misconception_token": "did-not-shift-partial-product"
        }
      ],
      "solution": "$234 \\times 56 = (234 \\times 50) + (234 \\times 6) = 11700 + 1404 = 13104$."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "What is $3600 \\div 45$?",
      "choices": [
        {
          "text": "80",
          "is_correct": true
        },
        {
          "text": "8",
          "is_correct": false,
          "misconception_token": "dropped-a-zero"
        },
        {
          "text": "800",
          "is_correct": false,
          "misconception_token": "added-extra-zero"
        },
        {
          "text": "81",
          "is_correct": false,
          "misconception_token": "off-by-one-high"
        }
      ],
      "solution": "$45 \\times 80 = 3600$, so $3600 \\div 45 = 80$."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "A store received a shipment of 2016 water bottles packed into cases of 36 bottles each. How many cases are there?",
      "choices": [
        {
          "text": "56",
          "is_correct": true
        },
        {
          "text": "55 R36",
          "is_correct": false,
          "misconception_token": "remainder-larger-than-divisor"
        },
        {
          "text": "57",
          "is_correct": false,
          "misconception_token": "off-by-one-high"
        },
        {
          "text": "560",
          "is_correct": false,
          "misconception_token": "added-extra-zero"
        }
      ],
      "solution": "$36 \\times 56 = 2016$ exactly, so there are 56 cases with no bottles left over."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "A warehouse has 27 shelves. Each shelf holds 38 boxes, and each box contains 15 cans. How many cans are in the warehouse?",
      "choices": [
        {
          "text": "15390",
          "is_correct": true
        },
        {
          "text": "1026",
          "is_correct": false,
          "misconception_token": "stopped-at-boxes"
        },
        {
          "text": "80",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        },
        {
          "text": "15290",
          "is_correct": false,
          "misconception_token": "multiplication-error"
        }
      ],
      "solution": "Boxes $= 27 \\times 38 = 1026$; cans $= 1026 \\times 15 = 15390$."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "A charity collected 5000 dollars to share equally among 32 families. How many whole dollars does each family receive, and how many dollars are left over?",
      "choices": [
        {
          "text": "156 dollars each, 8 dollars left over",
          "is_correct": true
        },
        {
          "text": "156 dollars each, 0 dollars left over",
          "is_correct": false,
          "misconception_token": "ignored-remainder"
        },
        {
          "text": "155 dollars each, 40 dollars left over",
          "is_correct": false,
          "misconception_token": "remainder-larger-than-divisor"
        },
        {
          "text": "156 dollars each, 18 dollars left over",
          "is_correct": false,
          "misconception_token": "subtraction-error"
        }
      ],
      "solution": "$32 \\times 156 = 4992$ and $5000 - 4992 = 8$, so each family gets 156 dollars with 8 dollars left over."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "A school orders 24 boxes of pencils. Each box has 144 pencils. The pencils are shared equally among 18 classrooms. How many pencils does each classroom get?",
      "choices": [
        {
          "text": "192",
          "is_correct": true
        },
        {
          "text": "3456",
          "is_correct": false,
          "misconception_token": "forgot-to-divide"
        },
        {
          "text": "191",
          "is_correct": false,
          "misconception_token": "off-by-one-low"
        },
        {
          "text": "200",
          "is_correct": false,
          "misconception_token": "rounded-before-dividing"
        }
      ],
      "solution": "Total pencils $= 24 \\times 144 = 3456$; then $3456 \\div 18 = 192$ pencils per classroom."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "A publisher prints 8700 pages that must be bound into books. Each book uses 96 pages. How many complete books can be made, and how many pages are left over?",
      "choices": [
        {
          "text": "90 books, 60 pages left over",
          "is_correct": true
        },
        {
          "text": "90 books, 0 pages left over",
          "is_correct": false,
          "misconception_token": "ignored-remainder"
        },
        {
          "text": "89 books, 156 pages left over",
          "is_correct": false,
          "misconception_token": "remainder-larger-than-divisor"
        },
        {
          "text": "90 books, 70 pages left over",
          "is_correct": false,
          "misconception_token": "subtraction-error"
        }
      ],
      "solution": "$96 \\times 90 = 8640$ and $8700 - 8640 = 60$, and $60 < 96$, so 90 complete books can be made with 60 pages left over."
    }
  ],
}

const ADD_SUBTRACT_FRACTIONS_UNLIKE: GapMathSkill = {
  slug: "add-subtract-fractions-unlike",
  name: "Add & Subtract Fractions",
  subject: 'math',
  ccssGrade: "5",
  ccssGradeNum: 5,
  ccssCode: "CCSS.MATH.CONTENT.5.NF.A.1",
  satAlignment: "problem-solving-data-analysis",
  gradeBand: "3-5",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "What is $\\frac{1}{2} + \\frac{1}{4}$?",
      "choices": [
        {
          "text": "$\\frac{3}{4}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{2}{6}$",
          "is_correct": false,
          "misconception_token": "added-numerators-and-denominators"
        },
        {
          "text": "$\\frac{1}{2}$",
          "is_correct": false,
          "misconception_token": "numerator-not-scaled"
        },
        {
          "text": "$\\frac{5}{8}$",
          "is_correct": false,
          "misconception_token": "only-scaled-one-fraction"
        }
      ],
      "solution": "Rewrite $\\frac{1}{2}$ as $\\frac{2}{4}$, then $\\frac{2}{4} + \\frac{1}{4} = \\frac{3}{4}$."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "What is $\\frac{2}{3} - \\frac{1}{6}$?",
      "choices": [
        {
          "text": "$\\frac{1}{2}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{1}{6}$",
          "is_correct": false,
          "misconception_token": "forgot-to-convert-first-fraction"
        },
        {
          "text": "$\\frac{5}{6}$",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracted"
        },
        {
          "text": "$\\frac{1}{3}$",
          "is_correct": false,
          "misconception_token": "subtracted-across"
        }
      ],
      "solution": "Rewrite $\\frac{2}{3}$ as $\\frac{4}{6}$, then $\\frac{4}{6} - \\frac{1}{6} = \\frac{3}{6} = \\frac{1}{2}$."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "What is $\\frac{3}{4} + \\frac{1}{8}$?",
      "choices": [
        {
          "text": "$\\frac{7}{8}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{4}{12}$",
          "is_correct": false,
          "misconception_token": "added-numerators-and-denominators"
        },
        {
          "text": "$\\frac{1}{2}$",
          "is_correct": false,
          "misconception_token": "numerator-not-scaled"
        },
        {
          "text": "$\\frac{5}{8}$",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-added"
        }
      ],
      "solution": "Rewrite $\\frac{3}{4}$ as $\\frac{6}{8}$, then $\\frac{6}{8} + \\frac{1}{8} = \\frac{7}{8}$."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "What is $\\frac{5}{6} - \\frac{1}{3}$?",
      "choices": [
        {
          "text": "$\\frac{1}{2}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{2}{3}$",
          "is_correct": false,
          "misconception_token": "forgot-to-convert-second-fraction"
        },
        {
          "text": "$\\frac{7}{6}$",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracted"
        },
        {
          "text": "$\\frac{4}{3}$",
          "is_correct": false,
          "misconception_token": "subtracted-across"
        }
      ],
      "solution": "Rewrite $\\frac{1}{3}$ as $\\frac{2}{6}$, then $\\frac{5}{6} - \\frac{2}{6} = \\frac{3}{6} = \\frac{1}{2}$."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "What is $\\frac{1}{3} + \\frac{1}{6}$?",
      "choices": [
        {
          "text": "$\\frac{1}{2}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{2}{9}$",
          "is_correct": false,
          "misconception_token": "added-numerators-and-denominators"
        },
        {
          "text": "$\\frac{1}{3}$",
          "is_correct": false,
          "misconception_token": "numerator-not-scaled"
        },
        {
          "text": "$\\frac{1}{6}$",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-added"
        }
      ],
      "solution": "Rewrite $\\frac{1}{3}$ as $\\frac{2}{6}$, then $\\frac{2}{6} + \\frac{1}{6} = \\frac{3}{6} = \\frac{1}{2}$."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "What is $\\frac{4}{5} - \\frac{3}{10}$?",
      "choices": [
        {
          "text": "$\\frac{1}{2}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{1}{10}$",
          "is_correct": false,
          "misconception_token": "forgot-to-convert-first-fraction"
        },
        {
          "text": "$\\frac{11}{10}$",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracted"
        },
        {
          "text": "$\\frac{1}{5}$",
          "is_correct": false,
          "misconception_token": "subtracted-across"
        }
      ],
      "solution": "Rewrite $\\frac{4}{5}$ as $\\frac{8}{10}$, then $\\frac{8}{10} - \\frac{3}{10} = \\frac{5}{10} = \\frac{1}{2}$."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "What is $\\frac{1}{4} + \\frac{2}{3}$?",
      "choices": [
        {
          "text": "$\\frac{11}{12}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{3}{7}$",
          "is_correct": false,
          "misconception_token": "added-numerators-and-denominators"
        },
        {
          "text": "$\\frac{1}{4}$",
          "is_correct": false,
          "misconception_token": "numerators-not-scaled"
        },
        {
          "text": "$\\frac{5}{12}$",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-added"
        }
      ],
      "solution": "Rewrite as $\\frac{3}{12} + \\frac{8}{12} = \\frac{11}{12}$."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "What is $\\frac{7}{8} - \\frac{1}{2}$?",
      "choices": [
        {
          "text": "$\\frac{3}{8}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{3}{4}$",
          "is_correct": false,
          "misconception_token": "forgot-to-convert-second-fraction"
        },
        {
          "text": "$\\frac{11}{8}$",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracted"
        },
        {
          "text": "$1$",
          "is_correct": false,
          "misconception_token": "subtracted-across"
        }
      ],
      "solution": "Rewrite $\\frac{1}{2}$ as $\\frac{4}{8}$, then $\\frac{7}{8} - \\frac{4}{8} = \\frac{3}{8}$."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "A recipe needs $\\frac{2}{3}$ cup of white sugar and $\\frac{1}{4}$ cup of brown sugar. How much sugar does the recipe need in all?",
      "choices": [
        {
          "text": "$\\frac{11}{12}$ cup",
          "is_correct": true
        },
        {
          "text": "$\\frac{3}{7}$ cup",
          "is_correct": false,
          "misconception_token": "added-numerators-and-denominators"
        },
        {
          "text": "$\\frac{3}{4}$ cup",
          "is_correct": false,
          "misconception_token": "only-scaled-one-fraction"
        },
        {
          "text": "$\\frac{5}{12}$ cup",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-added"
        }
      ],
      "solution": "Rewrite as $\\frac{8}{12} + \\frac{3}{12} = \\frac{11}{12}$ cup."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "Maria ran $\\frac{3}{4}$ mile and then walked $\\frac{5}{8}$ mile. How far did she travel in all?",
      "choices": [
        {
          "text": "$1\\frac{3}{8}$ miles",
          "is_correct": true
        },
        {
          "text": "$\\frac{2}{3}$ mile",
          "is_correct": false,
          "misconception_token": "added-numerators-and-denominators"
        },
        {
          "text": "$1$ mile",
          "is_correct": false,
          "misconception_token": "forgot-to-convert-first-fraction"
        },
        {
          "text": "$\\frac{1}{8}$ mile",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-added"
        }
      ],
      "solution": "Rewrite $\\frac{3}{4}$ as $\\frac{6}{8}$, then $\\frac{6}{8} + \\frac{5}{8} = \\frac{11}{8} = 1\\frac{3}{8}$ miles."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "What is $1\\frac{1}{2} + 2\\frac{1}{3}$?",
      "choices": [
        {
          "text": "$3\\frac{5}{6}$",
          "is_correct": true
        },
        {
          "text": "$3\\frac{2}{5}$",
          "is_correct": false,
          "misconception_token": "added-fraction-parts-across"
        },
        {
          "text": "$3\\frac{1}{6}$",
          "is_correct": false,
          "misconception_token": "subtracted-fraction-parts"
        },
        {
          "text": "$3\\frac{1}{3}$",
          "is_correct": false,
          "misconception_token": "numerators-not-scaled"
        }
      ],
      "solution": "Add wholes $1 + 2 = 3$; add fractions $\\frac{3}{6} + \\frac{2}{6} = \\frac{5}{6}$, giving $3\\frac{5}{6}$."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "What is $3\\frac{3}{4} - 1\\frac{1}{2}$?",
      "choices": [
        {
          "text": "$2\\frac{1}{4}$",
          "is_correct": true
        },
        {
          "text": "$2\\frac{1}{2}$",
          "is_correct": false,
          "misconception_token": "forgot-to-convert-fraction-part"
        },
        {
          "text": "$3\\frac{1}{4}$",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracted"
        },
        {
          "text": "$2\\frac{3}{4}$",
          "is_correct": false,
          "misconception_token": "ignored-fraction-subtraction"
        }
      ],
      "solution": "Rewrite $1\\frac{1}{2}$ as $1\\frac{2}{4}$; subtract wholes $3 - 1 = 2$ and fractions $\\frac{3}{4} - \\frac{2}{4} = \\frac{1}{4}$, giving $2\\frac{1}{4}$."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "What is $4\\frac{1}{3} - 1\\frac{5}{6}$?",
      "choices": [
        {
          "text": "$2\\frac{1}{2}$",
          "is_correct": true
        },
        {
          "text": "$3\\frac{1}{2}$",
          "is_correct": false,
          "misconception_token": "subtracted-fraction-backwards"
        },
        {
          "text": "$2\\frac{1}{3}$",
          "is_correct": false,
          "misconception_token": "forgot-to-convert-first-fraction"
        },
        {
          "text": "$6\\frac{1}{6}$",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracted"
        }
      ],
      "solution": "Rewrite $4\\frac{1}{3}$ as $4\\frac{2}{6} = 3\\frac{8}{6}$, then $3\\frac{8}{6} - 1\\frac{5}{6} = 2\\frac{3}{6} = 2\\frac{1}{2}$."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "A board is $5\\frac{1}{2}$ feet long. A carpenter cuts off $2\\frac{3}{4}$ feet. How long is the remaining piece?",
      "choices": [
        {
          "text": "$2\\frac{3}{4}$ feet",
          "is_correct": true
        },
        {
          "text": "$3\\frac{1}{4}$ feet",
          "is_correct": false,
          "misconception_token": "subtracted-fraction-backwards"
        },
        {
          "text": "$2\\frac{1}{2}$ feet",
          "is_correct": false,
          "misconception_token": "forgot-to-convert-fraction-part"
        },
        {
          "text": "$8\\frac{1}{4}$ feet",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracted"
        }
      ],
      "solution": "Rewrite $5\\frac{1}{2}$ as $5\\frac{2}{4} = 4\\frac{6}{4}$, then $4\\frac{6}{4} - 2\\frac{3}{4} = 2\\frac{3}{4}$ feet."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "Jack had $\\frac{7}{8}$ of a pizza. He ate $\\frac{1}{3}$ of a pizza. How much of the pizza is left?",
      "choices": [
        {
          "text": "$\\frac{13}{24}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{6}{5}$",
          "is_correct": false,
          "misconception_token": "subtracted-across"
        },
        {
          "text": "$\\frac{3}{4}$",
          "is_correct": false,
          "misconception_token": "forgot-to-convert-second-fraction"
        },
        {
          "text": "$\\frac{29}{24}$",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracted"
        }
      ],
      "solution": "Rewrite as $\\frac{21}{24} - \\frac{8}{24} = \\frac{13}{24}$."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "What is $\\frac{5}{6} + \\frac{3}{4}$?",
      "choices": [
        {
          "text": "$1\\frac{7}{12}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{4}{5}$",
          "is_correct": false,
          "misconception_token": "added-numerators-and-denominators"
        },
        {
          "text": "$1\\frac{1}{12}$",
          "is_correct": false,
          "misconception_token": "only-scaled-one-fraction"
        },
        {
          "text": "$\\frac{1}{12}$",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-added"
        }
      ],
      "solution": "Rewrite as $\\frac{10}{12} + \\frac{9}{12} = \\frac{19}{12} = 1\\frac{7}{12}$."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "What is $\\frac{1}{2} + \\frac{2}{3} + \\frac{3}{4}$?",
      "choices": [
        {
          "text": "$1\\frac{11}{12}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{2}{3}$",
          "is_correct": false,
          "misconception_token": "added-numerators-and-denominators"
        },
        {
          "text": "$1\\frac{5}{12}$",
          "is_correct": false,
          "misconception_token": "dropped-a-term"
        },
        {
          "text": "$\\frac{1}{2}$",
          "is_correct": false,
          "misconception_token": "numerators-not-scaled"
        }
      ],
      "solution": "Rewrite as $\\frac{6}{12} + \\frac{8}{12} + \\frac{9}{12} = \\frac{23}{12} = 1\\frac{11}{12}$."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "A runner ran $2\\frac{1}{2}$ miles on Monday and $1\\frac{5}{6}$ miles on Tuesday. How many miles did she run in all?",
      "choices": [
        {
          "text": "$4\\frac{1}{3}$ miles",
          "is_correct": true
        },
        {
          "text": "$3\\frac{3}{4}$ miles",
          "is_correct": false,
          "misconception_token": "added-fraction-parts-across"
        },
        {
          "text": "$4$ miles",
          "is_correct": false,
          "misconception_token": "forgot-to-convert-first-fraction"
        },
        {
          "text": "$\\frac{2}{3}$ mile",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-added"
        }
      ],
      "solution": "Rewrite $2\\frac{1}{2}$ as $2\\frac{3}{6}$; then $2\\frac{3}{6} + 1\\frac{5}{6} = 3\\frac{8}{6} = 4\\frac{2}{6} = 4\\frac{1}{3}$ miles."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "Sarah had $6\\frac{1}{4}$ yards of ribbon. She used $2\\frac{2}{3}$ yards. How many yards of ribbon are left?",
      "choices": [
        {
          "text": "$3\\frac{7}{12}$ yards",
          "is_correct": true
        },
        {
          "text": "$4\\frac{5}{12}$ yards",
          "is_correct": false,
          "misconception_token": "subtracted-fraction-backwards"
        },
        {
          "text": "$8\\frac{11}{12}$ yards",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracted"
        },
        {
          "text": "$3\\frac{5}{12}$ yards",
          "is_correct": false,
          "misconception_token": "borrowed-wrong-amount"
        }
      ],
      "solution": "Rewrite as $6\\frac{3}{12} - 2\\frac{8}{12}$; regroup $6\\frac{3}{12} = 5\\frac{15}{12}$, then $5\\frac{15}{12} - 2\\frac{8}{12} = 3\\frac{7}{12}$ yards."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "A tank is $\\frac{7}{8}$ full. First $\\frac{1}{3}$ of a tank is used, then $\\frac{1}{4}$ of a tank is added. How full is the tank now?",
      "choices": [
        {
          "text": "$\\frac{19}{24}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{7}{24}$",
          "is_correct": false,
          "misconception_token": "subtracted-last-term-instead-of-adding"
        },
        {
          "text": "$1\\frac{11}{24}$",
          "is_correct": false,
          "misconception_token": "added-all-terms"
        },
        {
          "text": "$\\frac{7}{12}$",
          "is_correct": false,
          "misconception_token": "last-fraction-not-scaled"
        }
      ],
      "solution": "Rewrite as $\\frac{21}{24} - \\frac{8}{24} + \\frac{6}{24} = \\frac{19}{24}$."
    }
  ],
}

const MULTIPLY_DIVIDE_FRACTIONS: GapMathSkill = {
  slug: "multiply-divide-fractions",
  name: "Multiply & Divide Fractions",
  subject: 'math',
  ccssGrade: "5",
  ccssGradeNum: 5,
  ccssCode: "CCSS.MATH.CONTENT.5.NF.B.4",
  satAlignment: "problem-solving-data-analysis",
  gradeBand: "3-5",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "What is $\\frac{1}{2}\\times\\frac{1}{3}$?",
      "choices": [
        {
          "text": "$\\frac{1}{6}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{2}{5}$",
          "is_correct": false,
          "misconception_token": "added-across"
        },
        {
          "text": "$\\frac{1}{5}$",
          "is_correct": false,
          "misconception_token": "added-denominators"
        },
        {
          "text": "$\\frac{2}{6}$",
          "is_correct": false,
          "misconception_token": "added-numerators"
        }
      ],
      "solution": "Multiply straight across: $\\frac{1\\times 1}{2\\times 3}=\\frac{1}{6}$."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "What is $\\frac{1}{3}\\times\\frac{1}{5}$?",
      "choices": [
        {
          "text": "$\\frac{1}{15}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{2}{8}$",
          "is_correct": false,
          "misconception_token": "added-across"
        },
        {
          "text": "$\\frac{1}{8}$",
          "is_correct": false,
          "misconception_token": "added-denominators"
        },
        {
          "text": "$\\frac{2}{15}$",
          "is_correct": false,
          "misconception_token": "added-numerators"
        }
      ],
      "solution": "Multiply straight across: $\\frac{1\\times 1}{3\\times 5}=\\frac{1}{15}$."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "What is $\\frac{2}{3}\\times\\frac{1}{5}$?",
      "choices": [
        {
          "text": "$\\frac{2}{15}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{3}{8}$",
          "is_correct": false,
          "misconception_token": "added-across"
        },
        {
          "text": "$\\frac{2}{8}$",
          "is_correct": false,
          "misconception_token": "added-denominators"
        },
        {
          "text": "$\\frac{3}{15}$",
          "is_correct": false,
          "misconception_token": "added-numerators"
        }
      ],
      "solution": "Multiply straight across: $\\frac{2\\times 1}{3\\times 5}=\\frac{2}{15}$."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "What is $\\frac{3}{4}\\times\\frac{1}{2}$?",
      "choices": [
        {
          "text": "$\\frac{3}{8}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{4}{6}$",
          "is_correct": false,
          "misconception_token": "added-across"
        },
        {
          "text": "$\\frac{3}{6}$",
          "is_correct": false,
          "misconception_token": "added-denominators"
        },
        {
          "text": "$\\frac{6}{4}$",
          "is_correct": false,
          "misconception_token": "inverted-second-factor"
        }
      ],
      "solution": "Multiply straight across: $\\frac{3\\times 1}{4\\times 2}=\\frac{3}{8}$."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "What is $\\frac{2}{7}\\times\\frac{3}{5}$?",
      "choices": [
        {
          "text": "$\\frac{6}{35}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{5}{12}$",
          "is_correct": false,
          "misconception_token": "added-across"
        },
        {
          "text": "$\\frac{6}{12}$",
          "is_correct": false,
          "misconception_token": "added-denominators"
        },
        {
          "text": "$\\frac{5}{35}$",
          "is_correct": false,
          "misconception_token": "added-numerators"
        }
      ],
      "solution": "Multiply straight across: $\\frac{2\\times 3}{7\\times 5}=\\frac{6}{35}$."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "What is $\\frac{4}{5}\\times\\frac{2}{3}$?",
      "choices": [
        {
          "text": "$\\frac{8}{15}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{6}{8}$",
          "is_correct": false,
          "misconception_token": "added-across"
        },
        {
          "text": "$\\frac{8}{8}$",
          "is_correct": false,
          "misconception_token": "added-denominators"
        },
        {
          "text": "$\\frac{6}{15}$",
          "is_correct": false,
          "misconception_token": "added-numerators"
        }
      ],
      "solution": "Multiply straight across: $\\frac{4\\times 2}{5\\times 3}=\\frac{8}{15}$."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "What is $\\frac{1}{4}\\times 8$?",
      "choices": [
        {
          "text": "$2$",
          "is_correct": true
        },
        {
          "text": "$32$",
          "is_correct": false,
          "misconception_token": "multiplied-whole-by-denominator"
        },
        {
          "text": "$\\frac{1}{32}$",
          "is_correct": false,
          "misconception_token": "multiplied-into-denominator"
        },
        {
          "text": "$12$",
          "is_correct": false,
          "misconception_token": "added-whole-and-denominator"
        }
      ],
      "solution": "Write $8$ as $\\frac{8}{1}$: $\\frac{1\\times 8}{4\\times 1}=\\frac{8}{4}=2$."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "What is $6\\times\\frac{1}{2}$?",
      "choices": [
        {
          "text": "$3$",
          "is_correct": true
        },
        {
          "text": "$12$",
          "is_correct": false,
          "misconception_token": "multiplied-whole-by-denominator"
        },
        {
          "text": "$\\frac{1}{12}$",
          "is_correct": false,
          "misconception_token": "multiplied-into-denominator"
        },
        {
          "text": "$8$",
          "is_correct": false,
          "misconception_token": "added-whole-and-denominator"
        }
      ],
      "solution": "Write $6$ as $\\frac{6}{1}$: $\\frac{6\\times 1}{1\\times 2}=\\frac{6}{2}=3$."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "What is $\\frac{2}{3}\\times\\frac{3}{4}$ in simplest form?",
      "choices": [
        {
          "text": "$\\frac{1}{2}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{5}{7}$",
          "is_correct": false,
          "misconception_token": "added-across"
        },
        {
          "text": "$\\frac{6}{7}$",
          "is_correct": false,
          "misconception_token": "added-denominators"
        },
        {
          "text": "$\\frac{5}{12}$",
          "is_correct": false,
          "misconception_token": "added-numerators"
        }
      ],
      "solution": "Multiply across: $\\frac{2\\times 3}{3\\times 4}=\\frac{6}{12}$, which simplifies to $\\frac{1}{2}$."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "What is $\\frac{3}{4}\\times\\frac{8}{9}$ in simplest form?",
      "choices": [
        {
          "text": "$\\frac{2}{3}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{11}{13}$",
          "is_correct": false,
          "misconception_token": "added-across"
        },
        {
          "text": "$\\frac{24}{13}$",
          "is_correct": false,
          "misconception_token": "added-denominators"
        },
        {
          "text": "$\\frac{11}{36}$",
          "is_correct": false,
          "misconception_token": "added-numerators"
        }
      ],
      "solution": "Multiply across: $\\frac{3\\times 8}{4\\times 9}=\\frac{24}{36}$, which simplifies to $\\frac{2}{3}$."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "What is $12\\times\\frac{2}{3}$?",
      "choices": [
        {
          "text": "$8$",
          "is_correct": true
        },
        {
          "text": "$24$",
          "is_correct": false,
          "misconception_token": "forgot-to-divide-by-denominator"
        },
        {
          "text": "$4$",
          "is_correct": false,
          "misconception_token": "forgot-to-multiply-by-numerator"
        },
        {
          "text": "$18$",
          "is_correct": false,
          "misconception_token": "inverted-the-fraction"
        }
      ],
      "solution": "Multiply then divide: $\\frac{12\\times 2}{3}=\\frac{24}{3}=8$."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "A rectangle is $\\frac{3}{4}$ meter long and $\\frac{2}{5}$ meter wide. What is its area in square meters?",
      "choices": [
        {
          "text": "$\\frac{3}{10}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{5}{9}$",
          "is_correct": false,
          "misconception_token": "added-across"
        },
        {
          "text": "$\\frac{6}{9}$",
          "is_correct": false,
          "misconception_token": "added-denominators"
        },
        {
          "text": "$\\frac{5}{20}$",
          "is_correct": false,
          "misconception_token": "added-numerators"
        }
      ],
      "solution": "Area is length times width: $\\frac{3}{4}\\times\\frac{2}{5}=\\frac{6}{20}=\\frac{3}{10}$."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "Maria has $\\frac{1}{2}$ of a pizza and shares it equally among 3 friends. What fraction of the whole pizza does each friend get?",
      "choices": [
        {
          "text": "$\\frac{1}{6}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{3}{2}$",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-divided"
        },
        {
          "text": "$\\frac{1}{5}$",
          "is_correct": false,
          "misconception_token": "added-whole-to-denominator"
        },
        {
          "text": "$\\frac{2}{3}$",
          "is_correct": false,
          "misconception_token": "inverted-wrong-number"
        }
      ],
      "solution": "Divide the half into 3 equal parts: $\\frac{1}{2}\\div 3=\\frac{1}{2\\times 3}=\\frac{1}{6}$."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "How many $\\frac{1}{4}$-cup servings are in 3 cups?",
      "choices": [
        {
          "text": "$12$",
          "is_correct": true
        },
        {
          "text": "$\\frac{3}{4}$",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-divided"
        },
        {
          "text": "$7$",
          "is_correct": false,
          "misconception_token": "added-whole-and-denominator"
        },
        {
          "text": "$\\frac{1}{12}$",
          "is_correct": false,
          "misconception_token": "inverted-the-whole-number"
        }
      ],
      "solution": "Divide by the serving size: $3\\div\\frac{1}{4}=3\\times 4=12$."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "What is $\\frac{5}{6}\\times\\frac{3}{10}$ in simplest form?",
      "choices": [
        {
          "text": "$\\frac{1}{4}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{8}{16}$",
          "is_correct": false,
          "misconception_token": "added-across"
        },
        {
          "text": "$\\frac{15}{16}$",
          "is_correct": false,
          "misconception_token": "added-denominators"
        },
        {
          "text": "$\\frac{8}{60}$",
          "is_correct": false,
          "misconception_token": "added-numerators"
        }
      ],
      "solution": "Multiply across: $\\frac{5\\times 3}{6\\times 10}=\\frac{15}{60}$, which simplifies to $\\frac{1}{4}$."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "A recipe needs $\\frac{2}{3}$ cup of sugar for one batch. How much sugar is needed for 4 batches?",
      "choices": [
        {
          "text": "$2\\frac{2}{3}$",
          "is_correct": true
        },
        {
          "text": "$4\\frac{2}{3}$",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        },
        {
          "text": "$\\frac{8}{12}$",
          "is_correct": false,
          "misconception_token": "multiplied-numerator-and-denominator"
        },
        {
          "text": "$\\frac{1}{6}$",
          "is_correct": false,
          "misconception_token": "multiplied-whole-into-denominator"
        }
      ],
      "solution": "Multiply: $\\frac{2}{3}\\times 4=\\frac{8}{3}=2\\frac{2}{3}$ cups."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "In a class, $\\frac{3}{5}$ of the students play a sport. Of those who play a sport, $\\frac{2}{3}$ play soccer. What fraction of the whole class plays soccer?",
      "choices": [
        {
          "text": "$\\frac{2}{5}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{5}{8}$",
          "is_correct": false,
          "misconception_token": "added-across"
        },
        {
          "text": "$\\frac{6}{8}$",
          "is_correct": false,
          "misconception_token": "added-denominators"
        },
        {
          "text": "$\\frac{5}{15}$",
          "is_correct": false,
          "misconception_token": "added-numerators"
        }
      ],
      "solution": "Take a fraction of a fraction: $\\frac{3}{5}\\times\\frac{2}{3}=\\frac{6}{15}=\\frac{2}{5}$."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "A garden plot is $\\frac{5}{6}$ meter long and $\\frac{3}{4}$ meter wide. What is its area in square meters?",
      "choices": [
        {
          "text": "$\\frac{5}{8}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{8}{10}$",
          "is_correct": false,
          "misconception_token": "added-across"
        },
        {
          "text": "$\\frac{15}{10}$",
          "is_correct": false,
          "misconception_token": "added-denominators"
        },
        {
          "text": "$\\frac{8}{24}$",
          "is_correct": false,
          "misconception_token": "added-numerators"
        }
      ],
      "solution": "Area is length times width: $\\frac{5}{6}\\times\\frac{3}{4}=\\frac{15}{24}=\\frac{5}{8}$."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "A ribbon is 5 meters long. How many pieces each $\\frac{1}{3}$ meter long can be cut from it?",
      "choices": [
        {
          "text": "$15$",
          "is_correct": true
        },
        {
          "text": "$\\frac{5}{3}$",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-divided"
        },
        {
          "text": "$8$",
          "is_correct": false,
          "misconception_token": "added-whole-and-denominator"
        },
        {
          "text": "$\\frac{1}{15}$",
          "is_correct": false,
          "misconception_token": "inverted-the-whole-number"
        }
      ],
      "solution": "Divide by the piece length: $5\\div\\frac{1}{3}=5\\times 3=15$ pieces."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "Three friends equally share $\\frac{1}{2}$ of a pan of brownies. Then each friend gives half of their share to a sibling. What fraction of the whole pan does each sibling get?",
      "choices": [
        {
          "text": "$\\frac{1}{12}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{1}{6}$",
          "is_correct": false,
          "misconception_token": "stopped-at-first-step"
        },
        {
          "text": "$\\frac{1}{4}$",
          "is_correct": false,
          "misconception_token": "ignored-the-three-friends"
        },
        {
          "text": "$\\frac{3}{4}$",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-dividing"
        }
      ],
      "solution": "Each friend gets $\\frac{1}{2}\\div 3=\\frac{1}{6}$; half of that is $\\frac{1}{6}\\times\\frac{1}{2}=\\frac{1}{12}$."
    }
  ],
}

const COORDINATE_PLANE: GapMathSkill = {
  slug: "coordinate-plane",
  name: "Coordinate Plane",
  subject: 'math',
  ccssGrade: "5",
  ccssGradeNum: 5,
  ccssCode: "CCSS.MATH.CONTENT.5.G.A.2",
  satAlignment: "geometry-trigonometry",
  gradeBand: "3-5",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "A point is located 4 units to the right of the origin and 2 units up. What are its coordinates?",
      "choices": [
        {
          "text": "$(4, 2)$",
          "is_correct": true
        },
        {
          "text": "$(2, 4)$",
          "is_correct": false,
          "misconception_token": "swapped-coordinates"
        },
        {
          "text": "$(4, 0)$",
          "is_correct": false,
          "misconception_token": "ignored-up-value"
        },
        {
          "text": "$(0, 2)$",
          "is_correct": false,
          "misconception_token": "ignored-right-value"
        }
      ],
      "solution": "The x-coordinate is the distance right (4) and the y-coordinate is the distance up (2), so the point is $(4, 2)$."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "In the ordered pair $(6, 1)$, what is the x-coordinate?",
      "choices": [
        {
          "text": "6",
          "is_correct": true
        },
        {
          "text": "1",
          "is_correct": false,
          "misconception_token": "used-y-coordinate"
        },
        {
          "text": "7",
          "is_correct": false,
          "misconception_token": "added-coordinates"
        },
        {
          "text": "5",
          "is_correct": false,
          "misconception_token": "subtracted-coordinates"
        }
      ],
      "solution": "The x-coordinate is the first number in the ordered pair, so it is 6."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "In the ordered pair $(2, 9)$, how many units up from the x-axis is the point?",
      "choices": [
        {
          "text": "9",
          "is_correct": true
        },
        {
          "text": "2",
          "is_correct": false,
          "misconception_token": "used-x-coordinate"
        },
        {
          "text": "11",
          "is_correct": false,
          "misconception_token": "added-coordinates"
        },
        {
          "text": "7",
          "is_correct": false,
          "misconception_token": "subtracted-coordinates"
        }
      ],
      "solution": "The distance up is the y-coordinate, the second number, so the point is 9 units up."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "Which ordered pair describes a point 5 units to the right of the origin and 0 units up?",
      "choices": [
        {
          "text": "$(5, 0)$",
          "is_correct": true
        },
        {
          "text": "$(0, 5)$",
          "is_correct": false,
          "misconception_token": "swapped-coordinates"
        },
        {
          "text": "$(5, 5)$",
          "is_correct": false,
          "misconception_token": "duplicated-value"
        },
        {
          "text": "$(0, 0)$",
          "is_correct": false,
          "misconception_token": "chose-origin"
        }
      ],
      "solution": "Right is the x-value (5) and up is the y-value (0), so the point is $(5, 0)$."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "The first number in an ordered pair tells you the distance to move in which direction from the origin?",
      "choices": [
        {
          "text": "Right",
          "is_correct": true
        },
        {
          "text": "Up",
          "is_correct": false,
          "misconception_token": "used-second-number-direction"
        },
        {
          "text": "Left",
          "is_correct": false,
          "misconception_token": "moved-left"
        },
        {
          "text": "Down",
          "is_correct": false,
          "misconception_token": "moved-down"
        }
      ],
      "solution": "The first number is the x-coordinate, which tells you how far to move right from the origin."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "A point sits 7 units to the right of the origin and 7 units up. What are its coordinates?",
      "choices": [
        {
          "text": "$(7, 7)$",
          "is_correct": true
        },
        {
          "text": "$(7, 0)$",
          "is_correct": false,
          "misconception_token": "ignored-up-value"
        },
        {
          "text": "$(0, 7)$",
          "is_correct": false,
          "misconception_token": "ignored-right-value"
        },
        {
          "text": "$(14, 7)$",
          "is_correct": false,
          "misconception_token": "added-coordinates"
        }
      ],
      "solution": "The distance right (7) is the x-value and the distance up (7) is the y-value, so the point is $(7, 7)$."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "In the ordered pair $(8, 3)$, what is the y-coordinate?",
      "choices": [
        {
          "text": "3",
          "is_correct": true
        },
        {
          "text": "8",
          "is_correct": false,
          "misconception_token": "used-x-coordinate"
        },
        {
          "text": "11",
          "is_correct": false,
          "misconception_token": "added-coordinates"
        },
        {
          "text": "5",
          "is_correct": false,
          "misconception_token": "subtracted-coordinates"
        }
      ],
      "solution": "The y-coordinate is the second number in the ordered pair, so it is 3."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "Which point lies exactly on the y-axis?",
      "choices": [
        {
          "text": "$(0, 4)$",
          "is_correct": true
        },
        {
          "text": "$(4, 0)$",
          "is_correct": false,
          "misconception_token": "confused-x-axis"
        },
        {
          "text": "$(2, 2)$",
          "is_correct": false,
          "misconception_token": "interior-point"
        },
        {
          "text": "$(5, 1)$",
          "is_correct": false,
          "misconception_token": "interior-point-two"
        }
      ],
      "solution": "A point on the y-axis has an x-coordinate of 0, so $(0, 4)$ lies on the y-axis."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "Two points are located at $(2, 3)$ and $(9, 3)$. How many units apart are they?",
      "choices": [
        {
          "text": "7",
          "is_correct": true
        },
        {
          "text": "6",
          "is_correct": false,
          "misconception_token": "off-by-one"
        },
        {
          "text": "11",
          "is_correct": false,
          "misconception_token": "added-x-coordinates"
        },
        {
          "text": "3",
          "is_correct": false,
          "misconception_token": "used-y-coordinate"
        }
      ],
      "solution": "The points share the same y-value, so the distance is the difference of the x-values: $9 - 2 = 7$."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "A point is at $(5, 2)$ and another point is at $(5, 10)$. How far apart are they?",
      "choices": [
        {
          "text": "8",
          "is_correct": true
        },
        {
          "text": "12",
          "is_correct": false,
          "misconception_token": "added-y-coordinates"
        },
        {
          "text": "7",
          "is_correct": false,
          "misconception_token": "off-by-one"
        },
        {
          "text": "5",
          "is_correct": false,
          "misconception_token": "used-x-coordinate"
        }
      ],
      "solution": "The points share the same x-value, so the distance is the difference of the y-values: $10 - 2 = 8$."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "On a map grid, the library is at $(3, 4)$ and the school is at $(3, 9)$. Each unit is 1 block. How many blocks apart are they?",
      "choices": [
        {
          "text": "5",
          "is_correct": true
        },
        {
          "text": "13",
          "is_correct": false,
          "misconception_token": "added-y-coordinates"
        },
        {
          "text": "6",
          "is_correct": false,
          "misconception_token": "off-by-one"
        },
        {
          "text": "3",
          "is_correct": false,
          "misconception_token": "used-x-coordinate"
        }
      ],
      "solution": "The two places share the same x-value, so the distance is the difference of the y-values: $9 - 4 = 5$ blocks."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "A treasure is buried 6 units east and 8 units north of the start. On the grid, east is right and north is up. What ordered pair marks the treasure?",
      "choices": [
        {
          "text": "$(6, 8)$",
          "is_correct": true
        },
        {
          "text": "$(8, 6)$",
          "is_correct": false,
          "misconception_token": "swapped-coordinates"
        },
        {
          "text": "$(6, 0)$",
          "is_correct": false,
          "misconception_token": "ignored-north-value"
        },
        {
          "text": "$(0, 8)$",
          "is_correct": false,
          "misconception_token": "ignored-east-value"
        }
      ],
      "solution": "East (right) is the x-value (6) and north (up) is the y-value (8), so the treasure is at $(6, 8)$."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "Maria starts at the origin, walks 4 units right, then 3 units up, then 2 more units up. What are her final coordinates?",
      "choices": [
        {
          "text": "$(4, 5)$",
          "is_correct": true
        },
        {
          "text": "$(4, 3)$",
          "is_correct": false,
          "misconception_token": "forgot-second-up-move"
        },
        {
          "text": "$(9, 0)$",
          "is_correct": false,
          "misconception_token": "added-all-to-x"
        },
        {
          "text": "$(5, 4)$",
          "is_correct": false,
          "misconception_token": "swapped-coordinates"
        }
      ],
      "solution": "She moves 4 right (x = 4) and up a total of $3 + 2 = 5$ (y = 5), so her coordinates are $(4, 5)$."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "Point A is at $(1, 2)$. Point B is 5 units to the right of A. What are the coordinates of B?",
      "choices": [
        {
          "text": "$(6, 2)$",
          "is_correct": true
        },
        {
          "text": "$(1, 7)$",
          "is_correct": false,
          "misconception_token": "moved-up-instead"
        },
        {
          "text": "$(6, 7)$",
          "is_correct": false,
          "misconception_token": "added-to-both-coordinates"
        },
        {
          "text": "$(5, 2)$",
          "is_correct": false,
          "misconception_token": "used-move-as-x"
        }
      ],
      "solution": "Moving right adds to the x-value: $1 + 5 = 6$, and y stays 2, so B is at $(6, 2)$."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "A garden has one corner at $(2, 2)$ and the opposite corner of the same side at $(2, 8)$. How long is that side, in units?",
      "choices": [
        {
          "text": "6",
          "is_correct": true
        },
        {
          "text": "10",
          "is_correct": false,
          "misconception_token": "added-y-coordinates"
        },
        {
          "text": "5",
          "is_correct": false,
          "misconception_token": "off-by-one"
        },
        {
          "text": "8",
          "is_correct": false,
          "misconception_token": "used-y-coordinate"
        }
      ],
      "solution": "The corners share the same x-value, so the side length is the difference of the y-values: $8 - 2 = 6$."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "Which of these points is farthest to the right, $(8, 2)$, $(5, 5)$, $(2, 9)$, or $(6, 1)$?",
      "choices": [
        {
          "text": "$(8, 2)$",
          "is_correct": true
        },
        {
          "text": "$(2, 9)$",
          "is_correct": false,
          "misconception_token": "chose-largest-y"
        },
        {
          "text": "$(5, 5)$",
          "is_correct": false,
          "misconception_token": "chose-equal-coordinates"
        },
        {
          "text": "$(6, 1)$",
          "is_correct": false,
          "misconception_token": "chose-second-largest-x"
        }
      ],
      "solution": "Farthest right means the largest x-coordinate, and 8 is the largest, so $(8, 2)$ is farthest right."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "A park is drawn on a grid. The entrance is at $(2, 1)$. The fountain is 5 units right and 3 units up from the entrance. What are the fountain's coordinates?",
      "choices": [
        {
          "text": "$(7, 4)$",
          "is_correct": true
        },
        {
          "text": "$(5, 3)$",
          "is_correct": false,
          "misconception_token": "ignored-starting-point"
        },
        {
          "text": "$(7, 1)$",
          "is_correct": false,
          "misconception_token": "forgot-up-move"
        },
        {
          "text": "$(2, 4)$",
          "is_correct": false,
          "misconception_token": "forgot-right-move"
        }
      ],
      "solution": "Add the moves to the entrance: x is $2 + 5 = 7$ and y is $1 + 3 = 4$, so the fountain is at $(7, 4)$."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "A rectangle has corners at $(1, 1)$, $(7, 1)$, $(7, 4)$, and $(1, 4)$. The bottom side is 6 units long and the left side is 3 units long. What is the perimeter of the rectangle?",
      "choices": [
        {
          "text": "18",
          "is_correct": true
        },
        {
          "text": "9",
          "is_correct": false,
          "misconception_token": "added-two-sides-only"
        },
        {
          "text": "15",
          "is_correct": false,
          "misconception_token": "forgot-to-double-one-side"
        },
        {
          "text": "24",
          "is_correct": false,
          "misconception_token": "used-longer-side-four-times"
        }
      ],
      "solution": "A rectangle has two sides of each length, so the perimeter is $2 \\times (6 + 3) = 18$."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "Sam is at $(4, 2)$. Dana is directly above Sam at $(4, 9)$, and Ray is directly right of Sam at $(10, 2)$. How much farther from Sam is Dana than Ray?",
      "choices": [
        {
          "text": "1",
          "is_correct": true
        },
        {
          "text": "13",
          "is_correct": false,
          "misconception_token": "added-both-distances"
        },
        {
          "text": "7",
          "is_correct": false,
          "misconception_token": "gave-dana-distance-only"
        },
        {
          "text": "2",
          "is_correct": false,
          "misconception_token": "off-by-one"
        }
      ],
      "solution": "Dana is $9 - 2 = 7$ units from Sam and Ray is $10 - 4 = 6$ units from Sam, so Dana is $7 - 6 = 1$ unit farther."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "A robot starts at the origin. It moves 3 units right, then 4 units up, then 2 units right, then 1 unit up. What are the robot's final coordinates?",
      "choices": [
        {
          "text": "$(5, 5)$",
          "is_correct": true
        },
        {
          "text": "$(5, 4)$",
          "is_correct": false,
          "misconception_token": "dropped-last-up-move"
        },
        {
          "text": "$(3, 5)$",
          "is_correct": false,
          "misconception_token": "dropped-second-right-move"
        },
        {
          "text": "$(10, 0)$",
          "is_correct": false,
          "misconception_token": "summed-all-as-x"
        }
      ],
      "solution": "The right moves total $3 + 2 = 5$ (x = 5) and the up moves total $4 + 1 = 5$ (y = 5), so the robot ends at $(5, 5)$."
    }
  ],
}

const NUMERICAL_EXPRESSIONS: GapMathSkill = {
  slug: "numerical-expressions",
  name: "Numerical Expressions",
  subject: 'math',
  ccssGrade: "5",
  ccssGradeNum: 5,
  ccssCode: "CCSS.MATH.CONTENT.5.OA.A.1",
  satAlignment: "algebra",
  gradeBand: "3-5",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "Evaluate $6 \\times (5 + 2)$.",
      "choices": [
        {
          "text": "42",
          "is_correct": true
        },
        {
          "text": "32",
          "is_correct": false,
          "misconception_token": "ignored-parentheses"
        },
        {
          "text": "13",
          "is_correct": false,
          "misconception_token": "added-all-numbers"
        },
        {
          "text": "60",
          "is_correct": false,
          "misconception_token": "multiplied-inside-parentheses"
        }
      ],
      "solution": "Do the parentheses first: $5 + 2 = 7$. Then $6 \\times 7 = 42$."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "Evaluate $(12 - 4) \\div 2$.",
      "choices": [
        {
          "text": "4",
          "is_correct": true
        },
        {
          "text": "10",
          "is_correct": false,
          "misconception_token": "ignored-parentheses"
        },
        {
          "text": "8",
          "is_correct": false,
          "misconception_token": "forgot-to-divide"
        },
        {
          "text": "2",
          "is_correct": false,
          "misconception_token": "divided-before-subtracting"
        }
      ],
      "solution": "Do the parentheses first: $12 - 4 = 8$. Then $8 \\div 2 = 4$."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "Evaluate $18 - (3 + 5)$.",
      "choices": [
        {
          "text": "10",
          "is_correct": true
        },
        {
          "text": "20",
          "is_correct": false,
          "misconception_token": "ignored-parentheses"
        },
        {
          "text": "26",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracting"
        },
        {
          "text": "8",
          "is_correct": false,
          "misconception_token": "answered-group-only"
        }
      ],
      "solution": "Do the parentheses first: $3 + 5 = 8$. Then $18 - 8 = 10$."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "Evaluate $20 - 3 \\times 4$.",
      "choices": [
        {
          "text": "8",
          "is_correct": true
        },
        {
          "text": "68",
          "is_correct": false,
          "misconception_token": "subtracted-before-multiplying"
        },
        {
          "text": "21",
          "is_correct": false,
          "misconception_token": "replaced-times-with-plus"
        },
        {
          "text": "12",
          "is_correct": false,
          "misconception_token": "answered-product-only"
        }
      ],
      "solution": "Multiply before subtracting: $3 \\times 4 = 12$. Then $20 - 12 = 8$."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "Which expression means: add 8 and 4, then multiply the sum by 3?",
      "choices": [
        {
          "text": "$(8 + 4) \\times 3$",
          "is_correct": true
        },
        {
          "text": "$8 + 4 \\times 3$",
          "is_correct": false,
          "misconception_token": "forgot-parentheses"
        },
        {
          "text": "$8 \\times 3 + 4$",
          "is_correct": false,
          "misconception_token": "multiplied-wrong-number"
        },
        {
          "text": "$(8 \\times 4) + 3$",
          "is_correct": false,
          "misconception_token": "used-wrong-operations"
        }
      ],
      "solution": "The sum $8 + 4$ must be grouped so it is multiplied by 3: $(8 + 4) \\times 3$."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "Evaluate $2 \\times (9 - 6) + 4$.",
      "choices": [
        {
          "text": "10",
          "is_correct": true
        },
        {
          "text": "16",
          "is_correct": false,
          "misconception_token": "ignored-parentheses"
        },
        {
          "text": "14",
          "is_correct": false,
          "misconception_token": "included-4-inside-parentheses"
        },
        {
          "text": "6",
          "is_correct": false,
          "misconception_token": "forgot-to-add-4"
        }
      ],
      "solution": "Parentheses first: $9 - 6 = 3$. Then $2 \\times 3 = 6$, and $6 + 4 = 10$."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "Evaluate $(7 + 3) \\times (6 - 2)$.",
      "choices": [
        {
          "text": "40",
          "is_correct": true
        },
        {
          "text": "23",
          "is_correct": false,
          "misconception_token": "ignored-parentheses"
        },
        {
          "text": "14",
          "is_correct": false,
          "misconception_token": "added-groups-instead-of-multiplying"
        },
        {
          "text": "58",
          "is_correct": false,
          "misconception_token": "ignored-second-parentheses"
        }
      ],
      "solution": "Each group first: $7 + 3 = 10$ and $6 - 2 = 4$. Then $10 \\times 4 = 40$."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "Maria buys 3 packs of pens with 4 pens in each pack. She already had 5 pens. Which expression shows how many pens she has now?",
      "choices": [
        {
          "text": "$3 \\times 4 + 5$",
          "is_correct": true
        },
        {
          "text": "$3 \\times (4 + 5)$",
          "is_correct": false,
          "misconception_token": "grouped-added-extra-pens"
        },
        {
          "text": "$3 + 4 \\times 5$",
          "is_correct": false,
          "misconception_token": "misplaced-operations"
        },
        {
          "text": "$(3 + 4) \\times 5$",
          "is_correct": false,
          "misconception_token": "added-before-multiplying"
        }
      ],
      "solution": "The 3 packs of 4 pens are $3 \\times 4$, and the 5 she already had are added: $3 \\times 4 + 5$."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "Evaluate $[15 + 6] \\times 2 - 8$.",
      "choices": [
        {
          "text": "34",
          "is_correct": true
        },
        {
          "text": "19",
          "is_correct": false,
          "misconception_token": "ignored-brackets"
        },
        {
          "text": "42",
          "is_correct": false,
          "misconception_token": "forgot-final-subtraction"
        },
        {
          "text": "26",
          "is_correct": false,
          "misconception_token": "subtracted-before-multiplying"
        }
      ],
      "solution": "Brackets first: $15 + 6 = 21$. Then $21 \\times 2 = 42$, and $42 - 8 = 34$."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "Evaluate $3 \\times [8 - (2 + 1)]$.",
      "choices": [
        {
          "text": "15",
          "is_correct": true
        },
        {
          "text": "21",
          "is_correct": false,
          "misconception_token": "ignored-brackets"
        },
        {
          "text": "5",
          "is_correct": false,
          "misconception_token": "forgot-to-multiply"
        },
        {
          "text": "33",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracting"
        }
      ],
      "solution": "Innermost first: $2 + 1 = 3$, then $8 - 3 = 5$. Finally $3 \\times 5 = 15$."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "A theater has 8 rows with 12 seats each and 5 rows with 10 seats each. Which expression gives the total number of seats?",
      "choices": [
        {
          "text": "$8 \\times 12 + 5 \\times 10$",
          "is_correct": true
        },
        {
          "text": "$8 \\times 12 + 5 + 10$",
          "is_correct": false,
          "misconception_token": "wrong-operation-for-second-group"
        },
        {
          "text": "$(8 + 12) \\times (5 + 10)$",
          "is_correct": false,
          "misconception_token": "added-within-groups"
        },
        {
          "text": "$8 \\times 5 + 12 \\times 10$",
          "is_correct": false,
          "misconception_token": "paired-wrong-numbers"
        }
      ],
      "solution": "The first block is $8 \\times 12$ seats and the second is $5 \\times 10$ seats, added together: $8 \\times 12 + 5 \\times 10$."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "Evaluate $\\{20 - [2 \\times (3 + 1)]\\} \\div 4$.",
      "choices": [
        {
          "text": "3",
          "is_correct": true
        },
        {
          "text": "12",
          "is_correct": false,
          "misconception_token": "forgot-to-divide"
        },
        {
          "text": "18",
          "is_correct": false,
          "misconception_token": "ignored-braces"
        },
        {
          "text": "8",
          "is_correct": false,
          "misconception_token": "answered-inner-bracket-only"
        }
      ],
      "solution": "Work outward: $3 + 1 = 4$, then $2 \\times 4 = 8$, then $20 - 8 = 12$. Finally $12 \\div 4 = 3$."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "Sam had 50 dollars. He bought 3 books that cost 8 dollars each. How many dollars does he have left?",
      "choices": [
        {
          "text": "26",
          "is_correct": true
        },
        {
          "text": "24",
          "is_correct": false,
          "misconception_token": "answered-cost-only"
        },
        {
          "text": "74",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracting"
        },
        {
          "text": "376",
          "is_correct": false,
          "misconception_token": "subtracted-before-multiplying"
        }
      ],
      "solution": "The books cost $3 \\times 8 = 24$ dollars. Subtract from what he had: $50 - 24 = 26$ dollars."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "Evaluate $40 \\div 5 + 3 \\times 6$.",
      "choices": [
        {
          "text": "26",
          "is_correct": true
        },
        {
          "text": "66",
          "is_correct": false,
          "misconception_token": "ignored-order-of-operations"
        },
        {
          "text": "11",
          "is_correct": false,
          "misconception_token": "dropped-multiplication-step"
        },
        {
          "text": "144",
          "is_correct": false,
          "misconception_token": "multiplied-parts-instead-of-adding"
        }
      ],
      "solution": "Do multiplication and division first: $40 \\div 5 = 8$ and $3 \\times 6 = 18$. Then $8 + 18 = 26$."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "Which expression means: subtract 7 from 20, then divide the result by the sum of 2 and 3?",
      "choices": [
        {
          "text": "$(20 - 7) \\div (2 + 3)$",
          "is_correct": true
        },
        {
          "text": "$20 - 7 \\div 2 + 3$",
          "is_correct": false,
          "misconception_token": "no-grouping"
        },
        {
          "text": "$(7 - 20) \\div (2 + 3)$",
          "is_correct": false,
          "misconception_token": "reversed-subtraction"
        },
        {
          "text": "$(20 - 7) \\div 2 + 3$",
          "is_correct": false,
          "misconception_token": "missed-second-grouping"
        }
      ],
      "solution": "\"Subtract 7 from 20\" is $(20 - 7)$, divided by the grouped sum $(2 + 3)$: $(20 - 7) \\div (2 + 3)$."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "A baker puts 6 muffins in each of 4 small boxes and 9 muffins in each of 2 large boxes. How many muffins does she pack in all?",
      "choices": [
        {
          "text": "42",
          "is_correct": true
        },
        {
          "text": "66",
          "is_correct": false,
          "misconception_token": "misplaced-grouping"
        },
        {
          "text": "21",
          "is_correct": false,
          "misconception_token": "added-all-numbers"
        },
        {
          "text": "24",
          "is_correct": false,
          "misconception_token": "counted-small-boxes-only"
        }
      ],
      "solution": "Small boxes hold $6 \\times 4 = 24$ and large boxes hold $9 \\times 2 = 18$. Total: $24 + 18 = 42$."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "Evaluate $2 \\times \\{15 - [3 \\times (2 + 2)]\\}$.",
      "choices": [
        {
          "text": "6",
          "is_correct": true
        },
        {
          "text": "18",
          "is_correct": false,
          "misconception_token": "ignored-outer-grouping"
        },
        {
          "text": "3",
          "is_correct": false,
          "misconception_token": "forgot-to-multiply-by-2"
        },
        {
          "text": "14",
          "is_correct": false,
          "misconception_token": "misapplied-inner-parentheses"
        }
      ],
      "solution": "Innermost first: $2 + 2 = 4$, then $3 \\times 4 = 12$, then $15 - 12 = 3$. Finally $2 \\times 3 = 6$."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "A school buys 4 boxes of markers at 6 dollars each and 3 boxes of pencils at 5 dollars each. A coupon takes 8 dollars off the total. What is the final cost in dollars?",
      "choices": [
        {
          "text": "31",
          "is_correct": true
        },
        {
          "text": "39",
          "is_correct": false,
          "misconception_token": "forgot-to-subtract-discount"
        },
        {
          "text": "47",
          "is_correct": false,
          "misconception_token": "added-discount-instead-of-subtracting"
        },
        {
          "text": "10",
          "is_correct": false,
          "misconception_token": "added-all-numbers"
        }
      ],
      "solution": "Markers cost $4 \\times 6 = 24$ and pencils cost $3 \\times 5 = 15$, so the total is $24 + 15 = 39$. After the coupon: $39 - 8 = 31$ dollars."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "Which expression means: multiply the difference of 30 and 6 by the sum of 4 and 5, then subtract 7?",
      "choices": [
        {
          "text": "$(30 - 6) \\times (4 + 5) - 7$",
          "is_correct": true
        },
        {
          "text": "$30 - 6 \\times (4 + 5) - 7$",
          "is_correct": false,
          "misconception_token": "no-grouping-on-difference"
        },
        {
          "text": "$(30 - 6) \\times (4 + 5 - 7)$",
          "is_correct": false,
          "misconception_token": "grouped-subtraction-wrong"
        },
        {
          "text": "$30 - (6 \\times 4) + (5 - 7)$",
          "is_correct": false,
          "misconception_token": "wrong-operations"
        }
      ],
      "solution": "The difference $(30 - 6)$ times the sum $(4 + 5)$, with 7 subtracted last: $(30 - 6) \\times (4 + 5) - 7$."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "Evaluate $\\{[(18 - 3) \\div 5] + 4\\} \\times 6$.",
      "choices": [
        {
          "text": "42",
          "is_correct": true
        },
        {
          "text": "7",
          "is_correct": false,
          "misconception_token": "forgot-to-multiply"
        },
        {
          "text": "27",
          "is_correct": false,
          "misconception_token": "ignored-braces"
        },
        {
          "text": "13",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplying"
        }
      ],
      "solution": "Innermost first: $18 - 3 = 15$, then $15 \\div 5 = 3$, then $3 + 4 = 7$. Finally $7 \\times 6 = 42$."
    }
  ],
}

const INTEGERS_RATIONAL_NUMBERS: GapMathSkill = {
  slug: "integers-rational-numbers",
  name: "Integers & Rational Numbers",
  subject: 'math',
  ccssGrade: "6",
  ccssGradeNum: 6,
  ccssCode: "CCSS.MATH.CONTENT.6.NS.C",
  satAlignment: "algebra",
  gradeBand: "6-8",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "What is the opposite of $-7$?",
      "choices": [
        {
          "text": "$7$",
          "is_correct": true
        },
        {
          "text": "$-7$",
          "is_correct": false,
          "misconception_token": "kept-same-number"
        },
        {
          "text": "$\\frac{1}{7}$",
          "is_correct": false,
          "misconception_token": "used-reciprocal"
        },
        {
          "text": "$0$",
          "is_correct": false,
          "misconception_token": "used-zero"
        }
      ],
      "solution": "The opposite of a number is the same distance from $0$ on the other side, so the opposite of $-7$ is $7$."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "What is $|-9|$?",
      "choices": [
        {
          "text": "$9$",
          "is_correct": true
        },
        {
          "text": "$-9$",
          "is_correct": false,
          "misconception_token": "kept-negative-sign"
        },
        {
          "text": "$18$",
          "is_correct": false,
          "misconception_token": "doubled-the-value"
        },
        {
          "text": "$0$",
          "is_correct": false,
          "misconception_token": "answered-zero"
        }
      ],
      "solution": "Absolute value is the distance from $0$, which is always non-negative, so $|-9| = 9$."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "On a number line, which number is farther to the right: $-1$ or $-6$?",
      "choices": [
        {
          "text": "$-1$",
          "is_correct": true
        },
        {
          "text": "$-6$",
          "is_correct": false,
          "misconception_token": "leftmost-is-greater"
        },
        {
          "text": "They are the same distance",
          "is_correct": false,
          "misconception_token": "treated-as-equal"
        },
        {
          "text": "Cannot tell without a ruler",
          "is_correct": false,
          "misconception_token": "misread-number-line"
        }
      ],
      "solution": "On a number line larger numbers are to the right; since $-1 > -6$, the number $-1$ is farther to the right."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "The temperature is $-3$ degrees. It rises $5$ degrees. What is the new temperature?",
      "choices": [
        {
          "text": "$2$ degrees",
          "is_correct": true
        },
        {
          "text": "$-2$ degrees",
          "is_correct": false,
          "misconception_token": "kept-negative-sign"
        },
        {
          "text": "$-8$ degrees",
          "is_correct": false,
          "misconception_token": "subtracted-instead"
        },
        {
          "text": "$8$ degrees",
          "is_correct": false,
          "misconception_token": "ignored-the-negative"
        }
      ],
      "solution": "Start at $-3$ and move up $5$: $-3 + 5 = 2$ degrees."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "A submarine is $60$ feet below sea level. Which integer represents its position?",
      "choices": [
        {
          "text": "$-60$",
          "is_correct": true
        },
        {
          "text": "$60$",
          "is_correct": false,
          "misconception_token": "ignored-below-direction"
        },
        {
          "text": "$0$",
          "is_correct": false,
          "misconception_token": "used-sea-level"
        },
        {
          "text": "$\\frac{1}{60}$",
          "is_correct": false,
          "misconception_token": "used-reciprocal"
        }
      ],
      "solution": "Below sea level is negative, so $60$ feet below sea level is represented by $-60$."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "What is $-(-4)$?",
      "choices": [
        {
          "text": "$4$",
          "is_correct": true
        },
        {
          "text": "$-4$",
          "is_correct": false,
          "misconception_token": "kept-one-negative"
        },
        {
          "text": "$0$",
          "is_correct": false,
          "misconception_token": "canceled-to-zero"
        },
        {
          "text": "$8$",
          "is_correct": false,
          "misconception_token": "added-the-numbers"
        }
      ],
      "solution": "The opposite of $-4$ is $4$, so $-(-4) = 4$."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "Which number has the greater absolute value: $-8$ or $3$?",
      "choices": [
        {
          "text": "$-8$",
          "is_correct": true
        },
        {
          "text": "$3$",
          "is_correct": false,
          "misconception_token": "compared-actual-values"
        },
        {
          "text": "They are equal in absolute value",
          "is_correct": false,
          "misconception_token": "treated-as-equal"
        },
        {
          "text": "Neither, absolute value has no size",
          "is_correct": false,
          "misconception_token": "misunderstood-absolute-value"
        }
      ],
      "solution": "Since $|-8| = 8$ and $|3| = 3$, and $8 > 3$, the number $-8$ has the greater absolute value."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "Order these integers from least to greatest: $-4$, $2$, $-1$.",
      "choices": [
        {
          "text": "$-4, -1, 2$",
          "is_correct": true
        },
        {
          "text": "$-1, -4, 2$",
          "is_correct": false,
          "misconception_token": "ordered-by-absolute-value"
        },
        {
          "text": "$2, -1, -4$",
          "is_correct": false,
          "misconception_token": "greatest-to-least"
        },
        {
          "text": "$-4, 2, -1$",
          "is_correct": false,
          "misconception_token": "left-in-original-order"
        }
      ],
      "solution": "On a number line $-4$ is leftmost, then $-1$, then $2$, so least to greatest is $-4, -1, 2$."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "Which fraction is greater: $-\\frac{1}{2}$ or $-\\frac{3}{4}$?",
      "choices": [
        {
          "text": "$-\\frac{1}{2}$",
          "is_correct": true
        },
        {
          "text": "$-\\frac{3}{4}$",
          "is_correct": false,
          "misconception_token": "larger-magnitude-is-greater"
        },
        {
          "text": "They are equal",
          "is_correct": false,
          "misconception_token": "treated-as-equal"
        },
        {
          "text": "Negative fractions cannot be compared",
          "is_correct": false,
          "misconception_token": "cannot-compare-negatives"
        }
      ],
      "solution": "As decimals, $-\\frac{1}{2} = -0.5$ and $-\\frac{3}{4} = -0.75$; since $-0.5 > -0.75$, the greater fraction is $-\\frac{1}{2}$."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "Order these numbers from least to greatest: $-0.5$, $-0.05$, $-5$.",
      "choices": [
        {
          "text": "$-5, -0.5, -0.05$",
          "is_correct": true
        },
        {
          "text": "$-0.05, -0.5, -5$",
          "is_correct": false,
          "misconception_token": "greatest-to-least"
        },
        {
          "text": "$-5, -0.05, -0.5$",
          "is_correct": false,
          "misconception_token": "misordered-small-decimals"
        },
        {
          "text": "$-0.5, -0.05, -5$",
          "is_correct": false,
          "misconception_token": "ordered-ignoring-place-value"
        }
      ],
      "solution": "The most negative value is least: $-5 < -0.5 < -0.05$, so least to greatest is $-5, -0.5, -0.05$."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "Maria owes her brother $15$ dollars and owes her friend $8$ dollars. Which integer represents her total debt?",
      "choices": [
        {
          "text": "$-23$",
          "is_correct": true
        },
        {
          "text": "$23$",
          "is_correct": false,
          "misconception_token": "ignored-debt-is-negative"
        },
        {
          "text": "$-7$",
          "is_correct": false,
          "misconception_token": "combined-as-difference"
        },
        {
          "text": "$7$",
          "is_correct": false,
          "misconception_token": "subtracted-and-dropped-sign"
        }
      ],
      "solution": "Both amounts are money owed, so they add as negatives: $-15 + (-8) = -23$."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "What is the distance between $-4$ and $3$ on a number line?",
      "choices": [
        {
          "text": "$7$",
          "is_correct": true
        },
        {
          "text": "$1$",
          "is_correct": false,
          "misconception_token": "subtracted-absolute-values"
        },
        {
          "text": "$-1$",
          "is_correct": false,
          "misconception_token": "added-signed-values"
        },
        {
          "text": "$12$",
          "is_correct": false,
          "misconception_token": "multiplied-the-numbers"
        }
      ],
      "solution": "Distance is the absolute difference: $|3 - (-4)| = |7| = 7$."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "At midnight the temperature was $-6$ degrees in Denver and $-10$ degrees in Fargo. Which city was colder?",
      "choices": [
        {
          "text": "Fargo",
          "is_correct": true
        },
        {
          "text": "Denver",
          "is_correct": false,
          "misconception_token": "compared-magnitudes-reversed"
        },
        {
          "text": "They were equally cold",
          "is_correct": false,
          "misconception_token": "treated-as-equal"
        },
        {
          "text": "Not enough information",
          "is_correct": false,
          "misconception_token": "thought-negatives-incomparable"
        }
      ],
      "solution": "Colder means a lower temperature; since $-10 < -6$, Fargo was colder."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "Evaluate $|3 - 8|$.",
      "choices": [
        {
          "text": "$5$",
          "is_correct": true
        },
        {
          "text": "$-5$",
          "is_correct": false,
          "misconception_token": "ignored-absolute-value"
        },
        {
          "text": "$11$",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracted"
        },
        {
          "text": "$-11$",
          "is_correct": false,
          "misconception_token": "negated-the-sum"
        }
      ],
      "solution": "First $3 - 8 = -5$, then $|-5| = 5$."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "Point A is at $-3$ and point B is at $-7$ on a number line. Which point is closer to $0$?",
      "choices": [
        {
          "text": "Point A",
          "is_correct": true
        },
        {
          "text": "Point B",
          "is_correct": false,
          "misconception_token": "larger-magnitude-is-closer"
        },
        {
          "text": "Both are equally close",
          "is_correct": false,
          "misconception_token": "treated-as-equal"
        },
        {
          "text": "Point B, because $-7 > -3$",
          "is_correct": false,
          "misconception_token": "misordered-negatives"
        }
      ],
      "solution": "Distance from $0$ is the absolute value: $|-3| = 3$ and $|-7| = 7$; since $3 < 7$, point A is closer to $0$."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "Order these numbers from least to greatest: $-\\frac{1}{2}$, $0.25$, $-1$, $\\frac{3}{4}$.",
      "choices": [
        {
          "text": "$-1, -\\frac{1}{2}, 0.25, \\frac{3}{4}$",
          "is_correct": true
        },
        {
          "text": "$-\\frac{1}{2}, -1, 0.25, \\frac{3}{4}$",
          "is_correct": false,
          "misconception_token": "ordered-negatives-by-magnitude"
        },
        {
          "text": "$-1, -\\frac{1}{2}, \\frac{3}{4}, 0.25$",
          "is_correct": false,
          "misconception_token": "misordered-decimal-and-fraction"
        },
        {
          "text": "$\\frac{3}{4}, 0.25, -\\frac{1}{2}, -1$",
          "is_correct": false,
          "misconception_token": "greatest-to-least"
        }
      ],
      "solution": "As decimals these are $-0.5, 0.25, -1, 0.75$, so from least to greatest: $-1, -\\frac{1}{2}, 0.25, \\frac{3}{4}$."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "Devon's bank account is at $-45$ dollars. He deposits $30$ dollars and then is charged a $12$ dollar fee. What is his balance?",
      "choices": [
        {
          "text": "$-27$",
          "is_correct": true
        },
        {
          "text": "$-3$",
          "is_correct": false,
          "misconception_token": "added-fee-instead-of-subtracting"
        },
        {
          "text": "$27$",
          "is_correct": false,
          "misconception_token": "dropped-negative-sign"
        },
        {
          "text": "$-87$",
          "is_correct": false,
          "misconception_token": "subtracted-the-deposit"
        }
      ],
      "solution": "Start at $-45$, add the deposit, then subtract the fee: $-45 + 30 - 12 = -27$."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "The peak of a mountain is 1,200 feet above sea level. The bottom of a nearby trench is 850 feet below sea level. What is the difference in elevation between them?",
      "choices": [
        {
          "text": "$2050$ feet",
          "is_correct": true
        },
        {
          "text": "$350$ feet",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-adding"
        },
        {
          "text": "$-2050$ feet",
          "is_correct": false,
          "misconception_token": "kept-negative-sign"
        },
        {
          "text": "$1200$ feet",
          "is_correct": false,
          "misconception_token": "ignored-the-trench"
        }
      ],
      "solution": "The trench is at $-850$ feet, so the difference is $1200 - (-850) = 1200 + 850 = 2050$ feet."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "Which statement is true?",
      "choices": [
        {
          "text": "$-8 < -3$",
          "is_correct": true
        },
        {
          "text": "$-8 > -3$",
          "is_correct": false,
          "misconception_token": "larger-magnitude-is-greater"
        },
        {
          "text": "$|-8| < |-3|$",
          "is_correct": false,
          "misconception_token": "compared-magnitudes-wrong"
        },
        {
          "text": "$-3 < -8$",
          "is_correct": false,
          "misconception_token": "reversed-inequality"
        }
      ],
      "solution": "On a number line $-8$ is to the left of $-3$, so $-8 < -3$ is the true statement."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "At $6$ a.m. the temperature was $-4$ degrees. It rose $3$ degrees each hour for $3$ hours, then dropped $2$ degrees. What was the final temperature?",
      "choices": [
        {
          "text": "$3$ degrees",
          "is_correct": true
        },
        {
          "text": "$-3$ degrees",
          "is_correct": false,
          "misconception_token": "applied-rise-once"
        },
        {
          "text": "$11$ degrees",
          "is_correct": false,
          "misconception_token": "ignored-starting-negative"
        },
        {
          "text": "$-15$ degrees",
          "is_correct": false,
          "misconception_token": "subtracted-the-rise"
        }
      ],
      "solution": "The total rise is $3 \\times 3 = 9$ degrees, so $-4 + 9 - 2 = 3$ degrees."
    }
  ],
}

const DIVIDE_FRACTIONS: GapMathSkill = {
  slug: "divide-fractions",
  name: "Dividing Fractions",
  subject: 'math',
  ccssGrade: "6",
  ccssGradeNum: 6,
  ccssCode: "CCSS.MATH.CONTENT.6.NS.A.1",
  satAlignment: "problem-solving-data-analysis",
  gradeBand: "6-8",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "What is $\\frac{1}{2} \\div \\frac{1}{4}$?",
      "choices": [
        {
          "text": "$2$",
          "is_correct": true
        },
        {
          "text": "$\\frac{1}{8}$",
          "is_correct": false,
          "misconception_token": "multiplied-instead"
        },
        {
          "text": "$\\frac{1}{2}$",
          "is_correct": false,
          "misconception_token": "flipped-dividend"
        },
        {
          "text": "$8$",
          "is_correct": false,
          "misconception_token": "flipped-both-fractions"
        }
      ],
      "solution": "Multiply by the reciprocal: $\\frac{1}{2} \\div \\frac{1}{4} = \\frac{1}{2} \\times \\frac{4}{1} = \\frac{4}{2} = 2$."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "What is $\\frac{3}{4} \\div \\frac{1}{2}$?",
      "choices": [
        {
          "text": "$\\frac{3}{2}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{3}{8}$",
          "is_correct": false,
          "misconception_token": "multiplied-instead"
        },
        {
          "text": "$\\frac{2}{3}$",
          "is_correct": false,
          "misconception_token": "flipped-dividend"
        },
        {
          "text": "$\\frac{8}{3}$",
          "is_correct": false,
          "misconception_token": "flipped-both-fractions"
        }
      ],
      "solution": "Multiply by the reciprocal: $\\frac{3}{4} \\times \\frac{2}{1} = \\frac{6}{4} = \\frac{3}{2}$."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "What is $\\frac{2}{3} \\div \\frac{4}{5}$?",
      "choices": [
        {
          "text": "$\\frac{5}{6}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{8}{15}$",
          "is_correct": false,
          "misconception_token": "multiplied-instead"
        },
        {
          "text": "$\\frac{6}{5}$",
          "is_correct": false,
          "misconception_token": "flipped-dividend"
        },
        {
          "text": "$\\frac{15}{8}$",
          "is_correct": false,
          "misconception_token": "flipped-both-fractions"
        }
      ],
      "solution": "Multiply by the reciprocal: $\\frac{2}{3} \\times \\frac{5}{4} = \\frac{10}{12} = \\frac{5}{6}$."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "What is $\\frac{5}{6} \\div \\frac{5}{12}$?",
      "choices": [
        {
          "text": "$2$",
          "is_correct": true
        },
        {
          "text": "$\\frac{25}{72}$",
          "is_correct": false,
          "misconception_token": "multiplied-instead"
        },
        {
          "text": "$\\frac{1}{2}$",
          "is_correct": false,
          "misconception_token": "flipped-dividend"
        },
        {
          "text": "$\\frac{72}{25}$",
          "is_correct": false,
          "misconception_token": "flipped-both-fractions"
        }
      ],
      "solution": "Multiply by the reciprocal: $\\frac{5}{6} \\times \\frac{12}{5} = \\frac{60}{30} = 2$."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "What is $\\frac{7}{8} \\div \\frac{1}{4}$?",
      "choices": [
        {
          "text": "$\\frac{7}{2}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{7}{32}$",
          "is_correct": false,
          "misconception_token": "multiplied-instead"
        },
        {
          "text": "$\\frac{2}{7}$",
          "is_correct": false,
          "misconception_token": "flipped-dividend"
        },
        {
          "text": "$\\frac{32}{7}$",
          "is_correct": false,
          "misconception_token": "flipped-both-fractions"
        }
      ],
      "solution": "Multiply by the reciprocal: $\\frac{7}{8} \\times \\frac{4}{1} = \\frac{28}{8} = \\frac{7}{2}$."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "What is $\\frac{3}{5} \\div \\frac{9}{10}$?",
      "choices": [
        {
          "text": "$\\frac{2}{3}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{27}{50}$",
          "is_correct": false,
          "misconception_token": "multiplied-instead"
        },
        {
          "text": "$\\frac{3}{2}$",
          "is_correct": false,
          "misconception_token": "flipped-dividend"
        },
        {
          "text": "$\\frac{50}{27}$",
          "is_correct": false,
          "misconception_token": "flipped-both-fractions"
        }
      ],
      "solution": "Multiply by the reciprocal: $\\frac{3}{5} \\times \\frac{10}{9} = \\frac{30}{45} = \\frac{2}{3}$."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "A recipe uses $\\frac{1}{3}$ cup of flour for one batch. How many batches can be made with $\\frac{2}{3}$ cup of flour?",
      "choices": [
        {
          "text": "$2$",
          "is_correct": true
        },
        {
          "text": "$\\frac{2}{9}$",
          "is_correct": false,
          "misconception_token": "multiplied-instead"
        },
        {
          "text": "$\\frac{1}{3}$",
          "is_correct": false,
          "misconception_token": "subtracted-instead"
        },
        {
          "text": "$\\frac{1}{2}$",
          "is_correct": false,
          "misconception_token": "flipped-dividend"
        }
      ],
      "solution": "Divide the total by the amount per batch: $\\frac{2}{3} \\div \\frac{1}{3} = \\frac{2}{3} \\times \\frac{3}{1} = 2$ batches."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "What is $\\frac{4}{9} \\div \\frac{2}{3}$?",
      "choices": [
        {
          "text": "$\\frac{2}{3}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{8}{27}$",
          "is_correct": false,
          "misconception_token": "multiplied-instead"
        },
        {
          "text": "$\\frac{3}{2}$",
          "is_correct": false,
          "misconception_token": "flipped-dividend"
        },
        {
          "text": "$\\frac{27}{8}$",
          "is_correct": false,
          "misconception_token": "flipped-both-fractions"
        }
      ],
      "solution": "Multiply by the reciprocal: $\\frac{4}{9} \\times \\frac{3}{2} = \\frac{12}{18} = \\frac{2}{3}$."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "What is $2\\frac{1}{2} \\div \\frac{1}{4}$?",
      "choices": [
        {
          "text": "$10$",
          "is_correct": true
        },
        {
          "text": "$\\frac{5}{8}$",
          "is_correct": false,
          "misconception_token": "multiplied-instead"
        },
        {
          "text": "$4$",
          "is_correct": false,
          "misconception_token": "ignored-whole-number"
        },
        {
          "text": "$\\frac{8}{5}$",
          "is_correct": false,
          "misconception_token": "flipped-dividend"
        }
      ],
      "solution": "Write the mixed number as $\\frac{5}{2}$, then multiply by the reciprocal: $\\frac{5}{2} \\times \\frac{4}{1} = \\frac{20}{2} = 10$."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "What is $3\\frac{1}{3} \\div \\frac{5}{6}$?",
      "choices": [
        {
          "text": "$4$",
          "is_correct": true
        },
        {
          "text": "$\\frac{25}{9}$",
          "is_correct": false,
          "misconception_token": "multiplied-instead"
        },
        {
          "text": "$\\frac{9}{25}$",
          "is_correct": false,
          "misconception_token": "flipped-dividend"
        },
        {
          "text": "$\\frac{1}{4}$",
          "is_correct": false,
          "misconception_token": "flipped-both-fractions"
        }
      ],
      "solution": "Write $3\\frac{1}{3}$ as $\\frac{10}{3}$: $\\frac{10}{3} \\times \\frac{6}{5} = \\frac{60}{15} = 4$."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "A bag holds $\\frac{3}{4}$ pound of trail mix. If each serving is $\\frac{1}{8}$ pound, how many servings are in the bag?",
      "choices": [
        {
          "text": "$6$",
          "is_correct": true
        },
        {
          "text": "$\\frac{3}{32}$",
          "is_correct": false,
          "misconception_token": "multiplied-instead"
        },
        {
          "text": "$\\frac{1}{6}$",
          "is_correct": false,
          "misconception_token": "flipped-dividend"
        },
        {
          "text": "$\\frac{5}{8}$",
          "is_correct": false,
          "misconception_token": "subtracted-instead"
        }
      ],
      "solution": "Divide the total by the serving size: $\\frac{3}{4} \\div \\frac{1}{8} = \\frac{3}{4} \\times \\frac{8}{1} = 6$ servings."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "What is $\\frac{5}{8} \\div 2\\frac{1}{2}$?",
      "choices": [
        {
          "text": "$\\frac{1}{4}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{25}{16}$",
          "is_correct": false,
          "misconception_token": "multiplied-instead"
        },
        {
          "text": "$\\frac{16}{25}$",
          "is_correct": false,
          "misconception_token": "flipped-dividend"
        },
        {
          "text": "$4$",
          "is_correct": false,
          "misconception_token": "flipped-both-fractions"
        }
      ],
      "solution": "Write $2\\frac{1}{2}$ as $\\frac{5}{2}$: $\\frac{5}{8} \\times \\frac{2}{5} = \\frac{10}{40} = \\frac{1}{4}$."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "The equation $\\frac{3}{4} \\div \\frac{1}{8} = 6$ correctly describes which situation?",
      "choices": [
        {
          "text": "The number of $\\frac{1}{8}$-sized pieces that fit into $\\frac{3}{4}$",
          "is_correct": true
        },
        {
          "text": "The size of each part when $\\frac{1}{8}$ is split into $6$ equal groups",
          "is_correct": false,
          "misconception_token": "reversed-dividend-divisor"
        },
        {
          "text": "The size of each part when $\\frac{3}{4}$ is split into $8$ equal parts",
          "is_correct": false,
          "misconception_token": "divided-by-denominator"
        },
        {
          "text": "The result of adding $\\frac{3}{4}$ to itself $\\frac{1}{8}$ times",
          "is_correct": false,
          "misconception_token": "addition-interpretation"
        }
      ],
      "solution": "Dividing $\\frac{3}{4}$ by $\\frac{1}{8}$ asks how many $\\frac{1}{8}$s are in $\\frac{3}{4}$; since $\\frac{3}{4} \\times \\frac{8}{1} = 6$, there are $6$ such pieces."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "A ribbon is $4\\frac{1}{2}$ feet long. Each bow uses $\\frac{3}{4}$ foot of ribbon. How many bows can be made?",
      "choices": [
        {
          "text": "$6$",
          "is_correct": true
        },
        {
          "text": "$\\frac{27}{8}$",
          "is_correct": false,
          "misconception_token": "multiplied-instead"
        },
        {
          "text": "$\\frac{8}{27}$",
          "is_correct": false,
          "misconception_token": "flipped-dividend"
        },
        {
          "text": "$\\frac{1}{6}$",
          "is_correct": false,
          "misconception_token": "flipped-both-fractions"
        }
      ],
      "solution": "Write $4\\frac{1}{2}$ as $\\frac{9}{2}$: $\\frac{9}{2} \\div \\frac{3}{4} = \\frac{9}{2} \\times \\frac{4}{3} = \\frac{36}{6} = 6$ bows."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "What is $\\frac{9}{10} \\div \\frac{3}{5}$?",
      "choices": [
        {
          "text": "$\\frac{3}{2}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{27}{50}$",
          "is_correct": false,
          "misconception_token": "multiplied-instead"
        },
        {
          "text": "$\\frac{50}{27}$",
          "is_correct": false,
          "misconception_token": "flipped-dividend"
        },
        {
          "text": "$\\frac{2}{3}$",
          "is_correct": false,
          "misconception_token": "flipped-both-fractions"
        }
      ],
      "solution": "Multiply by the reciprocal: $\\frac{9}{10} \\times \\frac{5}{3} = \\frac{45}{30} = \\frac{3}{2}$."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "What is $1\\frac{1}{5} \\div 2\\frac{2}{5}$?",
      "choices": [
        {
          "text": "$\\frac{1}{2}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{72}{25}$",
          "is_correct": false,
          "misconception_token": "multiplied-instead"
        },
        {
          "text": "$\\frac{25}{72}$",
          "is_correct": false,
          "misconception_token": "flipped-dividend"
        },
        {
          "text": "$2$",
          "is_correct": false,
          "misconception_token": "flipped-both-fractions"
        }
      ],
      "solution": "Write both as improper fractions: $\\frac{6}{5} \\div \\frac{12}{5} = \\frac{6}{5} \\times \\frac{5}{12} = \\frac{30}{60} = \\frac{1}{2}$."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "A pitcher holds $7\\frac{1}{2}$ cups of juice. Each glass holds $\\frac{5}{8}$ cup. How many full glasses can be poured?",
      "choices": [
        {
          "text": "$12$",
          "is_correct": true
        },
        {
          "text": "$\\frac{75}{16}$",
          "is_correct": false,
          "misconception_token": "multiplied-instead"
        },
        {
          "text": "$\\frac{16}{75}$",
          "is_correct": false,
          "misconception_token": "flipped-dividend"
        },
        {
          "text": "$\\frac{1}{12}$",
          "is_correct": false,
          "misconception_token": "flipped-both-fractions"
        }
      ],
      "solution": "Write $7\\frac{1}{2}$ as $\\frac{15}{2}$: $\\frac{15}{2} \\div \\frac{5}{8} = \\frac{15}{2} \\times \\frac{8}{5} = \\frac{120}{10} = 12$ glasses."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "What is $5\\frac{1}{4} \\div 1\\frac{3}{4}$?",
      "choices": [
        {
          "text": "$3$",
          "is_correct": true
        },
        {
          "text": "$\\frac{147}{16}$",
          "is_correct": false,
          "misconception_token": "multiplied-instead"
        },
        {
          "text": "$\\frac{16}{147}$",
          "is_correct": false,
          "misconception_token": "flipped-dividend"
        },
        {
          "text": "$\\frac{1}{3}$",
          "is_correct": false,
          "misconception_token": "flipped-both-fractions"
        }
      ],
      "solution": "Write both as improper fractions: $\\frac{21}{4} \\div \\frac{7}{4} = \\frac{21}{4} \\times \\frac{4}{7} = \\frac{84}{28} = 3$."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "There is $\\frac{7}{8}$ of a pan of cornbread left. Each person is served $\\frac{7}{16}$ of a pan. How many people can be served?",
      "choices": [
        {
          "text": "$2$",
          "is_correct": true
        },
        {
          "text": "$\\frac{49}{128}$",
          "is_correct": false,
          "misconception_token": "multiplied-instead"
        },
        {
          "text": "$\\frac{128}{49}$",
          "is_correct": false,
          "misconception_token": "flipped-dividend"
        },
        {
          "text": "$\\frac{1}{2}$",
          "is_correct": false,
          "misconception_token": "flipped-both-fractions"
        }
      ],
      "solution": "Divide the amount left by the serving size: $\\frac{7}{8} \\div \\frac{7}{16} = \\frac{7}{8} \\times \\frac{16}{7} = \\frac{112}{56} = 2$ people."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "A board is $10\\frac{1}{2}$ feet long. After $\\frac{3}{4}$ foot is trimmed off and discarded, the rest is cut into $\\frac{3}{4}$-foot pieces. How many pieces are made?",
      "choices": [
        {
          "text": "$13$",
          "is_correct": true
        },
        {
          "text": "$14$",
          "is_correct": false,
          "misconception_token": "skipped-the-trim-step"
        },
        {
          "text": "$\\frac{117}{16}$",
          "is_correct": false,
          "misconception_token": "multiplied-instead"
        },
        {
          "text": "$\\frac{16}{117}$",
          "is_correct": false,
          "misconception_token": "flipped-dividend"
        }
      ],
      "solution": "First subtract the trim: $10\\frac{1}{2} - \\frac{3}{4} = \\frac{42}{4} - \\frac{3}{4} = \\frac{39}{4}$. Then $\\frac{39}{4} \\div \\frac{3}{4} = \\frac{39}{4} \\times \\frac{4}{3} = \\frac{39}{3} = 13$ pieces."
    }
  ],
}

const ONE_STEP_EQUATIONS: GapMathSkill = {
  slug: "one-step-equations",
  name: "One-Step Equations",
  subject: 'math',
  ccssGrade: "6",
  ccssGradeNum: 6,
  ccssCode: "CCSS.MATH.CONTENT.6.EE.B.7",
  satAlignment: "algebra",
  gradeBand: "6-8",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "Solve for $x$: $x + 7 = 12$.",
      "choices": [
        {
          "text": "5",
          "is_correct": true
        },
        {
          "text": "19",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracting"
        },
        {
          "text": "-5",
          "is_correct": false,
          "misconception_token": "subtracted-in-wrong-order"
        },
        {
          "text": "84",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-subtracting"
        }
      ],
      "solution": "Subtract 7 from both sides: $x = 12 - 7 = 5$."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "Solve for $x$: $5x = 40$.",
      "choices": [
        {
          "text": "200",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-dividing"
        },
        {
          "text": "8",
          "is_correct": true
        },
        {
          "text": "35",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-dividing"
        },
        {
          "text": "45",
          "is_correct": false,
          "misconception_token": "added-instead-of-dividing"
        }
      ],
      "solution": "Divide both sides by 5: $x = 40 \\div 5 = 8$."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "Solve for $x$: $3x = 21$.",
      "choices": [
        {
          "text": "7",
          "is_correct": true
        },
        {
          "text": "63",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-dividing"
        },
        {
          "text": "18",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-dividing"
        },
        {
          "text": "24",
          "is_correct": false,
          "misconception_token": "added-instead-of-dividing"
        }
      ],
      "solution": "Divide both sides by 3: $x = 21 \\div 3 = 7$."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "Solve for $x$: $x + 12 = 30$.",
      "choices": [
        {
          "text": "42",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracting"
        },
        {
          "text": "-18",
          "is_correct": false,
          "misconception_token": "subtracted-in-wrong-order"
        },
        {
          "text": "18",
          "is_correct": true
        },
        {
          "text": "360",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-subtracting"
        }
      ],
      "solution": "Subtract 12 from both sides: $x = 30 - 12 = 18$."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "Solve for $x$: $9x = 72$.",
      "choices": [
        {
          "text": "648",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-dividing"
        },
        {
          "text": "63",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-dividing"
        },
        {
          "text": "8",
          "is_correct": true
        },
        {
          "text": "81",
          "is_correct": false,
          "misconception_token": "added-instead-of-dividing"
        }
      ],
      "solution": "Divide both sides by 9: $x = 72 \\div 9 = 8$."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "Solve for $x$: $x + 15 = 40$.",
      "choices": [
        {
          "text": "25",
          "is_correct": true
        },
        {
          "text": "55",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracting"
        },
        {
          "text": "-25",
          "is_correct": false,
          "misconception_token": "subtracted-in-wrong-order"
        },
        {
          "text": "600",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-subtracting"
        }
      ],
      "solution": "Subtract 15 from both sides: $x = 40 - 15 = 25$."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "Solve for $x$: $6x = 54$.",
      "choices": [
        {
          "text": "324",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-dividing"
        },
        {
          "text": "9",
          "is_correct": true
        },
        {
          "text": "48",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-dividing"
        },
        {
          "text": "60",
          "is_correct": false,
          "misconception_token": "added-instead-of-dividing"
        }
      ],
      "solution": "Divide both sides by 6: $x = 54 \\div 6 = 9$."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "Solve for $x$: $8x = 64$.",
      "choices": [
        {
          "text": "72",
          "is_correct": false,
          "misconception_token": "added-instead-of-dividing"
        },
        {
          "text": "56",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-dividing"
        },
        {
          "text": "8",
          "is_correct": true
        },
        {
          "text": "512",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-dividing"
        }
      ],
      "solution": "Divide both sides by 8: $x = 64 \\div 8 = 8$."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "Solve for $x$: $2.5x = 10$.",
      "choices": [
        {
          "text": "4",
          "is_correct": true
        },
        {
          "text": "25",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-dividing"
        },
        {
          "text": "7.5",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-dividing"
        },
        {
          "text": "12.5",
          "is_correct": false,
          "misconception_token": "added-instead-of-dividing"
        }
      ],
      "solution": "Divide both sides by 2.5: $x = 10 \\div 2.5 = 4$."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "Solve for $x$: $x + \\frac{1}{3} = \\frac{5}{6}$.",
      "choices": [
        {
          "text": "$\\frac{1}{2}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{7}{6}$",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracting"
        },
        {
          "text": "$\\frac{4}{3}$",
          "is_correct": false,
          "misconception_token": "subtracted-tops-and-bottoms"
        },
        {
          "text": "$\\frac{2}{3}$",
          "is_correct": false,
          "misconception_token": "skipped-common-denominator"
        }
      ],
      "solution": "Subtract $\\frac{1}{3}$ from both sides: $x = \\frac{5}{6} - \\frac{2}{6} = \\frac{3}{6} = \\frac{1}{2}$."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "Kevin bought 6 identical notebooks for 18 dollars in all. If $x$ is the cost of one notebook, then $6x = 18$. How much does one notebook cost?",
      "choices": [
        {
          "text": "3 dollars",
          "is_correct": true
        },
        {
          "text": "108 dollars",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-dividing"
        },
        {
          "text": "24 dollars",
          "is_correct": false,
          "misconception_token": "added-instead-of-dividing"
        },
        {
          "text": "12 dollars",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-dividing"
        }
      ],
      "solution": "Divide both sides by 6: $x = 18 \\div 6 = 3$, so one notebook costs 3 dollars."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "After depositing 45 dollars, Ana's account balance is 120 dollars. If $x$ is her starting balance, then $x + 45 = 120$. What was her starting balance?",
      "choices": [
        {
          "text": "165 dollars",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracting"
        },
        {
          "text": "75 dollars",
          "is_correct": true
        },
        {
          "text": "-75 dollars",
          "is_correct": false,
          "misconception_token": "subtracted-in-wrong-order"
        },
        {
          "text": "5400 dollars",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-subtracting"
        }
      ],
      "solution": "Subtract 45 from both sides: $x = 120 - 45 = 75$, so her starting balance was 75 dollars."
    },
    {
      "slot": 13,
      "difficulty": "medium",
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
          "text": "24",
          "is_correct": false,
          "misconception_token": "multiplied-by-denominator-only"
        },
        {
          "text": "4",
          "is_correct": false,
          "misconception_token": "divided-by-numerator-only"
        }
      ],
      "solution": "Multiply both sides by the reciprocal $\\frac{3}{2}$: $x = 8 \\times \\frac{3}{2} = 12$."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "Solve for $x$: $x + 6.4 = 10$.",
      "choices": [
        {
          "text": "16.4",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracting"
        },
        {
          "text": "3.6",
          "is_correct": true
        },
        {
          "text": "-3.6",
          "is_correct": false,
          "misconception_token": "subtracted-in-wrong-order"
        },
        {
          "text": "64",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-subtracting"
        }
      ],
      "solution": "Subtract 6.4 from both sides: $x = 10 - 6.4 = 3.6$."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "A car travels at a constant 60 miles per hour and covers 240 miles in $x$ hours, so $60x = 240$. How many hours did it travel?",
      "choices": [
        {
          "text": "4",
          "is_correct": true
        },
        {
          "text": "14400",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-dividing"
        },
        {
          "text": "300",
          "is_correct": false,
          "misconception_token": "added-instead-of-dividing"
        },
        {
          "text": "180",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-dividing"
        }
      ],
      "solution": "Divide both sides by 60: $x = 240 \\div 60 = 4$, so the car traveled 4 hours."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "Which equation represents: seven more than a number $n$ is 22?",
      "choices": [
        {
          "text": "$n + 7 = 22$",
          "is_correct": true
        },
        {
          "text": "$7n = 22$",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-adding"
        },
        {
          "text": "$n - 7 = 22$",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-adding"
        },
        {
          "text": "$n + 22 = 7$",
          "is_correct": false,
          "misconception_token": "reversed-the-equation"
        }
      ],
      "solution": "Seven more than $n$ means $n + 7$, and it equals 22, so the equation is $n + 7 = 22$."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "Solve for $x$: $\\frac{3}{4}x = \\frac{9}{8}$.",
      "choices": [
        {
          "text": "$\\frac{3}{2}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{27}{32}$",
          "is_correct": false,
          "misconception_token": "multiplied-by-fraction-not-reciprocal"
        },
        {
          "text": "$\\frac{27}{8}$",
          "is_correct": false,
          "misconception_token": "multiplied-by-numerator-only"
        },
        {
          "text": "$\\frac{3}{8}$",
          "is_correct": false,
          "misconception_token": "subtracted-the-coefficient"
        }
      ],
      "solution": "Multiply both sides by the reciprocal $\\frac{4}{3}$: $x = \\frac{9}{8} \\times \\frac{4}{3} = \\frac{36}{24} = \\frac{3}{2}$."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "A recipe needs 2.75 cups of flour in total. After adding some flour, you add 0.8 cup more to reach the full amount. If $x$ is the amount you added first, then $x + 0.8 = 2.75$. How much did you add first?",
      "choices": [
        {
          "text": "1.95 cups",
          "is_correct": true
        },
        {
          "text": "3.55 cups",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracting"
        },
        {
          "text": "-1.95 cups",
          "is_correct": false,
          "misconception_token": "subtracted-in-wrong-order"
        },
        {
          "text": "2.2 cups",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-subtracting"
        }
      ],
      "solution": "Subtract 0.8 from both sides: $x = 2.75 - 0.8 = 1.95$, so you added 1.95 cups first."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "A trail is divided into equal segments, each $\\frac{2}{5}$ of a mile long, and the whole trail is 6 miles. If $x$ is the number of segments, then $\\frac{2}{5}x = 6$. How many segments are there?",
      "choices": [
        {
          "text": "15",
          "is_correct": true
        },
        {
          "text": "$\\frac{12}{5}$",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-dividing"
        },
        {
          "text": "30",
          "is_correct": false,
          "misconception_token": "multiplied-by-denominator-only"
        },
        {
          "text": "3",
          "is_correct": false,
          "misconception_token": "divided-by-numerator-only"
        }
      ],
      "solution": "Multiply both sides by the reciprocal $\\frac{5}{2}$: $x = 6 \\times \\frac{5}{2} = 15$ segments."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "Priya bought tickets that cost 2.50 dollars each and spent 17.50 dollars in all. If $x$ is the number of tickets, then $2.5x = 17.5$. How many tickets did she buy?",
      "choices": [
        {
          "text": "43.75",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-dividing"
        },
        {
          "text": "20",
          "is_correct": false,
          "misconception_token": "added-instead-of-dividing"
        },
        {
          "text": "7",
          "is_correct": true
        },
        {
          "text": "15",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-dividing"
        }
      ],
      "solution": "Divide both sides by 2.5: $x = 17.5 \\div 2.5 = 7$, so she bought 7 tickets."
    }
  ],
}

const AREA_SURFACE_VOLUME_6: GapMathSkill = {
  slug: "area-surface-volume-6",
  name: "Area, Surface Area & Volume",
  subject: 'math',
  ccssGrade: "6",
  ccssGradeNum: 6,
  ccssCode: "CCSS.MATH.CONTENT.6.G.A.1",
  satAlignment: "geometry-trigonometry",
  gradeBand: "6-8",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "A parallelogram has a base of $8$ cm and a height of $5$ cm. What is its area in square centimeters?",
      "choices": [
        {
          "text": "40",
          "is_correct": true
        },
        {
          "text": "20",
          "is_correct": false,
          "misconception_token": "halved-like-triangle"
        },
        {
          "text": "13",
          "is_correct": false,
          "misconception_token": "added-base-height"
        },
        {
          "text": "26",
          "is_correct": false,
          "misconception_token": "used-perimeter"
        }
      ],
      "solution": "Area of a parallelogram is base times height: $8 \\times 5 = 40$ square centimeters."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "A triangle has a base of $6$ in and a height of $4$ in. What is its area in square inches?",
      "choices": [
        {
          "text": "12",
          "is_correct": true
        },
        {
          "text": "24",
          "is_correct": false,
          "misconception_token": "forgot-to-halve"
        },
        {
          "text": "10",
          "is_correct": false,
          "misconception_token": "added-base-height"
        },
        {
          "text": "5",
          "is_correct": false,
          "misconception_token": "halved-sum"
        }
      ],
      "solution": "Area of a triangle is $\\frac{1}{2} \\times 6 \\times 4 = 12$ square inches."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "A rectangular prism is $3$ cm long, $4$ cm wide, and $5$ cm tall. What is its volume in cubic centimeters?",
      "choices": [
        {
          "text": "60",
          "is_correct": true
        },
        {
          "text": "12",
          "is_correct": false,
          "misconception_token": "added-edges"
        },
        {
          "text": "20",
          "is_correct": false,
          "misconception_token": "used-two-dimensions"
        },
        {
          "text": "94",
          "is_correct": false,
          "misconception_token": "found-surface-area"
        }
      ],
      "solution": "Volume is length times width times height: $3 \\times 4 \\times 5 = 60$ cubic centimeters."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "A triangle has a base of $10$ m and a height of $3$ m. What is its area in square meters?",
      "choices": [
        {
          "text": "15",
          "is_correct": true
        },
        {
          "text": "30",
          "is_correct": false,
          "misconception_token": "forgot-to-halve"
        },
        {
          "text": "13",
          "is_correct": false,
          "misconception_token": "added-base-height"
        },
        {
          "text": "6.5",
          "is_correct": false,
          "misconception_token": "halved-sum"
        }
      ],
      "solution": "Area of a triangle is $\\frac{1}{2} \\times 10 \\times 3 = 15$ square meters."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "A parallelogram has a base of $12$ ft and a height of $7$ ft. What is its area in square feet?",
      "choices": [
        {
          "text": "84",
          "is_correct": true
        },
        {
          "text": "19",
          "is_correct": false,
          "misconception_token": "added-base-height"
        },
        {
          "text": "38",
          "is_correct": false,
          "misconception_token": "used-perimeter"
        },
        {
          "text": "42",
          "is_correct": false,
          "misconception_token": "halved-like-triangle"
        }
      ],
      "solution": "Area of a parallelogram is base times height: $12 \\times 7 = 84$ square feet."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "A cube has an edge length of $4$ cm. Using its net, what is the total surface area in square centimeters?",
      "choices": [
        {
          "text": "96",
          "is_correct": true
        },
        {
          "text": "16",
          "is_correct": false,
          "misconception_token": "one-face-only"
        },
        {
          "text": "64",
          "is_correct": false,
          "misconception_token": "found-volume"
        },
        {
          "text": "24",
          "is_correct": false,
          "misconception_token": "multiplied-edge-by-six"
        }
      ],
      "solution": "A cube's net has $6$ square faces, each $4 \\times 4 = 16$, so the surface area is $6 \\times 16 = 96$ square centimeters."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "A rectangular prism measures $2$ cm by $5$ cm by $6$ cm. What is its volume in cubic centimeters?",
      "choices": [
        {
          "text": "60",
          "is_correct": true
        },
        {
          "text": "13",
          "is_correct": false,
          "misconception_token": "added-edges"
        },
        {
          "text": "30",
          "is_correct": false,
          "misconception_token": "used-two-dimensions"
        },
        {
          "text": "104",
          "is_correct": false,
          "misconception_token": "found-surface-area"
        }
      ],
      "solution": "Volume is $2 \\times 5 \\times 6 = 60$ cubic centimeters."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "A triangle has a base of $8$ cm and a height of $9$ cm. What is its area in square centimeters?",
      "choices": [
        {
          "text": "36",
          "is_correct": true
        },
        {
          "text": "72",
          "is_correct": false,
          "misconception_token": "forgot-to-halve"
        },
        {
          "text": "17",
          "is_correct": false,
          "misconception_token": "added-base-height"
        },
        {
          "text": "18",
          "is_correct": false,
          "misconception_token": "halved-sum"
        }
      ],
      "solution": "Area of a triangle is $\\frac{1}{2} \\times 8 \\times 9 = 36$ square centimeters."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "A triangular garden has a base of $14$ m and a height of $6$ m. How many square meters of soil are needed to cover it?",
      "choices": [
        {
          "text": "42",
          "is_correct": true
        },
        {
          "text": "84",
          "is_correct": false,
          "misconception_token": "forgot-to-halve"
        },
        {
          "text": "20",
          "is_correct": false,
          "misconception_token": "added-base-height"
        },
        {
          "text": "10",
          "is_correct": false,
          "misconception_token": "halved-sum"
        }
      ],
      "solution": "Area of the triangular garden is $\\frac{1}{2} \\times 14 \\times 6 = 42$ square meters."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "A small box has edge lengths of $\\frac{1}{2}$ ft, $4$ ft, and $3$ ft. What is its volume in cubic feet?",
      "choices": [
        {
          "text": "6",
          "is_correct": true
        },
        {
          "text": "12",
          "is_correct": false,
          "misconception_token": "ignored-fraction"
        },
        {
          "text": "24",
          "is_correct": false,
          "misconception_token": "doubled-instead-of-halved"
        },
        {
          "text": "7.5",
          "is_correct": false,
          "misconception_token": "added-edges"
        }
      ],
      "solution": "Volume is $\\frac{1}{2} \\times 4 \\times 3 = 6$ cubic feet."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "A house-shaped figure is made of a rectangle that is $8$ cm wide and $5$ cm tall with a triangular roof on top that has a base of $8$ cm and a height of $4$ cm. What is the total area in square centimeters?",
      "choices": [
        {
          "text": "56",
          "is_correct": true
        },
        {
          "text": "72",
          "is_correct": false,
          "misconception_token": "triangle-not-halved"
        },
        {
          "text": "40",
          "is_correct": false,
          "misconception_token": "forgot-triangle"
        },
        {
          "text": "16",
          "is_correct": false,
          "misconception_token": "forgot-rectangle"
        }
      ],
      "solution": "The rectangle is $8 \\times 5 = 40$ and the triangle is $\\frac{1}{2} \\times 8 \\times 4 = 16$, so the total is $40 + 16 = 56$ square centimeters."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "A storage box is $5$ ft long, $3$ ft wide, and $2$ ft tall. How many cubic feet of space does it hold?",
      "choices": [
        {
          "text": "30",
          "is_correct": true
        },
        {
          "text": "10",
          "is_correct": false,
          "misconception_token": "added-edges"
        },
        {
          "text": "15",
          "is_correct": false,
          "misconception_token": "used-two-dimensions"
        },
        {
          "text": "62",
          "is_correct": false,
          "misconception_token": "found-surface-area"
        }
      ],
      "solution": "Volume is $5 \\times 3 \\times 2 = 30$ cubic feet."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "A gift box shaped like a rectangular prism is $6$ in by $4$ in by $2$ in. Using its net, how many square inches of wrapping paper cover the whole outside?",
      "choices": [
        {
          "text": "88",
          "is_correct": true
        },
        {
          "text": "48",
          "is_correct": false,
          "misconception_token": "found-volume"
        },
        {
          "text": "44",
          "is_correct": false,
          "misconception_token": "forgot-to-double"
        },
        {
          "text": "24",
          "is_correct": false,
          "misconception_token": "one-face-only"
        }
      ],
      "solution": "Surface area is $2(6 \\times 4 + 6 \\times 2 + 4 \\times 2) = 2(24 + 12 + 8) = 88$ square inches."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "A block has edge lengths of $\\frac{3}{4}$ in, $2$ in, and $4$ in. What is its volume in cubic inches?",
      "choices": [
        {
          "text": "6",
          "is_correct": true
        },
        {
          "text": "8",
          "is_correct": false,
          "misconception_token": "ignored-fraction"
        },
        {
          "text": "6.75",
          "is_correct": false,
          "misconception_token": "added-edges"
        },
        {
          "text": "24",
          "is_correct": false,
          "misconception_token": "used-numerator-only"
        }
      ],
      "solution": "Volume is $\\frac{3}{4} \\times 2 \\times 4 = \\frac{3}{4} \\times 8 = 6$ cubic inches."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "A parking space shaped like a parallelogram has a base of $9$ m and a height of $2.5$ m. What is its area in square meters?",
      "choices": [
        {
          "text": "22.5",
          "is_correct": true
        },
        {
          "text": "11.5",
          "is_correct": false,
          "misconception_token": "added-base-height"
        },
        {
          "text": "23",
          "is_correct": false,
          "misconception_token": "used-perimeter"
        },
        {
          "text": "11.25",
          "is_correct": false,
          "misconception_token": "halved-like-triangle"
        }
      ],
      "solution": "Area of a parallelogram is base times height: $9 \\times 2.5 = 22.5$ square meters."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "An L-shaped room fits inside a $12$ ft by $9$ ft rectangle, but a $5$ ft by $4$ ft rectangular corner is not part of the room. What is the room's floor area in square feet?",
      "choices": [
        {
          "text": "88",
          "is_correct": true
        },
        {
          "text": "108",
          "is_correct": false,
          "misconception_token": "forgot-cutout"
        },
        {
          "text": "128",
          "is_correct": false,
          "misconception_token": "added-cutout"
        },
        {
          "text": "68",
          "is_correct": false,
          "misconception_token": "doubled-cutout"
        }
      ],
      "solution": "The full rectangle is $12 \\times 9 = 108$ and the missing corner is $5 \\times 4 = 20$, so the area is $108 - 20 = 88$ square feet."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "A triangular sign has an area of $54$ square centimeters and a base of $12$ cm. What is its height in centimeters?",
      "choices": [
        {
          "text": "9",
          "is_correct": true
        },
        {
          "text": "4.5",
          "is_correct": false,
          "misconception_token": "forgot-double"
        },
        {
          "text": "108",
          "is_correct": false,
          "misconception_token": "forgot-to-divide"
        },
        {
          "text": "42",
          "is_correct": false,
          "misconception_token": "subtracted-base"
        }
      ],
      "solution": "From $\\frac{1}{2} \\times 12 \\times h = 54$, the height is $h = \\frac{2 \\times 54}{12} = \\frac{108}{12} = 9$ centimeters."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "A fish tank is $30$ cm long, $20$ cm wide, and $25$ cm tall. If $1000$ cubic centimeters equals $1$ liter, how many liters does the full tank hold?",
      "choices": [
        {
          "text": "15",
          "is_correct": true
        },
        {
          "text": "15000",
          "is_correct": false,
          "misconception_token": "forgot-conversion"
        },
        {
          "text": "150",
          "is_correct": false,
          "misconception_token": "divided-by-100"
        },
        {
          "text": "1.5",
          "is_correct": false,
          "misconception_token": "divided-by-10000"
        }
      ],
      "solution": "The volume is $30 \\times 20 \\times 25 = 15000$ cubic centimeters, and $15000 \\div 1000 = 15$ liters."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "A shipping crate shaped like a rectangular prism is $8$ ft by $5$ ft by $3$ ft. How many square feet of cardboard are needed to cover all six faces?",
      "choices": [
        {
          "text": "158",
          "is_correct": true
        },
        {
          "text": "120",
          "is_correct": false,
          "misconception_token": "found-volume"
        },
        {
          "text": "79",
          "is_correct": false,
          "misconception_token": "forgot-to-double"
        },
        {
          "text": "316",
          "is_correct": false,
          "misconception_token": "over-doubled"
        }
      ],
      "solution": "Surface area is $2(8 \\times 5 + 8 \\times 3 + 5 \\times 3) = 2(40 + 24 + 15) = 2 \\times 79 = 158$ square feet."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "A solid concrete block is a $6$ cm by $4$ cm by $2$ cm rectangular prism with a $2$ cm by $2$ cm by $2$ cm cube cut out of one corner. What is the volume of the remaining solid in cubic centimeters?",
      "choices": [
        {
          "text": "40",
          "is_correct": true
        },
        {
          "text": "48",
          "is_correct": false,
          "misconception_token": "forgot-cutout"
        },
        {
          "text": "56",
          "is_correct": false,
          "misconception_token": "added-cutout"
        },
        {
          "text": "32",
          "is_correct": false,
          "misconception_token": "doubled-cutout"
        }
      ],
      "solution": "The full prism is $6 \\times 4 \\times 2 = 48$ and the removed cube is $2 \\times 2 \\times 2 = 8$, so the remaining volume is $48 - 8 = 40$ cubic centimeters."
    }
  ],
}

export const GRADE_5_6_MATH_SKILLS: GapMathSkill[] = [
  DECIMAL_PLACE_VALUE,
  DECIMAL_OPERATIONS,
  MULTIPLY_DIVIDE_WHOLE_5,
  ADD_SUBTRACT_FRACTIONS_UNLIKE,
  MULTIPLY_DIVIDE_FRACTIONS,
  COORDINATE_PLANE,
  NUMERICAL_EXPRESSIONS,
  INTEGERS_RATIONAL_NUMBERS,
  DIVIDE_FRACTIONS,
  ONE_STEP_EQUATIONS,
  AREA_SURFACE_VOLUME_6,
]
