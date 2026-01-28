import type { Subject } from './types'

export interface PracticeQuestion {
  id: string
  question: string
  hint?: string
}

export interface FocusAreaQuestions {
  title: string
  description: string
  questions: PracticeQuestion[]
}

type FocusAreaMap = Record<string, FocusAreaQuestions>

export const practiceQuestions: Record<Subject, FocusAreaMap> = {
  math: {
    fractions: {
      title: 'Fractions Practice',
      description: 'Work through these problems to strengthen your understanding of fractions.',
      questions: [
        {
          id: 'math-frac-1',
          question: 'What is 1/4 + 1/2? Show your work.',
          hint: 'Try finding a common denominator first.',
        },
        {
          id: 'math-frac-2',
          question: 'If you eat 2/8 of a pizza, what fraction is left?',
          hint: 'Start with the whole pizza as 8/8.',
        },
      ],
    },
    geometry: {
      title: 'Geometry Practice',
      description: 'Work with shapes, angles, and measurements.',
      questions: [
        {
          id: 'math-geo-1',
          question: 'A rectangle has a length of 8 cm and a width of 5 cm. What is its perimeter?',
          hint: 'Perimeter = 2 × (length + width).',
        },
        {
          id: 'math-geo-2',
          question: 'How many degrees are in a right angle? What about a straight line?',
          hint: 'A right angle is what you see at the corner of a square.',
        },
      ],
    },
  },
  reading: {
    'main-idea': {
      title: 'Finding the Main Idea',
      description: 'Practice identifying what a passage is mostly about.',
      questions: [
        {
          id: 'read-main-1',
          question: 'Read a short paragraph in your textbook. In one sentence, explain what the paragraph is mostly about.',
          hint: 'Look for the sentence that all other sentences support.',
        },
        {
          id: 'read-main-2',
          question: 'What details from the text support the main idea? List two.',
          hint: 'Supporting details give examples or evidence.',
        },
      ],
    },
    vocabulary: {
      title: 'Vocabulary Building',
      description: 'Strengthen your word knowledge and context clues skills.',
      questions: [
        {
          id: 'read-vocab-1',
          question: 'Find an unfamiliar word in your reading. Use context clues to guess its meaning, then check a dictionary.',
        },
        {
          id: 'read-vocab-2',
          question: 'Write a sentence using a new vocabulary word from this week\'s lesson.',
          hint: 'Make sure your sentence shows what the word means.',
        },
      ],
    },
  },
  writing: {
    'short-response': {
      title: 'Short Response Writing',
      description: 'Practice answering questions with clear, complete sentences.',
      questions: [
        {
          id: 'write-short-1',
          question: 'In 2-3 sentences, explain why it\'s important to proofread your writing before turning it in.',
        },
        {
          id: 'write-short-2',
          question: 'Choose a character from a story you\'ve read. In 2-3 sentences, describe one challenge they faced.',
          hint: 'Use specific details from the text.',
        },
      ],
    },
    'paragraph-writing': {
      title: 'Paragraph Writing',
      description: 'Build strong paragraphs with topic sentences, details, and conclusions.',
      questions: [
        {
          id: 'write-para-1',
          question: 'Write a topic sentence for a paragraph about your favorite hobby.',
          hint: 'A topic sentence tells the reader what the paragraph will be about.',
        },
        {
          id: 'write-para-2',
          question: 'Write 3 supporting details that could follow your topic sentence.',
          hint: 'Each detail should explain or give an example.',
        },
      ],
    },
  },
}

/**
 * Get practice questions for a subject based on selected focus areas
 */
export function getQuestionsForSubject(
  subject: Subject,
  focusAreas: string[]
): FocusAreaQuestions | null {
  const subjectQuestions = practiceQuestions[subject]

  // Find the first matching focus area with questions
  for (const focusArea of focusAreas) {
    if (subjectQuestions[focusArea]) {
      return subjectQuestions[focusArea]
    }
  }

  // If no specific focus areas, return the first available
  const firstKey = Object.keys(subjectQuestions)[0]
  return firstKey ? subjectQuestions[firstKey] : null
}

/**
 * Get human-readable label for a focus area value
 */
export const focusAreaLabels: Record<string, string> = {
  // Math
  fractions: 'Fractions',
  geometry: 'Geometry',
  // Reading
  'main-idea': 'Main Idea',
  vocabulary: 'Vocabulary',
  // Writing
  'short-response': 'Short Response',
  'paragraph-writing': 'Paragraph Writing',
}
