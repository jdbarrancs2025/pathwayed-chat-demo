import type { PrepModule } from './types.js'

/**
 * HSPT (High School Placement Test) structure.
 *
 * Taken by 8th-grade students for 9th-grade admission. Section counts and time
 * limits are the current official HSPT specs: Verbal 60q/16min, Quantitative
 * 52q/30min, Reading 62q/25min, Mathematics 64q/45min, Language 60q/25min.
 * questionTypes are the working question-type tags the prep engine maps on.
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
      questionCount: 60,
      timeLimitSec: 960,
      questionTypes: ['synonyms', 'antonyms', 'analogies', 'logic', 'verbal_classification'],
    },
    {
      id: 'quantitative-skills',
      name: 'Quantitative Skills',
      questionCount: 52,
      timeLimitSec: 1800,
      questionTypes: ['number_series', 'quantitative_comparison', 'number_manipulation', 'geometric_comparison'],
    },
    {
      id: 'reading',
      name: 'Reading',
      questionCount: 62,
      timeLimitSec: 1500,
      questionTypes: ['reading_comprehension', 'main_idea', 'vocabulary_in_context'],
    },
    {
      id: 'mathematics',
      name: 'Mathematics',
      questionCount: 64,
      timeLimitSec: 2700,
      questionTypes: ['math_concepts', 'problem_solving', 'arithmetic', 'algebra', 'geometry'],
    },
    {
      id: 'language',
      name: 'Language',
      questionCount: 60,
      timeLimitSec: 1500,
      questionTypes: ['grammar_usage', 'punctuation', 'capitalization', 'spelling', 'composition'],
    },
  ],
  fullTestComposition: ['verbal-skills', 'quantitative-skills', 'reading', 'mathematics', 'language'],
}
