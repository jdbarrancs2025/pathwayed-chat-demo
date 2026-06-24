-- PathwayEd — schema the Stripe webhook depends on.
-- Run these statements in the Supabase SQL editor BEFORE relying on the
-- webhook's idempotency and subscription-date features. The webhook is written
-- to degrade gracefully if these are missing (it logs a warning and continues),
-- but idempotency and the trial/renewal dates only work once these are applied.

-- 1) Webhook idempotency -----------------------------------------------------
-- One row per Stripe event id that has been processed. A duplicate delivery
-- (Stripe retries) is detected by an existing row and skipped.
create table if not exists public.stripe_events (
  id text primary key,            -- Stripe event id, e.g. evt_123
  type text,                      -- event type, e.g. customer.subscription.updated
  received_at timestamptz not null default now()
);

-- The webhook writes with the service-role (sb_secret_) key, which bypasses
-- RLS. Enabling RLS with no policies locks the table to the service role only.
alter table public.stripe_events enable row level security;

-- 2) Subscription dates on profiles -----------------------------------------
-- The webhook writes the trial end and current period (renewal) end so the
-- Billing summary can show a real trial/renewal date. YOU MUST RUN THIS before
-- those dates will appear — until then the webhook logs a warning and the date
-- columns simply stay empty (everything else keeps working).
alter table public.profiles add column if not exists trial_end timestamptz;
alter table public.profiles add column if not exists current_period_end timestamptz;
