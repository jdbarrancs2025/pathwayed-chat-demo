import { useNavigate, useParams } from 'react-router'
import { TopMenu } from '@/components/TopMenu'
import { NikkiOrb } from '@/components/NikkiOrb'
import '@/styles/app-screens.css'

/**
 * Skills building — the learning-path entry. STUB (Phase 1): routing target only.
 * Phase 2 will run the short assessment on first arrival, build the per-subject
 * path, name the day's skill, and launch the lesson from here.
 */
export function SkillsBuilding() {
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
          <h1 className="greet">Skills building</h1>
          <p className="muted">
            This is where I’ll pick today’s lesson and we’ll learn it together — coming in the next step.
          </p>
        </div>
        <button type="button" className="opener-reassess" onClick={() => navigate(`/students/${id}`)}>
          ← Back
        </button>
      </div>
    </div>
  )
}
