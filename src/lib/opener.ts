import type { StudentLevel } from '@/lib/students'

export type OpenerActionKey = 'keepgoing' | 'homework'

/**
 * Order of the session-opener actions by the child's onboarding challenge level:
 *   - getting-ahead / advanced  -> lead with "keep going where you left off"
 *   - on-grade                  -> lead with the homework question
 * Both keys are ALWAYS returned — challenge level changes ORDER/emphasis only,
 * never availability. Unknown values fall back to homework-first.
 *
 * SEAM: this is the single place order is decided. A later usage-history signal
 * can slot in here (e.g. accept an optional `recentUsage` arg and let it override
 * the level default) without touching the component. History is NOT tracked yet.
 */
export function openerOrder(level: StudentLevel): OpenerActionKey[] {
  const keepGoingLeads = level === 'ahead' || level === 'advanced'
  return keepGoingLeads ? ['keepgoing', 'homework'] : ['homework', 'keepgoing']
}
