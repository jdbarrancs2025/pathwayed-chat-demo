import { getPrepModule } from '@/lib/prep/registry'
import type { PrepModule } from '@/lib/prep/types'
import { listAttempts } from '@/lib/prep/timedSection'
import { listEssayAttempts } from '@/lib/prep/prepEssay'
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
  history: HistoryRow[]
  /** True when no HSPT or ISEE section has a submitted attempt. */
  isEmpty: boolean
}

/** Order is the card's display order: HSPT, then ISEE. SAT renders separately. */
const MODULE_ORDER: PrepModule['id'][] = ['hspt', 'isee']

export async function loadTestReadiness(studentId: string): Promise<TestReadinessData> {
  const modules = MODULE_ORDER.map(getPrepModule).filter((m): m is PrepModule => !!m)

  const [attemptsByModule, essays] = await Promise.all([
    Promise.all(modules.map((m) => listAttempts(studentId, m.id))),
    listEssayAttempts(studentId),
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

  return {
    modules: built,
    history,
    isEmpty: built.every((m) => !m.hasResults),
  }
}
