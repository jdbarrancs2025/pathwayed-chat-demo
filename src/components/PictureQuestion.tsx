import { KidIcon } from '@/components/KidIcon'
import type { PracticeChoice, PicturePrompt } from '@/lib/questions'

interface PictureQuestionProps {
  /** The visual prompt (a group to count), or null for audio-only prompts. */
  prompt: PicturePrompt | null
  /** The answer tiles — numerals or object groups. */
  choices: PracticeChoice[]
  answered: boolean
  selected: number | null
  onPick: (index: number) => void
  /** Practice colors correct/wrong after a tap; the silent diagnostic does not. */
  showState: boolean
}

function group(image: string, count: number, size: number) {
  return (
    <span className="picq-group" aria-hidden="true">
      {Array.from({ length: count }, (_, i) => (
        <KidIcon key={i} name={image} size={size} />
      ))}
    </span>
  )
}

/**
 * The K–2 pre-reader answer UI: a big picture prompt (optional) and large
 * tap-target tiles (a giant numeral, or a group of picture icons). No text the
 * child must read — the prompt is spoken by Nikki (auto-read). Scoring is by the
 * tapped tile index, exactly like the text choices.
 */
export function PictureQuestion({ prompt, choices, answered, selected, onPick, showState }: PictureQuestionProps) {
  return (
    <div className="picq">
      {/* A single word-picture (phonics) shows large; a counting group shows smaller. */}
      {prompt && <div className="picq-prompt">{group(prompt.image, prompt.count, prompt.count === 1 ? 96 : 48)}</div>}
      <div className="picq-tiles" data-count={choices.length}>
        {choices.map((c, i) => {
          const tile = c.tile
          const state = !showState || !answered ? '' : c.is_correct ? 'correct' : i === selected ? 'chosen-wrong' : 'dim'
          return (
            <button
              key={i}
              type="button"
              className={`picq-tile ${state}`}
              disabled={answered}
              aria-label={c.text}
              onClick={() => onPick(i)}
            >
              {tile?.kind === 'number' || tile?.kind === 'letter' ? (
                <span className="picq-num">{tile.value}</span>
              ) : tile?.kind === 'object_group' ? (
                group(tile.image, tile.count, 30)
              ) : (
                <span className="picq-num">{c.text}</span>
              )}
            </button>
          )
        })}
      </div>
    </div>
  )
}
