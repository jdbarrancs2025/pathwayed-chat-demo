/**
 * Type definitions for test-prep modules (HSPT, ISEE, and later SAT).
 *
 * Config only: no UI, no DB. The assembled modules live in the sibling
 * definition files (hspt.ts, isee.ts) and are collected in registry.ts.
 */

export type PrepSection = {
  id: string
  name: string
  questionCount: number
  timeLimitSec: number
  questionTypes: string[]
  essay?: boolean
}

export type PrepModule = {
  id: 'hspt' | 'isee' | 'sat'
  name: string
  gradeBand: [number, number]
  sections: PrepSection[]
  fullTestComposition: string[]
}
