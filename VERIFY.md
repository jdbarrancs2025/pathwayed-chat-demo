# Academic OS — Phase 1 verification runbook

Manual end-to-end check that a tutoring session writes skill mastery and the
student dashboard reflects it, plus the cross-parent RLS isolation proof.

Target environment: **local dev against the dev Supabase project**. Do not push
or promote. Migration `migrations/0001_academic_os_phase1.sql` and seed
`seeds/0001_taxonomy_3-5.sql` must already be applied to the dev project (they
are).

---

## Preconditions

- `bun run build` is clean and the dev server is running your usual way (the
  session chat calls `/api/chat`, so the API functions must be served, not just
  the Vite frontend).
- Use a **grade 3–5 student** (e.g. grade 4). The taxonomy is seeded for the
  `3-5` band only, so `gradeBand(grade)` must resolve to `3-5` for any mastery
  to be written or shown. A K–2 / 6–12 student will (correctly) record nothing.
- You are logged in as a parent who owns that student.

---

## Part A — Browser runbook (happy path)

1. Go to **/students** and pick your grade 3–5 student → lands on **KidHome**
   (`/students/:id`).
2. On first run the **Skill Mastery Progress** card shows the empty state:
   _"No progress yet — start a session and your skills will grow here. 🌱"_ and
   **Current Subjects** shows the fallback chips (Math / Reading / Writing).
3. Tap **Math** to start a session.
4. Send a message that mentions a focus area by name so the Phase-1 keyword
   detector has something to match — e.g. type:
   > _"Can you help me with **fractions**? What is a numerator?"_
   Let Nikki reply (the detector scans the whole transcript, user + assistant).
5. Tap **Finish** (the ✕ in the session header).
6. In the **"How did that go?"** overlay, choose **Great!** → tap **Done**.
7. You are returned to **KidHome**. The **Skill Mastery Progress** card now shows
   a **Math** group with **Understanding Fractions**.

### Expected values after one "Great!" session on fractions

- Skill: **Understanding Fractions**, bar at **25%**, meta: _"Getting started ·
  practiced 1 time"_.
- Why 25%: rating `great` → session signal 100 → `accuracy = 100` on the first
  attempt; `mastery = round(100 × min(1, attempts/4)) = round(100 × 1/4) = 25`.
  Mastery ramps with attempts — four "Great!" sessions reach 100%.
- **Current Subjects** now shows **Math** (derived from the mastery row, not a
  hardcoded list).

(If you also mention multiplication/division/geometry, expect those skills too.)

---

## Part B — SQL checks (Supabase SQL editor, dev project)

> Note: the SQL editor runs as the table owner and **bypasses RLS** — these two
> checks confirm the data was written and shaped correctly, not isolation.
> Isolation is proven in Part C.

**a) A mastery row exists after the session:**

```sql
select sm.*, s.slug from student_skill_mastery sm
join skills s on s.id = sm.skill_id
order by sm.updated_at desc limit 10;
```

Expect the top row to be your student with `slug = 'fractions'`,
`accuracy = 100.00`, `mastery_percentage = 25.00`, `attempts = 1`, and a fresh
`last_practiced` / `updated_at`.

**b) The session self-describes:**

```sql
select id, subject, skills_practiced, mastery_updates
from sessions order by updated_at desc limit 5;
```

Expect the math session row with `skills_practiced = ["fractions"]` and
`mastery_updates` containing an entry like
`{ "skill_id": "...", "slug": "fractions", "attempts": 1, "accuracy": 100, "mastery_percentage": 25 }`.

---

## Part C — RLS isolation (cross-parent) — the proof

**How isolation works.** `getStudentMastery()` (and every other read/write in
`src/lib/skills.ts`) goes through the **anon-key** browser client in
`src/lib/supabase.ts`. There is **no service-role key and no bypass anywhere in
`src/`** (verified: the only `createClient` in `src/` is the anon client).
Reads of `student_skill_mastery` are therefore gated by its RLS `select` policy,
`owns_student(student_id)`, which is true only when
`students.parent_id = auth.uid()`. So **a cross-parent read returns zero rows by
policy** — not by app-side filtering. The manual check below is the proof.

### C1 — Browser proof (primary)

1. Note the URL of the student from Part A: `/students/<STUDENT_A_ID>`.
2. Log out, then log in as a **different parent account** (Parent B) that does
   **not** own Student A.
3. Navigate directly to `/students/<STUDENT_A_ID>`.
4. Expected: the app cannot load Student A (RLS returns no row) and redirects to
   **/students**. Parent B never sees Student A's mastery — the Skill Mastery
   Progress card is not rendered for that student at all.

### C2 — SQL editor proof (optional, exact)

Run as an impersonated authenticated user instead of the owner, so RLS actually
applies. Replace the two UUIDs with a real Parent B auth id and Student A id:

```sql
-- Impersonate Parent B (who does NOT own Student A)
set local role authenticated;
set local request.jwt.claims = '{"sub":"<PARENT_B_AUTH_UID>","role":"authenticated"}';

select count(*) as visible_rows
from student_skill_mastery
where student_id = '<STUDENT_A_ID>';   -- expect 0 by RLS

reset role;
```

`visible_rows = 0` confirms the `owns_student()` policy blocks the cross-parent
read. (Re-running query **a)** after `reset role` returns as owner and will show
the row again — that's expected; owner bypasses RLS.)

---

## What changed in Phase 1 (and what's deferred)

**Shipped (additive only; teaching engine, Nikki voice, MathLive, Whisper,
reading workspace, Stripe untouched):**

- Schema (`0001`): `skills` taxonomy (Subject→Domain→Skill→MicroSkill, `slug` =
  focusAreas value), `student_skill_mastery` (RLS, client-written), `grade_band`
  / `skill_level` enums, `owns_student()`, and additive columns
  `sessions.skills_practiced` / `sessions.mastery_updates` /
  `students.learning_preferences`.
- Seed (`0001`): the real `3-5` taxonomy for Math + ELA (all 12 focusAreas
  slugs).
- Resolver + mastery (`src/lib/skills.ts`): focusAreas value → slug → skill_id;
  keyword-based "skills practiced" detection; recency-weighted accuracy with
  attempts-ramped mastery; client-side upsert under RLS; session self-describing
  columns.
- Read-only dashboard sections on KidHome (Skill Mastery Progress, Current
  Subjects) + labeled Phase 2-3 placeholders.

**Deferred to Phase 2-3 (explicitly NOT built):** Pathway Score, Readiness
Scores, SAT Readiness, the Digital Twin; the parent dashboard; a real graded
accuracy signal (Phase 1 uses the end-of-session self-rating as a documented
confidence/sentiment proxy); LLM/structured "skills practiced" tagging (Phase 1
uses a transparent keyword heuristic); grade bands beyond `3-5`; mastery written
via a service-role backend route (Option B — revisit for B2B/DIL where mastery
integrity matters).
