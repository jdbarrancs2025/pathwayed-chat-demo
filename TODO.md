# TODO

## Type-check debt: 17 pre-existing `src/` errors

**Status:** recorded, not fixed. To be burned down in a dedicated session.

### Why these were invisible

The build script is `tsc --noEmit && vite build`. Because the root `tsconfig.json`
is solution-style (`"files": []` + `references`), plain `tsc --noEmit` resolves to
**zero files**, exits 0, and checks nothing — it needs `tsc -b` to check the
referenced projects. Vite then strips types with esbuild without checking them.
Net effect: nothing in the repo has been type-checked. These 17 errors are
pre-existing and none of them are new regressions.

Reproduce with:

```bash
bunx tsc -b --force
```

The build script was deliberately **not** switched to `tsc -b` yet — doing so
fails the build (and blocks deploys) until the list below is clear. That's the
first step of the burn-down, not the last.

`api/` is now checked separately and passes strict cleanly (`bunx tsc -p api/tsconfig.json`).

### The 17

#### `src/lib/profile.ts` — 6 errors, likely a real schema drift

```
src/lib/profile.ts(37,19): TS2339: Property 'subscription_status' does not exist on type 'SelectQueryError<"column 'trial_end' does not exist on 'profiles'.">'
src/lib/profile.ts(38,17): TS2339: Property 'plan' does not exist ...
src/lib/profile.ts(39,26): TS2339: Property 'billing_period' does not exist ...
src/lib/profile.ts(40,22): TS2339: Property 'extra_kids' does not exist ...
src/lib/profile.ts(41,21): TS2339: Property 'trial_end' does not exist ...
src/lib/profile.ts(42,29): TS2339: Property 'current_period_end' does not exist ...
```

**Investigate first — this one may not be merely cosmetic.** All six are downstream
of a single root cause: the generated Supabase types say `column 'trial_end' does
not exist on 'profiles'`, so the whole select collapses to `SelectQueryError` and
every field read off it fails. Either the generated types are stale, or `trial_end`
is genuinely missing from the deployed `profiles` table. If it's the latter, there
is a live billing bug here, not a type bug. Check the deployed schema before
regenerating types and assuming it's fixed.

#### `src/pages/SchoolStation.tsx` — 2 errors, missing null guard

```
src/pages/SchoolStation.tsx(66,25): TS18047: 'deanSupabase' is possibly 'null'
src/pages/SchoolStation.tsx(78,30): TS18047: 'deanSupabase' is possibly 'null'
```

Worth confirming whether `deanSupabase` can actually be null at these call sites
at runtime (i.e. unconfigured Dean env) — if so this is a real crash path, not
just a missing `!`.

#### `src/lib/readiness.ts` — 2 errors, `Json` vs `SkillRef` modeling

```
src/lib/readiness.ts(553,3):  TS2322: Type 'Json[]' is not assignable to type 'SkillRef[]'
src/lib/readiness.ts(554,15): TS2677: A type predicate's type must be assignable to its parameter's type
                              ('SkillRef' is missing an index signature for 'Json')
```

The type predicate and the `Json[]` → `SkillRef[]` conversion need to agree; likely
wants a proper parse/validate step rather than a cast.

#### `src/lib/readiness.sat.test.ts` — 4 errors, test fixtures

```
src/lib/readiness.sat.test.ts(28,24): TS2322: Type 'string | null' is not assignable to type 'string'
src/lib/readiness.sat.test.ts(29,24): (same)
src/lib/readiness.sat.test.ts(30,24): (same)
src/lib/readiness.sat.test.ts(31,24): (same)
```

Test-only. Cheapest of the group.

#### `src/components/PictureQuestion.tsx` — 1 error

```
src/components/PictureQuestion.tsx(53,23): TS2345: Argument of type 'string | undefined' is not assignable to parameter of type 'string'
```

#### `src/components/workspace/MathField.tsx` — 1 error

```
src/components/workspace/MathField.tsx(70,7): TS2322: Type '"onfocus"' is not assignable to type 'VirtualKeyboardPolicy'
```

Check MathLive's accepted `VirtualKeyboardPolicy` values — the string may simply
be wrong (`"auto"` / `"manual"` / `"sandboxed"`).

#### `src/hooks/useTextToSpeech.ts` — 1 error

```
src/hooks/useTextToSpeech.ts(162,13): TS2322: Type 'Uint8Array<ArrayBufferLike>' is not assignable to type 'Uint8Array<ArrayBuffer>'
                                      ('SharedArrayBuffer' is not assignable to 'ArrayBuffer')
```

TS 5.7+ made `Uint8Array` generic over its buffer type. Cosmetic; needs a narrow
or an explicit `ArrayBuffer` annotation.

### Suggested burn-down order

1. `profile.ts` — verify deployed schema first (possible live billing bug)
2. `SchoolStation.tsx` — confirm whether the null path is reachable
3. `readiness.ts` — needs a real decision on parse vs cast
4. The remaining 6 — mechanical
5. Only then: switch `"build"` to `tsc -b && vite build` so this can't regress
