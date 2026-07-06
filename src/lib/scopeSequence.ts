// Approved per-subject scope & sequence (curriculum ordering signed off).
//
// For each grade band and subject, the ordered list of skill slugs a student
// progresses through. lessonPath walks this in order, skips mastered skills, and
// loops on the first unmastered one — mastery sets the pace, so a ready kid moves
// ahead and is never held to grade pace.
//
// Tracks are per-subject and independent. Every slug is a real focus-area slug
// from focusAreas.ts (verified against it before wiring). Scope is
// math/reading/writing in bands 3-5, 6-8, 9-12 only; science and k-2 have no
// track and fall back to the "skills building coming soon" → homework state.

export type ScopeBand = '3-5' | '6-8' | '9-12'
export type ScopeSubject = 'math' | 'reading' | 'writing'

export const scopeSequence: Record<ScopeBand, Record<ScopeSubject, string[]>> = {
  '3-5': {
    math: ['multiplication', 'division', 'fractions', 'geometry'],
    reading: ['vocabulary', 'main-idea', 'reading-comprehension', 'story-elements'],
    writing: ['sentence-writing', 'short-response', 'paragraph-writing', 'creative-writing'],
  },
  '6-8': {
    math: [
      'ratios',
      'percentages',
      'proportional-reasoning',
      'data-analysis',
      'statistics',
      'geometry',
      'pre-algebra',
      'expressions',
      'linear-thinking',
      'algebra-1-concepts',
      'functions',
    ],
    reading: ['vocabulary-in-context', 'inference', 'text-analysis', 'author-purpose'],
    writing: ['essay-writing', 'research-skills', 'persuasive-writing', 'narrative-writing'],
  },
  '9-12': {
    math: [
      'algebra',
      'algebra-2',
      'functions',
      'advanced-functions',
      'statistics-probability',
      'hs-geometry',
      'geometry-proofs',
    ],
    reading: [
      'evidence-based-reading',
      'critical-analysis',
      'rhetorical-analysis',
      'source-evaluation',
      'literary-devices',
    ],
    writing: [
      'writing-structure',
      'thesis-development',
      'argumentative-essays',
      'analytical-writing',
      'research-papers',
    ],
  },
}
