const DAY_MS = 86_400_000

/**
 * A friendly relative-day label for an ISO timestamp (e.g. last activity).
 * `now` (epoch ms) is a parameter so it's deterministic/testable. Uses whole-day
 * buckets so "Today"/"Yesterday" don't depend on the exact hour.
 */
export function formatRelativeDay(iso: string | null, now: number): string {
  if (!iso) return 'No sessions yet'
  const t = Date.parse(iso)
  if (Number.isNaN(t)) return 'No sessions yet'
  const days = Math.floor(now / DAY_MS) - Math.floor(t / DAY_MS)
  if (days <= 0) return 'Today'
  if (days === 1) return 'Yesterday'
  if (days < 7) return `${days} days ago`
  if (days < 30) {
    const w = Math.floor(days / 7)
    return `${w} week${w === 1 ? '' : 's'} ago`
  }
  const m = Math.floor(days / 30)
  return `${m} month${m === 1 ? '' : 's'} ago`
}
