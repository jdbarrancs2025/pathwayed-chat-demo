import { getPrepModule } from '@/lib/prep/registry'
import type { PrepModule } from '@/lib/prep/types'
import { listAttempts } from '@/lib/prep/timedSection'
import { listEssayAttempts } from '@/lib/prep/prepEssay'
import { getPrepEntitlements, isKidEntitled } from '@/lib/prep/entitlements'
import { buildTrajectories, type ModuleTrajectory } from '@/lib/prep/testTrajectory'
import type { PrepAttemptLite } from '@/lib/prep/prepProgress'
import {
  HSPT_COMPOSITES,
  ISEE_SCORED_SECTION_IDS,
  buildHistory,
  buildModuleReadiness,
  type HistoryRow,
  type ModuleReadiness,
} from '@/lib/prep/testReadiness'

/**
 * I/O for TestReadinessCard. READ ONLY: three selects the parent can already make
 * under RLS (owns_student on prep_attempts and prep_essay_attempts). Nothing here
 * writes, and nothing touches the timed engine or its RPCs.
 *
 * Kept out of testReadiness.ts so the pure engine and its unit test stay free of
 * Supabase imports, matching prepProgress.ts / prepProgressLoad.ts.
 *
 * SAT is not loaded here. The card composes SatReadiness, which renders the stored
 * readiness_scores payload on its own.
 */

export interface TestReadinessData {
  /** HSPT first, then ISEE. Modules absent from the registry are skipped. */
  modules: ModuleReadiness[]
  /** Direction per section, ENTITLED modules only. Empty when nothing qualifies. */
  trajectories: ModuleTrajectory[]
  history: HistoryRow[]
  /** True when no HSPT or ISEE section has a submitted attempt. */
  isEmpty: boolean
}

/** Order is the card's display order: HSPT, then ISEE. SAT renders separately. */
const MODULE_ORDER: PrepModule['id'][] = ['hspt', 'isee']

/**
 * Trajectory covers all three tests, including SAT prep, which the readiness
 * blocks above do not (SAT has its own projection card). Entitlement still gates
 * it, so a test the child is not doing contributes nothing.
 */
const TRAJECTORY_MODULE_ORDER: PrepModule['id'][] = ['hspt', 'isee', 'sat']

export async function loadTestReadiness(studentId: string): Promise<TestReadinessData> {
  const modules = MODULE_ORDER.map(getPrepModule).filter((m): m is PrepModule => !!m)
  const trajectoryModules = TRAJECTORY_MODULE_ORDER.map(getPrepModule).filter(
    (m): m is PrepModule => !!m,
  )

  const [attemptsByModule, essays, satAttempts, entitlements] = await Promise.all([
    Promise.all(modules.map((m) => listAttempts(studentId, m.id))),
    listEssayAttempts(studentId),
    listAttempts(studentId, 'sat'),
    getPrepEntitlements([studentId]),
  ])

  const built: ModuleReadiness[] = modules.map((m, i) => {
    const lite: PrepAttemptLite[] = attemptsByModule[i]
      .filter((a) => a.status === 'submitted' || a.status === 'expired')
      .map((a) => ({
        sectionId: a.sectionId,
        status: a.status as 'submitted' | 'expired',
        score: a.score,
        startedAt: a.startedAt,
      }))
    return m.id === 'hspt'
      ? buildModuleReadiness(m, lite, HSPT_COMPOSITES)
      : buildModuleReadiness(m, lite, [], ISEE_SCORED_SECTION_IDS)
  })

  const history = buildHistory(
    attemptsByModule.flat().map((a) => ({
      id: a.id,
      moduleId: a.moduleId,
      sectionId: a.sectionId,
      mode: a.mode,
      status: a.status,
      score: a.score,
      startedAt: a.startedAt,
      submittedAt: a.submittedAt,
    })),
    essays.map((e) => ({
      id: e.id,
      startedAt: e.startedAt,
      submittedAt: e.submittedAt,
      hasFeedback: !!e.nikkiFeedback,
    })),
    modules,
  )

  // Entitlement gate: a test the child is not doing shows nothing at all, not a
  // locked card and not a teaser.
  const entitledModuleIds = new Set(
    entitlements.filter((e) => isKidEntitled(e.status)).map((e) => e.moduleId),
  )
  const trajectories = buildTrajectories(
    trajectoryModules,
    entitledModuleIds,
    [...attemptsByModule.flat(), ...satAttempts].map((a) => ({
      id: a.id,
      moduleId: a.moduleId,
      sectionId: a.sectionId,
      mode: a.mode,
      status: a.status,
      score: a.score,
      startedAt: a.startedAt,
      submittedAt: a.submittedAt,
    })),
  )

  return {
    modules: built,
    trajectories,
    history,
    isEmpty: built.every((m) => !m.hasResults),
  }
}
