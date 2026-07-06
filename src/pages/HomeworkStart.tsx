import { useNavigate, useParams } from 'react-router'
import { TopMenu } from '@/components/TopMenu'
import { NikkiOrb } from '@/components/NikkiOrb'
import '@/styles/app-screens.css'

/**
 * Homework — the homework-help entry. STUB (Phase 1): routing target only.
 * Phase 3 will ask which subject (Math / Reading / Writing / Science), load the
 * matching interface, and surface the photo/PDF upload here.
 */
export function HomeworkStart() {
  const { id } = useParams<{ id: string }>()
  const navigate = useNavigate()

  return (
    <div className="kid-screen">
      <div className="shell">
        <TopMenu />
        <div
          style={{
            display: 'flex',
            flexDirection: 'column',
            alignItems: 'center',
            textAlign: 'center',
            gap: 4,
            marginBottom: 22,
          }}
        >
          <NikkiOrb size={96} />
          <h1 className="greet">Homework</h1>
          <p className="muted">
            Bring an assignment and we’ll work through it together — this is coming in the next step.
          </p>
        </div>
        <button type="button" className="opener-reassess" onClick={() => navigate(`/students/${id}`)}>
          ← Back
        </button>
      </div>
    </div>
  )
}
