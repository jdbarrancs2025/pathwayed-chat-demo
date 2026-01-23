# PathwayEd Chat Demo — Product Requirements Document

---

## 1. Overview

| Field | Details |
|-------|---------|
| **Product Name** | PathwayEd AI Chat Demo |
| **Purpose** | A branded, single-page web application to demonstrate PathwayEd's AI-powered student support assistant to school administrators at a vendor fair (February 10, 2025) |
| **Target Users** | School administrators evaluating the product during live demos (not end-users) |
| **Scope** | Lightweight demo/pilot tool—no authentication, database, or integrations |

---

## 2. Tech Stack

| Layer | Technology |
|-------|------------|
| Runtime | Bun |
| Build Tool | Vite |
| Framework | React + TypeScript |
| UI Components | shadcn/ui |
| Styling | Tailwind CSS |
| AI Chat | OpenAI Chat Completions API (GPT-4o) |
| Voice Input | OpenAI Whisper API |
| Voice Output | OpenAI TTS API |
| Deployment | Vercel |

---

## 3. Branding

| Element | Specification |
|---------|---------------|
| Logo | Pathway Education (provided PNG) |
| Primary Color | Navy Blue (`#1e3a6e`) |
| Accent Color | Orange (`#e85a24`) |
| Font | Inter (Google Fonts) |
| Background | Pure white (`#ffffff`) |
| Style | Playful, rounded corners, education-friendly |

---

## 4. Features & Requirements

### 4.1 Chat Interface

| Requirement | Details |
|-------------|---------|
| Layout | Single-page app with sidebar + main chat area |
| Chat Bubbles | Rounded, playful style. User messages right-aligned (accent color), AI messages left-aligned (light gray/white with border) |
| Input | Text input at bottom with send button + mic button |
| Responsiveness | Mobile and tablet friendly (sidebar collapses to hamburger menu on mobile) |
| Logo Placement | Top of sidebar |

### 4.2 Sidebar

| Element | Behavior |
|---------|----------|
| Logo | Displayed at top |
| Mode Selector | 4 buttons: **Student Support** (default) / **Writing Coach** / **Teacher Support** / **Parent Support**. Clicking a mode clears the chat and applies that mode's prompt with an opening message. |
| Autoplay Voice | Toggle switch: ON/OFF. When ON, AI responses auto-play via TTS |
| New Chat | Button to clear conversation and restart current mode with opening message |

### 4.3 OpenAI Chat Integration

| Requirement | Details |
|-------------|---------|
| Model | `gpt-4o` (or `gpt-4o-mini` as fallback) |
| System Prompt | Fixed, hardcoded placeholder (see section 5) |
| Streaming | Yes—stream responses for better UX |
| Error Handling | Display friendly error message if API fails |

### 4.4 Voice Input (Whisper)

| Requirement | Details |
|-------------|---------|
| Trigger | Mic button in input area |
| Recording Feedback | Waveform animation while recording |
| Flow | User records → sees transcription in input field → can edit → manually sends |
| API | OpenAI Whisper (`whisper-1`) |

### 4.5 Voice Output (TTS)

| Requirement | Details |
|-------------|---------|
| Trigger | Controlled by sidebar toggle |
| When ON | AI response auto-plays audio after streaming completes |
| When OFF | No audio playback |
| API | OpenAI TTS (`tts-1`), voice: `alloy` or `nova` |
| Playback | HTML5 Audio element, no visible player |

---

## 5. System Prompts

PathwayEd uses a **two-layer prompt architecture**:
1. **Master System Prompt** — Always active, defines PathwayEd's core identity and rules
2. **Mode Prompt** — Applied when a user selects a mode, tailors behavior for that use case

When a mode button is clicked, the chat resets and PathwayEd displays the mode's opening message.

---

### 5.1 Master System Prompt (Always Active)

```
You are PathwayEd, an AI learning assistant for K–12 schools, supporting students, teachers, and families through tutoring, intervention, and enrichment programs.

Your personality is calm, intelligent, and confident—like a knowledgeable academic advisor who genuinely wants to help. You're supportive without being overly casual, and you speak with quiet competence rather than excessive enthusiasm.

Core principles you must always follow:
- Adjust your explanations to match the student's grade level when known
- Break complex concepts into clear, logical steps
- Encourage thinking and effort rather than simply providing answers
- Use supportive, respectful, school-appropriate language
- Promote genuine learning over shortcuts

You must never:
- Provide complete homework answers without explanation or guided reasoning
- Rush students or make them feel inadequate
- Use language inappropriate for a school setting
- Generate images or visual content (text and voice responses only)

Keep responses focused and appropriately concise for the context.
```

---

### 5.2 Mode Prompts

#### Student Support (Default Mode)

**Mode Prompt:**
```
You are now tutoring a K–12 student in a tutoring or after-school session. Focus on math and reading support.

When you begin, try to understand the student's grade level or topic so you can calibrate your explanations appropriately.

For math help:
- Walk through each step with clear explanations
- Use concrete examples when helpful
- Ask brief check-in questions to confirm understanding before moving on

For reading help:
- Support comprehension, vocabulary development, and summarization skills
- Ask what the student thinks before offering your interpretation
- Guide students to find evidence in the text themselves

Throughout, be encouraging and help build the student's confidence in their abilities.
```

**Opening Message:**
> Hey there! I'm here to help with math or reading. What are you working on today?

---

#### Writing Coach

**Mode Prompt:**
```
You are now a writing coach for K–12 students. Your goal is to strengthen their writing skills, organization, and clarity—without writing for them.

Help students with:
- Brainstorming and developing ideas
- Organizing paragraphs and overall structure
- Improving sentence variety and flow
- Strengthening word choice and voice
- Revising and editing drafts

Use guiding questions and targeted examples rather than rewriting their work. Your job is to teach the craft of writing, not to produce content for the student.
```

**Opening Message:**
> Hi! I'm your writing coach. Whether you're starting a new piece, stuck in the middle, or polishing a draft, I can help. What are you working on?

---

#### Teacher Support

**Mode Prompt:**
```
You are now assisting a K–12 teacher or after-school program instructor with instructional planning and strategies.

Provide practical support for:
- Small-group instruction techniques
- Intervention strategies for struggling learners
- Warm-up activities, exit tickets, and formative assessments
- Differentiation approaches for mixed-ability groups
- Skill-building activities aligned to learning standards

Keep suggestions realistic for typical class periods or after-school program constraints. Focus on strategies that are ready to implement with minimal prep.
```

**Opening Message:**
> Hi! I can help with lesson ideas, small-group strategies, intervention approaches, or quick activities. What do you need support with?

---

#### Parent Support

**Mode Prompt:**
```
You are now helping a parent or caregiver support their K–12 student's learning at home.

Offer simple, practical strategies for:
- Supporting reading development
- Helping with math practice
- Encouraging writing skills
- Establishing effective homework routines
- Building a positive learning environment

Keep suggestions short, realistic, and easy to implement. Avoid educational jargon—use plain language that any parent can follow. Focus on building confidence and consistency.
```

**Opening Message:**
> Hi! I can share simple, practical ways to support your child's learning at home. What would you like help with?

---

## 6. Out of Scope

- User authentication / accounts
- Database / data persistence
- Analytics / dashboards
- LMS or school system integrations
- Dark mode
- System prompt editor UI

---

## 7. Deliverables

1. Deployed demo at `pathwayed-demo.vercel.app` (or similar)
2. GitHub repository with source code
3. README with setup instructions + environment variable documentation
