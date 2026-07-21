import type { GradeBand } from './types'

export const focusAreasByGrade: Record<GradeBand, {
  math: { value: string; label: string }[]
  reading: { value: string; label: string }[]
  writing: { value: string; label: string }[]
}> = {
  '3-5': {
    math: [
      // Grade-3 (seed 0004) + grade-4 (seed 0013); lockstep with scopeSequence['3-5'].
      { value: 'multiplication', label: 'Multiplication' },
      { value: 'division', label: 'Division' },
      { value: 'fractions', label: 'Fractions' },
      { value: 'geometry', label: 'Geometry' },
      { value: 'multi-digit-multiplication', label: 'Multi-Digit Multiplication' },
      { value: 'multi-digit-division', label: 'Multi-Digit Division' },
      { value: 'factors-multiples', label: 'Factors & Multiples' },
      { value: 'fraction-equivalence', label: 'Fraction Equivalence & Comparison' },
      { value: 'fraction-operations-4', label: 'Fraction Operations' },
      { value: 'area-perimeter', label: 'Area & Perimeter' },
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
      { value: 'exponents-scientific-notation', label: 'Exponents & Scientific Notation' },
      { value: 'pythagorean-theorem', label: 'Pythagorean Theorem' },
      { value: 'transformations-8', label: 'Transformations' },
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
      // Full HS band (seeds 0011 + 0012), grade-ordered; every slug question-backed.
      // In lockstep with scopeSequence['9-12'].math — placement + lesson path, one set.
      { value: 'functions', label: 'Functions' },
      { value: 'linear-equations', label: 'Linear Equations' },
      { value: 'linear-inequalities', label: 'Linear Inequalities' },
      { value: 'graphing-linear-functions', label: 'Graphing Linear Functions' },
      { value: 'systems-linear', label: 'Systems of Linear Equations' },
      { value: 'exponent-rules', label: 'Exponent Rules' },
      { value: 'data-statistics', label: 'Data & Statistics' },
      { value: 'hs-geometry', label: 'Geometry (HS)' },
      { value: 'geometry-proofs', label: 'Geometry Proofs' },
      { value: 'triangle-congruence', label: 'Triangle Congruence' },
      { value: 'similarity-right-triangles', label: 'Similarity & Right Triangles' },
      { value: 'circle-geometry', label: 'Circle Geometry' },
      { value: 'coordinate-geometry', label: 'Coordinate Geometry' },
      { value: 'algebra-2', label: 'Algebra 2' },
      { value: 'polynomial-operations', label: 'Polynomial Operations' },
      { value: 'rational-radical-expressions', label: 'Rational & Radical Expressions' },
      { value: 'quadratic-functions', label: 'Quadratic Functions' },
      { value: 'systems-of-equations', label: 'Systems of Equations' },
      { value: 'exponential-logarithmic', label: 'Exponential & Logarithmic' },
      { value: 'advanced-functions', label: 'Advanced Functions' },
      { value: 'trigonometric-functions', label: 'Trigonometric Functions' },
      { value: 'sequences-series', label: 'Sequences & Series' },
      { value: 'rational-functions', label: 'Rational Functions' },
      { value: 'conic-sections', label: 'Conic Sections' },
      { value: 'combinatorics-probability', label: 'Combinatorics & Probability' },
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
