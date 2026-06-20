import { NikkiOrb } from '@/components/NikkiOrb'

export type NikkiId = 'orb' | 'p1' | 'p2' | 'p3'

const OPTIONS: { id: NikkiId; label: string; src?: string }[] = [
  { id: 'orb', label: 'Energy orb' },
  { id: 'p1', label: 'Nikki', src: '/nikki1.jpg' },
  { id: 'p2', label: 'Nikki', src: '/nikki2.jpg' },
  { id: 'p3', label: 'Nikki', src: '/nikki3.jpg' },
]

/** The four Nikki appearance choices (orb + three persona photos). */
export function NikkiChoiceGrid({ value, onChange }: { value: NikkiId; onChange: (id: NikkiId) => void }) {
  return (
    <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 12, marginTop: 6 }}>
      {OPTIONS.map((opt) => {
        const on = value === opt.id
        return (
          <button
            key={opt.id}
            type="button"
            onClick={() => onChange(opt.id)}
            style={{
              display: 'flex',
              flexDirection: 'column',
              alignItems: 'center',
              gap: 9,
              padding: '16px 10px',
              border: on ? '1.6px solid #CC543C' : '1.6px solid #ECE4D8',
              borderRadius: 20,
              background: on ? '#FBEEE9' : '#fff',
              fontWeight: 700,
              fontSize: 13,
              color: '#1C2230',
              cursor: 'pointer',
            }}
          >
            {opt.id === 'orb' ? (
              <NikkiOrb size={66} />
            ) : (
              <span
                style={{
                  width: 66,
                  height: 66,
                  borderRadius: '50%',
                  overflow: 'hidden',
                  boxShadow: '0 4px 12px rgba(28,34,48,.18)',
                }}
              >
                <img src={opt.src} alt="Nikki" style={{ width: '100%', height: '100%', objectFit: 'cover', display: 'block' }} />
              </span>
            )}
            <span>{opt.label}</span>
          </button>
        )
      })}
    </div>
  )
}
