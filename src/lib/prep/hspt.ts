import type { PrepModule } from './types.js'

/**
 * HSPT (High School Placement Test) structure.
 *
 * Taken by 8th-grade students for 9th-grade admission. The section NAMES and
 * ORDER below are correct; every questionCount, timeLimitSec, and questionTypes
 * value is a PLACEHOLDER (see the per-section TODOs) and must be verified against
 * current official HSPT specs before launch.
 */
export const HSPT: PrepModule = {
  id: 'hspt',
  name: 'HSPT',
  // Purchase eligibility gate (which grades may buy this module), not exam demographics.
  gradeBand: [6, 8],
  sections: [
    {
      id: 'verbal-skills',
      name: 'Verbal Skills',
      // TODO: placeholder values — verify questionCount, timeLimitSec, and
      //   questionTypes against current official HSPT specs before launch.
      questionCount: 0,
      timeLimitSec: 0,
      questionTypes: ['synonyms', 'antonyms', 'analogies', 'logic', 'verbal_classification'],
    },
    {
      id: 'quantitative-skills',
      name: 'Quantitative Skills',
      // TODO: placeholder values — verify questionCount, timeLimitSec, and
      //   questionTypes against current official HSPT specs before launch.
      questionCount: 0,
      timeLimitSec: 0,
      questionTypes: ['number_series', 'quantitative_comparison', 'number_manipulation', 'geometric_comparison'],
    },
    {
      id: 'reading',
      name: 'Reading',
      // TODO: placeholder values — verify questionCount, timeLimitSec, and
      //   questionTypes against current official HSPT specs before launch.
      questionCount: 0,
      timeLimitSec: 0,
      questionTypes: ['reading_comprehension', 'main_idea', 'vocabulary_in_context'],
    },
    {
      id: 'mathematics',
      name: 'Mathematics',
      // TODO: placeholder values — verify questionCount, timeLimitSec, and
      //   questionTypes against current official HSPT specs before launch.
      questionCount: 0,
      timeLimitSec: 0,
      questionTypes: ['math_concepts', 'problem_solving', 'arithmetic', 'algebra', 'geometry'],
    },
    {
      id: 'language',
      name: 'Language',
      // TODO: placeholder values — verify questionCount, timeLimitSec, and
      //   questionTypes against current official HSPT specs before launch.
      questionCount: 0,
      timeLimitSec: 0,
      questionTypes: ['grammar_usage', 'punctuation', 'capitalization', 'spelling', 'composition'],
    },
  ],
  fullTestComposition: ['verbal-skills', 'quantitative-skills', 'reading', 'mathematics', 'language'],
}
