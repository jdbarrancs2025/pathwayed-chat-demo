import { NikkiOrb, type NikkiOrbState } from '@/components/NikkiOrb'

export type CallState = NikkiOrbState // 'idle' | 'thinking' | 'speaking'

/**
 * The Nikki "call stage" at the top of the chat pane. The animated energy orb is
 * Nikki's only visual presence — it reacts to thinking and speaking states — with
 * her name and a live status line beneath it.
 */
export function CallStage({ state }: { state: CallState }) {
  const status = state === 'thinking' ? 'Thinking…' : state === 'speaking' ? 'Speaking…' : 'Here with you'

  return (
    <div className="callstage">
      <NikkiOrb size={240} state={state} />
      <div className="callname">Nikki</div>
      <div className="navstatus">{status}</div>
    </div>
  )
}
