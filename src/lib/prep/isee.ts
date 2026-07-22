import type { PrepModule } from './types.js'

/**
 * ISEE (Independent School Entrance Exam) structure.
 *
 * These are the official ISEE Middle/Upper Level counts and time limits: Verbal
 * Reasoning 40q/20min, Quantitative Reasoning 37q/35min, Reading Comprehension
 * 36q/35min, Mathematics Achievement 47q/40min, and the Essay at 30min
 * (unscored). Lower Level differs; split by level before shipping Lower.
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
      questionCount: 40,
      timeLimitSec: 1200,
      questionTypes: ['synonyms', 'sentence_completion'],
    },
    {
      id: 'quantitative-reasoning',
      name: 'Quantitative Reasoning',
      questionCount: 37,
      timeLimitSec: 2100,
      questionTypes: ['word_problems', 'quantitative_comparison'],
    },
    {
      id: 'reading-comprehension',
      name: 'Reading Comprehension',
      questionCount: 36,
      timeLimitSec: 2100,
      questionTypes: ['main_idea', 'supporting_details', 'inference', 'vocabulary_in_context'],
    },
    {
      id: 'mathematics-achievement',
      name: 'Mathematics Achievement',
      questionCount: 47,
      timeLimitSec: 2400,
      questionTypes: ['arithmetic', 'algebra', 'geometry', 'data_analysis', 'problem_solving'],
    },
    {
      id: 'essay',
      name: 'Essay',
      essay: true,
      questionCount: 1,
      timeLimitSec: 1800,
      questionTypes: ['essay_prompt'],
    },
  ],
  // Official ISEE Middle/Upper order. A short break falls AFTER Quantitative
  // Reasoning and AFTER Mathematics Achievement.
  fullTestComposition: [
    'verbal-reasoning',
    'quantitative-reasoning', // break after this section
    'reading-comprehension',
    'mathematics-achievement', // break after this section
    'essay',
  ],
}
