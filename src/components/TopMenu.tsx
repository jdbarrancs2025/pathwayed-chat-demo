import logoImg from '@/assets/logo.png'
import { HeaderMenu } from '@/components/HeaderMenu'

/** Top bar with the PathwayEd mark on the left and the app menu on the right.
 *  `logoHeight` overrides the default 52px mark and `menuSize` the default 44px
 *  hamburger for a specific screen (e.g. the larger welcome / /students header);
 *  both omitted everywhere else, so other screens are unaffected. */
export function TopMenu({ logoHeight, menuSize }: { logoHeight?: number; menuSize?: number } = {}) {
  return (
    <div className="topbar">
      <img
        className="markimg"
        src={logoImg}
        alt="PathwayEd"
        style={logoHeight ? { height: logoHeight } : undefined}
      />
      <HeaderMenu size={menuSize} />
    </div>
  )
}
