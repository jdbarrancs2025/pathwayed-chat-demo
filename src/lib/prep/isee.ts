import type { PrepModule } from './types.js'

/**
 * ISEE (Independent School Entrance Exam) structure.
 *
 * The ISEE is offered at Lower (grades 5-6), Middle (7-8), and Upper (9-12)
 * levels; this single module spans that whole range. The section NAMES and ORDER
 * are the same across levels and are correct here, but every questionCount,
 * timeLimitSec, and questionTypes value is a PLACEHOLDER (see the per-section
 * TODOs) and must be verified against current official ISEE specs — and split by
 * level — before launch.
 */
export const ISEE: PrepModule = {
  id: 'isee',
  name: 'ISEE',
  // Purchase eligibility gate (which grades may buy this module), not exam demographics.
  gradeBand: [6, 8],
  sections: [
    {
      id: 'verbal-reasoning',
      name: 'Verbal Reasoning',
      // TODO: placeholder values — verify questionCount, timeLimitSec, and
      //   questionTypes against current official ISEE specs before launch.
      questionCount: 0,
      timeLimitSec: 0,
      questionTypes: ['synonyms', 'sentence_completion'],
    },
    {
      id: 'quantitative-reasoning',
      name: 'Quantitative Reasoning',
      // TODO: placeholder values — verify questionCount, timeLimitSec, and
      //   questionTypes against current official ISEE specs before launch.
      questionCount: 0,
      timeLimitSec: 0,
      questionTypes: ['word_problems', 'quantitative_comparison'],
    },
    {
      id: 'reading-comprehension',
      name: 'Reading Comprehension',
      // TODO: placeholder values — verify questionCount, timeLimitSec, and
      //   questionTypes against current official ISEE specs before launch.
      questionCount: 0,
      timeLimitSec: 0,
      questionTypes: ['main_idea', 'supporting_details', 'inference', 'vocabulary_in_context'],
    },
    {
      id: 'mathematics-achievement',
      name: 'Mathematics Achievement',
      // TODO: placeholder values — verify questionCount, timeLimitSec, and
      //   questionTypes against current official ISEE specs before launch.
      questionCount: 0,
      timeLimitSec: 0,
      questionTypes: ['arithmetic', 'algebra', 'geometry', 'data_analysis', 'problem_solving'],
    },
    {
      id: 'essay',
      name: 'Essay',
      essay: true,
      // TODO: placeholder values — verify questionCount, timeLimitSec, and
      //   questionTypes against current official ISEE specs before launch.
      questionCount: 0,
      timeLimitSec: 0,
      questionTypes: ['essay_prompt'],
    },
  ],
  fullTestComposition: [
    'verbal-reasoning',
    'quantitative-reasoning',
    'reading-comprehension',
    'mathematics-achievement',
    'essay',
  ],
}
