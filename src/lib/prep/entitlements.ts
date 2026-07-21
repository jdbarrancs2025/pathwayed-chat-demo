import { supabase } from '@/lib/supabase'
import type { PrepModule } from '@/lib/prep/types'

/** A child's entitlement to a prep module, as read from prep_entitlements. */
export interface PrepEntitlement {
  studentId: string
  moduleId: string
  status: string
  endsAt: string | null
}

/**
 * Access checks MUST key on `status`, never on "canceled but still before
 * ends_at". The ends_at column is a record/scheduling hint, not an access gate:
 *   - status 'active' (with or without ends_at) = entitled. A set ends_at means a
 *     SCHEDULED end (cancel at period end) — still entitled until the webhook flips
 *     it to canceled — and the UI shows "ends [date]".
 *   - status 'canceled' = NOT entitled, regardless of ends_at (an immediate cancel
 *     writes ends_at = when it ended, which may be in the past or future).
 * These statuses are the entitled set; treat everything else as no access.
 */
export const ACTIVE_PREP_STATUSES = new Set(['active', 'past_due'])

/** Numeric grade for eligibility math: 'K' -> 0, else the parsed int (else -1). */
function gradeNumber(grade: string): number {
  if (grade === 'K') return 0
  const n = parseInt(grade, 10)
  return Number.isNaN(n) ? -1 : n
}

/** A child is eligible for a module when their grade falls inside its gradeBand. */
export function isGradeEligible(grade: string, module: PrepModule): boolean {
  const g = gradeNumber(grade)
  const [lo, hi] = module.gradeBand
  return g >= lo && g <= hi
}

/** Short reason shown next to a disabled (ineligible) child, e.g. "Grades 6-8 only". */
export function eligibilityReason(module: PrepModule): string {
  const [lo, hi] = module.gradeBand
  return `Grades ${lo}-${hi} only`
}

/** Read prep entitlements for a set of children. RLS scopes to the parent's own
 *  children, so callers just pass the child ids they know about. */
export async function getPrepEntitlements(studentIds: string[]): Promise<PrepEntitlement[]> {
  if (studentIds.length === 0) return []
  const { data, error } = await supabase
    .from('prep_entitlements')
    .select('student_id, module_id, status, ends_at')
    .in('student_id', studentIds)
  if (error || !data) return []
  return data.map((r) => ({
    studentId: r.student_id,
    moduleId: r.module_id,
    status: r.status,
    endsAt: r.ends_at,
  }))
}

interface PurchasePrepInput {
  userId: string
  moduleId: string
  studentIds: string[]
  email?: string
}

/**
 * Start a prep purchase. Resolves with { added: true } when the module was added
 * to an existing subscription (proration, no redirect — the caller should refresh
 * its entitlements). When a new subscription is needed the server returns a Stripe
 * Checkout URL and this navigates to it (the page then unloads).
 */
export async function purchasePrep(input: PurchasePrepInput): Promise<{ added: boolean }> {
  const res = await fetch('/api/purchase-prep', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(input),
  })
  if (!res.ok) throw new Error('Could not start the prep purchase')
  const data = (await res.json()) as { url?: string; added?: boolean }
  if (data.url) {
    window.location.href = data.url
    return { added: false }
  }
  return { added: !!data.added }
}

/**
 * Cancel a prep module for the given children (or all of them for the module when
 * studentIds is empty). Removed children are reduced/removed from the subscription
 * and their entitlements go canceled; the caller should refresh entitlements after.
 */
export async function cancelPrep(input: {
  userId: string
  moduleId: string
  studentIds: string[]
}): Promise<void> {
  const res = await fetch('/api/cancel-prep', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(input),
  })
  if (!res.ok) throw new Error('Could not cancel the prep module')
}
