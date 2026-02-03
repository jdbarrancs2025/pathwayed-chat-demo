# PathwayEd Learning Demo — Product Requirements Document (v2)

---

## 1. Overview

| Field | Details |
|-------|---------|
| **Product Name** | PathwayEd Learning Demo |
| **Purpose** | A multi-screen demo application showing how PathwayEd works as a learning system for schools and families, with AI tutoring (N.I.K.K.I.) integrated into the workflow |
| **Target Users** | School administrators and parents evaluating the product at vendor fairs and meetings |
| **Scope** | Click-through demo with static/hardcoded data — no authentication, database, or persistence required |
| **Demo Goal** | Show how schools guide practice, how students work, and how parents see progress |

---

## 2. Tech Stack

| Layer | Technology |
|-------|------------|
| Runtime | Bun |
| Build Tool | Vite |
| Framework | React + TypeScript |
| Routing | React Router |
| UI Components | shadcn/ui |
| Styling | Tailwind CSS |
| AI (N.I.K.K.I.) | OpenAI Chat Completions API (GPT-4o) |
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
| AI Name | **N.I.K.K.I.** — PathwayEd's built-in AI learning assistant |

---

## 4. Demo Story & User Flows

The demo tells this story:

1. **First-time setup** — Is this student using PathwayEd through school or at home?
2. **School Mode** — Teacher sets goals → Student practices → Parent views progress
3. **Home Mode** — Parent sets goals → Student practices → Parent manages & views progress

---

## 5. Screen Specifications

### Screen 0: Account Setup (First Time)

| Element | Details |
|---------|---------|
| **Purpose** | Decide if learning is driven by school or parent |
| **Header** | "How will PathwayEd be used for this student?" |
| **Buttons** | 🏫 "Through my school / after-school program" → Go to T1 |
| | 🏠 "At home for extra practice" → Go to P2 |

---

### Screen T1: Teacher / Program Setup (School Mode)

| Element | Details |
|---------|---------|
| **Purpose** | Teacher controls what students practice |
| **Section 1** | **Select Focus Areas** (checkboxes, static) |
| | Math: Fractions, Word Problems |
| | Reading: Main Idea, Vocabulary |
| | Writing: Short Response, Paragraph Writing |
| **Section 2** | **Upload Assignment** — button (no real upload, just UI) |
| **Section 3** | **Timeframe** — "This week" / "Until test date" |
| **Button** | "Save & Continue" → Go to S1 (School Mode) |

---

### Screen S1: Student Home (Both Modes)

| Element | Details |
|---------|---------|
| **Header** | School: "Hi Jordan — here's what your teacher wants you to work on" |
| | Home: "Hi Jordan — here's what to work on today" |
| **Subject Buttons** | 📘 Math / 📗 Reading / ✍️ Writing |
| **Today's Focus Panel** | Shows selected focus areas with status icons |
| | Example: ✔ Math: Fractions, ⏳ Reading: Main Idea, ⏳ Writing: Short Response |
| **Progress Area** | Time spent today, activities completed (static) |
| **Navigation** | Clicking subject → Go to S2 |

---

### Screen S2: Student Subject Screen (Both Modes)

| Element | Details |
|---------|---------|
| **Section A** | **Practice Today's Skill** |
| | 1-2 example questions related to focus topic |
| | Static AI explanation/hints |
| **Section B** | **Homework Help — Ask N.I.K.K.I.** |
| | Text input: "Paste or type your homework question" |
| | Button: "Get Help" |
| | **Live OpenAI integration** — real AI responses |
| | Voice input/output supported here |
| **Completion** | "Mark Complete" button — updates progress visually |
| **Back** | Return to S1 |

---

### Screen P1: Parent View (School Mode Only)

| Element | Details |
|---------|---------|
| **Purpose** | Parent sees progress but doesn't control goals |
| **Header** | "This week's school assignments" |
| **Content** | Assigned skills list |
| | Completion status per skill |
| | Time spent |
| **Teacher Notes** | Static example: "Focus on word problems before Friday's quiz." |
| **No controls** | View only |

---

### Screen P2: Parent Setup (Home Mode Only)

| Element | Details |
|---------|---------|
| **Purpose** | Parent sets learning goals and schedule |
| **Step 1** | **Choose Subjects** — Checkboxes: Math, Reading, Writing |
| **Step 2** | **Focus Areas** — Examples: Word problems, Reading comprehension, Sentence writing |
| **Step 3** | **Practice Schedule** — Options: Daily, 3x per week, Weekends only |
| **Button** | "Save & Continue" → Go to S1 (Home Mode) |

---

### Screen P3: Parent Dashboard (Home Mode Only)

| Element | Details |
|---------|---------|
| **Purpose** | Parent monitors progress and adjusts goals |
| **Stats** | Weekly minutes practiced |
| | Subjects completed |
| | Areas needing attention |
| **Controls** | "Change Goals" button |
| | "Change Schedule" button |

---

### Screen T2: Teacher Support (Optional — All Modes)

| Element | Details |
|---------|---------|
| **Purpose** | Show classroom alignment features |
| **Options** | Upload assignment |
| | Request practice set |
| | Ask for explanation support |
| **Implementation** | Can be modal or separate screen, static UI |

---

## 6. N.I.K.K.I. AI Integration

| Aspect | Details |
|--------|---------|
| **Where** | Student Subject Screen (S2) — Homework Help section only |
| **Label** | "Ask N.I.K.K.I. for help with your homework" |
| **Integration** | Live OpenAI API (GPT-4o) with streaming |
| **Voice** | Whisper for input, TTS for output (optional toggle) |
| **Context** | N.I.K.K.I. responses should reference the current subject/skill area |

### N.I.K.K.I. System Prompt

```
You are N.I.K.K.I., PathwayEd's AI learning assistant for K–12 students. You help students understand their homework and practice skills in Math, Reading, and Writing.

Your personality is calm, encouraging, and patient — like a helpful tutor who genuinely wants the student to learn.

When helping with homework:
- Ask clarifying questions if the problem is unclear
- Guide students through steps rather than giving direct answers
- Use age-appropriate language
- Encourage effort and celebrate progress
- Connect explanations to the skill they're practicing

Current subject: {subject}
Current focus area: {focus_area}

Keep responses concise and focused on helping the student understand.
```

---

## 7. State Management

| State | Purpose | Persistence |
|-------|---------|-------------|
| `mode` | "school" or "home" | In-memory (resets on refresh) |
| `focusAreas` | Selected skills from teacher/parent setup | In-memory |
| `progress` | Completion status per subject | In-memory (can be hardcoded) |
| `currentSubject` | Which subject screen is active | Route-based |

No database or localStorage required — demo resets on refresh is acceptable.

---

## 8. What's Already Built (From Phase 1-5)

| Component | Status | Reuse |
|-----------|--------|-------|
| Project setup (Bun, Vite, React, TS, Tailwind, shadcn) | ✅ Complete | 100% |
| Layout structure & sidebar | ✅ Complete | Adapt for new screens |
| Chat interface components | ✅ Complete | Move to S2 as N.I.K.K.I. |
| OpenAI integration + streaming | ✅ Complete | Use in S2 |
| Branding (colors, fonts, rounded style) | ✅ Complete | 100% |
| Mobile responsiveness | ✅ Complete | 100% |

---

## 9. Out of Scope

- User authentication / accounts
- Database / data persistence
- Real file uploads
- Analytics / dashboards
- LMS or school system integrations
- Dark mode
- Multiple students / real user switching

---

## 10. Deliverables

1. Deployed demo at `pathwayed-demo.vercel.app` (or similar)
2. GitHub repository with source code
3. README with setup instructions + environment variable documentation

---

## 11. Budget & Milestones

| Item | Amount |
|------|--------|
| Work already completed (Phases 1-5) | $250 |
| Milestone 1: Core screens + N.I.K.K.I. | $650 |
| Milestone 2: Parent screens + polish + deployment | $450 |
| **Total** | **$1,350** |

# PathwayEd Learning Demo — PRD v2 Addition

## Milestone 3: Grade Bands + Question-First Flow ($400)

---

## Overview

This addition transforms the N.I.K.K.I. experience from an open chat to a question-first learning flow, where the AI leads with practice questions and guides students through their answers.

---

## New Feature: Grade Band Selection

### Where It Appears

After selecting School or Home mode (Screen 0), user selects a grade band before proceeding to setup.

### Grade Band Options

| Option | Label |
|--------|-------|
| 1 | Grades 3–5 |
| 2 | Grades 6–8 |
| 3 | Grades 9–12 |

### UI Specification

**Screen 0.5: Grade Band Selection**

**Route:** `/grade-select`

**Layout:**
- Centered card (consistent with Account Setup)
- Header: "What grade level?"
- Subtext: "This helps N.I.K.K.I. adjust questions and explanations appropriately"
- Three large buttons stacked vertically:
  - "Grades 3–5 (Elementary)"
  - "Grades 6–8 (Middle School)"
  - "Grades 9–12 (High School)"

**Behavior:**
- Store selection in AppContext as `gradeBand: '3-5' | '6-8' | '9-12'`
- Navigate to `/teacher-setup` (School Mode) or `/parent-setup` (Home Mode)

---

## Updated Feature: Question-First Flow

### Concept

Instead of N.I.K.K.I. waiting for student questions, the AI leads the learning session:

1. N.I.K.K.I. presents a question
2. Student types their answer in the chat input
3. N.I.K.K.I. evaluates the answer
4. If correct → praise + next question
5. If incorrect → guide through step-by-step, then next question
6. After X questions → session complete

### Teacher/Parent Setup Changes

Add a new field to Teacher Setup (T1) and Parent Setup (P2):

**Number of Practice Questions**

```
How many questions should the student complete?
○ 3 questions (Quick practice)
● 5 questions (Standard)
○ 10 questions (Extended practice)
```

Store in AppContext as `questionCount: 3 | 5 | 10`

---

## Updated N.I.K.K.I. System Prompt

Replace the existing N.I.K.K.I. prompt with this question-first version:

```
You are N.I.K.K.I., PathwayEd's AI learning assistant. You help K–12 students practice and strengthen their skills through guided question-based learning.

CURRENT SESSION CONTEXT:
- Grade level: {gradeBand}
- Subject: {subject}
- Focus area: {focusArea}
- Total questions: {questionCount}
- Current question: {currentQuestion}

YOUR ROLE:
You lead the learning session by presenting questions one at a time. You do NOT wait for the student to ask you questions — you drive the session.

SESSION FLOW:
1. Present a question appropriate for the grade level and focus area
2. Wait for the student's answer
3. Evaluate their response:
   - If CORRECT: Praise briefly, confirm why it's correct, then present the next question
   - If INCORRECT: Don't give the answer immediately. Ask guiding questions to help them think through it. If they're still stuck after 2-3 exchanges, walk them through the solution, then move to the next question.
4. Track progress conversationally: "Great! That's 2 of 5. Here's your next question..."
5. When all questions are complete, congratulate them and summarize how they did

QUESTION GUIDELINES:
- Grades 3-5: Simple language, concrete examples, single-step problems
- Grades 6-8: Moderate complexity, may require multiple steps
- Grades 9-12: More abstract thinking, real-world applications

TONE:
- Encouraging and patient
- Celebrate effort, not just correct answers
- Never make the student feel bad for mistakes
- Keep explanations concise and age-appropriate

IMPORTANT:
- Always start by presenting a question (never "How can I help you?")
- Keep track of question count in your responses
- When session is complete, clearly state "Session complete!" so the UI can respond

BEGIN by presenting Question 1 of {questionCount}.
```

---

## UI Updates for Question-First Flow

### Question Progress Indicator

Add a progress element to the Student Subject screen (S2), above the chat area:

```
┌─────────────────────────────────────────────────┐
│ 📘 Math: Fractions                              │
│                                                 │
│ Question 2 of 5                                 │
│ [████████░░░░░░░░░░░░] 40%                     │
│                                                 │
│ ┌─────────────────────────────────────────────┐ │
│ │ N.I.K.K.I.: Here's your next question...    │ │
│ │                                             │ │
│ │ Student: [answer]                           │ │
│ └─────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────┘
```

**Implementation:**
- Parse N.I.K.K.I.'s responses for question count (e.g., "That's 2 of 5" or "Question 3 of 5")
- Update progress bar accordingly
- Can use regex or simple string matching

### Session Completion Card

When N.I.K.K.I. says "Session complete!" (or similar), display a completion overlay/card:

```
┌─────────────────────────────────────────────────┐
│                                                 │
│              🎉 Session Complete!               │
│                                                 │
│         You finished 5 questions on            │
│               Fractions                         │
│                                                 │
│        [Practice More]  [Back to Home]          │
│                                                 │
└─────────────────────────────────────────────────┘
```

**Buttons:**
- "Practice More" → resets session, N.I.K.K.I. starts fresh with new questions
- "Back to Home" → navigates to `/student`

---

## Updated AppContext State

```typescript
interface AppState {
  mode: 'school' | 'home' | null;
  gradeBand: '3-5' | '6-8' | '9-12' | null;  // NEW
  focusAreas: {
    math: string[];
    reading: string[];
    writing: string[];
  };
  progress: {
    math: 'not-started' | 'in-progress' | 'complete';
    reading: 'not-started' | 'in-progress' | 'complete';
    writing: 'not-started' | 'in-progress' | 'complete';
  };
  schedule?: 'daily' | '3x-week' | 'weekends';
  questionCount: 3 | 5 | 10;  // NEW
}
```

---

## Updated Flow Diagram

```
┌─────────────────┐
│  Account Setup  │
│   (Screen 0)    │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Grade Select   │  ← NEW
│  (Screen 0.5)   │
└────────┬────────┘
         │
    ┌────┴────┐
    ▼         ▼
┌───────┐  ┌───────┐
│School │  │ Home  │
│ Mode  │  │ Mode  │
└───┬───┘  └───┬───┘
    │          │
    ▼          ▼
┌───────┐  ┌───────┐
│  T1   │  │  P2   │
│Teacher│  │Parent │
│ Setup │  │ Setup │
│+QCount│  │+QCount│  ← UPDATED (add question count)
└───┬───┘  └───┬───┘
    │          │
    └────┬─────┘
         ▼
    ┌─────────┐
    │   S1    │
    │ Student │
    │  Home   │
    └────┬────┘
         │
         ▼
    ┌─────────┐
    │   S2    │
    │ Subject │
    │+Progress│  ← UPDATED (question counter, completion card)
    │+N.I.K.K.I│
    └─────────┘
```

---

## Out of Scope for This Milestone

- Actual question bank / database of questions (AI generates them)
- Scoring or grading system
- Saving session history
- Adaptive difficulty based on performance
- Multiple attempts tracking across sessions