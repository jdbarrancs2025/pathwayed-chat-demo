/**
 * Grade 4 & 8 math (grade-4 core + grade-8 completion) — CURATED POOL (9 skills, 20 items each), same shape
 * and served path as gapMathTemplates.ts. Generated from reviewed authored JSON;
 * every answer key is verified in the morning review before the seed is run.
 */
import type { GapMathSkill } from '@/lib/gapMathTemplates'

const MULTI_DIGIT_MULTIPLICATION: GapMathSkill = {
  slug: "multi-digit-multiplication",
  name: "Multi-Digit Multiplication",
  subject: 'math',
  ccssGrade: "4",
  ccssGradeNum: 4,
  ccssCode: "CCSS.MATH.CONTENT.4.NBT.B.5",
  satAlignment: "problem-solving-data-analysis",
  gradeBand: "3-5",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "What is $3 \\times 24$?",
      "choices": [
        {
          "text": "72",
          "is_correct": true
        },
        {
          "text": "60",
          "is_correct": false,
          "misconception_token": "multiplied-only-tens-place"
        },
        {
          "text": "612",
          "is_correct": false,
          "misconception_token": "concatenated-digit-products"
        },
        {
          "text": "27",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        }
      ],
      "solution": "Break 24 into 20 and 4: $3 \\times 20 = 60$ and $3 \\times 4 = 12$, then $60 + 12 = 72$."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "What is $5 \\times 63$?",
      "choices": [
        {
          "text": "315",
          "is_correct": true
        },
        {
          "text": "305",
          "is_correct": false,
          "misconception_token": "dropped-the-carry"
        },
        {
          "text": "300",
          "is_correct": false,
          "misconception_token": "multiplied-only-tens-place"
        },
        {
          "text": "68",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        }
      ],
      "solution": "Break 63 into 60 and 3: $5 \\times 60 = 300$ and $5 \\times 3 = 15$, then $300 + 15 = 315$."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "What is $6 \\times 48$?",
      "choices": [
        {
          "text": "288",
          "is_correct": true
        },
        {
          "text": "240",
          "is_correct": false,
          "misconception_token": "multiplied-only-tens-place"
        },
        {
          "text": "248",
          "is_correct": false,
          "misconception_token": "dropped-the-carry"
        },
        {
          "text": "2448",
          "is_correct": false,
          "misconception_token": "concatenated-digit-products"
        }
      ],
      "solution": "Break 48 into 40 and 8: $6 \\times 40 = 240$ and $6 \\times 8 = 48$, then $240 + 48 = 288$."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "A box holds 8 crayons. How many crayons are in 34 boxes?",
      "choices": [
        {
          "text": "272",
          "is_correct": true
        },
        {
          "text": "240",
          "is_correct": false,
          "misconception_token": "multiplied-only-tens-place"
        },
        {
          "text": "32",
          "is_correct": false,
          "misconception_token": "multiplied-only-ones-place"
        },
        {
          "text": "42",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        }
      ],
      "solution": "Multiply $8 \\times 34$: $8 \\times 30 = 240$ and $8 \\times 4 = 32$, then $240 + 32 = 272$."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "What is $9 \\times 26$?",
      "choices": [
        {
          "text": "234",
          "is_correct": true
        },
        {
          "text": "180",
          "is_correct": false,
          "misconception_token": "multiplied-only-tens-place"
        },
        {
          "text": "184",
          "is_correct": false,
          "misconception_token": "dropped-the-carry"
        },
        {
          "text": "35",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        }
      ],
      "solution": "Break 26 into 20 and 6: $9 \\times 20 = 180$ and $9 \\times 6 = 54$, then $180 + 54 = 234$."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "Each row in a theater has 7 seats. The theater has 58 rows. How many seats are there in all?",
      "choices": [
        {
          "text": "406",
          "is_correct": true
        },
        {
          "text": "350",
          "is_correct": false,
          "misconception_token": "multiplied-only-tens-place"
        },
        {
          "text": "356",
          "is_correct": false,
          "misconception_token": "dropped-the-carry"
        },
        {
          "text": "65",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        }
      ],
      "solution": "Multiply $7 \\times 58$: $7 \\times 50 = 350$ and $7 \\times 8 = 56$, then $350 + 56 = 406$."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "What is $2 \\times 346$?",
      "choices": [
        {
          "text": "692",
          "is_correct": true
        },
        {
          "text": "682",
          "is_correct": false,
          "misconception_token": "dropped-the-carry"
        },
        {
          "text": "348",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        },
        {
          "text": "6812",
          "is_correct": false,
          "misconception_token": "concatenated-digit-products"
        }
      ],
      "solution": "Break 346 into 300, 40, and 6: $2 \\times 300 = 600$, $2 \\times 40 = 80$, $2 \\times 6 = 12$, then $600 + 80 + 12 = 692$."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "What is $6 \\times 70$?",
      "choices": [
        {
          "text": "420",
          "is_correct": true
        },
        {
          "text": "42",
          "is_correct": false,
          "misconception_token": "dropped-the-place-value-zero"
        },
        {
          "text": "4200",
          "is_correct": false,
          "misconception_token": "added-extra-zero"
        },
        {
          "text": "76",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        }
      ],
      "solution": "Multiply $6 \\times 7 = 42$, then attach the place-value zero from 70: $6 \\times 70 = 420$."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "What is $23 \\times 14$?",
      "choices": [
        {
          "text": "322",
          "is_correct": true
        },
        {
          "text": "115",
          "is_correct": false,
          "misconception_token": "forgot-place-value-shift"
        },
        {
          "text": "92",
          "is_correct": false,
          "misconception_token": "used-only-ones-partial"
        },
        {
          "text": "37",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        }
      ],
      "solution": "Break 14 into 10 and 4: $23 \\times 10 = 230$ and $23 \\times 4 = 92$, then $230 + 92 = 322$."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "What is $46 \\times 25$?",
      "choices": [
        {
          "text": "1150",
          "is_correct": true
        },
        {
          "text": "322",
          "is_correct": false,
          "misconception_token": "forgot-place-value-shift"
        },
        {
          "text": "920",
          "is_correct": false,
          "misconception_token": "used-only-tens-partial"
        },
        {
          "text": "230",
          "is_correct": false,
          "misconception_token": "used-only-ones-partial"
        }
      ],
      "solution": "Break 25 into 20 and 5: $46 \\times 20 = 920$ and $46 \\times 5 = 230$, then $920 + 230 = 1150$."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "A school orders 32 tablets. Each tablet costs 15 dollars. How much do all the tablets cost?",
      "choices": [
        {
          "text": "480 dollars",
          "is_correct": true
        },
        {
          "text": "192 dollars",
          "is_correct": false,
          "misconception_token": "forgot-place-value-shift"
        },
        {
          "text": "320 dollars",
          "is_correct": false,
          "misconception_token": "used-only-tens-partial"
        },
        {
          "text": "47 dollars",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        }
      ],
      "solution": "Multiply $32 \\times 15$: $32 \\times 10 = 320$ and $32 \\times 5 = 160$, then $320 + 160 = 480$, so the cost is 480 dollars."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "What is $7 \\times 1234$?",
      "choices": [
        {
          "text": "8638",
          "is_correct": true
        },
        {
          "text": "7418",
          "is_correct": false,
          "misconception_token": "dropped-the-carry"
        },
        {
          "text": "1638",
          "is_correct": false,
          "misconception_token": "ignored-thousands-digit"
        },
        {
          "text": "1241",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        }
      ],
      "solution": "Break 1234 into 1000, 200, 30, and 4: $7 \\times 1000 = 7000$, $7 \\times 200 = 1400$, $7 \\times 30 = 210$, $7 \\times 4 = 28$, then $7000 + 1400 + 210 + 28 = 8638$."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "A factory makes 268 bottles each hour. How many bottles does it make in 6 hours?",
      "choices": [
        {
          "text": "1608",
          "is_correct": true
        },
        {
          "text": "1268",
          "is_correct": false,
          "misconception_token": "dropped-the-carry"
        },
        {
          "text": "168",
          "is_correct": false,
          "misconception_token": "ignored-hundreds-digit"
        },
        {
          "text": "274",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        }
      ],
      "solution": "Multiply $268 \\times 6$: $200 \\times 6 = 1200$, $60 \\times 6 = 360$, $8 \\times 6 = 48$, then $1200 + 360 + 48 = 1608$."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "What is $58 \\times 37$?",
      "choices": [
        {
          "text": "2146",
          "is_correct": true
        },
        {
          "text": "580",
          "is_correct": false,
          "misconception_token": "forgot-place-value-shift"
        },
        {
          "text": "1740",
          "is_correct": false,
          "misconception_token": "used-only-tens-partial"
        },
        {
          "text": "95",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        }
      ],
      "solution": "Break 37 into 30 and 7: $58 \\times 30 = 1740$ and $58 \\times 7 = 406$, then $1740 + 406 = 2146$."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "A garden has 24 rows of plants with 36 plants in each row. How many plants are in the garden?",
      "choices": [
        {
          "text": "864",
          "is_correct": true
        },
        {
          "text": "216",
          "is_correct": false,
          "misconception_token": "forgot-place-value-shift"
        },
        {
          "text": "720",
          "is_correct": false,
          "misconception_token": "used-only-tens-partial"
        },
        {
          "text": "60",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        }
      ],
      "solution": "Multiply $24 \\times 36$: $24 \\times 30 = 720$ and $24 \\times 6 = 144$, then $720 + 144 = 864$."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "What is $8 \\times 3005$?",
      "choices": [
        {
          "text": "24040",
          "is_correct": true
        },
        {
          "text": "24000",
          "is_correct": false,
          "misconception_token": "dropped-the-carry"
        },
        {
          "text": "280",
          "is_correct": false,
          "misconception_token": "ignored-place-value-zeros"
        },
        {
          "text": "3013",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        }
      ],
      "solution": "Break 3005 into 3000 and 5: $8 \\times 3000 = 24000$ and $8 \\times 5 = 40$, then $24000 + 40 = 24040$."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "What is $67 \\times 48$?",
      "choices": [
        {
          "text": "3216",
          "is_correct": true
        },
        {
          "text": "804",
          "is_correct": false,
          "misconception_token": "forgot-place-value-shift"
        },
        {
          "text": "2680",
          "is_correct": false,
          "misconception_token": "used-only-tens-partial"
        },
        {
          "text": "115",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        }
      ],
      "solution": "Break 48 into 40 and 8: $67 \\times 40 = 2680$ and $67 \\times 8 = 536$, then $2680 + 536 = 3216$."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "A stadium has 48 sections, and each section has 76 seats. If 512 seats are broken, how many seats can be used?",
      "choices": [
        {
          "text": "3136",
          "is_correct": true
        },
        {
          "text": "3648",
          "is_correct": false,
          "misconception_token": "forgot-to-subtract"
        },
        {
          "text": "4160",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracting"
        },
        {
          "text": "112",
          "is_correct": false,
          "misconception_token": "forgot-place-value-shift"
        }
      ],
      "solution": "First multiply $48 \\times 76 = 3648$ total seats, then subtract the broken ones: $3648 - 512 = 3136$."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "A warehouse ships 1875 boxes each day. How many boxes does it ship in 4 days?",
      "choices": [
        {
          "text": "7500",
          "is_correct": true
        },
        {
          "text": "4280",
          "is_correct": false,
          "misconception_token": "dropped-the-carry"
        },
        {
          "text": "3500",
          "is_correct": false,
          "misconception_token": "ignored-thousands-digit"
        },
        {
          "text": "1879",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        }
      ],
      "solution": "Break 1875 into 1000, 800, 70, and 5: $4 \\times 1000 = 4000$, $4 \\times 800 = 3200$, $4 \\times 70 = 280$, $4 \\times 5 = 20$, then $4000 + 3200 + 280 + 20 = 7500$."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "A book fair sells 35 books at 12 dollars each and 18 books at 20 dollars each. How much money does the fair collect in all?",
      "choices": [
        {
          "text": "780 dollars",
          "is_correct": true
        },
        {
          "text": "420 dollars",
          "is_correct": false,
          "misconception_token": "used-only-first-group"
        },
        {
          "text": "360 dollars",
          "is_correct": false,
          "misconception_token": "used-only-second-group"
        },
        {
          "text": "456 dollars",
          "is_correct": false,
          "misconception_token": "dropped-the-place-value-zero"
        }
      ],
      "solution": "Find each group: $35 \\times 12 = 420$ and $18 \\times 20 = 360$, then add: $420 + 360 = 780$, so the fair collects 780 dollars."
    }
  ],
}

const MULTI_DIGIT_DIVISION: GapMathSkill = {
  slug: "multi-digit-division",
  name: "Multi-Digit Division",
  subject: 'math',
  ccssGrade: "4",
  ccssGradeNum: 4,
  ccssCode: "CCSS.MATH.CONTENT.4.NBT.B.6",
  satAlignment: "problem-solving-data-analysis",
  gradeBand: "3-5",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "What is $84 \\div 4$?",
      "choices": [
        {
          "text": "21",
          "is_correct": true
        },
        {
          "text": "20",
          "is_correct": false,
          "misconception_token": "dropped-ones-place"
        },
        {
          "text": "12",
          "is_correct": false,
          "misconception_token": "reversed-quotient-digits"
        },
        {
          "text": "22",
          "is_correct": false,
          "misconception_token": "wrong-partial-quotient"
        }
      ],
      "solution": "Break 84 into 80 and 4: $80 \\div 4 = 20$ and $4 \\div 4 = 1$, so $84 \\div 4 = 21$."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "What is $96 \\div 3$?",
      "choices": [
        {
          "text": "32",
          "is_correct": true
        },
        {
          "text": "23",
          "is_correct": false,
          "misconception_token": "reversed-quotient-digits"
        },
        {
          "text": "33",
          "is_correct": false,
          "misconception_token": "wrong-partial-quotient"
        },
        {
          "text": "31",
          "is_correct": false,
          "misconception_token": "off-by-one-quotient"
        }
      ],
      "solution": "Break 96 into 90 and 6: $90 \\div 3 = 30$ and $6 \\div 3 = 2$, so $96 \\div 3 = 32$."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "What is $72 \\div 6$?",
      "choices": [
        {
          "text": "12",
          "is_correct": true
        },
        {
          "text": "21",
          "is_correct": false,
          "misconception_token": "reversed-quotient-digits"
        },
        {
          "text": "11",
          "is_correct": false,
          "misconception_token": "off-by-one-quotient"
        },
        {
          "text": "13",
          "is_correct": false,
          "misconception_token": "wrong-partial-quotient"
        }
      ],
      "solution": "Break 72 into 60 and 12: $60 \\div 6 = 10$ and $12 \\div 6 = 2$, so $72 \\div 6 = 12$."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "What is $65 \\div 5$?",
      "choices": [
        {
          "text": "13",
          "is_correct": true
        },
        {
          "text": "31",
          "is_correct": false,
          "misconception_token": "reversed-quotient-digits"
        },
        {
          "text": "12",
          "is_correct": false,
          "misconception_token": "off-by-one-quotient"
        },
        {
          "text": "15",
          "is_correct": false,
          "misconception_token": "wrong-partial-quotient"
        }
      ],
      "solution": "Break 65 into 50 and 15: $50 \\div 5 = 10$ and $15 \\div 5 = 3$, so $65 \\div 5 = 13$."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "What is $47 \\div 5$? Give the quotient and remainder.",
      "choices": [
        {
          "text": "9 R2",
          "is_correct": true
        },
        {
          "text": "9 R3",
          "is_correct": false,
          "misconception_token": "wrong-remainder"
        },
        {
          "text": "8 R2",
          "is_correct": false,
          "misconception_token": "quotient-too-small"
        },
        {
          "text": "9 R5",
          "is_correct": false,
          "misconception_token": "remainder-equals-divisor"
        }
      ],
      "solution": "The largest multiple of 5 below 47 is $5 \\times 9 = 45$, and $47 - 45 = 2$, so the answer is 9 R2."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "What is $38 \\div 4$? Give the quotient and remainder.",
      "choices": [
        {
          "text": "9 R2",
          "is_correct": true
        },
        {
          "text": "8 R6",
          "is_correct": false,
          "misconception_token": "remainder-too-big"
        },
        {
          "text": "9 R1",
          "is_correct": false,
          "misconception_token": "wrong-remainder"
        },
        {
          "text": "10 R2",
          "is_correct": false,
          "misconception_token": "quotient-too-big"
        }
      ],
      "solution": "The largest multiple of 4 below 38 is $4 \\times 9 = 36$, and $38 - 36 = 2$, so the answer is 9 R2."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "What is $128 \\div 4$?",
      "choices": [
        {
          "text": "32",
          "is_correct": true
        },
        {
          "text": "31",
          "is_correct": false,
          "misconception_token": "off-by-one-quotient"
        },
        {
          "text": "23",
          "is_correct": false,
          "misconception_token": "reversed-quotient-digits"
        },
        {
          "text": "42",
          "is_correct": false,
          "misconception_token": "wrong-partial-quotient"
        }
      ],
      "solution": "Break 128 into 120 and 8: $120 \\div 4 = 30$ and $8 \\div 4 = 2$, so $128 \\div 4 = 32$."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "What is $150 \\div 5$?",
      "choices": [
        {
          "text": "30",
          "is_correct": true
        },
        {
          "text": "3",
          "is_correct": false,
          "misconception_token": "dropped-trailing-zero"
        },
        {
          "text": "35",
          "is_correct": false,
          "misconception_token": "quotient-too-big"
        },
        {
          "text": "25",
          "is_correct": false,
          "misconception_token": "quotient-too-small"
        }
      ],
      "solution": "Since $5 \\times 30 = 150$, the quotient is 30. In place value, $15 \\div 5 = 3$ tens, which is 30."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "What is $856 \\div 4$?",
      "choices": [
        {
          "text": "214",
          "is_correct": true
        },
        {
          "text": "204",
          "is_correct": false,
          "misconception_token": "skipped-middle-digit"
        },
        {
          "text": "213",
          "is_correct": false,
          "misconception_token": "off-by-one-quotient"
        },
        {
          "text": "215",
          "is_correct": false,
          "misconception_token": "wrong-partial-quotient"
        }
      ],
      "solution": "Dividing by place: $8 \\div 4 = 2$ hundreds, $5 \\div 4 = 1$ ten remainder 1, then $16 \\div 4 = 4$ ones, giving 214."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "What is $738 \\div 6$?",
      "choices": [
        {
          "text": "123",
          "is_correct": true
        },
        {
          "text": "122",
          "is_correct": false,
          "misconception_token": "off-by-one-quotient"
        },
        {
          "text": "113",
          "is_correct": false,
          "misconception_token": "skipped-middle-digit"
        },
        {
          "text": "133",
          "is_correct": false,
          "misconception_token": "wrong-partial-quotient"
        }
      ],
      "solution": "Dividing by place: $7 \\div 6 = 1$ remainder 1, then $13 \\div 6 = 2$ remainder 1, then $18 \\div 6 = 3$, giving 123."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "A teacher shares 100 pencils equally among 6 students. How many pencils does each student get, and how many are left over?",
      "choices": [
        {
          "text": "16 each, 4 left over",
          "is_correct": true
        },
        {
          "text": "16 each, 6 left over",
          "is_correct": false,
          "misconception_token": "remainder-equals-divisor"
        },
        {
          "text": "17 each, 2 left over",
          "is_correct": false,
          "misconception_token": "quotient-too-big"
        },
        {
          "text": "15 each, 10 left over",
          "is_correct": false,
          "misconception_token": "remainder-too-big"
        }
      ],
      "solution": "Since $6 \\times 16 = 96$ and $100 - 96 = 4$, each student gets 16 pencils with 4 left over."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "What is $945 \\div 7$?",
      "choices": [
        {
          "text": "135",
          "is_correct": true
        },
        {
          "text": "134",
          "is_correct": false,
          "misconception_token": "off-by-one-quotient"
        },
        {
          "text": "125",
          "is_correct": false,
          "misconception_token": "skipped-middle-digit"
        },
        {
          "text": "145",
          "is_correct": false,
          "misconception_token": "wrong-partial-quotient"
        }
      ],
      "solution": "Dividing by place: $9 \\div 7 = 1$ remainder 2, then $24 \\div 7 = 3$ remainder 3, then $35 \\div 7 = 5$, giving 135."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "A farmer puts 512 apples into bags that each hold 8 apples. How many bags does the farmer fill?",
      "choices": [
        {
          "text": "64",
          "is_correct": true
        },
        {
          "text": "63",
          "is_correct": false,
          "misconception_token": "off-by-one-quotient"
        },
        {
          "text": "65",
          "is_correct": false,
          "misconception_token": "rounded-up-unnecessarily"
        },
        {
          "text": "62",
          "is_correct": false,
          "misconception_token": "wrong-partial-quotient"
        }
      ],
      "solution": "Since $8 \\times 64 = 512$ exactly, the farmer fills 64 bags with no apples left over."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "What is $623 \\div 3$? Give the quotient and remainder.",
      "choices": [
        {
          "text": "207 R2",
          "is_correct": true
        },
        {
          "text": "27 R2",
          "is_correct": false,
          "misconception_token": "dropped-middle-zero"
        },
        {
          "text": "207 R1",
          "is_correct": false,
          "misconception_token": "wrong-remainder"
        },
        {
          "text": "217 R2",
          "is_correct": false,
          "misconception_token": "wrong-partial-quotient"
        }
      ],
      "solution": "Dividing by place: $6 \\div 3 = 2$, then $2 \\div 3 = 0$ remainder 2, then $23 \\div 3 = 7$ remainder 2, giving 207 R2."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "A ferry can carry 8 cars on each trip. There are 50 cars waiting to cross the river. How many trips are needed to carry all of the cars?",
      "choices": [
        {
          "text": "7",
          "is_correct": true
        },
        {
          "text": "6",
          "is_correct": false,
          "misconception_token": "ignored-remainder"
        },
        {
          "text": "6 R2",
          "is_correct": false,
          "misconception_token": "left-answer-as-remainder"
        },
        {
          "text": "8",
          "is_correct": false,
          "misconception_token": "rounded-too-far"
        }
      ],
      "solution": "Since $50 \\div 8 = 6$ remainder 2, six trips carry 48 cars and 2 cars remain, so a 7th trip is needed, for 7 trips."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "What is $2408 \\div 4$?",
      "choices": [
        {
          "text": "602",
          "is_correct": true
        },
        {
          "text": "62",
          "is_correct": false,
          "misconception_token": "dropped-place-zero"
        },
        {
          "text": "612",
          "is_correct": false,
          "misconception_token": "wrong-partial-quotient"
        },
        {
          "text": "601",
          "is_correct": false,
          "misconception_token": "off-by-one-quotient"
        }
      ],
      "solution": "Dividing by place: $24 \\div 4 = 6$ hundreds, $0 \\div 4 = 0$ tens, and $8 \\div 4 = 2$ ones, giving 602."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "What is $3765 \\div 5$?",
      "choices": [
        {
          "text": "753",
          "is_correct": true
        },
        {
          "text": "743",
          "is_correct": false,
          "misconception_token": "skipped-middle-digit"
        },
        {
          "text": "752",
          "is_correct": false,
          "misconception_token": "off-by-one-quotient"
        },
        {
          "text": "763",
          "is_correct": false,
          "misconception_token": "wrong-partial-quotient"
        }
      ],
      "solution": "Dividing by place: $37 \\div 5 = 7$ remainder 2, then $26 \\div 5 = 5$ remainder 1, then $15 \\div 5 = 3$, giving 753."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "What is $4926 \\div 8$? Give the quotient and remainder.",
      "choices": [
        {
          "text": "615 R6",
          "is_correct": true
        },
        {
          "text": "605 R6",
          "is_correct": false,
          "misconception_token": "skipped-middle-digit"
        },
        {
          "text": "615 R2",
          "is_correct": false,
          "misconception_token": "wrong-remainder"
        },
        {
          "text": "616 R6",
          "is_correct": false,
          "misconception_token": "quotient-too-big"
        }
      ],
      "solution": "Dividing by place: $49 \\div 8 = 6$ remainder 1, then $12 \\div 8 = 1$ remainder 4, then $46 \\div 8 = 5$ remainder 6, giving 615 R6."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "A factory makes 1,250 toys and packs them into boxes that each hold 9 toys. After filling as many complete boxes as possible, how many toys are left over?",
      "choices": [
        {
          "text": "8",
          "is_correct": true
        },
        {
          "text": "138",
          "is_correct": false,
          "misconception_token": "gave-quotient-not-remainder"
        },
        {
          "text": "7",
          "is_correct": false,
          "misconception_token": "wrong-remainder"
        },
        {
          "text": "2",
          "is_correct": false,
          "misconception_token": "subtracted-incorrectly"
        }
      ],
      "solution": "Since $9 \\times 138 = 1242$ and $1250 - 1242 = 8$, there are 138 full boxes and 8 toys left over."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "A park worker plants 2,024 trees, putting exactly 7 trees in each row. How many complete rows are planted, and how many trees are left over?",
      "choices": [
        {
          "text": "289 rows, 1 left over",
          "is_correct": true
        },
        {
          "text": "289 rows, 3 left over",
          "is_correct": false,
          "misconception_token": "wrong-remainder"
        },
        {
          "text": "288 rows, 8 left over",
          "is_correct": false,
          "misconception_token": "remainder-too-big"
        },
        {
          "text": "290 rows, 6 left over",
          "is_correct": false,
          "misconception_token": "quotient-too-big"
        }
      ],
      "solution": "Since $7 \\times 289 = 2023$ and $2024 - 2023 = 1$, there are 289 complete rows with 1 tree left over."
    }
  ],
}

const FRACTION_EQUIVALENCE: GapMathSkill = {
  slug: "fraction-equivalence",
  name: "Fraction Equivalence & Comparison",
  subject: 'math',
  ccssGrade: "4",
  ccssGradeNum: 4,
  ccssCode: "CCSS.MATH.CONTENT.4.NF.A.1",
  satAlignment: "problem-solving-data-analysis",
  gradeBand: "3-5",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "Which fraction is equivalent to $\\frac{1}{2}$?",
      "choices": [
        {
          "text": "$\\frac{2}{4}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{1}{4}$",
          "is_correct": false,
          "misconception_token": "multiplied-denominator-only"
        },
        {
          "text": "$\\frac{2}{3}$",
          "is_correct": false,
          "misconception_token": "added-one-to-both"
        },
        {
          "text": "$\\frac{4}{2}$",
          "is_correct": false,
          "misconception_token": "inverted-fraction"
        }
      ],
      "solution": "Multiply the numerator and denominator by the same number: $\\frac{1}{2} = \\frac{1 \\times 2}{2 \\times 2} = \\frac{2}{4}$."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "Fill in the missing numerator: $\\frac{1}{3} = \\frac{?}{6}$.",
      "choices": [
        {
          "text": "2",
          "is_correct": true
        },
        {
          "text": "3",
          "is_correct": false,
          "misconception_token": "used-half-of-denominator"
        },
        {
          "text": "1",
          "is_correct": false,
          "misconception_token": "kept-numerator-unchanged"
        },
        {
          "text": "4",
          "is_correct": false,
          "misconception_token": "added-denominator-difference"
        }
      ],
      "solution": "The denominator was multiplied by 2 to get from 3 to 6, so the numerator is $1 \\times 2 = 2$."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "Write $\\frac{4}{8}$ in lowest terms.",
      "choices": [
        {
          "text": "$\\frac{1}{2}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{2}{4}$",
          "is_correct": false,
          "misconception_token": "not-fully-reduced"
        },
        {
          "text": "$\\frac{1}{4}$",
          "is_correct": false,
          "misconception_token": "over-divided-numerator"
        },
        {
          "text": "$\\frac{2}{1}$",
          "is_correct": false,
          "misconception_token": "inverted-fraction"
        }
      ],
      "solution": "Divide the numerator and denominator by their greatest common factor 4: $\\frac{4 \\div 4}{8 \\div 4} = \\frac{1}{2}$."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "Write $\\frac{6}{9}$ in lowest terms.",
      "choices": [
        {
          "text": "$\\frac{2}{3}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{3}{6}$",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-divided"
        },
        {
          "text": "$\\frac{2}{9}$",
          "is_correct": false,
          "misconception_token": "divided-numerator-only"
        },
        {
          "text": "$\\frac{3}{2}$",
          "is_correct": false,
          "misconception_token": "inverted-fraction"
        }
      ],
      "solution": "The greatest common factor of 6 and 9 is 3, so $\\frac{6 \\div 3}{9 \\div 3} = \\frac{2}{3}$."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "Which fraction is equivalent to $\\frac{3}{4}$?",
      "choices": [
        {
          "text": "$\\frac{6}{8}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{4}{5}$",
          "is_correct": false,
          "misconception_token": "added-one-to-both"
        },
        {
          "text": "$\\frac{6}{4}$",
          "is_correct": false,
          "misconception_token": "multiplied-numerator-only"
        },
        {
          "text": "$\\frac{3}{8}$",
          "is_correct": false,
          "misconception_token": "multiplied-denominator-only"
        }
      ],
      "solution": "Multiply numerator and denominator by 2: $\\frac{3 \\times 2}{4 \\times 2} = \\frac{6}{8}$."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "Fill in the missing numerator: $\\frac{2}{5} = \\frac{?}{15}$.",
      "choices": [
        {
          "text": "6",
          "is_correct": true
        },
        {
          "text": "12",
          "is_correct": false,
          "misconception_token": "added-denominator-difference"
        },
        {
          "text": "3",
          "is_correct": false,
          "misconception_token": "used-multiplier-as-numerator"
        },
        {
          "text": "2",
          "is_correct": false,
          "misconception_token": "kept-numerator-unchanged"
        }
      ],
      "solution": "The denominator was multiplied by 3 to get from 5 to 15, so the numerator is $2 \\times 3 = 6$."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "Which of these fractions is the largest: $\\frac{1}{2}$, $\\frac{1}{3}$, $\\frac{1}{4}$, or $\\frac{1}{5}$?",
      "choices": [
        {
          "text": "$\\frac{1}{2}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{1}{5}$",
          "is_correct": false,
          "misconception_token": "bigger-denominator-bigger-fraction"
        },
        {
          "text": "$\\frac{1}{4}$",
          "is_correct": false,
          "misconception_token": "denominator-4-looks-big"
        },
        {
          "text": "$\\frac{1}{3}$",
          "is_correct": false,
          "misconception_token": "denominator-3-looks-big"
        }
      ],
      "solution": "With the same numerator, the fraction with the smallest denominator is largest, so $\\frac{1}{2}$ is the largest."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "Write $\\frac{8}{12}$ in lowest terms.",
      "choices": [
        {
          "text": "$\\frac{2}{3}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{4}{6}$",
          "is_correct": false,
          "misconception_token": "only-divided-once"
        },
        {
          "text": "$\\frac{3}{2}$",
          "is_correct": false,
          "misconception_token": "inverted-fraction"
        },
        {
          "text": "$\\frac{2}{4}$",
          "is_correct": false,
          "misconception_token": "divided-by-different-numbers"
        }
      ],
      "solution": "The greatest common factor of 8 and 12 is 4, so $\\frac{8 \\div 4}{12 \\div 4} = \\frac{2}{3}$."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "Which symbol makes this true: $\\frac{2}{3}$ ___ $\\frac{3}{5}$?",
      "choices": [
        {
          "text": "$>$",
          "is_correct": true
        },
        {
          "text": "$<$",
          "is_correct": false,
          "misconception_token": "compared-denominators"
        },
        {
          "text": "$=$",
          "is_correct": false,
          "misconception_token": "assumed-equal"
        },
        {
          "text": "$\\leq$",
          "is_correct": false,
          "misconception_token": "chose-less-or-equal"
        }
      ],
      "solution": "Using a common denominator of 15, $\\frac{2}{3} = \\frac{10}{15}$ and $\\frac{3}{5} = \\frac{9}{15}$, so $\\frac{2}{3} > \\frac{3}{5}$."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "Fill in the missing denominator: $\\frac{3}{5} = \\frac{12}{?}$.",
      "choices": [
        {
          "text": "20",
          "is_correct": true
        },
        {
          "text": "8",
          "is_correct": false,
          "misconception_token": "added-numerator-to-denominator"
        },
        {
          "text": "14",
          "is_correct": false,
          "misconception_token": "added-numerator-difference"
        },
        {
          "text": "60",
          "is_correct": false,
          "misconception_token": "multiplied-denominator-by-numerator"
        }
      ],
      "solution": "The numerator was multiplied by 4 to get from 3 to 12, so the denominator is $5 \\times 4 = 20$."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "A pizza is cut into 8 equal slices. Maria eats 2 slices. What fraction of the pizza did she eat, in lowest terms?",
      "choices": [
        {
          "text": "$\\frac{1}{4}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{2}{8}$",
          "is_correct": false,
          "misconception_token": "did-not-simplify"
        },
        {
          "text": "$\\frac{1}{3}$",
          "is_correct": false,
          "misconception_token": "wrong-simplification"
        },
        {
          "text": "$\\frac{2}{6}$",
          "is_correct": false,
          "misconception_token": "subtracted-from-denominator"
        }
      ],
      "solution": "She ate $\\frac{2}{8}$, and dividing top and bottom by 2 gives $\\frac{1}{4}$."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "In a class, $\\frac{4}{6}$ of the students play a sport. Written in lowest terms, what fraction is this?",
      "choices": [
        {
          "text": "$\\frac{2}{3}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{4}{6}$",
          "is_correct": false,
          "misconception_token": "left-unsimplified"
        },
        {
          "text": "$\\frac{1}{3}$",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-divided"
        },
        {
          "text": "$\\frac{3}{2}$",
          "is_correct": false,
          "misconception_token": "inverted-fraction"
        }
      ],
      "solution": "The greatest common factor of 4 and 6 is 2, so $\\frac{4 \\div 2}{6 \\div 2} = \\frac{2}{3}$."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "Ben ran $\\frac{5}{8}$ of a mile and Tara ran $\\frac{3}{4}$ of a mile. Who ran farther?",
      "choices": [
        {
          "text": "Tara",
          "is_correct": true
        },
        {
          "text": "Ben",
          "is_correct": false,
          "misconception_token": "compared-numerators-only"
        },
        {
          "text": "They ran the same distance",
          "is_correct": false,
          "misconception_token": "ignored-denominators"
        },
        {
          "text": "It cannot be determined",
          "is_correct": false,
          "misconception_token": "thought-uncomparable"
        }
      ],
      "solution": "Rewrite $\\frac{3}{4}$ as $\\frac{6}{8}$; since $\\frac{6}{8} > \\frac{5}{8}$, Tara ran farther."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "Which fraction is equivalent to $\\frac{2}{3}$?",
      "choices": [
        {
          "text": "$\\frac{10}{15}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{10}{12}$",
          "is_correct": false,
          "misconception_token": "used-different-multipliers"
        },
        {
          "text": "$\\frac{9}{15}$",
          "is_correct": false,
          "misconception_token": "wrong-numerator"
        },
        {
          "text": "$\\frac{10}{20}$",
          "is_correct": false,
          "misconception_token": "multiplied-denominator-by-more"
        }
      ],
      "solution": "Multiply numerator and denominator by 5: $\\frac{2 \\times 5}{3 \\times 5} = \\frac{10}{15}$."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "Which fraction is the smallest: $\\frac{3}{4}$, $\\frac{2}{3}$, or $\\frac{5}{6}$?",
      "choices": [
        {
          "text": "$\\frac{2}{3}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{3}{4}$",
          "is_correct": false,
          "misconception_token": "misjudged-by-numerator"
        },
        {
          "text": "$\\frac{5}{6}$",
          "is_correct": false,
          "misconception_token": "largest-mistaken-for-smallest"
        },
        {
          "text": "They are all equal",
          "is_correct": false,
          "misconception_token": "assumed-equal"
        }
      ],
      "solution": "Using a common denominator of 12, they become $\\frac{9}{12}$, $\\frac{8}{12}$, and $\\frac{10}{12}$, so $\\frac{2}{3}$ is smallest."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "Write $\\frac{12}{18}$ in lowest terms.",
      "choices": [
        {
          "text": "$\\frac{2}{3}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{6}{9}$",
          "is_correct": false,
          "misconception_token": "divided-by-2-only"
        },
        {
          "text": "$\\frac{4}{6}$",
          "is_correct": false,
          "misconception_token": "divided-by-3-only"
        },
        {
          "text": "$\\frac{3}{2}$",
          "is_correct": false,
          "misconception_token": "inverted-fraction"
        }
      ],
      "solution": "The greatest common factor of 12 and 18 is 6, so $\\frac{12 \\div 6}{18 \\div 6} = \\frac{2}{3}$."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "Jordan answered 15 of the 20 problems on a quiz correctly. Written in lowest terms, what fraction did Jordan get correct?",
      "choices": [
        {
          "text": "$\\frac{3}{4}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{15}{20}$",
          "is_correct": false,
          "misconception_token": "did-not-simplify"
        },
        {
          "text": "$\\frac{3}{5}$",
          "is_correct": false,
          "misconception_token": "divided-by-different-numbers"
        },
        {
          "text": "$\\frac{1}{4}$",
          "is_correct": false,
          "misconception_token": "used-incorrect-part"
        }
      ],
      "solution": "Jordan got $\\frac{15}{20}$ correct, and dividing top and bottom by 5 gives $\\frac{3}{4}$."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "One runner has completed $\\frac{7}{12}$ of a race and another has completed $\\frac{5}{8}$. Which fraction is farther along?",
      "choices": [
        {
          "text": "$\\frac{5}{8}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{7}{12}$",
          "is_correct": false,
          "misconception_token": "chose-larger-numbers"
        },
        {
          "text": "They are equal",
          "is_correct": false,
          "misconception_token": "assumed-equal"
        },
        {
          "text": "Cannot be compared",
          "is_correct": false,
          "misconception_token": "thought-uncomparable"
        }
      ],
      "solution": "Using a common denominator of 24, $\\frac{7}{12} = \\frac{14}{24}$ and $\\frac{5}{8} = \\frac{15}{24}$, so $\\frac{5}{8}$ is farther along."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "Fill in the missing numerator: $\\frac{?}{9} = \\frac{20}{45}$.",
      "choices": [
        {
          "text": "4",
          "is_correct": true
        },
        {
          "text": "5",
          "is_correct": false,
          "misconception_token": "used-scale-factor-as-answer"
        },
        {
          "text": "20",
          "is_correct": false,
          "misconception_token": "kept-original-numerator"
        },
        {
          "text": "11",
          "is_correct": false,
          "misconception_token": "subtracted-denominator"
        }
      ],
      "solution": "Since $45 \\div 9 = 5$, divide the numerator by 5: $20 \\div 5 = 4$, so $\\frac{4}{9} = \\frac{20}{45}$."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "A bag has 24 marbles: 6 red, 10 blue, and 8 green. What fraction of the marbles are blue, in lowest terms?",
      "choices": [
        {
          "text": "$\\frac{5}{12}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{10}{24}$",
          "is_correct": false,
          "misconception_token": "did-not-simplify"
        },
        {
          "text": "$\\frac{5}{7}$",
          "is_correct": false,
          "misconception_token": "part-to-part-instead-of-whole"
        },
        {
          "text": "$\\frac{2}{5}$",
          "is_correct": false,
          "misconception_token": "wrong-simplification"
        }
      ],
      "solution": "There are 10 blue out of 24 total, and dividing top and bottom by 2 gives $\\frac{10 \\div 2}{24 \\div 2} = \\frac{5}{12}$."
    }
  ],
}

const FRACTION_OPERATIONS_4: GapMathSkill = {
  slug: "fraction-operations-4",
  name: "Fraction Operations",
  subject: 'math',
  ccssGrade: "4",
  ccssGradeNum: 4,
  ccssCode: "CCSS.MATH.CONTENT.4.NF.B.3",
  satAlignment: "problem-solving-data-analysis",
  gradeBand: "3-5",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "What is $\\frac{1}{5} + \\frac{2}{5}$?",
      "choices": [
        {
          "text": "$\\frac{3}{5}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{3}{10}$",
          "is_correct": false,
          "misconception_token": "added-denominators"
        },
        {
          "text": "$\\frac{1}{5}$",
          "is_correct": false,
          "misconception_token": "subtracted-numerators"
        },
        {
          "text": "$\\frac{3}{25}$",
          "is_correct": false,
          "misconception_token": "multiplied-denominators"
        }
      ],
      "solution": "The denominators are the same, so add the numerators and keep the denominator: $\\frac{1}{5} + \\frac{2}{5} = \\frac{3}{5}$."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "What is $\\frac{3}{8} + \\frac{2}{8}$?",
      "choices": [
        {
          "text": "$\\frac{5}{8}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{5}{16}$",
          "is_correct": false,
          "misconception_token": "added-denominators"
        },
        {
          "text": "$\\frac{1}{8}$",
          "is_correct": false,
          "misconception_token": "subtracted-numerators"
        },
        {
          "text": "$\\frac{5}{64}$",
          "is_correct": false,
          "misconception_token": "multiplied-denominators"
        }
      ],
      "solution": "Keep the like denominator and add the numerators: $\\frac{3}{8} + \\frac{2}{8} = \\frac{5}{8}$."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "What is $\\frac{7}{9} - \\frac{2}{9}$?",
      "choices": [
        {
          "text": "$\\frac{5}{9}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{9}{9}$",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracted"
        },
        {
          "text": "5",
          "is_correct": false,
          "misconception_token": "dropped-denominator"
        },
        {
          "text": "$\\frac{6}{9}$",
          "is_correct": false,
          "misconception_token": "off-by-one"
        }
      ],
      "solution": "Subtract the numerators over the like denominator: $\\frac{7}{9} - \\frac{2}{9} = \\frac{5}{9}$."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "What is $3 \\times \\frac{1}{5}$?",
      "choices": [
        {
          "text": "$\\frac{3}{5}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{3}{15}$",
          "is_correct": false,
          "misconception_token": "multiplied-denominator"
        },
        {
          "text": "$\\frac{4}{5}$",
          "is_correct": false,
          "misconception_token": "added-whole-to-numerator"
        },
        {
          "text": "$\\frac{1}{5}$",
          "is_correct": false,
          "misconception_token": "forgot-to-multiply"
        }
      ],
      "solution": "Multiplying by a whole number multiplies the numerator: $3 \\times \\frac{1}{5} = \\frac{3}{5}$."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "What is $4 \\times \\frac{2}{7}$?",
      "choices": [
        {
          "text": "$\\frac{8}{7}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{8}{28}$",
          "is_correct": false,
          "misconception_token": "multiplied-denominator"
        },
        {
          "text": "$\\frac{6}{7}$",
          "is_correct": false,
          "misconception_token": "added-whole-to-numerator"
        },
        {
          "text": "$\\frac{2}{7}$",
          "is_correct": false,
          "misconception_token": "forgot-to-multiply"
        }
      ],
      "solution": "Multiply the numerator by the whole number and keep the denominator: $4 \\times \\frac{2}{7} = \\frac{8}{7}$."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "What is $\\frac{2}{5} + \\frac{2}{5}$?",
      "choices": [
        {
          "text": "$\\frac{4}{5}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{4}{10}$",
          "is_correct": false,
          "misconception_token": "added-denominators"
        },
        {
          "text": "$\\frac{4}{25}$",
          "is_correct": false,
          "misconception_token": "multiplied-denominators"
        },
        {
          "text": "$\\frac{0}{5}$",
          "is_correct": false,
          "misconception_token": "subtracted-numerators"
        }
      ],
      "solution": "Add the numerators over the shared denominator: $\\frac{2}{5} + \\frac{2}{5} = \\frac{4}{5}$."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "What is $\\frac{7}{10} - \\frac{4}{10}$?",
      "choices": [
        {
          "text": "$\\frac{3}{10}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{11}{10}$",
          "is_correct": false,
          "misconception_token": "added-numerators"
        },
        {
          "text": "3",
          "is_correct": false,
          "misconception_token": "dropped-denominator"
        },
        {
          "text": "$\\frac{2}{10}$",
          "is_correct": false,
          "misconception_token": "off-by-one"
        }
      ],
      "solution": "Subtract the numerators and keep the like denominator: $\\frac{7}{10} - \\frac{4}{10} = \\frac{3}{10}$."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "What is $\\frac{4}{9} + \\frac{4}{9}$?",
      "choices": [
        {
          "text": "$\\frac{8}{9}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{8}{18}$",
          "is_correct": false,
          "misconception_token": "added-denominators"
        },
        {
          "text": "$\\frac{8}{81}$",
          "is_correct": false,
          "misconception_token": "multiplied-denominators"
        },
        {
          "text": "$\\frac{0}{9}$",
          "is_correct": false,
          "misconception_token": "subtracted-numerators"
        }
      ],
      "solution": "The denominators match, so add the numerators: $\\frac{4}{9} + \\frac{4}{9} = \\frac{8}{9}$."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "Maria ate $\\frac{2}{8}$ of a pizza and her brother ate $\\frac{3}{8}$ of the same pizza. How much of the pizza did they eat in all?",
      "choices": [
        {
          "text": "$\\frac{5}{8}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{5}{16}$",
          "is_correct": false,
          "misconception_token": "added-denominators"
        },
        {
          "text": "$\\frac{1}{8}$",
          "is_correct": false,
          "misconception_token": "subtracted-numerators"
        },
        {
          "text": "$\\frac{5}{64}$",
          "is_correct": false,
          "misconception_token": "multiplied-denominators"
        }
      ],
      "solution": "Add the two like fractions: $\\frac{2}{8} + \\frac{3}{8} = \\frac{5}{8}$."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "What is $2\\frac{3}{6} + 1\\frac{2}{6}$?",
      "choices": [
        {
          "text": "$3\\frac{5}{6}$",
          "is_correct": true
        },
        {
          "text": "$3\\frac{5}{12}$",
          "is_correct": false,
          "misconception_token": "added-denominators"
        },
        {
          "text": "$1\\frac{1}{6}$",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-added"
        },
        {
          "text": "$\\frac{5}{6}$",
          "is_correct": false,
          "misconception_token": "forgot-whole-numbers"
        }
      ],
      "solution": "Add the whole numbers and the like fractions: $2 + 1 = 3$ and $\\frac{3}{6} + \\frac{2}{6} = \\frac{5}{6}$, giving $3\\frac{5}{6}$."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "What is $4\\frac{1}{5} - 1\\frac{3}{5}$?",
      "choices": [
        {
          "text": "$2\\frac{3}{5}$",
          "is_correct": true
        },
        {
          "text": "$3\\frac{2}{5}$",
          "is_correct": false,
          "misconception_token": "flipped-fraction-difference"
        },
        {
          "text": "$3\\frac{3}{5}$",
          "is_correct": false,
          "misconception_token": "forgot-borrow-decrement"
        },
        {
          "text": "$2\\frac{2}{5}$",
          "is_correct": false,
          "misconception_token": "incorrect-borrow"
        }
      ],
      "solution": "Regroup: $4\\frac{1}{5} = 3\\frac{6}{5}$, then $3\\frac{6}{5} - 1\\frac{3}{5} = 2\\frac{3}{5}$."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "A recipe needs $\\frac{3}{4}$ cup of flour for one batch. How much flour is needed for 3 batches?",
      "choices": [
        {
          "text": "$\\frac{9}{4}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{9}{12}$",
          "is_correct": false,
          "misconception_token": "multiplied-denominator"
        },
        {
          "text": "$\\frac{6}{4}$",
          "is_correct": false,
          "misconception_token": "added-whole-to-numerator"
        },
        {
          "text": "$\\frac{3}{4}$",
          "is_correct": false,
          "misconception_token": "forgot-to-multiply"
        }
      ],
      "solution": "Multiply the fraction by the number of batches: $3 \\times \\frac{3}{4} = \\frac{9}{4}$."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "What is $5 \\times \\frac{3}{8}$?",
      "choices": [
        {
          "text": "$\\frac{15}{8}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{15}{40}$",
          "is_correct": false,
          "misconception_token": "multiplied-denominator"
        },
        {
          "text": "$\\frac{8}{8}$",
          "is_correct": false,
          "misconception_token": "added-whole-to-numerator"
        },
        {
          "text": "$\\frac{3}{8}$",
          "is_correct": false,
          "misconception_token": "forgot-to-multiply"
        }
      ],
      "solution": "Multiply the numerator by the whole number: $5 \\times \\frac{3}{8} = \\frac{15}{8}$."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "Jordan had $3\\frac{5}{8}$ feet of rope and used $1\\frac{2}{8}$ feet. How much rope is left?",
      "choices": [
        {
          "text": "$2\\frac{3}{8}$",
          "is_correct": true
        },
        {
          "text": "$4\\frac{7}{8}$",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracted"
        },
        {
          "text": "$2\\frac{7}{8}$",
          "is_correct": false,
          "misconception_token": "added-the-fractions"
        },
        {
          "text": "$3\\frac{3}{8}$",
          "is_correct": false,
          "misconception_token": "forgot-to-subtract-whole"
        }
      ],
      "solution": "Subtract wholes and like fractions: $3 - 1 = 2$ and $\\frac{5}{8} - \\frac{2}{8} = \\frac{3}{8}$, giving $2\\frac{3}{8}$."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "In a class, $\\frac{4}{10}$ of the students walk to school and $\\frac{3}{10}$ ride a bike. What fraction of the students walk or ride a bike?",
      "choices": [
        {
          "text": "$\\frac{7}{10}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{7}{20}$",
          "is_correct": false,
          "misconception_token": "added-denominators"
        },
        {
          "text": "$\\frac{1}{10}$",
          "is_correct": false,
          "misconception_token": "subtracted-numerators"
        },
        {
          "text": "$\\frac{7}{100}$",
          "is_correct": false,
          "misconception_token": "multiplied-denominators"
        }
      ],
      "solution": "Add the like fractions: $\\frac{4}{10} + \\frac{3}{10} = \\frac{7}{10}$."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "Each lap around a track is $\\frac{2}{3}$ mile. Sam ran 4 laps. How far did Sam run?",
      "choices": [
        {
          "text": "$\\frac{8}{3}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{8}{12}$",
          "is_correct": false,
          "misconception_token": "multiplied-denominator"
        },
        {
          "text": "$\\frac{6}{3}$",
          "is_correct": false,
          "misconception_token": "added-whole-to-numerator"
        },
        {
          "text": "$\\frac{2}{3}$",
          "is_correct": false,
          "misconception_token": "forgot-to-multiply"
        }
      ],
      "solution": "Multiply the distance per lap by the number of laps: $4 \\times \\frac{2}{3} = \\frac{8}{3}$."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "A baker used $\\frac{4}{9}$ kilogram of sugar in the morning and $\\frac{7}{9}$ kilogram in the afternoon. How much sugar did the baker use in all?",
      "choices": [
        {
          "text": "$1\\frac{2}{9}$",
          "is_correct": true
        },
        {
          "text": "$\\frac{11}{18}$",
          "is_correct": false,
          "misconception_token": "added-denominators"
        },
        {
          "text": "$\\frac{3}{9}$",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-added"
        },
        {
          "text": "$\\frac{2}{9}$",
          "is_correct": false,
          "misconception_token": "dropped-the-whole"
        }
      ],
      "solution": "Add the like fractions to get $\\frac{4}{9} + \\frac{7}{9} = \\frac{11}{9}$, which is $1\\frac{2}{9}$."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "What is $\\frac{5}{9} + \\frac{8}{9} - \\frac{4}{9}$?",
      "choices": [
        {
          "text": "1",
          "is_correct": true
        },
        {
          "text": "$1\\frac{8}{9}$",
          "is_correct": false,
          "misconception_token": "added-all-three"
        },
        {
          "text": "$\\frac{9}{27}$",
          "is_correct": false,
          "misconception_token": "added-denominators"
        },
        {
          "text": "$\\frac{1}{9}$",
          "is_correct": false,
          "misconception_token": "subtracted-before-adding"
        }
      ],
      "solution": "Combine the numerators over the like denominator: $5 + 8 - 4 = 9$, so $\\frac{9}{9} = 1$."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "A ribbon is 5 feet long. Mia cut 3 pieces, each $\\frac{3}{4}$ foot long. How much ribbon is left?",
      "choices": [
        {
          "text": "$2\\frac{3}{4}$",
          "is_correct": true
        },
        {
          "text": "$4\\frac{1}{4}$",
          "is_correct": false,
          "misconception_token": "subtracted-one-piece"
        },
        {
          "text": "$2\\frac{1}{4}$",
          "is_correct": false,
          "misconception_token": "gave-amount-used"
        },
        {
          "text": "$7\\frac{1}{4}$",
          "is_correct": false,
          "misconception_token": "added-instead-of-subtracted"
        }
      ],
      "solution": "The pieces use $3 \\times \\frac{3}{4} = \\frac{9}{4} = 2\\frac{1}{4}$ feet, so $5 - 2\\frac{1}{4} = 2\\frac{3}{4}$ feet remain."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "Two ropes measuring $2\\frac{5}{6}$ meters and $3\\frac{4}{6}$ meters are tied together, and $\\frac{2}{6}$ meter is lost in the knot. How long is the combined rope?",
      "choices": [
        {
          "text": "$6\\frac{1}{6}$",
          "is_correct": true
        },
        {
          "text": "$6\\frac{3}{6}$",
          "is_correct": false,
          "misconception_token": "forgot-to-subtract-loss"
        },
        {
          "text": "$6\\frac{5}{6}$",
          "is_correct": false,
          "misconception_token": "added-loss-instead"
        },
        {
          "text": "$6\\frac{2}{6}$",
          "is_correct": false,
          "misconception_token": "subtracted-wrong-amount"
        }
      ],
      "solution": "Add the ropes: $2\\frac{5}{6} + 3\\frac{4}{6} = 6\\frac{3}{6}$, then subtract the knot loss: $6\\frac{3}{6} - \\frac{2}{6} = 6\\frac{1}{6}$."
    }
  ],
}

const FACTORS_MULTIPLES: GapMathSkill = {
  slug: "factors-multiples",
  name: "Factors & Multiples",
  subject: 'math',
  ccssGrade: "4",
  ccssGradeNum: 4,
  ccssCode: "CCSS.MATH.CONTENT.4.OA.B.4",
  satAlignment: "algebra",
  gradeBand: "3-5",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "Which number is a multiple of $4$?",
      "choices": [
        {
          "text": "16",
          "is_correct": true
        },
        {
          "text": "15",
          "is_correct": false,
          "misconception_token": "multiple-of-5-not-4"
        },
        {
          "text": "9",
          "is_correct": false,
          "misconception_token": "multiple-of-3-not-4"
        },
        {
          "text": "14",
          "is_correct": false,
          "misconception_token": "multiple-of-7-not-4"
        }
      ],
      "solution": "Count by fours: 4, 8, 12, 16. So 16 is a multiple of 4."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "Which number is a factor of $18$?",
      "choices": [
        {
          "text": "6",
          "is_correct": true
        },
        {
          "text": "36",
          "is_correct": false,
          "misconception_token": "chose-multiple-not-factor"
        },
        {
          "text": "4",
          "is_correct": false,
          "misconception_token": "four-does-not-divide-18"
        },
        {
          "text": "5",
          "is_correct": false,
          "misconception_token": "five-does-not-divide-18"
        }
      ],
      "solution": "18 divided by 6 is 3 with no remainder, so 6 is a factor of 18."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "Is $7$ prime or composite?",
      "choices": [
        {
          "text": "Prime",
          "is_correct": true
        },
        {
          "text": "Composite",
          "is_correct": false,
          "misconception_token": "counted-7-as-composite"
        },
        {
          "text": "Neither prime nor composite",
          "is_correct": false,
          "misconception_token": "called-7-neither"
        },
        {
          "text": "Both prime and composite",
          "is_correct": false,
          "misconception_token": "called-7-both"
        }
      ],
      "solution": "7 has exactly two factors, 1 and 7, so it is prime."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "Is $9$ prime or composite?",
      "choices": [
        {
          "text": "Composite",
          "is_correct": true
        },
        {
          "text": "Prime",
          "is_correct": false,
          "misconception_token": "odd-so-called-prime"
        },
        {
          "text": "Neither prime nor composite",
          "is_correct": false,
          "misconception_token": "called-9-neither"
        },
        {
          "text": "Both prime and composite",
          "is_correct": false,
          "misconception_token": "called-9-both"
        }
      ],
      "solution": "9 equals 3 times 3, so it has a factor other than 1 and 9, making it composite."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "Which multiplication has a product of $20$?",
      "choices": [
        {
          "text": "$4 \\times 5$",
          "is_correct": true
        },
        {
          "text": "$4 \\times 6$",
          "is_correct": false,
          "misconception_token": "product-is-24"
        },
        {
          "text": "$3 \\times 6$",
          "is_correct": false,
          "misconception_token": "product-is-18"
        },
        {
          "text": "$2 \\times 8$",
          "is_correct": false,
          "misconception_token": "product-is-16"
        }
      ],
      "solution": "4 times 5 equals 20."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "What is the next multiple of $6$ after $18$?",
      "choices": [
        {
          "text": "24",
          "is_correct": true
        },
        {
          "text": "19",
          "is_correct": false,
          "misconception_token": "added-one-not-six"
        },
        {
          "text": "20",
          "is_correct": false,
          "misconception_token": "added-two-not-six"
        },
        {
          "text": "30",
          "is_correct": false,
          "misconception_token": "skipped-a-multiple"
        }
      ],
      "solution": "The multiples of 6 are 6, 12, 18, 24, so the next one after 18 is 24."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "Which of these is NOT a factor of $16$?",
      "choices": [
        {
          "text": "6",
          "is_correct": true
        },
        {
          "text": "2",
          "is_correct": false,
          "misconception_token": "two-is-a-factor"
        },
        {
          "text": "4",
          "is_correct": false,
          "misconception_token": "four-is-a-factor"
        },
        {
          "text": "8",
          "is_correct": false,
          "misconception_token": "eight-is-a-factor"
        }
      ],
      "solution": "The factors of 16 are 1, 2, 4, 8, 16. Since 6 is not in that list, 6 is not a factor."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "Which number is a multiple of $10$?",
      "choices": [
        {
          "text": "40",
          "is_correct": true
        },
        {
          "text": "14",
          "is_correct": false,
          "misconception_token": "ends-in-4-not-0"
        },
        {
          "text": "25",
          "is_correct": false,
          "misconception_token": "multiple-of-5-not-10"
        },
        {
          "text": "55",
          "is_correct": false,
          "misconception_token": "odd-multiple-of-5"
        }
      ],
      "solution": "Multiples of 10 end in 0: 10, 20, 30, 40. So 40 is a multiple of 10."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "How many factor pairs does $16$ have?",
      "choices": [
        {
          "text": "3",
          "is_correct": true
        },
        {
          "text": "5",
          "is_correct": false,
          "misconception_token": "counted-all-factors"
        },
        {
          "text": "2",
          "is_correct": false,
          "misconception_token": "forgot-the-4-times-4-pair"
        },
        {
          "text": "6",
          "is_correct": false,
          "misconception_token": "counted-each-pair-twice"
        }
      ],
      "solution": "The factor pairs of 16 are 1 and 16, 2 and 8, and 4 and 4, which is 3 pairs."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "A teacher arranges $24$ chairs into equal rows with $6$ chairs in each row. How many rows are there?",
      "choices": [
        {
          "text": "4",
          "is_correct": true
        },
        {
          "text": "18",
          "is_correct": false,
          "misconception_token": "subtracted-instead-of-divided"
        },
        {
          "text": "144",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-divided"
        },
        {
          "text": "3",
          "is_correct": false,
          "misconception_token": "divided-incorrectly"
        }
      ],
      "solution": "24 divided by 6 equals 4 rows."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "A baker puts $36$ muffins into boxes of $9$. How many boxes does she fill?",
      "choices": [
        {
          "text": "4",
          "is_correct": true
        },
        {
          "text": "27",
          "is_correct": false,
          "misconception_token": "subtracted-9-from-36"
        },
        {
          "text": "45",
          "is_correct": false,
          "misconception_token": "added-9-to-36"
        },
        {
          "text": "5",
          "is_correct": false,
          "misconception_token": "off-by-one-division"
        }
      ],
      "solution": "36 divided by 9 equals 4 boxes."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "Which of these numbers is prime?",
      "choices": [
        {
          "text": "29",
          "is_correct": true
        },
        {
          "text": "21",
          "is_correct": false,
          "misconception_token": "chose-21-divisible-by-3"
        },
        {
          "text": "27",
          "is_correct": false,
          "misconception_token": "chose-27-divisible-by-3"
        },
        {
          "text": "33",
          "is_correct": false,
          "misconception_token": "chose-33-divisible-by-11"
        }
      ],
      "solution": "29 has only the factors 1 and 29, so it is prime; 21, 27, and 33 each have other factors."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "Which of these numbers is composite?",
      "choices": [
        {
          "text": "15",
          "is_correct": true
        },
        {
          "text": "13",
          "is_correct": false,
          "misconception_token": "chose-13-which-is-prime"
        },
        {
          "text": "17",
          "is_correct": false,
          "misconception_token": "chose-17-which-is-prime"
        },
        {
          "text": "23",
          "is_correct": false,
          "misconception_token": "chose-23-which-is-prime"
        }
      ],
      "solution": "15 equals 3 times 5, so it has factors besides 1 and 15, making it composite."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "Rowan has $30$ stickers to share equally among some friends with none left over. Which number of friends works?",
      "choices": [
        {
          "text": "5",
          "is_correct": true
        },
        {
          "text": "4",
          "is_correct": false,
          "misconception_token": "four-does-not-divide-30"
        },
        {
          "text": "7",
          "is_correct": false,
          "misconception_token": "seven-does-not-divide-30"
        },
        {
          "text": "8",
          "is_correct": false,
          "misconception_token": "eight-does-not-divide-30"
        }
      ],
      "solution": "30 divided by 5 equals 6 with no remainder, so 5 friends works."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "Every $8$ minutes a bus leaves the station. If a bus leaves at minute $0$, at which minute will another bus leave?",
      "choices": [
        {
          "text": "40",
          "is_correct": true
        },
        {
          "text": "20",
          "is_correct": false,
          "misconception_token": "not-a-multiple-of-8"
        },
        {
          "text": "28",
          "is_correct": false,
          "misconception_token": "off-by-4-from-multiple"
        },
        {
          "text": "12",
          "is_correct": false,
          "misconception_token": "multiple-of-4-not-8"
        }
      ],
      "solution": "Buses leave at multiples of 8: 8, 16, 24, 32, 40. So a bus leaves at minute 40."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "If $7 \\times \\square = 56$, what is the missing factor?",
      "choices": [
        {
          "text": "8",
          "is_correct": true
        },
        {
          "text": "49",
          "is_correct": false,
          "misconception_token": "used-7-times-7"
        },
        {
          "text": "63",
          "is_correct": false,
          "misconception_token": "added-7-to-56"
        },
        {
          "text": "9",
          "is_correct": false,
          "misconception_token": "off-by-one"
        }
      ],
      "solution": "56 divided by 7 equals 8, so the missing factor is 8."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "A gardener plants $48$ flowers in equal rows with none left over. Which number of rows is NOT possible?",
      "choices": [
        {
          "text": "5",
          "is_correct": true
        },
        {
          "text": "6",
          "is_correct": false,
          "misconception_token": "six-is-a-factor-of-48"
        },
        {
          "text": "8",
          "is_correct": false,
          "misconception_token": "eight-is-a-factor-of-48"
        },
        {
          "text": "12",
          "is_correct": false,
          "misconception_token": "twelve-is-a-factor-of-48"
        }
      ],
      "solution": "The factors of 48 include 6, 8, and 12 but not 5, since 48 divided by 5 leaves a remainder."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "How many prime numbers are there between $10$ and $20$?",
      "choices": [
        {
          "text": "4",
          "is_correct": true
        },
        {
          "text": "3",
          "is_correct": false,
          "misconception_token": "missed-one-prime"
        },
        {
          "text": "5",
          "is_correct": false,
          "misconception_token": "included-a-composite"
        },
        {
          "text": "2",
          "is_correct": false,
          "misconception_token": "counted-too-few"
        }
      ],
      "solution": "The primes between 10 and 20 are 11, 13, 17, and 19, which is 4 numbers."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "A coach splits $60$ players into equal teams, with more than one team and more than one player per team. Which number of players per team is NOT possible?",
      "choices": [
        {
          "text": "7",
          "is_correct": true
        },
        {
          "text": "5",
          "is_correct": false,
          "misconception_token": "five-divides-60"
        },
        {
          "text": "6",
          "is_correct": false,
          "misconception_token": "six-divides-60"
        },
        {
          "text": "10",
          "is_correct": false,
          "misconception_token": "ten-divides-60"
        }
      ],
      "solution": "60 divided by 5, 6, or 10 comes out even, but 60 divided by 7 leaves a remainder, so 7 is not possible."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "Balloons come in packs of $6$ and candles come in packs of $8$. What is the least number of each you must buy to have an equal number of balloons and candles?",
      "choices": [
        {
          "text": "24",
          "is_correct": true
        },
        {
          "text": "48",
          "is_correct": false,
          "misconception_token": "used-product-not-lcm"
        },
        {
          "text": "14",
          "is_correct": false,
          "misconception_token": "added-6-and-8"
        },
        {
          "text": "12",
          "is_correct": false,
          "misconception_token": "multiple-of-6-not-8"
        }
      ],
      "solution": "The least common multiple of 6 and 8 is 24, so you need 24 of each."
    }
  ],
}

const AREA_PERIMETER: GapMathSkill = {
  slug: "area-perimeter",
  name: "Area & Perimeter",
  subject: 'math',
  ccssGrade: "4",
  ccssGradeNum: 4,
  ccssCode: "CCSS.MATH.CONTENT.4.MD.A.3",
  satAlignment: "geometry-trigonometry",
  gradeBand: "3-5",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "A rectangle is $5$ cm long and $3$ cm wide. What is its area in square centimeters?",
      "choices": [
        {
          "text": "15",
          "is_correct": true
        },
        {
          "text": "16",
          "is_correct": false,
          "misconception_token": "used-perimeter-formula"
        },
        {
          "text": "8",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        },
        {
          "text": "30",
          "is_correct": false,
          "misconception_token": "doubled-the-product"
        }
      ],
      "solution": "Area is length times width: $5 \\times 3 = 15$ square centimeters."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "A rectangle is $6$ inches long and $2$ inches wide. What is its perimeter in inches?",
      "choices": [
        {
          "text": "16",
          "is_correct": true
        },
        {
          "text": "12",
          "is_correct": false,
          "misconception_token": "multiplied-for-area"
        },
        {
          "text": "8",
          "is_correct": false,
          "misconception_token": "half-perimeter"
        },
        {
          "text": "14",
          "is_correct": false,
          "misconception_token": "missed-a-side"
        }
      ],
      "solution": "Perimeter is $2 \\times 6 + 2 \\times 2 = 12 + 4 = 16$ inches."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "A poster is $7$ feet tall and $2$ feet wide. What is the area of the poster in square feet?",
      "choices": [
        {
          "text": "14",
          "is_correct": true
        },
        {
          "text": "18",
          "is_correct": false,
          "misconception_token": "used-perimeter-formula"
        },
        {
          "text": "9",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        },
        {
          "text": "28",
          "is_correct": false,
          "misconception_token": "doubled-the-product"
        }
      ],
      "solution": "Area is length times width: $7 \\times 2 = 14$ square feet."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "A rug is $8$ meters long and $5$ meters wide. What is its perimeter in meters?",
      "choices": [
        {
          "text": "26",
          "is_correct": true
        },
        {
          "text": "40",
          "is_correct": false,
          "misconception_token": "multiplied-for-area"
        },
        {
          "text": "13",
          "is_correct": false,
          "misconception_token": "half-perimeter"
        },
        {
          "text": "21",
          "is_correct": false,
          "misconception_token": "missed-a-side"
        }
      ],
      "solution": "Perimeter is $2 \\times 8 + 2 \\times 5 = 16 + 10 = 26$ meters."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "A garden is $9$ yards long and $3$ yards wide. What is the area of the garden in square yards?",
      "choices": [
        {
          "text": "27",
          "is_correct": true
        },
        {
          "text": "24",
          "is_correct": false,
          "misconception_token": "used-perimeter-formula"
        },
        {
          "text": "12",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        },
        {
          "text": "54",
          "is_correct": false,
          "misconception_token": "doubled-the-product"
        }
      ],
      "solution": "Area is length times width: $9 \\times 3 = 27$ square yards."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "A square tile has a side length of $6$ cm. What is the perimeter of the tile in centimeters?",
      "choices": [
        {
          "text": "24",
          "is_correct": true
        },
        {
          "text": "36",
          "is_correct": false,
          "misconception_token": "computed-area"
        },
        {
          "text": "12",
          "is_correct": false,
          "misconception_token": "side-times-two"
        },
        {
          "text": "18",
          "is_correct": false,
          "misconception_token": "side-times-three"
        }
      ],
      "solution": "A square has four equal sides, so the perimeter is $4 \\times 6 = 24$ centimeters."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "A square rug has a side length of $5$ feet. What is the area of the rug in square feet?",
      "choices": [
        {
          "text": "25",
          "is_correct": true
        },
        {
          "text": "20",
          "is_correct": false,
          "misconception_token": "found-perimeter"
        },
        {
          "text": "10",
          "is_correct": false,
          "misconception_token": "side-times-two"
        },
        {
          "text": "15",
          "is_correct": false,
          "misconception_token": "side-times-three"
        }
      ],
      "solution": "The area of a square is side times side: $5 \\times 5 = 25$ square feet."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "A room is $10$ feet long and $4$ feet wide. What is the perimeter of the room in feet?",
      "choices": [
        {
          "text": "28",
          "is_correct": true
        },
        {
          "text": "40",
          "is_correct": false,
          "misconception_token": "multiplied-for-area"
        },
        {
          "text": "14",
          "is_correct": false,
          "misconception_token": "half-perimeter"
        },
        {
          "text": "20",
          "is_correct": false,
          "misconception_token": "doubled-length-only"
        }
      ],
      "solution": "Perimeter is $2 \\times 10 + 2 \\times 4 = 20 + 8 = 28$ feet."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "A rectangle has an area of $48$ square inches. Its length is $8$ inches. What is its width in inches?",
      "choices": [
        {
          "text": "6",
          "is_correct": true
        },
        {
          "text": "40",
          "is_correct": false,
          "misconception_token": "subtracted-length"
        },
        {
          "text": "24",
          "is_correct": false,
          "misconception_token": "halved-the-area"
        },
        {
          "text": "56",
          "is_correct": false,
          "misconception_token": "added-length"
        }
      ],
      "solution": "Width is area divided by length: $48 \\div 8 = 6$ inches."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "A rectangle has a perimeter of $30$ cm. Its length is $9$ cm. What is its width in centimeters?",
      "choices": [
        {
          "text": "6",
          "is_correct": true
        },
        {
          "text": "21",
          "is_correct": false,
          "misconception_token": "subtracted-length"
        },
        {
          "text": "12",
          "is_correct": false,
          "misconception_token": "forgot-to-divide"
        },
        {
          "text": "15",
          "is_correct": false,
          "misconception_token": "halved-perimeter"
        }
      ],
      "solution": "The two lengths use $2 \\times 9 = 18$ cm, leaving $30 - 18 = 12$ cm for the two widths, so each width is $12 \\div 2 = 6$ centimeters."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "A soccer field is $25$ meters long and $12$ meters wide. What is the area of the field in square meters?",
      "choices": [
        {
          "text": "300",
          "is_correct": true
        },
        {
          "text": "74",
          "is_correct": false,
          "misconception_token": "used-perimeter-formula"
        },
        {
          "text": "37",
          "is_correct": false,
          "misconception_token": "added-instead-of-multiplied"
        },
        {
          "text": "600",
          "is_correct": false,
          "misconception_token": "doubled-the-product"
        }
      ],
      "solution": "Area is length times width: $25 \\times 12 = 300$ square meters."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "A rectangular garden is $15$ feet long and $8$ feet wide. Maria wants to put a fence around it. How many feet of fencing does she need?",
      "choices": [
        {
          "text": "46",
          "is_correct": true
        },
        {
          "text": "120",
          "is_correct": false,
          "misconception_token": "computed-area"
        },
        {
          "text": "23",
          "is_correct": false,
          "misconception_token": "half-perimeter"
        },
        {
          "text": "30",
          "is_correct": false,
          "misconception_token": "doubled-length-only"
        }
      ],
      "solution": "The fence follows the perimeter: $2 \\times 15 + 2 \\times 8 = 30 + 16 = 46$ feet."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "A rectangular room has an area of $72$ square feet. Its width is $6$ feet. What is its length in feet?",
      "choices": [
        {
          "text": "12",
          "is_correct": true
        },
        {
          "text": "66",
          "is_correct": false,
          "misconception_token": "subtracted-width"
        },
        {
          "text": "36",
          "is_correct": false,
          "misconception_token": "halved-the-area"
        },
        {
          "text": "78",
          "is_correct": false,
          "misconception_token": "added-width"
        }
      ],
      "solution": "Length is area divided by width: $72 \\div 6 = 12$ feet."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "A rectangular swimming pool has a perimeter of $40$ meters. Its length is $12$ meters. What is its width in meters?",
      "choices": [
        {
          "text": "8",
          "is_correct": true
        },
        {
          "text": "28",
          "is_correct": false,
          "misconception_token": "subtracted-length"
        },
        {
          "text": "16",
          "is_correct": false,
          "misconception_token": "forgot-to-divide"
        },
        {
          "text": "20",
          "is_correct": false,
          "misconception_token": "halved-perimeter"
        }
      ],
      "solution": "The two lengths use $2 \\times 12 = 24$ meters, leaving $40 - 24 = 16$ meters for the two widths, so each width is $16 \\div 2 = 8$ meters."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "A square painting has a side length of $12$ inches. What is the area of the painting in square inches?",
      "choices": [
        {
          "text": "144",
          "is_correct": true
        },
        {
          "text": "48",
          "is_correct": false,
          "misconception_token": "found-perimeter"
        },
        {
          "text": "24",
          "is_correct": false,
          "misconception_token": "side-times-two"
        },
        {
          "text": "36",
          "is_correct": false,
          "misconception_token": "side-times-three"
        }
      ],
      "solution": "The area of a square is side times side: $12 \\times 12 = 144$ square inches."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "A rectangular kitchen floor is $8$ feet long and $6$ feet wide. Tile costs $2$ dollars for each square foot. How much will it cost to tile the whole floor?",
      "choices": [
        {
          "text": "96 dollars",
          "is_correct": true
        },
        {
          "text": "48 dollars",
          "is_correct": false,
          "misconception_token": "forgot-cost-multiplier"
        },
        {
          "text": "56 dollars",
          "is_correct": false,
          "misconception_token": "used-perimeter-times-cost"
        },
        {
          "text": "28 dollars",
          "is_correct": false,
          "misconception_token": "computed-perimeter-only"
        }
      ],
      "solution": "The floor area is $8 \\times 6 = 48$ square feet, and at $2$ dollars each the cost is $48 \\times 2 = 96$ dollars."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "A rectangular garden has a perimeter of $34$ feet. Its length is $10$ feet. What is the area of the garden in square feet?",
      "choices": [
        {
          "text": "70",
          "is_correct": true
        },
        {
          "text": "140",
          "is_correct": false,
          "misconception_token": "forgot-to-halve-width"
        },
        {
          "text": "240",
          "is_correct": false,
          "misconception_token": "subtracted-length-for-width"
        },
        {
          "text": "100",
          "is_correct": false,
          "misconception_token": "assumed-square"
        }
      ],
      "solution": "The two lengths use $2 \\times 10 = 20$ feet, so the two widths total $34 - 20 = 14$ feet and each width is $7$ feet; the area is $10 \\times 7 = 70$ square feet."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "A rectangular rug has an area of $60$ square feet. Its width is $5$ feet. What is the perimeter of the rug in feet?",
      "choices": [
        {
          "text": "34",
          "is_correct": true
        },
        {
          "text": "17",
          "is_correct": false,
          "misconception_token": "half-perimeter"
        },
        {
          "text": "130",
          "is_correct": false,
          "misconception_token": "used-area-as-length"
        },
        {
          "text": "24",
          "is_correct": false,
          "misconception_token": "doubled-length-only"
        }
      ],
      "solution": "The length is $60 \\div 5 = 12$ feet, so the perimeter is $2 \\times 12 + 2 \\times 5 = 24 + 10 = 34$ feet."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "A rectangular field is $40$ meters long and $25$ meters wide. A runner runs all the way around the edge of the field $2$ times. How many meters does the runner run in total?",
      "choices": [
        {
          "text": "260",
          "is_correct": true
        },
        {
          "text": "130",
          "is_correct": false,
          "misconception_token": "ran-only-one-lap"
        },
        {
          "text": "1000",
          "is_correct": false,
          "misconception_token": "used-area"
        },
        {
          "text": "2000",
          "is_correct": false,
          "misconception_token": "used-area-times-two"
        }
      ],
      "solution": "One lap is the perimeter $2 \\times 40 + 2 \\times 25 = 80 + 50 = 130$ meters, and two laps is $130 \\times 2 = 260$ meters."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "A rectangular garden is $12$ meters long and $9$ meters wide. A fence costs $3$ dollars for each meter. How much will it cost to put a fence all the way around the garden?",
      "choices": [
        {
          "text": "126 dollars",
          "is_correct": true
        },
        {
          "text": "324 dollars",
          "is_correct": false,
          "misconception_token": "used-area-times-cost"
        },
        {
          "text": "42 dollars",
          "is_correct": false,
          "misconception_token": "forgot-cost-multiplier"
        },
        {
          "text": "63 dollars",
          "is_correct": false,
          "misconception_token": "half-perimeter-times-cost"
        }
      ],
      "solution": "The perimeter is $2 \\times 12 + 2 \\times 9 = 24 + 18 = 42$ meters, and at $3$ dollars each the cost is $42 \\times 3 = 126$ dollars."
    }
  ],
}

const EXPONENTS_SCIENTIFIC_NOTATION: GapMathSkill = {
  slug: "exponents-scientific-notation",
  name: "Exponents & Scientific Notation",
  subject: 'math',
  ccssGrade: "8",
  ccssGradeNum: 8,
  ccssCode: "CCSS.MATH.CONTENT.8.EE.A",
  satAlignment: "advanced-math",
  gradeBand: "6-8",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "What is the value of $2^5$?",
      "choices": [
        {
          "text": "32",
          "is_correct": true
        },
        {
          "text": "10",
          "is_correct": false,
          "misconception_token": "multiplied-base-times-exponent"
        },
        {
          "text": "25",
          "is_correct": false,
          "misconception_token": "swapped-base-and-exponent"
        },
        {
          "text": "16",
          "is_correct": false,
          "misconception_token": "used-one-less-exponent"
        }
      ],
      "solution": "$2^5 = 2 \\times 2 \\times 2 \\times 2 \\times 2 = 32$."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "Simplify $3^4 \\times 3^2$.",
      "choices": [
        {
          "text": "$3^6$",
          "is_correct": true
        },
        {
          "text": "$3^8$",
          "is_correct": false,
          "misconception_token": "multiplied-exponents"
        },
        {
          "text": "$9^6$",
          "is_correct": false,
          "misconception_token": "multiplied-bases"
        },
        {
          "text": "$3^2$",
          "is_correct": false,
          "misconception_token": "subtracted-exponents"
        }
      ],
      "solution": "With the same base, add the exponents: $3^4 \\times 3^2 = 3^{4+2} = 3^6$."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "Simplify $\\frac{5^7}{5^3}$.",
      "choices": [
        {
          "text": "$5^4$",
          "is_correct": true
        },
        {
          "text": "$5^{10}$",
          "is_correct": false,
          "misconception_token": "added-exponents"
        },
        {
          "text": "$5^{21}$",
          "is_correct": false,
          "misconception_token": "multiplied-exponents"
        },
        {
          "text": "$1^4$",
          "is_correct": false,
          "misconception_token": "divided-bases"
        }
      ],
      "solution": "With the same base, subtract the exponents: $\\frac{5^7}{5^3} = 5^{7-3} = 5^4$."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "What is the value of $7^0$?",
      "choices": [
        {
          "text": "1",
          "is_correct": true
        },
        {
          "text": "0",
          "is_correct": false,
          "misconception_token": "zero-exponent-gives-zero"
        },
        {
          "text": "7",
          "is_correct": false,
          "misconception_token": "treated-as-base"
        },
        {
          "text": "undefined",
          "is_correct": false,
          "misconception_token": "thinks-undefined"
        }
      ],
      "solution": "Any nonzero number raised to the zero power equals 1, so $7^0 = 1$."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "What is the value of $2^{-3}$?",
      "choices": [
        {
          "text": "$\\frac{1}{8}$",
          "is_correct": true
        },
        {
          "text": "$-8$",
          "is_correct": false,
          "misconception_token": "made-base-negative"
        },
        {
          "text": "$-6$",
          "is_correct": false,
          "misconception_token": "multiplied-base-times-exponent"
        },
        {
          "text": "$8$",
          "is_correct": false,
          "misconception_token": "ignored-negative"
        }
      ],
      "solution": "A negative exponent means reciprocal: $2^{-3} = \\frac{1}{2^3} = \\frac{1}{8}$."
    },
    {
      "slot": 6,
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
          "text": "$x^4$",
          "is_correct": false,
          "misconception_token": "kept-outer-exponent-only"
        },
        {
          "text": "$x^3$",
          "is_correct": false,
          "misconception_token": "kept-inner-exponent-only"
        }
      ],
      "solution": "Raising a power to a power multiplies the exponents: $(x^3)^4 = x^{3 \\times 4} = x^{12}$."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "Write $3 \\times 10^4$ in standard form.",
      "choices": [
        {
          "text": "30000",
          "is_correct": true
        },
        {
          "text": "300000",
          "is_correct": false,
          "misconception_token": "moved-one-extra-place"
        },
        {
          "text": "3000",
          "is_correct": false,
          "misconception_token": "moved-too-few-places"
        },
        {
          "text": "30004",
          "is_correct": false,
          "misconception_token": "added-the-exponent"
        }
      ],
      "solution": "$3 \\times 10^4 = 3 \\times 10000 = 30000$."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "Write the number 52,000 in scientific notation.",
      "choices": [
        {
          "text": "$5.2 \\times 10^4$",
          "is_correct": true
        },
        {
          "text": "$5.2 \\times 10^3$",
          "is_correct": false,
          "misconception_token": "miscounted-places"
        },
        {
          "text": "$52 \\times 10^3$",
          "is_correct": false,
          "misconception_token": "coefficient-not-between-one-and-ten"
        },
        {
          "text": "$5.2 \\times 10^5$",
          "is_correct": false,
          "misconception_token": "overcounted-places"
        }
      ],
      "solution": "Move the decimal 4 places to the left: $52000 = 5.2 \\times 10^4$."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "What is the value of $\\frac{1}{3^{-2}}$?",
      "choices": [
        {
          "text": "9",
          "is_correct": true
        },
        {
          "text": "$\\frac{1}{9}$",
          "is_correct": false,
          "misconception_token": "did-not-flip"
        },
        {
          "text": "$-9$",
          "is_correct": false,
          "misconception_token": "made-negative"
        },
        {
          "text": "6",
          "is_correct": false,
          "misconception_token": "multiplied-base-times-exponent"
        }
      ],
      "solution": "A negative exponent in the denominator moves up: $\\frac{1}{3^{-2}} = 3^{2} = 9$."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "Simplify $(2 \\times 10^3)(4 \\times 10^5)$.",
      "choices": [
        {
          "text": "$8 \\times 10^8$",
          "is_correct": true
        },
        {
          "text": "$8 \\times 10^{15}$",
          "is_correct": false,
          "misconception_token": "multiplied-exponents"
        },
        {
          "text": "$6 \\times 10^8$",
          "is_correct": false,
          "misconception_token": "added-coefficients"
        },
        {
          "text": "$8 \\times 10^2$",
          "is_correct": false,
          "misconception_token": "subtracted-exponents"
        }
      ],
      "solution": "Multiply the coefficients and add the exponents: $2 \\times 4 = 8$ and $10^{3+5} = 10^8$, giving $8 \\times 10^8$."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "Simplify $\\frac{8 \\times 10^9}{2 \\times 10^4}$.",
      "choices": [
        {
          "text": "$4 \\times 10^5$",
          "is_correct": true
        },
        {
          "text": "$4 \\times 10^{13}$",
          "is_correct": false,
          "misconception_token": "added-exponents"
        },
        {
          "text": "$6 \\times 10^5$",
          "is_correct": false,
          "misconception_token": "subtracted-coefficients"
        },
        {
          "text": "$16 \\times 10^5$",
          "is_correct": false,
          "misconception_token": "multiplied-coefficients"
        }
      ],
      "solution": "Divide the coefficients and subtract the exponents: $8 \\div 2 = 4$ and $10^{9-4} = 10^5$, giving $4 \\times 10^5$."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "How many times larger is $6 \\times 10^8$ than $3 \\times 10^5$?",
      "choices": [
        {
          "text": "$2 \\times 10^3$",
          "is_correct": true
        },
        {
          "text": "$2 \\times 10^{13}$",
          "is_correct": false,
          "misconception_token": "added-exponents"
        },
        {
          "text": "$18 \\times 10^3$",
          "is_correct": false,
          "misconception_token": "multiplied-coefficients"
        },
        {
          "text": "$0.5 \\times 10^3$",
          "is_correct": false,
          "misconception_token": "inverted-coefficient-division"
        }
      ],
      "solution": "Divide: $\\frac{6 \\times 10^8}{3 \\times 10^5} = 2 \\times 10^{8-5} = 2 \\times 10^3$."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "A data center stores 74,000,000,000 bytes of information. Write this number in scientific notation.",
      "choices": [
        {
          "text": "$7.4 \\times 10^{10}$",
          "is_correct": true
        },
        {
          "text": "$7.4 \\times 10^9$",
          "is_correct": false,
          "misconception_token": "miscounted-places"
        },
        {
          "text": "$74 \\times 10^9$",
          "is_correct": false,
          "misconception_token": "coefficient-not-between-one-and-ten"
        },
        {
          "text": "$7.4 \\times 10^{11}$",
          "is_correct": false,
          "misconception_token": "overcounted-places"
        }
      ],
      "solution": "Move the decimal 10 places: $74000000000 = 7.4 \\times 10^{10}$."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "A virus particle measures about 0.00000012 meters across. Write this number in scientific notation.",
      "choices": [
        {
          "text": "$1.2 \\times 10^{-7}$",
          "is_correct": true
        },
        {
          "text": "$1.2 \\times 10^{7}$",
          "is_correct": false,
          "misconception_token": "wrong-sign-exponent"
        },
        {
          "text": "$1.2 \\times 10^{-6}$",
          "is_correct": false,
          "misconception_token": "miscounted-places"
        },
        {
          "text": "$12 \\times 10^{-8}$",
          "is_correct": false,
          "misconception_token": "coefficient-not-between-one-and-ten"
        }
      ],
      "solution": "Move the decimal 7 places to the right: $0.00000012 = 1.2 \\times 10^{-7}$."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "What is the value of $(-3)^3$?",
      "choices": [
        {
          "text": "$-27$",
          "is_correct": true
        },
        {
          "text": "$27$",
          "is_correct": false,
          "misconception_token": "dropped-negative-sign"
        },
        {
          "text": "$-9$",
          "is_correct": false,
          "misconception_token": "multiplied-base-times-exponent"
        },
        {
          "text": "$9$",
          "is_correct": false,
          "misconception_token": "squared-instead-of-cubed"
        }
      ],
      "solution": "$(-3)^3 = (-3)(-3)(-3) = -27$; an odd power keeps the negative sign."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "Simplify $\\frac{a^3}{a^{-2}}$.",
      "choices": [
        {
          "text": "$a^5$",
          "is_correct": true
        },
        {
          "text": "$a$",
          "is_correct": false,
          "misconception_token": "kept-negative-sign"
        },
        {
          "text": "$a^6$",
          "is_correct": false,
          "misconception_token": "multiplied-exponents"
        },
        {
          "text": "$\\frac{1}{a^5}$",
          "is_correct": false,
          "misconception_token": "flipped-final-sign"
        }
      ],
      "solution": "Subtract the exponents: $\\frac{a^3}{a^{-2}} = a^{3-(-2)} = a^5$."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "Simplify $(5 \\times 10^6)(6 \\times 10^3)$ and express the result in scientific notation.",
      "choices": [
        {
          "text": "$3 \\times 10^{10}$",
          "is_correct": true
        },
        {
          "text": "$30 \\times 10^9$",
          "is_correct": false,
          "misconception_token": "not-normalized"
        },
        {
          "text": "$11 \\times 10^9$",
          "is_correct": false,
          "misconception_token": "added-coefficients"
        },
        {
          "text": "$3 \\times 10^9$",
          "is_correct": false,
          "misconception_token": "forgot-to-adjust-exponent"
        }
      ],
      "solution": "$5 \\times 6 = 30$ and $10^{6+3} = 10^9$, so $30 \\times 10^9 = 3 \\times 10^{10}$ after normalizing."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "The distance from Earth to the Sun is about $1.5 \\times 10^{11}$ meters, and the distance from Earth to the Moon is about $3 \\times 10^8$ meters. About how many times farther away is the Sun than the Moon?",
      "choices": [
        {
          "text": "$5 \\times 10^2$",
          "is_correct": true
        },
        {
          "text": "$5 \\times 10^3$",
          "is_correct": false,
          "misconception_token": "mis-normalized-coefficient"
        },
        {
          "text": "$2 \\times 10^3$",
          "is_correct": false,
          "misconception_token": "inverted-division"
        },
        {
          "text": "$4.5 \\times 10^{19}$",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-dividing"
        }
      ],
      "solution": "$\\frac{1.5 \\times 10^{11}}{3 \\times 10^8} = 0.5 \\times 10^3 = 5 \\times 10^2$."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "One bacterium has a mass of about $9.5 \\times 10^{-13}$ grams. A colony contains $4 \\times 10^8$ bacteria. What is the total mass of the colony, in grams?",
      "choices": [
        {
          "text": "$3.8 \\times 10^{-4}$",
          "is_correct": true
        },
        {
          "text": "$38 \\times 10^{-5}$",
          "is_correct": false,
          "misconception_token": "not-normalized"
        },
        {
          "text": "$3.8 \\times 10^{-5}$",
          "is_correct": false,
          "misconception_token": "forgot-to-adjust-exponent"
        },
        {
          "text": "$13.5 \\times 10^{-5}$",
          "is_correct": false,
          "misconception_token": "added-coefficients"
        }
      ],
      "solution": "$9.5 \\times 4 = 38$ and $10^{-13+8} = 10^{-5}$, so $38 \\times 10^{-5} = 3.8 \\times 10^{-4}$."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "Simplify $\\frac{(2^3)^2 \\cdot 2^{-4}}{2^5}$.",
      "choices": [
        {
          "text": "$\\frac{1}{8}$",
          "is_correct": true
        },
        {
          "text": "$8$",
          "is_correct": false,
          "misconception_token": "dropped-final-negative-sign"
        },
        {
          "text": "$\\frac{1}{16}$",
          "is_correct": false,
          "misconception_token": "added-inner-exponents"
        },
        {
          "text": "$32$",
          "is_correct": false,
          "misconception_token": "ignored-negative-exponent"
        }
      ],
      "solution": "$(2^3)^2 = 2^6$, then $2^6 \\cdot 2^{-4} = 2^2$, and $\\frac{2^2}{2^5} = 2^{-3} = \\frac{1}{8}$."
    }
  ],
}

const PYTHAGOREAN_THEOREM: GapMathSkill = {
  slug: "pythagorean-theorem",
  name: "Pythagorean Theorem",
  subject: 'math',
  ccssGrade: "8",
  ccssGradeNum: 8,
  ccssCode: "CCSS.MATH.CONTENT.8.G.B.7",
  satAlignment: "geometry-trigonometry",
  gradeBand: "6-8",
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
          "text": "12",
          "is_correct": false,
          "misconception_token": "multiplied-legs"
        }
      ],
      "solution": "Using $a^2 + b^2 = c^2$: $3^2 + 4^2 = 9 + 16 = 25$, so $c = \\sqrt{25} = 5$."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "A right triangle has legs of length $6$ and $8$. What is the length of the hypotenuse?",
      "choices": [
        {
          "text": "10",
          "is_correct": true
        },
        {
          "text": "14",
          "is_correct": false,
          "misconception_token": "added-legs"
        },
        {
          "text": "100",
          "is_correct": false,
          "misconception_token": "forgot-square-root"
        },
        {
          "text": "48",
          "is_correct": false,
          "misconception_token": "multiplied-legs"
        }
      ],
      "solution": "Using $a^2 + b^2 = c^2$: $6^2 + 8^2 = 36 + 64 = 100$, so $c = \\sqrt{100} = 10$."
    },
    {
      "slot": 3,
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
          "text": "60",
          "is_correct": false,
          "misconception_token": "multiplied-legs"
        }
      ],
      "solution": "Using $a^2 + b^2 = c^2$: $5^2 + 12^2 = 25 + 144 = 169$, so $c = \\sqrt{169} = 13$."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "A right triangle has legs of length $8$ and $15$. What is the length of the hypotenuse?",
      "choices": [
        {
          "text": "17",
          "is_correct": true
        },
        {
          "text": "23",
          "is_correct": false,
          "misconception_token": "added-legs"
        },
        {
          "text": "289",
          "is_correct": false,
          "misconception_token": "forgot-square-root"
        },
        {
          "text": "120",
          "is_correct": false,
          "misconception_token": "multiplied-legs"
        }
      ],
      "solution": "Using $a^2 + b^2 = c^2$: $8^2 + 15^2 = 64 + 225 = 289$, so $c = \\sqrt{289} = 17$."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "A right triangle has a hypotenuse of length $5$ and one leg of length $3$. What is the length of the other leg?",
      "choices": [
        {
          "text": "4",
          "is_correct": true
        },
        {
          "text": "$\\sqrt{34}$",
          "is_correct": false,
          "misconception_token": "added-squares-instead-of-subtracting"
        },
        {
          "text": "2",
          "is_correct": false,
          "misconception_token": "subtracted-lengths"
        },
        {
          "text": "8",
          "is_correct": false,
          "misconception_token": "added-lengths"
        }
      ],
      "solution": "Rearrange to $b^2 = c^2 - a^2 = 5^2 - 3^2 = 25 - 9 = 16$, so $b = \\sqrt{16} = 4$."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "A right triangle has a hypotenuse of length $10$ and one leg of length $8$. What is the length of the other leg?",
      "choices": [
        {
          "text": "6",
          "is_correct": true
        },
        {
          "text": "$\\sqrt{164}$",
          "is_correct": false,
          "misconception_token": "added-squares-instead-of-subtracting"
        },
        {
          "text": "2",
          "is_correct": false,
          "misconception_token": "subtracted-lengths"
        },
        {
          "text": "18",
          "is_correct": false,
          "misconception_token": "added-lengths"
        }
      ],
      "solution": "Rearrange to $b^2 = c^2 - a^2 = 10^2 - 8^2 = 100 - 64 = 36$, so $b = \\sqrt{36} = 6$."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "A right triangle has a hypotenuse of length $13$ and one leg of length $5$. What is the length of the other leg?",
      "choices": [
        {
          "text": "12",
          "is_correct": true
        },
        {
          "text": "$\\sqrt{194}$",
          "is_correct": false,
          "misconception_token": "added-squares-instead-of-subtracting"
        },
        {
          "text": "8",
          "is_correct": false,
          "misconception_token": "subtracted-lengths"
        },
        {
          "text": "18",
          "is_correct": false,
          "misconception_token": "added-lengths"
        }
      ],
      "solution": "Rearrange to $b^2 = c^2 - a^2 = 13^2 - 5^2 = 169 - 25 = 144$, so $b = \\sqrt{144} = 12$."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "A right triangle has two legs, each of length $1$. What is the length of the hypotenuse?",
      "choices": [
        {
          "text": "$\\sqrt{2}$",
          "is_correct": true
        },
        {
          "text": "2",
          "is_correct": false,
          "misconception_token": "forgot-square-root"
        },
        {
          "text": "1",
          "is_correct": false,
          "misconception_token": "used-single-leg"
        },
        {
          "text": "4",
          "is_correct": false,
          "misconception_token": "squared-the-sum"
        }
      ],
      "solution": "Using $a^2 + b^2 = c^2$: $1^2 + 1^2 = 2$, so $c = \\sqrt{2}$."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "A ladder $17$ feet long leans against a wall with its base $8$ feet from the wall. How high up the wall does the ladder reach?",
      "choices": [
        {
          "text": "15",
          "is_correct": true
        },
        {
          "text": "$\\sqrt{353}$",
          "is_correct": false,
          "misconception_token": "added-squares-instead-of-subtracting"
        },
        {
          "text": "9",
          "is_correct": false,
          "misconception_token": "subtracted-lengths"
        },
        {
          "text": "25",
          "is_correct": false,
          "misconception_token": "added-lengths"
        }
      ],
      "solution": "The ladder is the hypotenuse: $h^2 = 17^2 - 8^2 = 289 - 64 = 225$, so $h = \\sqrt{225} = 15$ feet."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "An isosceles right triangle has two legs, each of length $5$. What is the length of the hypotenuse?",
      "choices": [
        {
          "text": "$5\\sqrt{2}$",
          "is_correct": true
        },
        {
          "text": "10",
          "is_correct": false,
          "misconception_token": "added-legs"
        },
        {
          "text": "50",
          "is_correct": false,
          "misconception_token": "forgot-square-root"
        },
        {
          "text": "$5\\sqrt{10}$",
          "is_correct": false,
          "misconception_token": "wrong-radical-simplification"
        }
      ],
      "solution": "Using $a^2 + b^2 = c^2$: $5^2 + 5^2 = 50$, so $c = \\sqrt{50} = \\sqrt{25 \\times 2} = 5\\sqrt{2}$."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "What is the distance between the points $(1, 2)$ and $(4, 6)$ on the coordinate plane?",
      "choices": [
        {
          "text": "5",
          "is_correct": true
        },
        {
          "text": "7",
          "is_correct": false,
          "misconception_token": "added-differences"
        },
        {
          "text": "25",
          "is_correct": false,
          "misconception_token": "forgot-square-root"
        },
        {
          "text": "$\\sqrt{7}$",
          "is_correct": false,
          "misconception_token": "did-not-square-differences"
        }
      ],
      "solution": "The differences are $4 - 1 = 3$ and $6 - 2 = 4$, so the distance is $\\sqrt{3^2 + 4^2} = \\sqrt{25} = 5$."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "What is the distance between the points $(-2, 1)$ and $(3, 13)$ on the coordinate plane?",
      "choices": [
        {
          "text": "13",
          "is_correct": true
        },
        {
          "text": "17",
          "is_correct": false,
          "misconception_token": "added-differences"
        },
        {
          "text": "169",
          "is_correct": false,
          "misconception_token": "forgot-square-root"
        },
        {
          "text": "$\\sqrt{17}$",
          "is_correct": false,
          "misconception_token": "did-not-square-differences"
        }
      ],
      "solution": "The differences are $3 - (-2) = 5$ and $13 - 1 = 12$, so the distance is $\\sqrt{5^2 + 12^2} = \\sqrt{169} = 13$."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "A rectangle measures $20$ cm by $21$ cm. What is the length of its diagonal?",
      "choices": [
        {
          "text": "29",
          "is_correct": true
        },
        {
          "text": "41",
          "is_correct": false,
          "misconception_token": "added-sides"
        },
        {
          "text": "841",
          "is_correct": false,
          "misconception_token": "forgot-square-root"
        },
        {
          "text": "420",
          "is_correct": false,
          "misconception_token": "multiplied-sides"
        }
      ],
      "solution": "The diagonal is the hypotenuse: $d^2 = 20^2 + 21^2 = 400 + 441 = 841$, so $d = \\sqrt{841} = 29$ cm."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "A person walks $9$ blocks east and then $12$ blocks north. How far is the person from the starting point in a straight line?",
      "choices": [
        {
          "text": "15",
          "is_correct": true
        },
        {
          "text": "21",
          "is_correct": false,
          "misconception_token": "added-distances"
        },
        {
          "text": "225",
          "is_correct": false,
          "misconception_token": "forgot-square-root"
        },
        {
          "text": "3",
          "is_correct": false,
          "misconception_token": "subtracted-distances"
        }
      ],
      "solution": "The two legs are $9$ and $12$: $d = \\sqrt{9^2 + 12^2} = \\sqrt{81 + 144} = \\sqrt{225} = 15$ blocks."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "A right triangle has a hypotenuse of length $25$ and one leg of length $24$. What is the length of the other leg?",
      "choices": [
        {
          "text": "7",
          "is_correct": true
        },
        {
          "text": "1",
          "is_correct": false,
          "misconception_token": "subtracted-lengths"
        },
        {
          "text": "49",
          "is_correct": false,
          "misconception_token": "forgot-square-root"
        },
        {
          "text": "$\\sqrt{1201}$",
          "is_correct": false,
          "misconception_token": "added-squares-instead-of-subtracting"
        }
      ],
      "solution": "Rearrange to $b^2 = c^2 - a^2 = 25^2 - 24^2 = 625 - 576 = 49$, so $b = \\sqrt{49} = 7$."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "A rectangular box has edge lengths $2$, $3$, and $6$. What is the length of the box's longest interior diagonal?",
      "choices": [
        {
          "text": "7",
          "is_correct": true
        },
        {
          "text": "11",
          "is_correct": false,
          "misconception_token": "added-edges"
        },
        {
          "text": "49",
          "is_correct": false,
          "misconception_token": "forgot-square-root"
        },
        {
          "text": "$\\sqrt{13}$",
          "is_correct": false,
          "misconception_token": "used-two-edges"
        }
      ],
      "solution": "The space diagonal is $\\sqrt{2^2 + 3^2 + 6^2} = \\sqrt{4 + 9 + 36} = \\sqrt{49} = 7$."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "A rectangular box has edge lengths $3$, $4$, and $12$. What is the length of the box's longest interior diagonal?",
      "choices": [
        {
          "text": "13",
          "is_correct": true
        },
        {
          "text": "19",
          "is_correct": false,
          "misconception_token": "added-edges"
        },
        {
          "text": "5",
          "is_correct": false,
          "misconception_token": "used-two-edges"
        },
        {
          "text": "169",
          "is_correct": false,
          "misconception_token": "forgot-square-root"
        }
      ],
      "solution": "The space diagonal is $\\sqrt{3^2 + 4^2 + 12^2} = \\sqrt{9 + 16 + 144} = \\sqrt{169} = 13$."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "A $25$-foot ladder leans against a wall, reaching $24$ feet up. The base is then pulled out until the top of the ladder is only $20$ feet up the wall. How far is the base of the ladder from the wall now?",
      "choices": [
        {
          "text": "15",
          "is_correct": true
        },
        {
          "text": "5",
          "is_correct": false,
          "misconception_token": "subtracted-lengths"
        },
        {
          "text": "45",
          "is_correct": false,
          "misconception_token": "added-lengths"
        },
        {
          "text": "$\\sqrt{1025}$",
          "is_correct": false,
          "misconception_token": "added-squares-instead-of-subtracting"
        }
      ],
      "solution": "The ladder length ($25$) stays the hypotenuse. With the top at $20$: $b^2 = 25^2 - 20^2 = 625 - 400 = 225$, so $b = \\sqrt{225} = 15$ feet."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "A cube has edges of length $4$. What is the length of the cube's longest interior diagonal (from one corner to the opposite corner)?",
      "choices": [
        {
          "text": "$4\\sqrt{3}$",
          "is_correct": true
        },
        {
          "text": "12",
          "is_correct": false,
          "misconception_token": "added-edges"
        },
        {
          "text": "48",
          "is_correct": false,
          "misconception_token": "forgot-square-root"
        },
        {
          "text": "$4\\sqrt{2}$",
          "is_correct": false,
          "misconception_token": "used-two-edges"
        }
      ],
      "solution": "The space diagonal is $\\sqrt{4^2 + 4^2 + 4^2} = \\sqrt{48} = \\sqrt{16 \\times 3} = 4\\sqrt{3}$."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "An isosceles triangle has a base of length $10$ and two equal sides of length $13$. What is the height of the triangle from the base to the opposite vertex?",
      "choices": [
        {
          "text": "12",
          "is_correct": true
        },
        {
          "text": "$\\sqrt{194}$",
          "is_correct": false,
          "misconception_token": "added-squares-instead-of-subtracting"
        },
        {
          "text": "8",
          "is_correct": false,
          "misconception_token": "subtracted-lengths"
        },
        {
          "text": "3",
          "is_correct": false,
          "misconception_token": "subtracted-base-from-side"
        }
      ],
      "solution": "The height splits the base in half, giving a right triangle with hypotenuse $13$ and one leg $5$: $h^2 = 13^2 - 5^2 = 169 - 25 = 144$, so $h = \\sqrt{144} = 12$."
    }
  ],
}

const TRANSFORMATIONS_8: GapMathSkill = {
  slug: "transformations-8",
  name: "Transformations",
  subject: 'math',
  ccssGrade: "8",
  ccssGradeNum: 8,
  ccssCode: "CCSS.MATH.CONTENT.8.G.A",
  satAlignment: "geometry-trigonometry",
  gradeBand: "6-8",
  items: [
    {
      "slot": 1,
      "difficulty": "easy",
      "stem": "The point $(3, -2)$ is reflected over the x-axis. What are the coordinates of its image?",
      "choices": [
        {
          "text": "$(3, 2)$",
          "is_correct": true
        },
        {
          "text": "$(-3, -2)$",
          "is_correct": false,
          "misconception_token": "reflected-over-y-axis"
        },
        {
          "text": "$(-3, 2)$",
          "is_correct": false,
          "misconception_token": "rotated-180-instead"
        },
        {
          "text": "$(-2, 3)$",
          "is_correct": false,
          "misconception_token": "swapped-coordinates"
        }
      ],
      "solution": "A reflection over the x-axis keeps $x$ and negates $y$: $(3, -2) \\to (3, 2)$."
    },
    {
      "slot": 2,
      "difficulty": "easy",
      "stem": "The point $(-4, 5)$ is reflected over the y-axis. What are the coordinates of its image?",
      "choices": [
        {
          "text": "$(4, 5)$",
          "is_correct": true
        },
        {
          "text": "$(-4, -5)$",
          "is_correct": false,
          "misconception_token": "reflected-over-x-axis"
        },
        {
          "text": "$(4, -5)$",
          "is_correct": false,
          "misconception_token": "rotated-180-instead"
        },
        {
          "text": "$(5, -4)$",
          "is_correct": false,
          "misconception_token": "swapped-coordinates"
        }
      ],
      "solution": "A reflection over the y-axis negates $x$ and keeps $y$: $(-4, 5) \\to (4, 5)$."
    },
    {
      "slot": 3,
      "difficulty": "easy",
      "stem": "The point $(2, 3)$ is translated right 4 units and up 1 unit. What are the coordinates of its image?",
      "choices": [
        {
          "text": "$(6, 4)$",
          "is_correct": true
        },
        {
          "text": "$(6, 2)$",
          "is_correct": false,
          "misconception_token": "moved-down-not-up"
        },
        {
          "text": "$(-2, 4)$",
          "is_correct": false,
          "misconception_token": "moved-left-not-right"
        },
        {
          "text": "$(3, 7)$",
          "is_correct": false,
          "misconception_token": "swapped-shift-amounts"
        }
      ],
      "solution": "Translating right 4 and up 1 adds to each coordinate: $(2+4, 3+1) = (6, 4)$."
    },
    {
      "slot": 4,
      "difficulty": "easy",
      "stem": "The point $(1, 4)$ is rotated $180^\\circ$ about the origin. What are the coordinates of its image?",
      "choices": [
        {
          "text": "$(-1, -4)$",
          "is_correct": true
        },
        {
          "text": "$(1, -4)$",
          "is_correct": false,
          "misconception_token": "reflected-over-x-axis"
        },
        {
          "text": "$(-1, 4)$",
          "is_correct": false,
          "misconception_token": "reflected-over-y-axis"
        },
        {
          "text": "$(4, 1)$",
          "is_correct": false,
          "misconception_token": "swapped-coordinates"
        }
      ],
      "solution": "A $180^\\circ$ rotation about the origin negates both coordinates: $(1, 4) \\to (-1, -4)$."
    },
    {
      "slot": 5,
      "difficulty": "easy",
      "stem": "The point $(3, -1)$ is dilated from the origin by a scale factor of $2$. What are the coordinates of its image?",
      "choices": [
        {
          "text": "$(6, -2)$",
          "is_correct": true
        },
        {
          "text": "$(6, -1)$",
          "is_correct": false,
          "misconception_token": "scaled-x-only"
        },
        {
          "text": "$(5, 1)$",
          "is_correct": false,
          "misconception_token": "added-scale-factor"
        },
        {
          "text": "$(1.5, -0.5)$",
          "is_correct": false,
          "misconception_token": "divided-by-factor"
        }
      ],
      "solution": "A dilation from the origin multiplies both coordinates by the scale factor: $(3 \\times 2, -1 \\times 2) = (6, -2)$."
    },
    {
      "slot": 6,
      "difficulty": "easy",
      "stem": "The point $(-2, -6)$ is reflected over the x-axis. What are the coordinates of its image?",
      "choices": [
        {
          "text": "$(-2, 6)$",
          "is_correct": true
        },
        {
          "text": "$(2, -6)$",
          "is_correct": false,
          "misconception_token": "reflected-over-y-axis"
        },
        {
          "text": "$(2, 6)$",
          "is_correct": false,
          "misconception_token": "rotated-180-instead"
        },
        {
          "text": "$(-6, -2)$",
          "is_correct": false,
          "misconception_token": "swapped-coordinates"
        }
      ],
      "solution": "A reflection over the x-axis keeps $x$ and negates $y$: $(-2, -6) \\to (-2, 6)$."
    },
    {
      "slot": 7,
      "difficulty": "easy",
      "stem": "The point $(5, 2)$ is rotated $90^\\circ$ counterclockwise about the origin. What are the coordinates of its image?",
      "choices": [
        {
          "text": "$(-2, 5)$",
          "is_correct": true
        },
        {
          "text": "$(2, -5)$",
          "is_correct": false,
          "misconception_token": "used-clockwise-rule"
        },
        {
          "text": "$(2, 5)$",
          "is_correct": false,
          "misconception_token": "swapped-without-negating"
        },
        {
          "text": "$(-5, -2)$",
          "is_correct": false,
          "misconception_token": "rotated-180-instead"
        }
      ],
      "solution": "A $90^\\circ$ counterclockwise rotation sends $(x, y) \\to (-y, x)$: $(5, 2) \\to (-2, 5)$."
    },
    {
      "slot": 8,
      "difficulty": "easy",
      "stem": "The point $(-3, 4)$ is translated left 2 units and down 5 units. What are the coordinates of its image?",
      "choices": [
        {
          "text": "$(-5, -1)$",
          "is_correct": true
        },
        {
          "text": "$(-1, -1)$",
          "is_correct": false,
          "misconception_token": "moved-right-not-left"
        },
        {
          "text": "$(-5, 9)$",
          "is_correct": false,
          "misconception_token": "moved-up-not-down"
        },
        {
          "text": "$(-1, 9)$",
          "is_correct": false,
          "misconception_token": "reversed-both-directions"
        }
      ],
      "solution": "Left 2 subtracts from $x$ and down 5 subtracts from $y$: $(-3-2, 4-5) = (-5, -1)$."
    },
    {
      "slot": 9,
      "difficulty": "medium",
      "stem": "Triangle $ABC$ has vertices $A(2, 3)$, $B(5, 3)$, and $C(2, 7)$. Its image has vertices $A'(-2, 3)$, $B'(-5, 3)$, and $C'(-2, 7)$. Which transformation was applied?",
      "choices": [
        {
          "text": "Reflection over the y-axis",
          "is_correct": true
        },
        {
          "text": "Reflection over the x-axis",
          "is_correct": false,
          "misconception_token": "reflected-wrong-axis"
        },
        {
          "text": "Rotation of 180 degrees about the origin",
          "is_correct": false,
          "misconception_token": "mistook-for-rotation"
        },
        {
          "text": "Translation to the left",
          "is_correct": false,
          "misconception_token": "mistook-for-translation"
        }
      ],
      "solution": "Each $x$ is negated while every $y$ stays the same, so the figure was reflected over the y-axis: $(x, y) \\to (-x, y)$."
    },
    {
      "slot": 10,
      "difficulty": "medium",
      "stem": "The point $(-6, 3)$ is rotated $270^\\circ$ counterclockwise about the origin. What are the coordinates of its image?",
      "choices": [
        {
          "text": "$(3, 6)$",
          "is_correct": true
        },
        {
          "text": "$(-3, -6)$",
          "is_correct": false,
          "misconception_token": "used-90-ccw-rule"
        },
        {
          "text": "$(6, -3)$",
          "is_correct": false,
          "misconception_token": "rotated-180-instead"
        },
        {
          "text": "$(3, -6)$",
          "is_correct": false,
          "misconception_token": "swapped-without-negating"
        }
      ],
      "solution": "A $270^\\circ$ counterclockwise rotation sends $(x, y) \\to (y, -x)$: $(-6, 3) \\to (3, 6)$."
    },
    {
      "slot": 11,
      "difficulty": "medium",
      "stem": "On a coordinate map, a park entrance is at $(4, -6)$. A designer applies a dilation from the origin with scale factor $\\frac{1}{2}$. What are the coordinates of the image?",
      "choices": [
        {
          "text": "$(2, -3)$",
          "is_correct": true
        },
        {
          "text": "$(8, -12)$",
          "is_correct": false,
          "misconception_token": "multiplied-instead-of-halved"
        },
        {
          "text": "$(4.5, -5.5)$",
          "is_correct": false,
          "misconception_token": "added-scale-factor"
        },
        {
          "text": "$(2, -6)$",
          "is_correct": false,
          "misconception_token": "scaled-x-only"
        }
      ],
      "solution": "Multiply both coordinates by $\\frac{1}{2}$: $(4 \\times \\frac{1}{2}, -6 \\times \\frac{1}{2}) = (2, -3)$."
    },
    {
      "slot": 12,
      "difficulty": "medium",
      "stem": "Triangle $PQR$ has vertices $P(1, 2)$, $Q(4, 5)$, and $R(6, 2)$. Its image has vertices $P'(1, -3)$, $Q'(4, 0)$, and $R'(6, -3)$. Which transformation was applied?",
      "choices": [
        {
          "text": "Translation down 5 units",
          "is_correct": true
        },
        {
          "text": "Reflection over the x-axis",
          "is_correct": false,
          "misconception_token": "mistook-for-reflection"
        },
        {
          "text": "Translation up 5 units",
          "is_correct": false,
          "misconception_token": "wrong-direction"
        },
        {
          "text": "Translation down 3 units",
          "is_correct": false,
          "misconception_token": "misread-distance"
        }
      ],
      "solution": "Every $x$ stays the same and every $y$ decreases by 5, so the figure was translated down 5 units."
    },
    {
      "slot": 13,
      "difficulty": "medium",
      "stem": "A video game character stands at $(-7, 2)$. When the level flips, the character is reflected over the y-axis. What are the character's new coordinates?",
      "choices": [
        {
          "text": "$(7, 2)$",
          "is_correct": true
        },
        {
          "text": "$(-7, -2)$",
          "is_correct": false,
          "misconception_token": "reflected-over-x-axis"
        },
        {
          "text": "$(7, -2)$",
          "is_correct": false,
          "misconception_token": "rotated-180-instead"
        },
        {
          "text": "$(2, -7)$",
          "is_correct": false,
          "misconception_token": "swapped-coordinates"
        }
      ],
      "solution": "A reflection over the y-axis negates $x$ and keeps $y$: $(-7, 2) \\to (7, 2)$."
    },
    {
      "slot": 14,
      "difficulty": "medium",
      "stem": "The point $(3, 5)$ is first translated up 2 units and then reflected over the x-axis. What are the coordinates of the final image?",
      "choices": [
        {
          "text": "$(3, -7)$",
          "is_correct": true
        },
        {
          "text": "$(3, 7)$",
          "is_correct": false,
          "misconception_token": "forgot-to-reflect"
        },
        {
          "text": "$(3, -3)$",
          "is_correct": false,
          "misconception_token": "performed-steps-in-reverse"
        },
        {
          "text": "$(-3, 7)$",
          "is_correct": false,
          "misconception_token": "reflected-wrong-axis"
        }
      ],
      "solution": "Up 2 gives $(3, 7)$, then reflecting over the x-axis negates $y$: $(3, 7) \\to (3, -7)$."
    },
    {
      "slot": 15,
      "difficulty": "medium",
      "stem": "A photo has a corner at $(-2, 5)$. It is enlarged by a dilation from the origin with scale factor $3$. What are the new coordinates of that corner?",
      "choices": [
        {
          "text": "$(-6, 15)$",
          "is_correct": true
        },
        {
          "text": "$(1, 8)$",
          "is_correct": false,
          "misconception_token": "added-scale-factor"
        },
        {
          "text": "$(-6, 5)$",
          "is_correct": false,
          "misconception_token": "scaled-x-only"
        },
        {
          "text": "$(-2, 15)$",
          "is_correct": false,
          "misconception_token": "scaled-y-only"
        }
      ],
      "solution": "Multiply both coordinates by $3$: $(-2 \\times 3, 5 \\times 3) = (-6, 15)$."
    },
    {
      "slot": 16,
      "difficulty": "medium",
      "stem": "The point $(-3, -8)$ is rotated $90^\\circ$ clockwise about the origin. What are the coordinates of its image?",
      "choices": [
        {
          "text": "$(-8, 3)$",
          "is_correct": true
        },
        {
          "text": "$(8, -3)$",
          "is_correct": false,
          "misconception_token": "used-counterclockwise-rule"
        },
        {
          "text": "$(3, 8)$",
          "is_correct": false,
          "misconception_token": "rotated-180-instead"
        },
        {
          "text": "$(-8, -3)$",
          "is_correct": false,
          "misconception_token": "forgot-to-negate"
        }
      ],
      "solution": "A $90^\\circ$ clockwise rotation sends $(x, y) \\to (y, -x)$: $(-3, -8) \\to (-8, 3)$."
    },
    {
      "slot": 17,
      "difficulty": "hard",
      "stem": "A drone starts at $(6, -4)$. It is rotated $180^\\circ$ about the origin, then translated left 3 units and up 5 units. What is its final position?",
      "choices": [
        {
          "text": "$(-9, 9)$",
          "is_correct": true
        },
        {
          "text": "$(3, 1)$",
          "is_correct": false,
          "misconception_token": "skipped-rotation"
        },
        {
          "text": "$(-6, 4)$",
          "is_correct": false,
          "misconception_token": "skipped-translation"
        },
        {
          "text": "$(-3, -1)$",
          "is_correct": false,
          "misconception_token": "reversed-translation-directions"
        }
      ],
      "solution": "The $180^\\circ$ rotation gives $(-6, 4)$, then left 3 and up 5 gives $(-6-3, 4+5) = (-9, 9)$."
    },
    {
      "slot": 18,
      "difficulty": "hard",
      "stem": "Triangle $ABC$ has vertices $A(1, 2)$, $B(3, 4)$, and $C(5, 1)$. Its image has vertices $A'(3, 6)$, $B'(9, 12)$, and $C'(15, 3)$. Which transformation was applied?",
      "choices": [
        {
          "text": "Dilation from the origin with scale factor 3",
          "is_correct": true
        },
        {
          "text": "Dilation from the origin with scale factor 2",
          "is_correct": false,
          "misconception_token": "wrong-scale-factor"
        },
        {
          "text": "Translation by adding 2 to each coordinate",
          "is_correct": false,
          "misconception_token": "mistook-for-translation"
        },
        {
          "text": "Rotation of 90 degrees about the origin",
          "is_correct": false,
          "misconception_token": "mistook-for-rotation"
        }
      ],
      "solution": "Each coordinate is multiplied by 3 (for example $A(1, 2) \\to A'(3, 6)$), so it is a dilation from the origin with scale factor 3."
    },
    {
      "slot": 19,
      "difficulty": "hard",
      "stem": "A robot at $(-5, 6)$ is reflected over the x-axis and then rotated $90^\\circ$ counterclockwise about the origin. What are its final coordinates?",
      "choices": [
        {
          "text": "$(6, -5)$",
          "is_correct": true
        },
        {
          "text": "$(-6, 5)$",
          "is_correct": false,
          "misconception_token": "performed-steps-in-reverse"
        },
        {
          "text": "$(-6, -5)$",
          "is_correct": false,
          "misconception_token": "skipped-reflection"
        },
        {
          "text": "$(-5, -6)$",
          "is_correct": false,
          "misconception_token": "skipped-rotation"
        }
      ],
      "solution": "Reflecting over the x-axis gives $(-5, -6)$, then a $90^\\circ$ counterclockwise rotation sends $(x, y) \\to (-y, x)$: $(-5, -6) \\to (6, -5)$."
    },
    {
      "slot": 20,
      "difficulty": "hard",
      "stem": "An architect places a beam endpoint at $(8, -10)$. She dilates the drawing from the origin by scale factor $\\frac{1}{2}$, then reflects the result over the y-axis. What are the final coordinates?",
      "choices": [
        {
          "text": "$(-4, -5)$",
          "is_correct": true
        },
        {
          "text": "$(4, -5)$",
          "is_correct": false,
          "misconception_token": "skipped-reflection"
        },
        {
          "text": "$(4, 5)$",
          "is_correct": false,
          "misconception_token": "reflected-wrong-axis"
        },
        {
          "text": "$(-16, -20)$",
          "is_correct": false,
          "misconception_token": "used-reciprocal-factor"
        }
      ],
      "solution": "The dilation gives $(8 \\times \\frac{1}{2}, -10 \\times \\frac{1}{2}) = (4, -5)$, then reflecting over the y-axis negates $x$: $(4, -5) \\to (-4, -5)$."
    }
  ],
}

export const GRADE_4_8_MATH_SKILLS: GapMathSkill[] = [
  MULTI_DIGIT_MULTIPLICATION,
  MULTI_DIGIT_DIVISION,
  FRACTION_EQUIVALENCE,
  FRACTION_OPERATIONS_4,
  FACTORS_MULTIPLES,
  AREA_PERIMETER,
  EXPONENTS_SCIENTIFIC_NOTATION,
  PYTHAGOREAN_THEOREM,
  TRANSFORMATIONS_8,
]
