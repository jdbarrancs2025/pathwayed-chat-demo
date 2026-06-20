import { NikkiOrb, type NikkiOrbState } from '@/components/NikkiOrb'

const PHOTOS: Record<string, string> = {
  p1: '/nikki1.jpg',
  p2: '/nikki2.jpg',
  p3: '/nikki3.jpg',
}

export type CallState = NikkiOrbState // 'idle' | 'thinking' | 'speaking'

/**
 * The Nikki "call stage" at the top of the chat pane (deep navy). Renders the
 * animated orb or the persona photo tile, with a live status line. Both react
 * to thinking and speaking states.
 */
export function CallStage({ nikki, state }: { nikki: string; state: CallState }) {
  const status = state === 'thinking' ? 'Thinking…' : state === 'speaking' ? 'Speaking…' : 'Here with you'
  const photo = PHOTOS[nikki]

  return (
    <div className="callstage">
      {nikki === 'orb' || !photo ? (
        <NikkiOrb size={240} state={state} />
      ) : (
        <div className={`callphoto ${state === 'idle' ? '' : state}`.trim()}>
          <img src={photo} alt="Nikki" />
        </div>
      )}
      <div className="callname">Nikki</div>
      <div className="navstatus">{status}</div>
    </div>
  )
}
