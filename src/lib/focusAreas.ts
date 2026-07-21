import type { GradeBand } from './types'

export const focusAreasByGrade: Record<GradeBand, {
  math: { value: string; label: string }[]
  reading: { value: string; label: string }[]
  writing: { value: string; label: string }[]
}> = {
  '3-5': {
    math: [
      { value: 'multiplication', label: 'Multiplication' },
      { value: 'division', label: 'Division' },
      { value: 'fractions', label: 'Fractions' },
      { value: 'geometry', label: 'Geometry' },
    ],
    reading: [
      { value: 'main-idea', label: 'Main Idea' },
      { value: 'vocabulary', label: 'Vocabulary' },
      { value: 'reading-comprehension', label: 'Reading Comprehension' },
      { value: 'story-elements', label: 'Story Elements' },
    ],
    writing: [
      { value: 'sentence-writing', label: 'Sentence Writing' },
      { value: 'short-response', label: 'Short Response' },
      { value: 'paragraph-writing', label: 'Paragraph Writing' },
      { value: 'creative-writing', label: 'Creative Writing' },
    ],
  },
  '6-8': {
    math: [
      // Grade-7 skills (seed 0011) — real 20-question banks; placement + lesson
      // path share one set. Removed empty 'pre-algebra','geometry','statistics'.
      { value: 'ratios', label: 'Ratios & Proportions' },
      { value: 'percentages', label: 'Percentages' },
      { value: 'expressions', label: 'Expressions' },
      { value: 'data-analysis', label: 'Data Analysis' },
      { value: 'proportional-reasoning', label: 'Proportional Reasoning' },
      { value: 'rational-number-operations', label: 'Operations with Rational Numbers' },
      { value: 'percent-applications', label: 'Percent Applications' },
      { value: 'two-step-equations', label: 'Two-Step Equations & Inequalities' },
      { value: 'angles-area-volume', label: 'Angles, Area & Volume' },
      { value: 'probability-models', label: 'Probability' },
      { value: 'linear-thinking', label: 'Linear Thinking' },
      { value: 'algebra-1-concepts', label: 'Algebra 1 Concepts' },
      { value: 'functions', label: 'Functions' },
    ],
    reading: [
      { value: 'inference', label: 'Inference' },
      { value: 'text-analysis', label: 'Text Analysis' },
      { value: 'vocabulary-in-context', label: 'Vocabulary in Context' },
      { value: 'author-purpose', label: "Author's Purpose" },
    ],
    writing: [
      { value: 'essay-writing', label: 'Essay Writing' },
      { value: 'persuasive-writing', label: 'Persuasive Writing' },
      { value: 'research-skills', label: 'Research Skills' },
      { value: 'narrative-writing', label: 'Narrative Writing' },
    ],
  },
  '9-12': {
    math: [
      // Grade-11 skills (seed 0011) — real 20-question banks; placement + lesson
      // path share one set. Removed empty 'algebra','geometry-proofs',
      // 'statistics-probability'. hs-geometry is distinct from the seeded 3-5
      // 'geometry' skill (which keeps its own slug).
      { value: 'hs-geometry', label: 'Geometry (HS)' },
      { value: 'algebra-2', label: 'Algebra 2' },
      { value: 'polynomial-operations', label: 'Polynomial Operations' },
      { value: 'rational-radical-expressions', label: 'Rational & Radical Expressions' },
      { value: 'quadratic-functions', label: 'Quadratic Functions' },
      { value: 'systems-of-equations', label: 'Systems of Equations' },
      { value: 'exponential-logarithmic', label: 'Exponential & Logarithmic' },
      { value: 'functions', label: 'Functions' },
      { value: 'advanced-functions', label: 'Advanced Functions' },
    ],
    reading: [
      { value: 'critical-analysis', label: 'Critical Analysis' },
      { value: 'rhetorical-analysis', label: 'Rhetorical Analysis' },
      { value: 'literary-devices', label: 'Literary Devices' },
      { value: 'source-evaluation', label: 'Source Evaluation' },
      // SAT 6-12 ladder (seed 0002)
      { value: 'evidence-based-reading', label: 'Evidence-Based Reading' },
    ],
    writing: [
      { value: 'argumentative-essays', label: 'Argumentative Essays' },
      { value: 'research-papers', label: 'Research Papers' },
      { value: 'analytical-writing', label: 'Analytical Writing' },
      { value: 'thesis-development', label: 'Thesis Development' },
      // SAT 6-12 ladder (seed 0002)
      { value: 'writing-structure', label: 'Writing Structure' },
      // Standard-English-Conventions (seed 0005/0007) — the served HS writing bank
      { value: 'advanced-punctuation', label: 'Advanced Punctuation' },
      { value: 'possessives-and-apostrophes', label: 'Possessives & Apostrophes' },
      { value: 'modifier-placement', label: 'Modifier Placement' },
      { value: 'sentence-boundaries', label: 'Sentence Boundaries' },
    ],
  },
}
