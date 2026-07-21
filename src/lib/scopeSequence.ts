// Approved per-subject scope & sequence (curriculum ordering signed off).
//
// For each grade band and subject, the ordered list of skill slugs a student
// progresses through. lessonPath walks this in order, skips mastered skills, and
// loops on the first unmastered one — mastery sets the pace, so a ready kid moves
// ahead and is never held to grade pace.
//
// Tracks are per-subject and independent. For bands 3-5/6-8/9-12 every slug is a
// real focus-area slug from focusAreas.ts (verified against it before wiring).
// The k-2 band uses the real published Kindergarten skill slugs from the DB
// (audio-picture pre-reader lessons); there is no writing track at K yet.
// Science has no track and falls back to the "skills building coming soon" →
// homework state.

export type ScopeBand = 'k-2' | '3-5' | '6-8' | '9-12'
export type ScopeSubject = 'math' | 'reading' | 'writing'

export const scopeSequence: Record<ScopeBand, Record<ScopeSubject, string[]>> = {
  'k-2': {
    // Kindergarten pre-reader tracks. Exact published DB slugs: counting (K.CC)
    // and letter-sounds (RF.K). Number sense before letter sounds.
    math: ['counting'],
    reading: ['letter-sounds'],
    writing: [],
  },
  '3-5': {
    math: ['multiplication', 'division', 'fractions', 'geometry'],
    reading: ['vocabulary', 'main-idea', 'reading-comprehension', 'story-elements'],
    writing: ['sentence-writing', 'short-response', 'paragraph-writing', 'creative-writing'],
  },
  '6-8': {
    // Grade-7 skills (rational-number-operations … probability-models) added with
    // a real 20-question bank (seed 0011) so placement AND this walk share one set.
    // Removed empty placeholders 'statistics', 'geometry', 'pre-algebra' (no question
    // bank; logged for the Phase-2 grade-6/8 build).
    math: [
      'ratios',
      'percentages',
      'expressions',
      'data-analysis',
      'proportional-reasoning',
      'rational-number-operations',
      'percent-applications',
      'two-step-equations',
      'angles-area-volume',
      'probability-models',
      'linear-thinking',
      'algebra-1-concepts',
      'functions',
    ],
    reading: ['vocabulary-in-context', 'inference', 'text-analysis', 'author-purpose'],
    writing: ['essay-writing', 'research-skills', 'persuasive-writing', 'narrative-writing'],
  },
  '9-12': {
    // Full HS band, grade-ordered, every slug question-backed (seeds 0011 + 0012):
    // grade 9 Algebra 1, grade 10 Geometry, grade 11 Algebra 2, grade 12 Precalc.
    // The backlogged placeholders are now real skills (algebra → the Algebra 1 set;
    // statistics-probability → data-statistics/combinatorics-probability;
    // geometry-proofs authored). Placement (grade-anchored) and this walk share one set.
    math: [
      'functions',
      'linear-equations',
      'linear-inequalities',
      'graphing-linear-functions',
      'systems-linear',
      'exponent-rules',
      'data-statistics',
      'hs-geometry',
      'geometry-proofs',
      'triangle-congruence',
      'similarity-right-triangles',
      'circle-geometry',
      'coordinate-geometry',
      'algebra-2',
      'polynomial-operations',
      'rational-radical-expressions',
      'quadratic-functions',
      'systems-of-equations',
      'exponential-logarithmic',
      'advanced-functions',
      'trigonometric-functions',
      'sequences-series',
      'rational-functions',
      'conic-sections',
      'combinatorics-probability',
    ],
    reading: [
      'evidence-based-reading',
      'critical-analysis',
      'rhetorical-analysis',
      'source-evaluation',
      'literary-devices',
    ],
    writing: [
      // Standard-English-Conventions skills lead the HS writing track: these are
      // the only HS writing skills with a published question bank (20 each), so
      // they're what actually gets served — and it lets Practice-SAT conventions
      // misses surface here through the focus mechanism, mirroring how SAT math
      // misses surface under math.
      'advanced-punctuation',
      'possessives-and-apostrophes',
      'modifier-placement',
      'sentence-boundaries',
      'writing-structure',
      'thesis-development',
      'argumentative-essays',
      'analytical-writing',
      'research-papers',
    ],
  },
}
