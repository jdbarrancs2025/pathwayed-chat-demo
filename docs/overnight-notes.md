# Overnight backend work — Stripe webhook hardening, dates, billing tests

Branch: `phase-2-app`. Scope was backend webhook code and tests only — no UI
changes, no dev server, no dashboard/env changes. Build (`bun run build`) and the
unit suite (`bun run test`) were green before every commit.

## Commits (oldest first)

1. **`398f3ff` — Harden Stripe webhook**
   - Raw-body signature verification confirmed (`bodyParser` is disabled and the
     raw `Buffer` is passed to `stripe.webhooks.constructEvent`). On failure it
     now logs the underlying message and returns a readable `400` with that
     message; a missing `stripe-signature` header is rejected explicitly.
   - **Idempotency:** a duplicate event id is ignored. Backed by a new
     `stripe_events` table; the check is best-effort — if the table is missing it
     logs a warning and proceeds (the profile writes are idempotent anyway).
   - Each handled event type has its own branch with clear logging; unhandled
     types are logged and ignored instead of silently passing.
   - Handler failures surface a readable `500` (event type + message), and a
     failed Supabase profile update now throws instead of silently no-op'ing.

2. **`a8b261c` — Persist subscription dates**
   - The webhook now reads `trial_end` and `current_period_end` from the Stripe
     subscription (on `checkout.session.completed` and the
     `customer.subscription.*` events) and writes them to the profile as ISO
     timestamps. Handles both Stripe API shapes for `current_period_end`
     (subscription-level and subscription-item-level).

3. **`9fc5953` — Billing math unit tests + testable checkout core**
   - Extracted the checkout pricing math into `api/billing-core.ts` (pure, no
     Stripe/env): `includedSeats`, `extraKids = max(0, totalKids - included)`,
     and the per-interval price env-var mapping. `api/create-checkout.ts` now
     uses it with identical behavior.
   - `api/billing-core.test.ts` — `extra_kids` across all plans (zero, multiple,
     exactly-at-limit, negative, non-numeric); add-on interval matches the plan
     interval; plan/period input guards. (10 tests)
   - `src/lib/billing.test.ts` — plan suggestion by oldest child's grade, plan
     and total pricing, money formatting, interval suffix. (15 tests)
   - Scoped Vitest to unit tests only (excluded `e2e/`, which Playwright owns and
     whose `test()` API breaks the Vitest collector). This was a pre-existing
     gap that made `bun run test` fail; now the full suite is green (32 tests).

## YOU MUST DO THIS MANUALLY (SQL) — `docs/webhook-schema.sql`

Run the statements in `docs/webhook-schema.sql` in the Supabase SQL editor. Two
groups:

1. **`stripe_events` table** — required for webhook idempotency to actually
   dedupe. Until it exists, duplicate Stripe deliveries are reprocessed (safe,
   because the writes are idempotent, but not deduped). A log warning
   (`idempotency check unavailable`) tells you it is missing.
2. **`profiles.trial_end` + `profiles.current_period_end`** (both `timestamptz`)
   — required before the trial/renewal dates populate. Until you run these, the
   webhook's date writes fail and are logged; everything else keeps working.

The webhook is written to degrade gracefully without these, so deploying the
code before running the SQL will not break checkout or status updates.

## Things I was unsure about / flagging for you

- **`current_period_end` API shape.** Recent Stripe API versions moved
  `current_period_end` from the subscription onto the subscription *item*. I read
  both locations (subscription first, then `items.data[0]`) so it works either
  way, but please confirm the renewal date looks right against a real Stripe test
  subscription once the columns exist.
- **Stale `trial_end` after a trial converts.** `updateProfile` only writes
  non-empty values, so it never overwrites a column with null. When a trial ends
  and the subscription becomes `active`, Stripe sends `trial_end: null`, which we
  skip — so an old `trial_end` can linger. The UI should treat `trial_end` as the
  trial date only while `subscription_status === 'trialing'` and otherwise show
  `current_period_end` as the renewal date. (No UI was changed tonight per the
  task; this is a note for whoever wires the date into the Billing summary.)
- **UI not wired yet.** Task #2 says the Billing summary "needs" a date, but UI
  changes were out of scope tonight, so I only made the webhook *write* the
  dates. `BillingPanel.tsx` does not read them yet — that's a follow-up (the
  panel currently omits the renewal line by design).
- **`vite.config.ts` touched.** I added a `test.exclude` for `e2e/**`. It's the
  Vitest config block (ignored by `vite build`), not app/UI code, but flagging it
  since it's outside `api/`. It was necessary to make `bun run test` pass.
- **Idempotency vs. handler failure ordering.** The event id is recorded only
  *after* the handler succeeds, so a failed event can be safely retried by Stripe.
  The trade-off is a tiny race window if Stripe delivers the same event twice
  concurrently before the first finishes — harmless here because all writes are
  idempotent.
- I did **not** touch B2B pricing, Stripe/Supabase/Vercel dashboards, env vars,
  or run any SQL, per the instructions.
