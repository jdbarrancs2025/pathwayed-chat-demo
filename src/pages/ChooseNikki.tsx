import { useState } from 'react'
import { useNavigate } from 'react-router'
import { useAuth } from '@/context/AuthContext'
import { supabase } from '@/lib/supabase'
import { NikkiOrb } from '@/components/NikkiOrb'

type NikkiId = 'orb' | 'p1' | 'p2' | 'p3'

const OPTIONS: { id: NikkiId; label: string; src?: string }[] = [
  { id: 'orb', label: 'Energy orb' },
  { id: 'p1', label: 'Nikki', src: '/nikki1.jpg' },
  { id: 'p2', label: 'Nikki', src: '/nikki2.jpg' },
  { id: 'p3', label: 'Nikki', src: '/nikki3.jpg' },
]

export function ChooseNikki() {
  const { user } = useAuth()
  const navigate = useNavigate()
  const [selected, setSelected] = useState<NikkiId>('orb')
  const [saving, setSaving] = useState(false)

  const handleContinue = async () => {
    if (saving) return
    setSaving(true)
    if (user) {
      await supabase.from('profiles').update({ nikki: selected }).eq('id', user.id)
    }
    navigate('/children', { replace: true })
  }

  return (
    <div
      style={{
        minHeight: '100dvh',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        padding: '26px 22px',
        background: '#FBF8F3',
        color: '#1C2230',
      }}
    >
      <div
        style={{
          background: '#FFFFFF',
          border: '1px solid #ECE4D8',
          borderRadius: 20,
          boxShadow: '0 1px 2px rgba(28,34,48,.04),0 10px 30px rgba(28,34,48,.07)',
          width: '100%',
          maxWidth: 480,
          padding: 34,
          textAlign: 'center',
        }}
      >
        <p
          style={{
            color: '#CC543C',
            fontWeight: 700,
            fontSize: 12,
            letterSpacing: '.1em',
            textTransform: 'uppercase',
          }}
        >
          Almost there
        </p>
        <h1
          style={{
            fontFamily: '"Baloo 2", "Trebuchet MS", system-ui, sans-serif',
            color: '#003078',
            fontSize: 23,
            fontWeight: 700,
            margin: '5px 0 6px',
          }}
        >
          Choose your Nikki
        </h1>
        <p style={{ color: '#5A6172', fontSize: 14.5, margin: '0 0 16px' }}>
          Pick how Nikki looks while your child learns. You can change this any time in Settings.
        </p>

        <div
          style={{
            display: 'grid',
            gridTemplateColumns: '1fr 1fr',
            gap: 12,
            marginTop: 6,
          }}
        >
          {OPTIONS.map((opt) => {
            const on = selected === opt.id
            return (
              <button
                key={opt.id}
                type="button"
                onClick={() => setSelected(opt.id)}
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
                    <img
                      src={opt.src}
                      alt="Nikki"
                      style={{ width: '100%', height: '100%', objectFit: 'cover', display: 'block' }}
                    />
                  </span>
                )}
                <span>{opt.label}</span>
              </button>
            )
          })}
        </div>

        <button
          type="button"
          onClick={handleContinue}
          disabled={saving}
          style={{
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            width: '100%',
            padding: '15px 22px',
            borderRadius: 999,
            fontWeight: 700,
            fontSize: 15.5,
            marginTop: 18,
            background: '#CC543C',
            color: '#fff',
            cursor: saving ? 'not-allowed' : 'pointer',
            opacity: saving ? 0.45 : 1,
          }}
        >
          {saving ? 'Saving…' : 'Continue'}
        </button>
      </div>
    </div>
  )
}
