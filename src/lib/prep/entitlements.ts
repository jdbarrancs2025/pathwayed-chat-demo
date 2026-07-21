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

/**
 * Kid-facing surfaces grant access on 'active' or 'past_due'. past_due is a grace
 * state while Stripe retries a failing card — a child mid-retry must not be locked
 * out of their prep experience. Access ends only on 'canceled'.
 */
export function isKidEntitled(status: string): boolean {
  return status === 'active' || status === 'past_due'
}

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

/**
 * Read prep_settings for a set of children as a map keyed `studentId:moduleId` ->
 * test_date (ISO date string or null). RLS scopes to the parent's own children.
 */
export async function getPrepSettings(studentIds: string[]): Promise<Map<string, string | null>> {
  const out = new Map<string, string | null>()
  if (studentIds.length === 0) return out
  const { data, error } = await supabase
    .from('prep_settings')
    .select('student_id, module_id, test_date')
    .in('student_id', studentIds)
  if (error || !data) return out
  for (const r of data) out.set(`${r.student_id}:${r.module_id}`, r.test_date)
  return out
}

/**
 * Upsert a child's test date for a module (student_id + module_id is the primary
 * key). Direct client write — prep_settings has insert/update grants under
 * owns_student per migration 0015. Pass null to clear the date.
 */
export async function setPrepTestDate(
  studentId: string,
  moduleId: string,
  testDate: string | null,
): Promise<void> {
  const { error } = await supabase
    .from('prep_settings')
    .upsert({ student_id: studentId, module_id: moduleId, test_date: testDate }, { onConflict: 'student_id,module_id' })
  if (error) throw new Error('Could not save the test date')
}

/** Whole days from today (local midnight) until an ISO date string; negative once
 *  passed, or null when unset/invalid. */
export function daysUntilDate(dateStr: string | null): number | null {
  if (!dateStr) return null
  const target = new Date(`${dateStr}T00:00:00`)
  if (isNaN(target.getTime())) return null
  const today = new Date()
  today.setHours(0, 0, 0, 0)
  return Math.round((target.getTime() - today.getTime()) / (24 * 60 * 60 * 1000))
}

/** Kid-friendly countdown copy for a test date, or null when there is nothing to
 *  show (no date, or a date already in the past). */
export function testDayCountdown(dateStr: string | null): string | null {
  const d = daysUntilDate(dateStr)
  if (d == null || d < 0) return null
  if (d === 0) return 'Test day is today!'
  if (d === 1) return '1 day to test day'
  return `${d} days to test day`
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

/** Which cancellation path the endpoint would run for a given request. */
export type CancelPrepPath = 'reduce' | 'delete' | 'schedule' | 'none'

export interface CancelPrepPreview {
  /** 'schedule' = access continues until periodEnd; 'reduce'/'delete' = ends now. */
  path: CancelPrepPath
  periodEnd: string | null
}

interface CancelPrepInput {
  userId: string
  moduleId: string
  studentIds: string[]
}

/**
 * Ask which path a cancel would take (and the period end) WITHOUT changing
 * anything, so the UI can show the right confirm copy: an immediate credit vs.
 * access continuing until the period end.
 */
export async function previewCancelPrep(input: CancelPrepInput): Promise<CancelPrepPreview> {
  const res = await fetch('/api/cancel-prep', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ ...input, preview: true }),
  })
  if (!res.ok) throw new Error('Could not load cancel details')
  const data = (await res.json()) as Partial<CancelPrepPreview>
  return { path: data.path ?? 'none', periodEnd: data.periodEnd ?? null }
}

/**
 * Cancel a prep module for the given children (or all of them for the module when
 * studentIds is empty). Stripe is mutated first; the caller should refresh
 * entitlements after. Returns the path the server actually ran.
 */
export async function cancelPrep(input: CancelPrepInput): Promise<CancelPrepPath> {
  const res = await fetch('/api/cancel-prep', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(input),
  })
  if (!res.ok) throw new Error('Could not cancel the prep module')
  const data = (await res.json()) as { path?: CancelPrepPath }
  return data.path ?? 'none'
}
