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
| Persona Toggle | Radio/toggle group: Student / Teacher / Parent (changes context label, same system prompt for now) |
| Autoplay Voice | Toggle switch: ON/OFF. When ON, AI responses auto-play via TTS |
| New Chat | Button to clear conversation and start fresh |

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

## 5. Placeholder System Prompt

```
You are PathwayEd, a friendly and supportive AI assistant designed to help students, teachers, and parents in after-school and intervention programs.

Your role:
- For students: Help with homework, explain concepts simply, encourage learning
- For teachers: Provide teaching strategies, activity ideas, and classroom support
- For parents: Answer questions about supporting their child's education at home

Tone: Warm, encouraging, patient, and age-appropriate. Keep responses concise and actionable.
```

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
