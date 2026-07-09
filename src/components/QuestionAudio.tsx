interface QuestionAudioProps {
  /** App-wide read-aloud mute state. */
  muted: boolean
  /** True while a read is playing (drives the replay button's active state). */
  speaking: boolean
  /** Toggle mute (the caller also stops any in-flight audio when muting). */
  onToggleMute: () => void
  /** Re-read the current question aloud. */
  onReplay: () => void
}

/**
 * The read-aloud controls shown above a served question (diagnostic + practice):
 * a "Hear it again" replay button and a mute toggle for Nikki's voice. Nikki
 * reads each new question automatically; these let the child replay it or turn
 * reading aloud off. When muted, replay is disabled.
 */
export function QuestionAudio({ muted, speaking, onToggleMute, onReplay }: QuestionAudioProps) {
  return (
    <div className="qaudio">
      <button
        type="button"
        className={`qaudio-replay ${speaking ? 'on' : ''}`}
        onClick={onReplay}
        disabled={muted}
        title="Hear the question again"
        aria-label="Hear the question again"
      >
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
          <path d="M11 5 6 9H2v6h4l5 4zM15.5 8.5a5 5 0 0 1 0 7M19 5a9 9 0 0 1 0 14" />
        </svg>
        Hear it again
      </button>
      <button
        type="button"
        className={`qaudio-mute ${muted ? 'muted' : ''}`}
        onClick={onToggleMute}
        aria-pressed={muted}
        title={muted ? 'Turn reading aloud on' : 'Turn reading aloud off'}
        aria-label={muted ? 'Turn reading aloud on' : 'Turn reading aloud off'}
      >
        {muted ? (
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
            <path d="M11 5 6 9H2v6h4l5 4z" />
            <line x1="23" y1="9" x2="17" y2="15" />
            <line x1="17" y1="9" x2="23" y2="15" />
          </svg>
        ) : (
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" aria-hidden="true">
            <path d="M11 5 6 9H2v6h4l5 4zM15.5 8.5a5 5 0 0 1 0 7M19 5a9 9 0 0 1 0 14" />
          </svg>
        )}
      </button>
    </div>
  )
}
