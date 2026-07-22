import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router'
import { getPrepModule } from '@/lib/prep/registry'
import type { PrepModule } from '@/lib/prep/types'
import {
  getPrepEntitlements,
  getPrepSettings,
  isKidEntitled,
  testDayCountdown,
} from '@/lib/prep/entitlements'

interface ActiveModule {
  moduleId: string
  name: string
  testDate: string | null
}

/**
 * Kid-home tiles for the child's prep modules. Renders one .bigcard per module the
 * child is entitled to via isKidEntitled: status 'active' or 'past_due' (the grace
 * state while a failing card retries). 'canceled' fails the filter, so when a
 * scheduled cancel flips an entitlement to canceled the tile drops off on its own.
 * No entitlement means no tile and nothing about prep is shown. Deliberately free
 * of any billing / money / subscription language.
 */
export function PrepModuleTiles({ studentId }: { studentId: string }) {
  const navigate = useNavigate()
  const [modules, setModules] = useState<ActiveModule[]>([])

  useEffect(() => {
    let active = true
    Promise.all([getPrepEntitlements([studentId]), getPrepSettings([studentId])]).then(
      ([ents, settings]) => {
        if (!active) return
        const list = ents
          .filter((e) => isKidEntitled(e.status))
          .map((e): ActiveModule | null => {
            const mod = getPrepModule(e.moduleId as PrepModule['id'])
            if (!mod) return null
            return { moduleId: e.moduleId, name: mod.name, testDate: settings.get(`${studentId}:${e.moduleId}`) ?? null }
          })
          .filter((m): m is ActiveModule => m !== null)
        setModules(list)
      },
    )
    return () => {
      active = false
    }
  }, [studentId])

  if (modules.length === 0) return null

  return (
    <>
      {modules.map((m) => {
        const countdown = testDayCountdown(m.testDate)
        return (
          <button
            key={m.moduleId}
            type="button"
            className="bigcard"
            onClick={() => navigate(`/students/${studentId}/prep/${m.moduleId}`)}
          >
            <div className="ico" style={{ background: 'var(--navy)', color: '#fff', fontSize: 20 }}>
              ★
            </div>
            <div>
              <h3>{m.name} Prep</h3>
              <p>{countdown ?? 'Sharpen up for test day, one section at a time.'}</p>
            </div>
          </button>
        )
      })}
    </>
  )
}
