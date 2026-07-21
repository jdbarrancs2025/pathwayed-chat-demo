import type { PrepModule } from './types.js'
import { HSPT } from './hspt.js'
import { ISEE } from './isee.js'

/**
 * All configured test-prep modules. SAT is intentionally not included yet, even
 * though the PrepModule id type allows it. Follows the array-const + find-helper
 * shape used by the other config registries (see subjects.ts, billing.ts).
 */
export const PREP_MODULES: PrepModule[] = [HSPT, ISEE]

/** Look up a prep module by id, or undefined if it is not configured. */
export function getPrepModule(id: PrepModule['id']): PrepModule | undefined {
  return PREP_MODULES.find((m) => m.id === id)
}
