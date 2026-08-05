-- ===========================================================================
-- 0024_revoke_unused_grants.sql - remove grants that no policy backs.
--
-- HOW TO APPLY: paste into the Supabase SQL editor and run against
-- papiowjjoyhnbyhgtbxq. Idempotent: REVOKE on a privilege that is not held is a
-- no-op, so this is safe to re-run.
--
-- WHY. An audit of every public table compared grants against policies. Three
-- tables hold a grant with no matching RLS policy. Today they FAIL CLOSED, because
-- RLS is enabled and a missing policy denies: nothing is currently leaking. The
-- problem is that the grant is a loaded gun. Postgres needs BOTH a grant and a
-- policy to allow a row through, so the moment anyone adds a permissive policy to
-- one of these tables, perhaps by copying a pattern from a table where the grant is
-- intended, the door opens with no second check. Removing the grant means such a
-- policy would still be denied by the grant layer.
--
-- Nothing here changes application behaviour. Every one of these paths already
-- returns nothing; this only makes the schema state what it means.
-- ===========================================================================

begin;

-- ---------------------------------------------------------------------------
-- stripe_events - billing event ledger, written ONLY by api/stripe-webhook.ts
-- under the service role for idempotency. RLS on, zero policies, yet SELECT,
-- INSERT, UPDATE and DELETE are all granted to authenticated. This is the one
-- with real content behind it, so it goes first.
-- ---------------------------------------------------------------------------
revoke all on public.stripe_events from authenticated, anon;

-- ---------------------------------------------------------------------------
-- passages and skills - shared curriculum content. Both correctly grant SELECT
-- and back it with a policy (passages: status = 'published'; skills: readable by
-- authenticated), and both are authored exclusively by the service role through
-- seed files. The WRITE grants have no policy and no caller.
-- SELECT is deliberately left in place: the client reads both tables.
-- ---------------------------------------------------------------------------
revoke insert, update, delete on public.passages from authenticated, anon;
revoke insert, update, delete on public.skills   from authenticated, anon;

-- ---------------------------------------------------------------------------
-- VERIFY BEFORE COMMITTING. Expect exactly three rows, all SELECT:
--   passages   | authenticated | SELECT
--   skills     | authenticated | SELECT
--   (and nothing at all for stripe_events)
-- ---------------------------------------------------------------------------
select table_name, grantee, privilege_type
from information_schema.role_table_grants
where table_schema = 'public'
  and table_name in ('stripe_events', 'passages', 'skills')
  and grantee in ('anon', 'authenticated')
order by table_name, grantee, privilege_type;

commit;

-- ---------------------------------------------------------------------------
-- ROLLBACK, if something unexpected depended on one of these.
-- ---------------------------------------------------------------------------
-- grant select, insert, update, delete on public.stripe_events to authenticated;
-- grant insert, update, delete on public.passages to authenticated;
-- grant insert, update, delete on public.skills   to authenticated;
