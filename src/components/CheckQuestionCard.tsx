import { MathText } from '@/components/MathText'
import type { PracticeQuestion } from '@/lib/questions'

/**
 * A check question, rendered INSIDE the chat transcript as one of Nikki's turns.
 *
 * Deliberately not a quiz screen. There is no score, no "Question 3 of 10", no
 * progress bar, no timer, and no right/wrong banner. It reads as Nikki putting a
 * question in front of the child in the middle of a conversation, because that is
 * what it is. Once answered the choices lock and the picked one is marked, then the
 * conversation carries straight on: Nikki's next turn does the teaching, so the
 * card itself never explains, praises, or corrects.
 */
export function CheckQuestionCard({
  question,
  selectedIndex,
  onPick,
}: {
  question: PracticeQuestion
  /** null while unanswered; the chosen index once answered (locks the card). */
  selectedIndex: number | null
  onPick: (index: number) => void
}) {
  const answered = selectedIndex !== null

  return (
    <div className="check-card">
      {question.passage && (
        <div className="check-passage">
          <MathText content={question.passage} />
        </div>
      )}
      <div className="check-stem">
        <MathText content={question.stem} />
      </div>
      <div className="check-choices" role="group" aria-label="Answer choices">
        {question.choices.map((c, i) => {
          const picked = selectedIndex === i
          return (
            <button
              key={i}
              type="button"
              className={`check-choice${picked ? ' picked' : ''}`}
              disabled={answered}
              aria-pressed={picked}
              onClick={() => onPick(i)}
            >
              <span className="check-choice-letter" aria-hidden="true">
                {String.fromCharCode(65 + i)}
              </span>
              <MathText content={c.text} />
            </button>
          )
        })}
      </div>
    </div>
  )
}
