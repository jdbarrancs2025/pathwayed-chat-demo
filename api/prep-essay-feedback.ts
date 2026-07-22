import Anthropic from "@anthropic-ai/sdk"
import { createClient } from "@supabase/supabase-js"
import type { VercelRequest, VercelResponse } from "@vercel/node"

/**
 * Generate Nikki's feedback for a finalized ISEE practice essay and store it.
 *
 * Auth: the caller sends their Supabase access token (Bearer). We read the essay
 * through an RLS-BOUND client (anon key + that token), so a caller can only reach
 * an essay their own child wrote (owns_student on prep_essay_attempts). We never
 * trust an attemptId without that check.
 *
 * The essay text is graded server-side because the feedback needs the Anthropic
 * key, which never reaches the browser. Feedback is written with the service role
 * via prep_essay_save_feedback (write-once), the one path allowed past the 0018
 * guard. Idempotent: an essay that already has feedback returns it unchanged.
 */
export default async function handler(req: VercelRequest, res: VercelResponse) {
  if (req.method !== "POST") {
    return res.status(405).json({ error: "Method not allowed" })
  }

  const apiKey = process.env.ANTHROPIC_API_KEY
  const supabaseUrl = process.env.SUPABASE_URL ?? process.env.VITE_SUPABASE_URL
  const anonKey = process.env.SUPABASE_ANON_KEY ?? process.env.VITE_SUPABASE_ANON_KEY
  const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY
  if (!apiKey || !supabaseUrl || !anonKey || !serviceKey) {
    return res.status(500).json({ error: "Essay feedback is not configured" })
  }

  const authHeader = req.headers.authorization ?? ""
  const token = authHeader.startsWith("Bearer ") ? authHeader.slice(7) : ""
  if (!token) {
    return res.status(401).json({ error: "Missing authorization" })
  }

  const { attemptId } = (req.body ?? {}) as { attemptId?: string }
  if (!attemptId || typeof attemptId !== "string") {
    return res.status(400).json({ error: "attemptId is required" })
  }

  try {
    // RLS-bound read: this only returns the essay if the caller owns the child.
    const rls = createClient(supabaseUrl, anonKey, {
      global: { headers: { Authorization: `Bearer ${token}` } },
      auth: { persistSession: false, autoRefreshToken: false },
    })

    const { data: essay, error: essayError } = await rls
      .from("prep_essay_attempts")
      .select("id, student_id, prompt_id, essay_text, nikki_feedback, submitted_at")
      .eq("id", attemptId)
      .maybeSingle()

    if (essayError || !essay) {
      // No row visible under RLS = not the caller's child (or no such essay).
      return res.status(403).json({ error: "Not found or not authorized" })
    }

    // Already has feedback — return it (idempotent; no second API call).
    if (essay.nikki_feedback) {
      return res.status(200).json({ feedback: essay.nikki_feedback })
    }

    // Only grade a finalized essay; a live draft is not ready for feedback.
    if (!essay.submitted_at) {
      return res.status(409).json({ error: "Essay is not submitted yet" })
    }

    // Grade + name for age-appropriate framing (best-effort; safe defaults).
    const { data: student } = await rls
      .from("students")
      .select("first_name, grade")
      .eq("id", essay.student_id)
      .maybeSingle()
    const firstName = (student?.first_name as string | undefined)?.trim() || "there"
    const grade = (student?.grade as string | undefined) ?? ""

    const promptText = promptTextFor(essay.prompt_id as string)
    const essayText = ((essay.essay_text as string | null) ?? "").trim()

    const feedback = await generateFeedback({ apiKey, firstName, grade, promptText, essayText })

    // Persist with the service role (write-once, past the guard). Best-effort: even
    // if the store fails we still return the feedback the child just earned.
    const svc = createClient(supabaseUrl, serviceKey)
    const { error: saveError } = await svc.rpc("prep_essay_save_feedback", {
      p_attempt_id: attemptId,
      p_feedback: feedback,
    })
    if (saveError) console.error("prep_essay_save_feedback failed:", saveError.message)

    return res.status(200).json({ feedback })
  } catch (error) {
    console.error("prep-essay-feedback error:", error)
    return res.status(500).json({ error: "Could not generate feedback" })
  }
}

/** Resolve a prompt id to its text without importing the client bank (kept in sync
 *  by id). Falls back to a generic line if an id is unknown. */
function promptTextFor(promptId: string): string {
  return ESSAY_PROMPT_TEXT[promptId] ?? "the essay prompt"
}

async function generateFeedback(args: {
  apiKey: string
  firstName: string
  grade: string
  promptText: string
  essayText: string
}): Promise<string> {
  const { apiKey, firstName, grade, promptText, essayText } = args
  const anthropic = new Anthropic({ apiKey })

  const gradeLine = grade ? `The student is in grade ${grade}. ` : ""
  const system = `You are Nikki, a warm and encouraging writing coach helping a student practice for the ISEE admissions essay. ${gradeLine}The ISEE essay is UNSCORED but is sent to the schools the student applies to, so it is a real writing sample that admissions readers see.

Give the student warm, specific, genuinely useful feedback on the essay they wrote. Follow this structure exactly, in plain text (no markdown headers, no bullets with symbols, no scores or grades — ever):

1. Open with one warm sentence, addressing the student by name (${firstName}).
2. "What's working well:" then 2-3 SPECIFIC strengths, each pointing to something they actually wrote (quote or paraphrase their own words). Be genuine, not generic.
3. "Ways to make it even stronger:" then 2-3 concrete, doable improvements tied to what admissions readers value — a clear focus, organized paragraphs, specific details and examples, and clean conventions. Teach the move; never rewrite their essay or hand them finished sentences.
4. Close with one encouraging sentence that mentions this is exactly the kind of practice that gets them ready.

Keep it kind, concrete, and age-appropriate. Never give a number, letter, points, percentage, or rubric level. If the essay is very short or blank, gently encourage them to write more fully next time and give what specific guidance you can.`

  const user = `The essay prompt was:
"${promptText}"

Here is what ${firstName} wrote:
"""
${essayText || "(The student did not write anything.)"}
"""

Write your feedback now.`

  const msg = await anthropic.messages.create({
    model: "claude-sonnet-4-6",
    max_tokens: 900,
    temperature: 0.6,
    system,
    messages: [{ role: "user", content: user }],
  })

  const text = msg.content
    .filter((b): b is Anthropic.TextBlock => b.type === "text")
    .map((b) => b.text)
    .join("")
    .trim()

  return text || "You worked hard on this essay! Keep practicing — each one makes you a stronger writer."
}

// Prompt text by id — MUST stay in sync with src/lib/prep/essayPrompts.ts (same
// ids). Kept here as a plain map so the serverless function stays dependency-light
// and never imports client (Vite-aliased) modules.
const ESSAY_PROMPT_TEXT: Record<string, string> = {
  "accomplishment-proud": "Describe an accomplishment you are proud of. What did you do, and why does it matter to you?",
  "admire-person": "Write about a person you admire. What qualities do they have that you would like to develop in yourself?",
  "favorite-place": "Describe a place where you feel completely comfortable. What makes it special to you?",
  "learned-mistake": "Think of a time you made a mistake and learned something from it. What happened, and what did you learn?",
  "perfect-day": "Describe your idea of a perfect day from start to finish. Explain why each part matters to you.",
  "helped-someone": "Write about a time you helped someone. What did you do, and how did it make you feel?",
  "new-skill": "Describe a skill or hobby you would like to learn. Why does it interest you, and how would you begin?",
  "family-tradition": "Write about a tradition your family or community shares. Describe it and explain why it is important to you.",
  "changed-mind": "Describe a time you changed your mind about something. What made you see it differently?",
  "challenge-overcame": "Write about a challenge you faced and how you worked through it.",
  "mentor-influence": "Describe a teacher, coach, or mentor who made a difference for you. What did they teach you?",
  "story-stayed": "Write about a book, story, or movie that stayed with you. What was it about, and why did it matter to you?",
  "time-to-visit": "If you could visit any time period, past or future, which would you choose and why? Describe what you would want to see.",
  "helpful-invention": "If you could invent something to make everyday life better, what would it be? Describe how it would work and who it would help.",
  "kindness-received": "Describe a time someone was kind to you. What did they do, and how did it affect you?",
  "appreciate-community": "Write about something you appreciate in your neighborhood, town, or school community.",
  "goal-this-year": "Describe one goal you have for this year. Why did you choose it, and what steps will you take to reach it?",
  "memorable-day": "Write about a day you will always remember. Describe what happened and why it stayed with you.",
  "teach-a-class": "If you could teach a class on any topic, what would it be? Describe what you would want your students to learn.",
  "outdoors-experience": "Describe an experience you had outdoors or in nature. What did you notice, and how did you feel?",
  "quality-matters": "Which personal quality — such as honesty, kindness, or determination — matters most to you, and why? Use an example from your own life.",
  "tried-something-new": "Write about a time you tried something new. What was it like, and what did you discover?",
  "someone-dependable": "Describe a person in your life you can always count on. What makes them so dependable?",
  "future-self": "Imagine yourself ten years from now. Describe the kind of person you hope to be and how you might get there.",
}
