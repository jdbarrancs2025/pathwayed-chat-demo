import { type NikkiOrbState } from '@/components/NikkiOrb'
import { NikkiFace } from '@/components/NikkiFace'
import type { AvatarMode } from '@/lib/students'

export type CallState = NikkiOrbState // 'idle' | 'thinking' | 'speaking'

/**
 * The Nikki "call stage" at the top of the chat pane. Nikki's visual presence
 * follows the child's chosen avatar mode (video / orb / voice nameplate) — with
 * her name and a live status line beneath it.
 */
export function CallStage({ state, mode = 'video' }: { state: CallState; mode?: AvatarMode }) {
  const status = state === 'thinking' ? 'Thinking…' : state === 'speaking' ? 'Speaking…' : 'Here with you'

  return (
    <div className="callstage">
      <NikkiFace mode={mode} size={240} state={state} />
      <div className="callname">Nikki</div>
      <div className="navstatus">{status}</div>
    </div>
  )
}
