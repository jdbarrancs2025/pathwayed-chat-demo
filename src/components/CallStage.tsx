import { type NikkiOrbState } from '@/components/NikkiOrb'
import { NikkiAvatar } from '@/components/NikkiAvatar'

export type CallState = NikkiOrbState // 'idle' | 'thinking' | 'speaking'

/**
 * The Nikki "call stage" at the top of the chat pane. Nikki's visual presence is
 * a real video avatar that switches between a speaking clip and an idle clip on
 * the same speaking state — with her name and a live status line beneath it.
 */
export function CallStage({ state }: { state: CallState }) {
  const status = state === 'thinking' ? 'Thinking…' : state === 'speaking' ? 'Speaking…' : 'Here with you'

  return (
    <div className="callstage">
      <NikkiAvatar size={240} state={state} />
      <div className="callname">Nikki</div>
      <div className="navstatus">{status}</div>
    </div>
  )
}
