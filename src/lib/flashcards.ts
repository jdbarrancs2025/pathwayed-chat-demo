import { authedJsonHeaders } from '@/lib/apiAuth'

export interface Flashcard {
  front: string
  back: string
}

export interface CardContext {
  childName: string
  grade: string
  level: string
}

interface FlashcardsBody {
  text?: string
  image?: { data: string; mediaType: string }
  context: { subject: string; focusAreas: never[]; appMode: null; childName: string; grade: string; level: string }
}

function contextFor(ctx: CardContext): FlashcardsBody['context'] {
  return {
    subject: 'reading',
    focusAreas: [],
    appMode: null,
    childName: ctx.childName,
    grade: ctx.grade,
    level: ctx.level,
  }
}

/** Call the non-streaming /api/flashcards endpoint and defensively read the cards. */
async function requestCards(body: FlashcardsBody): Promise<Flashcard[]> {
  const res = await fetch('/api/flashcards', {
    method: 'POST',
    headers: await authedJsonHeaders(),
    body: JSON.stringify(body),
  })
  if (!res.ok) throw new Error('Request failed')
  const data: unknown = await res.json()
  const cards = (data as { cards?: unknown })?.cards
  if (!Array.isArray(cards)) return []
  return cards
    .filter(
      (c): c is Flashcard =>
        !!c &&
        typeof (c as Flashcard).front === 'string' &&
        typeof (c as Flashcard).back === 'string',
    )
    .map((c) => ({ front: c.front, back: c.back }))
}

/** Generate from a typed word list / topic; an empty topic lets Nikki choose. */
export async function generateFromTopic(ctx: CardContext, topic: string): Promise<Flashcard[]> {
  return requestCards({ text: topic.trim(), context: contextFor(ctx) })
}

/** Generate from a photo of vocabulary or an assignment (server-side vision). */
export async function generateFromImage(
  ctx: CardContext,
  base64: string,
  mediaType: string,
): Promise<Flashcard[]> {
  return requestCards({ image: { data: base64, mediaType }, context: contextFor(ctx) })
}

/** Generate from words extracted client-side (e.g. PDF text). */
export async function generateFromText(ctx: CardContext, words: string): Promise<Flashcard[]> {
  return requestCards({ text: words, context: contextFor(ctx) })
}
