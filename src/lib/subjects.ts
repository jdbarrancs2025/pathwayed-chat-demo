export type SubjectId = 'math' | 'reading' | 'writing' | 'science'

export interface SubjectDef {
  id: SubjectId
  name: string
  accent: string
  blurb: string
  icon: string
}

export const SUBJECTS: SubjectDef[] = [
  {
    id: 'math',
    name: 'Math',
    accent: '#2E5BB8',
    blurb: 'Numbers, problems, and patterns',
    icon: '<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M5 7h6M8 4v6M14.5 6.5h5M5 16.5h5M5 14l5 5M14 14.5l5 5M19 14.5l-5 5"/></svg>',
  },
  {
    id: 'reading',
    name: 'Reading',
    accent: '#1F9E6F',
    blurb: 'Understanding what you read',
    icon: '<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 6.5C10.5 5 8 4.5 4 5v13c4-.5 6.5 0 8 1.5 1.5-1.5 4-2 8-1.5V5c-4-.5-6.5 0-8 1.5zM12 6.5V20"/></svg>',
  },
  {
    id: 'writing',
    name: 'Writing',
    accent: '#8B5CD6',
    blurb: 'Putting ideas into words',
    icon: '<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 19h8M4 17l9.5-9.5a2 2 0 0 0-3-3L1 14v3h3z"/></svg>',
  },
  {
    id: 'science',
    name: 'Science',
    accent: '#E8943A',
    blurb: 'How and why things work',
    icon: '<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M9 3h6M10 3v6L5.5 17a2 2 0 0 0 1.8 3h9.4a2 2 0 0 0 1.8-3L14 9V3M8 14h8"/></svg>',
  },
]

export const HOMEWORK = {
  id: 'homework' as const,
  name: 'Homework help',
  accent: '#CC543C',
  blurb: "Upload a photo or PDF of what you're working on and do it together",
  icon: '<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 16V4M7 9l5-5 5 5M5 20h14"/></svg>',
}

/** Display name for a subject id (including the special 'homework' session). */
export function subjectDisplayName(id: string): string {
  if (id === 'homework') return 'Homework help'
  return SUBJECTS.find((s) => s.id === id)?.name ?? id
}
