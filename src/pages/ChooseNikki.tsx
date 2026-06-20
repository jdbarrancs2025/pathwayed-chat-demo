import { useState } from 'react'
import { useNavigate } from 'react-router'
import { useAuth } from '@/context/AuthContext'
import { setNikkiChoice } from '@/lib/profile'
import { NikkiChoiceGrid, type NikkiId } from '@/components/NikkiChoiceGrid'

export function ChooseNikki() {
  const { user } = useAuth()
  const navigate = useNavigate()
  const [selected, setSelected] = useState<NikkiId>('orb')
  const [saving, setSaving] = useState(false)

  const handleContinue = async () => {
    if (saving) return
    setSaving(true)
    if (user) await setNikkiChoice(user.id, selected)
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

        <NikkiChoiceGrid value={selected} onChange={setSelected} />

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
