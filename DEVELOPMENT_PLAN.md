# PathwayEd Chat Demo — Development Plan

**Total Tasks:** 47 atomic tasks across 9 phases  
**Timeline:** ~7-8 days  
**Budget:** $800 (two milestones)

---

## Progress Tracker

| Milestone | Status | Phases |
|-----------|--------|--------|
| Milestone 1 — Core Demo ($500) | 🟡 In Progress | Phases 1-5 |
| Milestone 2 — Voice & Polish ($300) | ⬜ Not Started | Phases 6-9 |

---

# Milestone 1 — Core Demo ($500)

## Phase 1: Project Setup

- [x] **Phase 1 Complete**

| Task | Description | Status |
|------|-------------|--------|
| 1.1 | Initialize project with Bun + Vite + React + TypeScript | ✅ |
| 1.2 | Install and configure Tailwind CSS | ✅ |
| 1.3 | Install and configure shadcn/ui | ✅ |
| 1.4 | Set up project folder structure (`/components`, `/lib`, `/assets`) | ✅ |
| 1.5 | Add Inter font via Google Fonts | ✅ |
| 1.6 | Create Tailwind theme with brand colors (navy, orange, white) | ✅ |
| 1.7 | Add logo to `/assets` | ✅ |

---

## Phase 2: Layout & Sidebar

- [x] **Phase 2 Complete**

| Task | Description | Status |
|------|-------------|--------|
| 2.1 | Create `AppLayout` component (sidebar + main area) | ✅ |
| 2.2 | Create `Sidebar` component with logo at top | ✅ |
| 2.3 | Add persona toggle (Student/Teacher/Parent) using shadcn RadioGroup | ✅ |
| 2.4 | Add autoplay voice toggle using shadcn Switch (non-functional placeholder) | ✅ |
| 2.5 | Add "New Chat" button | ✅ |
| 2.6 | Implement responsive sidebar (hamburger menu on mobile) | ✅ |

---

## Phase 3: Chat Interface

- [x] **Phase 3 Complete**

| Task | Description | Status |
|------|-------------|--------|
| 3.1 | Create `ChatContainer` component | ✅ |
| 3.2 | Create `ChatMessage` component (rounded, playful bubbles) | ✅ |
| 3.3 | Style user messages (right-aligned, accent color) | ✅ |
| 3.4 | Style AI messages (left-aligned, light background) | ✅ |
| 3.5 | Create `ChatInput` component (text input + send button + mic button placeholder) | ✅ |
| 3.6 | Implement auto-scroll to latest message | ✅ |
| 3.7 | Add empty state / welcome message | ✅ |

---

## Phase 4: OpenAI Integration

- [ ] **Phase 4 Complete**

| Task | Description | Status |
|------|-------------|--------|
| 4.1 | Set up environment variables for OpenAI API key | ⬜ |
| 4.2 | Create `/api/chat` serverless function (Vite API route or separate) | ⬜ |
| 4.3 | Implement streaming response handling | ⬜ |
| 4.4 | Connect chat input to API | ⬜ |
| 4.5 | Display streamed response in chat bubbles | ⬜ |
| 4.6 | Add loading indicator while AI is responding | ⬜ |
| 4.7 | Implement error handling with user-friendly message | ⬜ |
| 4.8 | Wire up "New Chat" to clear conversation state | ⬜ |

---

## Phase 5: Mobile Polish

- [ ] **Phase 5 Complete**

| Task | Description | Status |
|------|-------------|--------|
| 5.1 | Test and fix responsive layout on tablet sizes | ⬜ |
| 5.2 | Test and fix responsive layout on mobile sizes | ⬜ |
| 5.3 | Ensure chat input stays fixed at bottom on mobile | ⬜ |
| 5.4 | Test sidebar collapse/expand behavior | ⬜ |

---

### ✅ Milestone 1 Deliverable

Working chat demo with persona toggles, fully responsive, deployed locally for testing.

- [ ] **Milestone 1 Complete — Ready for client review**

---

# Milestone 2 — Voice & Polish ($300)

## Phase 6: Voice Input (Whisper)

- [ ] **Phase 6 Complete**

| Task | Description | Status |
|------|-------------|--------|
| 6.1 | Create `useAudioRecorder` hook (MediaRecorder API) | ⬜ |
| 6.2 | Create `WaveformVisualizer` component (canvas or CSS animation) | ⬜ |
| 6.3 | Implement mic button toggle (start/stop recording) | ⬜ |
| 6.4 | Create `/api/transcribe` serverless function (Whisper API) | ⬜ |
| 6.5 | Send recorded audio to Whisper, receive transcription | ⬜ |
| 6.6 | Populate transcription into chat input (editable) | ⬜ |
| 6.7 | Test on iOS Safari + Chrome | ⬜ |

---

## Phase 7: Voice Output (TTS)

- [ ] **Phase 7 Complete**

| Task | Description | Status |
|------|-------------|--------|
| 7.1 | Create `/api/tts` serverless function (OpenAI TTS API) | ⬜ |
| 7.2 | Create `useTextToSpeech` hook | ⬜ |
| 7.3 | Wire autoplay toggle state to TTS behavior | ⬜ |
| 7.4 | When autoplay ON: trigger TTS after AI response completes | ⬜ |
| 7.5 | Play audio via HTML5 Audio element | ⬜ |
| 7.6 | Handle TTS errors gracefully | ⬜ |
| 7.7 | Test on iOS Safari + Chrome | ⬜ |

---

## Phase 8: Final Polish

- [ ] **Phase 8 Complete**

| Task | Description | Status |
|------|-------------|--------|
| 8.1 | Add subtle animations (message appear, button hover states) | ⬜ |
| 8.2 | Add favicon (PathwayEd logo) | ⬜ |
| 8.3 | Add page title and meta tags | ⬜ |
| 8.4 | Final cross-browser testing (Chrome, Safari, Firefox) | ⬜ |
| 8.5 | Final mobile/tablet testing | ⬜ |
| 8.6 | Code cleanup and comments | ⬜ |

---

## Phase 9: Deployment & Documentation

- [ ] **Phase 9 Complete**

| Task | Description | Status |
|------|-------------|--------|
| 9.1 | Deploy to Vercel | ⬜ |
| 9.2 | Configure environment variables in Vercel dashboard | ⬜ |
| 9.3 | Test production deployment | ⬜ |
| 9.4 | Write README with setup instructions | ⬜ |
| 9.5 | Document environment variables needed | ⬜ |
| 9.6 | Final handoff to client | ⬜ |

---

### ✅ Milestone 2 Deliverable

Fully functional demo with voice features, deployed on Vercel, source code with documentation.

- [ ] **Milestone 2 Complete — Project delivered**

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

- Task 1.7 resolved: Logo added to `/src/assets/logo.png` 

