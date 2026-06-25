# Nikki tutoring eval harness

A dev/test tool (not user-facing) for measuring Nikki's tutoring quality. It runs
each scenario through Nikki's **actual** system prompt — the same
`getCombinedSystemPrompt('kid-tutor', …)` the live `/api/chat` endpoint uses —
then scores her response against a rubric with an LLM judge.

## Run

```bash
ANTHROPIC_API_KEY=sk-... bun run eval
# or directly:
ANTHROPIC_API_KEY=sk-... bun run eval/run.ts
```

The API key is read from the environment server-side; nothing is sent anywhere
except the Anthropic API. Output is printed to the console and a full machine-
readable report is written to `eval/report.json` (gitignored).

## How it works

- **Tutor model:** `claude-sonnet-4-6` with the same params as `api/chat.ts`.
- **Judge model:** `claude-sonnet-4-6`, scoring each rubric criterion
  `pass` / `partial` / `fail` with a one-line reason.
- **Score:** per scenario = average of its criteria (pass=1, partial=0.5,
  fail=0); overall = average across scenarios.

## Scenarios

Fixtures live in `eval/scenarios/*.json`. Each is an array of objects:

```json
{
  "id": "k2-reading-picture-guess",
  "grade": "1",
  "subject": "reading",
  "childName": "Mia",
  "level": "on",
  "studentMessage": "…what the student says, including wrong answers/misconceptions…",
  "rubric": ["what a good Nikki response should do", "…"]
}
```

To add coverage, drop another `.json` file (or more objects) into
`eval/scenarios/` — the runner globs the whole folder. The set is weighted toward
K–2 reading and common misconceptions (picture/context guessing, blending,
phonemic awareness), plus math misconceptions/careless slips, writing, and
science.

## Notes

- `eval/` is a standalone Bun script. It is **not** part of `bun run build`, not
  bundled by Vite, and not deployed as a Vercel function — it just imports the
  shared prompt builder from `api/`.
- Scenarios run sequentially to stay gentle on rate limits (~2 API calls each).
