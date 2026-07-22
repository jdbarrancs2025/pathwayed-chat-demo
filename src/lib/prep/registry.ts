import type { PrepModule } from './types.js'
import { HSPT } from './hspt.js'
import { ISEE } from './isee.js'
import { SAT } from './sat.js'

/**
 * All configured test-prep modules. Follows the array-const + find-helper shape
 * used by the other config registries (see subjects.ts, billing.ts). Adding a
 * module here is enough to wire its checkout (STRIPE_PRICE_<ID>_PREP_MONTHLY),
 * webhook price->module mapping, kid tile, tabs, and parent card — the whole
 * pipeline is module-id-driven.
 */
export const PREP_MODULES: PrepModule[] = [HSPT, ISEE, SAT]

/** Look up a prep module by id, or undefined if it is not configured. */
export function getPrepModule(id: PrepModule['id']): PrepModule | undefined {
  return PREP_MODULES.find((m) => m.id === id)
}
