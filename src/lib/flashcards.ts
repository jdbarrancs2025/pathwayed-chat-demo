import { fetchChatText } from '@/lib/chatClient'

export interface Flashcard {
  front: string
  back: string
}

export interface CardContext {
  childName: string
  grade: string
  level: string
}

/** Tolerant JSON parse — strips code fences and slices to the array bounds. */
export function parseCards(raw: string): Flashcard[] {
  let text = String(raw)
    .replace(/```json|```/g, '')
    .trim()
  const start = text.indexOf('[')
  const end = text.lastIndexOf(']')
  if (start >= 0 && end > start) text = text.slice(start, end + 1)
  try {
    const parsed: unknown = JSON.parse(text)
    if (!Array.isArray(parsed)) return []
    return parsed.filter(
      (c): c is Flashcard =>
        !!c &&
        typeof (c as Flashcard).front === 'string' &&
        typeof (c as Flashcard).back === 'string',
    )
  } catch {
    return []
  }
}

function contextFor(ctx: CardContext) {
  return {
    subject: 'reading',
    focusAreas: [],
    appMode: null,
    childName: ctx.childName,
    grade: ctx.grade,
    level: ctx.level,
  }
}

export async function generateFromTopic(ctx: CardContext, topic: string): Promise<Flashcard[]> {
  const suffix = topic.trim() ? ` using these words or topic: ${topic.trim()}` : ''
  const raw = await fetchChatText({
    messages: [{ role: 'user', content: 'Make flashcards' + suffix }],
    mode: 'kid-tutor',
    task: 'flashcards',
    context: contextFor(ctx),
  })
  return parseCards(raw).slice(0, 16)
}

export async function generateFromImage(
  ctx: CardContext,
  base64: string,
  mediaType: string,
): Promise<Flashcard[]> {
  const raw = await fetchChatText({
    messages: [{ role: 'user', content: 'Make flashcards from these words.' }],
    image: { data: base64, mediaType },
    mode: 'kid-tutor',
    task: 'flashcards',
    context: contextFor(ctx),
  })
  return parseCards(raw).slice(0, 16)
}

export async function generateFromText(ctx: CardContext, words: string): Promise<Flashcard[]> {
  const raw = await fetchChatText({
    messages: [{ role: 'user', content: 'Make flashcards from these words:\n' + words }],
    mode: 'kid-tutor',
    task: 'flashcards',
    context: contextFor(ctx),
  })
  return parseCards(raw).slice(0, 20)
}
