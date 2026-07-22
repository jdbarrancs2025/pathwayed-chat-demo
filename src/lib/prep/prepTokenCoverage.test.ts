import { describe, expect, it } from 'vitest'
import { explainMisconception } from '../misconceptions'
import { PREP_VERBAL_SKILLS, type PrepSkill } from './verbalTemplates'
import { PREP_ANALOGY_SKILLS } from './analogyTemplates'
import { PREP_SENTENCE_COMPLETION_SKILLS } from './sentenceCompletionTemplates'
import { PREP_NUMBER_SERIES_SKILLS } from './numberSeriesTemplates'
import { PREP_QUANT_COMPARE_SKILLS } from './quantCompareTemplates'
import { PREP_LOGIC_SKILLS } from './logicTemplates'

/**
 * Central check that the per-module misconception tokens actually resolve through
 * explainMisconception() after being merged into misconceptions.ts EXPLANATIONS.
 * Each module's own test asserts its local map; this asserts the integration, so
 * the review screen (which calls explainMisconception) shows a real nudge for
 * every distractor a student can pick.
 */
const ALL_PREP_SKILLS: PrepSkill[] = [
  ...PREP_VERBAL_SKILLS,
  ...PREP_ANALOGY_SKILLS,
  ...PREP_SENTENCE_COMPLETION_SKILLS,
  ...PREP_NUMBER_SERIES_SKILLS,
  ...PREP_QUANT_COMPARE_SKILLS,
  ...PREP_LOGIC_SKILLS,
]

describe('prep misconception token coverage (via explainMisconception)', () => {
  for (const skill of ALL_PREP_SKILLS) {
    it(`${skill.slug}: every distractor token has an explanation`, () => {
      for (const item of skill.items) {
        for (const choice of item.choices) {
          if (choice.is_correct) continue
          expect(choice.misconception_token, `${skill.slug} slot ${item.slot} distractor missing token`).toBeTruthy()
          const nudge = explainMisconception(choice.misconception_token)
          expect(nudge, `${skill.slug} slot ${item.slot} token "${choice.misconception_token}" has no explanation`).toBeTruthy()
        }
      }
    })
  }
})
