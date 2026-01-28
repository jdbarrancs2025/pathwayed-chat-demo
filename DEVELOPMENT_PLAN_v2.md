# PathwayEd Learning Demo — Development Plan (v2)

**Total Budget:** $1,350  
**Timeline:** ~6-7 days  
**Demo Date:** February 10, 2025

---

## Progress Tracker

| Milestone | Amount | Status | Phases |
|-----------|--------|--------|--------|
| Work Already Completed | $250 | ✅ Complete | Phases 1-5 (original) |
| Milestone 1 — Core Screens + N.I.K.K.I. | $650 | ⬜ Not Started | Phases 6-8 |
| Milestone 2 — Parent Screens + Polish | $450 | ⬜ Not Started | Phases 9-11 |

---

# ✅ COMPLETED WORK ($250)

## Phase 1: Project Setup ✅

- [x] **Phase 1 Complete**

| Task | Description | Status |
|------|-------------|--------|
| 1.1 | Initialize project with Bun + Vite + React + TypeScript | ✅ |
| 1.2 | Install and configure Tailwind CSS | ✅ |
| 1.3 | Install and configure shadcn/ui | ✅ |
| 1.4 | Set up project folder structure | ✅ |
| 1.5 | Add Inter font via Google Fonts | ✅ |
| 1.6 | Create Tailwind theme with brand colors | ✅ |
| 1.7 | Add logo to `/assets` | ✅ |

---

## Phase 2: Layout & Sidebar ✅

- [x] **Phase 2 Complete**

| Task | Description | Status |
|------|-------------|--------|
| 2.1 | Create `AppLayout` component | ✅ |
| 2.2 | Create `Sidebar` component with logo | ✅ |
| 2.3 | Add mode selector buttons | ✅ |
| 2.4 | Add autoplay voice toggle | ✅ |
| 2.5 | Add "New Chat" button | ✅ |
| 2.6 | Implement responsive sidebar | ✅ |

---

## Phase 3: Chat Interface ✅

- [x] **Phase 3 Complete**

| Task | Description | Status |
|------|-------------|--------|
| 3.1 | Create `ChatContainer` component | ✅ |
| 3.2 | Create `ChatMessage` component | ✅ |
| 3.3 | Style user messages | ✅ |
| 3.4 | Style AI messages | ✅ |
| 3.5 | Create `ChatInput` component | ✅ |
| 3.6 | Implement auto-scroll | ✅ |
| 3.7 | Add welcome message | ✅ |

---

## Phase 4: OpenAI Integration ✅

- [x] **Phase 4 Complete**

| Task | Description | Status |
|------|-------------|--------|
| 4.1 | Set up environment variables | ✅ |
| 4.2 | Create system prompts | ✅ |
| 4.3 | Create `/api/chat` serverless function | ✅ |
| 4.4 | Implement streaming responses | ✅ |
| 4.5 | Connect chat input to API | ✅ |
| 4.6 | Add loading indicator | ✅ |
| 4.7 | Implement error handling | ✅ |

---

## Phase 5: Mobile Polish ✅

- [x] **Phase 5 Complete**

| Task | Description | Status |
|------|-------------|--------|
| 5.1 | Test tablet layout | ✅ |
| 5.2 | Test mobile layout | ✅ |
| 5.3 | Fix chat input on mobile | ✅ |
| 5.4 | Test sidebar collapse | ✅ |

---

# MILESTONE 1 — Core Screens + N.I.K.K.I. ($650)

## Phase 6: Routing & App Structure ✅

- [x] **Phase 6 Complete**

| Task | Description | Status |
|------|-------------|--------|
| 6.1 | Install and configure React Router | ✅ |
| 6.2 | Create route structure for all screens | ✅ |
| 6.3 | Create `AppContext` for global state (mode, focusAreas, progress) | ✅ |
| 6.4 | Create shared `PageLayout` component (header + content area) | ✅ |
| 6.5 | Create `BackButton` component for navigation | ✅ |

---

## Phase 7: Setup & Flow Screens ✅

- [x] **Phase 7 Complete**

| Task | Description | Status |
|------|-------------|--------|
| 7.1 | Create **Screen 0: Account Setup** — mode selection (School vs Home) | ✅ |
| 7.2 | Create **Screen T1: Teacher Setup** — focus area checkboxes | ✅ |
| 7.3 | Add subject sections to T1 (Math, Reading, Writing with sub-options) | ✅ |
| 7.4 | Add "Upload Assignment" button (UI only) | ✅ |
| 7.5 | Add timeframe selector (This week / Until test date) | ✅ |
| 7.6 | Add "Save & Continue" button → navigates to S1 | ✅ |
| 7.7 | Store teacher selections in AppContext | ✅ |

---

## Phase 8: Student Screens + N.I.K.K.I.

- [ ] **Phase 8 Complete**

| Task | Description | Status |
|------|-------------|--------|
| 8.1 | Create **Screen S1: Student Home** layout | ⬜ |
| 8.2 | Add dynamic header based on mode (school vs home) | ⬜ |
| 8.3 | Create subject buttons (Math, Reading, Writing) with icons | ⬜ |
| 8.4 | Create "Today's Focus" panel showing selected focus areas | ⬜ |
| 8.5 | Add progress indicators (time spent, activities completed — static) | ⬜ |
| 8.6 | Create **Screen S2: Student Subject** layout | ⬜ |
| 8.7 | Add "Practice Today's Skill" section with example questions (static) | ⬜ |
| 8.8 | Add "Homework Help — Ask N.I.K.K.I." section | ⬜ |
| 8.9 | Move existing chat components into N.I.K.K.I. section | ⬜ |
| 8.10 | Update system prompt to include subject/focus context | ⬜ |
| 8.11 | Add "Mark Complete" button with visual feedback | ⬜ |
| 8.12 | Add back navigation to S1 | ⬜ |
| 8.13 | Test N.I.K.K.I. AI responses in context | ⬜ |

---

### ✅ Milestone 1 Deliverable

Working demo with: Account Setup → Teacher Setup → Student Home → Student Subject with live N.I.K.K.I. AI homework help.

- [ ] **Milestone 1 Complete — Ready for client review**

---

# MILESTONE 2 — Parent Screens + Polish ($450)

## Phase 9: Parent Screens

- [ ] **Phase 9 Complete**

| Task | Description | Status |
|------|-------------|--------|
| 9.1 | Create **Screen P1: Parent View** (School Mode) — view only | ⬜ |
| 9.2 | Add assigned skills list with completion status | ⬜ |
| 9.3 | Add time spent display | ⬜ |
| 9.4 | Add static "Teacher Notes" section | ⬜ |
| 9.5 | Create **Screen P2: Parent Setup** (Home Mode) | ⬜ |
| 9.6 | Add subject checkboxes (Math, Reading, Writing) | ⬜ |
| 9.7 | Add focus area selection | ⬜ |
| 9.8 | Add schedule selector (Daily, 3x per week, Weekends only) | ⬜ |
| 9.9 | Add "Save & Continue" → navigates to S1 (Home Mode) | ⬜ |
| 9.10 | Create **Screen P3: Parent Dashboard** (Home Mode) | ⬜ |
| 9.11 | Add weekly stats (minutes practiced, subjects completed) | ⬜ |
| 9.12 | Add "Change Goals" and "Change Schedule" buttons | ⬜ |

---

## Phase 10: Voice Features (N.I.K.K.I.)

- [ ] **Phase 10 Complete**

| Task | Description | Status |
|------|-------------|--------|
| 10.1 | Create `useAudioRecorder` hook (MediaRecorder API) | ⬜ |
| 10.2 | Create `WaveformVisualizer` component | ⬜ |
| 10.3 | Implement mic button in N.I.K.K.I. chat input | ⬜ |
| 10.4 | Create `/api/transcribe` serverless function (Whisper) | ⬜ |
| 10.5 | Populate transcription into input (editable) | ⬜ |
| 10.6 | Create `/api/tts` serverless function (OpenAI TTS) | ⬜ |
| 10.7 | Create `useTextToSpeech` hook | ⬜ |
| 10.8 | Add voice autoplay toggle to S2 screen | ⬜ |
| 10.9 | Test voice features on iOS Safari + Chrome | ⬜ |

---

## Phase 11: Final Polish & Deployment

- [ ] **Phase 11 Complete**

| Task | Description | Status |
|------|-------------|--------|
| 11.1 | Add navigation between all screens (verify all flows work) | ⬜ |
| 11.2 | Add subtle animations (transitions, button hovers) | ⬜ |
| 11.3 | Add favicon (PathwayEd logo) | ⬜ |
| 11.4 | Add page titles and meta tags | ⬜ |
| 11.5 | Final responsive testing (mobile + tablet) | ⬜ |
| 11.6 | Final cross-browser testing (Chrome, Safari, Firefox) | ⬜ |
| 11.7 | Code cleanup and comments | ⬜ |
| 11.8 | Deploy to Vercel | ⬜ |
| 11.9 | Configure environment variables in Vercel | ⬜ |
| 11.10 | Test production deployment | ⬜ |
| 11.11 | Write README with setup instructions | ⬜ |
| 11.12 | Final handoff to client | ⬜ |

---

### ✅ Milestone 2 Deliverable

Complete demo with all screens, voice features, deployed on Vercel with documentation.

- [ ] **Milestone 2 Complete — Project delivered**

---

## Screen Flow Summary

```
┌─────────────────┐
│  Account Setup  │
│   (Screen 0)    │
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
    │+N.I.K.K.I│
    └─────────┘

Parent Views:
• P1 (School Mode) — View only
• P3 (Home Mode) — Dashboard + controls
```

---

## Status Legend

| Symbol | Meaning |
|--------|---------|
| ⬜ | Not started |
| 🟡 | In progress |
| ✅ | Complete |
| ❌ | Blocked |

---

## Notes

_Use this section to track blockers, decisions, or client feedback._

- **Scope change approved:** Shifting from chat-first to learning workflow demo
- **N.I.K.K.I.** is the branded name for the AI assistant
- AI integration stays live for homework help, everything else is static
- Client confirmed: "showing how schools guide practice, how students work, and how parents see progress"

