/**
 * TEMPORARY stand-in skill mapping for the kid-facing prep shell.
 *
 * The prep question types do not have their own skills or questions yet, so each
 * type points at an EXISTING math skill slug so the Train and Practice tabs can
 * launch the real Nikki lesson loop and the untimed per-skill practice flow today.
 *
 * REPLACE THIS in the question-template step. This is the ONLY place stand-in
 * skill ids live — do not hardcode skill slugs in the prep components.
 */
export const STANDIN_SKILLS: Record<string, string> = {
  // Verbal / vocabulary / language types (stand-ins — real verbal skills later).
  synonyms: 'expressions',
  antonyms: 'expressions',
  analogies: 'factors-multiples',
  logic: 'linear-equations',
  verbal_classification: 'factors-multiples',
  sentence_completion: 'expressions',
  vocabulary_in_context: 'expressions',
  grammar_usage: 'expressions',
  punctuation: 'expressions',
  capitalization: 'expressions',
  spelling: 'expressions',
  composition: 'data-analysis',
  essay_prompt: 'data-analysis',

  // Reading types.
  reading_comprehension: 'data-analysis',
  main_idea: 'data-analysis',
  supporting_details: 'data-analysis',
  inference: 'data-analysis',

  // Quantitative / math types (natural math mappings).
  number_series: 'factors-multiples',
  quantitative_comparison: 'integers-rational-numbers',
  number_manipulation: 'decimal-operations',
  geometric_comparison: 'geometry',
  math_concepts: 'expressions',
  problem_solving: 'linear-equations',
  arithmetic: 'multiplication',
  algebra: 'algebra-1-concepts',
  geometry: 'geometry',
  word_problems: 'linear-equations',
  data_analysis: 'data-analysis',
}

/** The subject the stand-in skills belong to (all math for now). Used to build the
 *  Nikki session route: /students/:id/session/<subject>?skill=<slug>. */
export const STANDIN_SUBJECT = 'math'

/** Resolve a prep question type to its stand-in skill slug, or null if unmapped. */
export function standinSkillFor(questionType: string): string | null {
  return STANDIN_SKILLS[questionType] ?? null
}

/** A prettier label for a question type, e.g. "reading_comprehension" -> "Reading comprehension". */
export function questionTypeLabel(questionType: string): string {
  const spaced = questionType.replace(/_/g, ' ')
  return spaced.charAt(0).toUpperCase() + spaced.slice(1)
}
