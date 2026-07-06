import logoImg from '@/assets/logo.png'
import { HeaderMenu } from '@/components/HeaderMenu'

/** Top bar with the PathwayEd mark on the left and the app menu on the right.
 *  `logoHeight` overrides the default 52px mark for a specific screen (e.g. the
 *  larger /students header); omitted everywhere else, so other screens are
 *  unaffected. */
export function TopMenu({ logoHeight }: { logoHeight?: number } = {}) {
  return (
    <div className="topbar">
      <img
        className="markimg"
        src={logoImg}
        alt="PathwayEd"
        style={logoHeight ? { height: logoHeight } : undefined}
      />
      <HeaderMenu />
    </div>
  )
}
