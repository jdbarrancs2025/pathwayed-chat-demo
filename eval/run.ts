/**
 * Nikki tutoring-quality eval harness (dev/test tool — not user-facing).
 *
 * For each scenario fixture it:
 *   1. builds Nikki's ACTUAL system prompt via getCombinedSystemPrompt (the same
 *      builder api/chat.ts uses for the live tutor),
 *   2. calls Claude to get Nikki's response (same model/params as chat.ts),
 *   3. scores that response against the scenario's rubric with an LLM judge
 *      (claude-sonnet-4-6), pass/partial/fail per criterion,
 *   4. prints a report and writes eval/report.json.
 *
 * Run:  ANTHROPIC_API_KEY=sk-... bun run eval/run.ts
 * (The key stays server-side — this is a local Node/Bun script.)
 */
import { readFileSync, readdirSync, writeFileSync } from "node:fs"
import { fileURLToPath } from "node:url"
import { dirname, join } from "node:path"
import Anthropic from "@anthropic-ai/sdk"
import { getCombinedSystemPrompt, type StudentContext } from "../api/prompts.ts"

// Keep these in step with api/chat.ts (the live tutor) so we evaluate what ships.
const TUTOR_MODEL = "claude-sonnet-4-6"
const JUDGE_MODEL = "claude-sonnet-4-6"

const here = dirname(fileURLToPath(import.meta.url))
const scenariosDir = join(here, "scenarios")

type Verdict = "pass" | "partial" | "fail"

interface Scenario {
  id: string
  grade: string
  subject: string
  childName: string
  level?: string
  studentMessage: string
  rubric: string[]
}

interface CriterionResult {
  criterion: string
  verdict: Verdict
  reason: string
}

interface ScenarioResult {
  id: string
  grade: string
  subject: string
  studentMessage: string
  nikkiResponse: string
  criteria: CriterionResult[]
  score: number // 0..1, average of criteria (pass=1, partial=0.5, fail=0)
}

function loadScenarios(): Scenario[] {
  const files = readdirSync(scenariosDir).filter((f) => f.endsWith(".json"))
  const all: Scenario[] = []
  for (const file of files) {
    const parsed = JSON.parse(readFileSync(join(scenariosDir, file), "utf8")) as Scenario[]
    all.push(...parsed)
  }
  return all
}

/** Nikki's response, using her real system prompt for this scenario. */
async function runNikki(client: Anthropic, scenario: Scenario): Promise<string> {
  const context: StudentContext = {
    subject: scenario.subject,
    focusAreas: [],
    appMode: null,
    childName: scenario.childName,
    grade: scenario.grade,
    level: scenario.level,
  }
  const system = getCombinedSystemPrompt("kid-tutor", context)
  const res = await client.messages.create({
    model: TUTOR_MODEL,
    max_tokens: 1024,
    temperature: 0.7,
    system,
    messages: [{ role: "user", content: scenario.studentMessage }],
  })
  return res.content
    .filter((b): b is Anthropic.TextBlock => b.type === "text")
    .map((b) => b.text)
    .join("")
    .trim()
}

const JUDGE_SYSTEM = `You are a strict but fair evaluator of K-12 tutoring quality, grounded in evidence-based teaching (explicit instruction, scaffolding, the zone of proximal development, and — for early reading — structured literacy / the science of reading, which rejects guessing words from pictures or context).

You will be given a tutoring scenario, the tutor's (Nikki's) single response, and a rubric: a list of criteria a good response should satisfy. For EACH criterion, decide:
- "pass": the response clearly satisfies it.
- "partial": partially satisfies it, or is ambiguous.
- "fail": does not satisfy it (or does the opposite).

Judge ONLY against the rubric. Be concrete; quote or paraphrase the evidence in one short sentence.

Respond with ONLY a JSON object, no markdown, of the form:
{"criteria":[{"criterion":"<verbatim criterion text>","verdict":"pass|partial|fail","reason":"<one short sentence>"}]}`

function parseJudge(text: string): CriterionResult[] {
  // Tolerate accidental code fences or surrounding prose.
  const cleaned = text.trim().replace(/^```(?:json)?/i, "").replace(/```$/, "").trim()
  const start = cleaned.indexOf("{")
  const end = cleaned.lastIndexOf("}")
  const json = start >= 0 && end >= 0 ? cleaned.slice(start, end + 1) : cleaned
  const parsed = JSON.parse(json) as { criteria: CriterionResult[] }
  return parsed.criteria
}

async function judge(client: Anthropic, scenario: Scenario, nikkiResponse: string): Promise<CriterionResult[]> {
  const user = `SCENARIO
- Grade: ${scenario.grade}
- Subject: ${scenario.subject}
- Student (${scenario.childName}) said: "${scenario.studentMessage}"

RUBRIC (score each):
${scenario.rubric.map((c, i) => `${i + 1}. ${c}`).join("\n")}

NIKKI'S RESPONSE:
"""
${nikkiResponse}
"""`

  const res = await client.messages.create({
    model: JUDGE_MODEL,
    max_tokens: 1024,
    temperature: 0,
    system: JUDGE_SYSTEM,
    messages: [{ role: "user", content: user }],
  })
  const text = res.content
    .filter((b): b is Anthropic.TextBlock => b.type === "text")
    .map((b) => b.text)
    .join("")
  return parseJudge(text)
}

const verdictScore: Record<Verdict, number> = { pass: 1, partial: 0.5, fail: 0 }
const verdictMark: Record<Verdict, string> = { pass: "PASS", partial: "PART", fail: "FAIL" }

async function main() {
  const apiKey = process.env.ANTHROPIC_API_KEY
  if (!apiKey) {
    console.error("Missing ANTHROPIC_API_KEY. Run: ANTHROPIC_API_KEY=sk-... bun run eval/run.ts")
    process.exit(1)
  }
  const client = new Anthropic({ apiKey })
  const scenarios = loadScenarios()
  console.log(`Running ${scenarios.length} scenarios through Nikki (${TUTOR_MODEL}), judging with ${JUDGE_MODEL}…\n`)

  const results: ScenarioResult[] = []
  for (const scenario of scenarios) {
    process.stdout.write(`• ${scenario.id} … `)
    try {
      const nikkiResponse = await runNikki(client, scenario)
      const criteria = await judge(client, scenario, nikkiResponse)
      const score =
        criteria.length > 0
          ? criteria.reduce((sum, c) => sum + (verdictScore[c.verdict] ?? 0), 0) / criteria.length
          : 0
      results.push({
        id: scenario.id,
        grade: scenario.grade,
        subject: scenario.subject,
        studentMessage: scenario.studentMessage,
        nikkiResponse,
        criteria,
        score,
      })
      const passes = criteria.filter((c) => c.verdict === "pass").length
      console.log(`${Math.round(score * 100)}%  (${passes}/${criteria.length} pass)`)
    } catch (err) {
      console.log(`ERROR: ${err instanceof Error ? err.message : String(err)}`)
    }
  }

  // --- Report ---------------------------------------------------------------
  console.log("\n=========== EVAL REPORT ===========\n")
  let totalCriteria = 0
  const tally: Record<Verdict, number> = { pass: 0, partial: 0, fail: 0 }
  for (const r of results) {
    console.log(`### ${r.id}  [${r.subject}, grade ${r.grade}]  — ${Math.round(r.score * 100)}%`)
    for (const c of r.criteria) {
      console.log(`   [${verdictMark[c.verdict]}] ${c.criterion}`)
      console.log(`          ↳ ${c.reason}`)
      tally[c.verdict] = (tally[c.verdict] ?? 0) + 1
      totalCriteria++
    }
    console.log("")
  }

  const overall =
    results.length > 0 ? results.reduce((s, r) => s + r.score, 0) / results.length : 0
  console.log("----------- SUMMARY -----------")
  console.log(`Scenarios:        ${results.length}`)
  console.log(`Criteria scored:  ${totalCriteria}`)
  console.log(`  pass:    ${tally.pass}`)
  console.log(`  partial: ${tally.partial}`)
  console.log(`  fail:    ${tally.fail}`)
  console.log(`Overall score:    ${Math.round(overall * 100)}%`)

  const reportPath = join(here, "report.json")
  writeFileSync(
    reportPath,
    JSON.stringify({ model: TUTOR_MODEL, judge: JUDGE_MODEL, overall, tally, results }, null, 2),
  )
  console.log(`\nFull report written to ${reportPath}`)
}

main().catch((err) => {
  console.error(err)
  process.exit(1)
})
