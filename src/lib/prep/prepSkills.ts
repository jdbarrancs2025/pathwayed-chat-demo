/**
 * PREP_SKILLS — maps each prep question type to the real skill slug it serves, plus
 * the session subject the Train tab's Nikki lesson should use. Replaces the old
 * stand-in map. Three kinds of entry:
 *
 *   REAL PREP    — a dedicated prep-* skill authored to the fractions bar
 *                  (src/lib/prep/verbalTemplates.ts, seeded by prep-verbal seeds).
 *   REAL EXISTING — a genuinely-close K-12 skill that already has real questions
 *                  (reading/achievement-math/language sections stay on these).
 *   INTERIM      — a NEW verbal/quantitative type not yet authored; points at the
 *                  closest existing skill so the section still works, and is clearly
 *                  marked. Replaced with a real prep-* slug as each type is authored.
 *
 * Do not scatter slugs through components — this is the one place they live.
 */

export interface PrepSkillRef {
  /** The generated_questions skill slug used by Practice and the timed engine. */
  slug: string
  /** Valid Session subject for the Train tab's Nikki lesson (math|reading|writing). */
  sessionSubject: string
}

export const PREP_SKILLS: Record<string, PrepSkillRef> = {
  // ---- REAL PREP (authored) ----
  synonyms: { slug: 'prep-synonyms', sessionSubject: 'reading' },
  antonyms: { slug: 'prep-antonyms', sessionSubject: 'reading' },

  // ---- REAL EXISTING (reading comprehension section) ----
  reading_comprehension: { slug: 'main-idea', sessionSubject: 'reading' },
  main_idea: { slug: 'main-idea', sessionSubject: 'reading' },
  supporting_details: { slug: 'evidence-based-reading', sessionSubject: 'reading' },
  inference: { slug: 'inference', sessionSubject: 'reading' },
  vocabulary_in_context: { slug: 'author-purpose', sessionSubject: 'reading' }, // THIN: no vocab-in-context skill yet

  // ---- REAL EXISTING (achievement math section) ----
  arithmetic: { slug: 'multiplication', sessionSubject: 'math' },
  algebra: { slug: 'algebra-1-concepts', sessionSubject: 'math' },
  geometry: { slug: 'geometry', sessionSubject: 'math' },
  data_analysis: { slug: 'data-analysis', sessionSubject: 'math' },
  math_concepts: { slug: 'expressions', sessionSubject: 'math' },
  problem_solving: { slug: 'linear-equations', sessionSubject: 'math' },

  // ---- REAL EXISTING (language section) ----
  grammar_usage: { slug: 'modifier-placement', sessionSubject: 'writing' },
  punctuation: { slug: 'advanced-punctuation', sessionSubject: 'writing' },
  capitalization: { slug: 'advanced-punctuation', sessionSubject: 'writing' }, // THIN: no capitalization skill
  spelling: { slug: 'author-purpose', sessionSubject: 'reading' }, // THIN: no spelling skill
  composition: { slug: 'modifier-placement', sessionSubject: 'writing' }, // THIN: essay handled separately later

  // ---- REAL PREP (authored, iteration 2) ----
  analogies: { slug: 'prep-analogies', sessionSubject: 'reading' },
  sentence_completion: { slug: 'prep-sentence-completion', sessionSubject: 'reading' },
  number_series: { slug: 'prep-number-series', sessionSubject: 'math' },
  quantitative_comparison: { slug: 'prep-quantitative-comparison', sessionSubject: 'math' },
  logic: { slug: 'prep-logic', sessionSubject: 'reading' },
  verbal_classification: { slug: 'prep-verbal-classification', sessionSubject: 'reading' },

  // ---- REAL EXISTING (quantitative-skills types deliberately on close existing math skills) ----
  number_manipulation: { slug: 'decimal-operations', sessionSubject: 'math' },
  geometric_comparison: { slug: 'geometry', sessionSubject: 'math' },

  // ---- Essay: handled by the dedicated server-timed essay flow (PrepEssay), NOT
  //      this MCQ map. Essay sections are filtered out of Train/Practice and the
  //      timed MCQ engine, so prepSkillFor('essay_prompt') is never used to render;
  //      the mapping stays only so the type resolves to a harmless real slug. ----
  essay_prompt: { slug: 'data-analysis', sessionSubject: 'writing' },

  // ---- SAT (Digital SAT content domains) ----
  // Reading & Writing: two domains are SAT-specific AUTHORED prep skills
  // (transitions, words-in-context); the other two lean on close existing reading/
  // writing banks where they genuinely overlap (central ideas/evidence -> main-idea;
  // boundaries/conventions -> advanced-punctuation).
  information_and_ideas: { slug: 'main-idea', sessionSubject: 'reading' }, // OVERLAP: central ideas + command of evidence
  craft_and_structure: { slug: 'prep-sat-words-in-context', sessionSubject: 'reading' }, // REAL PREP (authored)
  expression_of_ideas: { slug: 'prep-sat-transitions', sessionSubject: 'writing' }, // REAL PREP (authored)
  standard_english_conventions: { slug: 'advanced-punctuation', sessionSubject: 'writing' }, // OVERLAP: boundaries/grammar
  // Math: SAT math genuinely overlaps existing banks. 'algebra' reuses the existing
  // entry above (algebra-1-concepts). The rest lean on close existing math skills.
  advanced_math: { slug: 'expressions', sessionSubject: 'math' }, // OVERLAP (THIN): SAT nonlinear -> expressions
  problem_solving_data_analysis: { slug: 'data-analysis', sessionSubject: 'math' }, // OVERLAP
  geometry_trigonometry: { slug: 'geometry', sessionSubject: 'math' }, // OVERLAP (THIN): no trig-specific bank yet
}

/** Resolve a prep question type to its skill ref, or null if unmapped. */
export function prepSkillFor(questionType: string): PrepSkillRef | null {
  return PREP_SKILLS[questionType] ?? null
}

/** A prettier label for a question type, e.g. "reading_comprehension" -> "Reading comprehension". */
export function questionTypeLabel(questionType: string): string {
  const spaced = questionType.replace(/_/g, ' ')
  return spaced.charAt(0).toUpperCase() + spaced.slice(1)
}
