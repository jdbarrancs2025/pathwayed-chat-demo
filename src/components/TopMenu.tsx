import logoImg from '@/assets/logo-horizontal.png'
import { HeaderMenu } from '@/components/HeaderMenu'

/** Top bar with the PathwayEd lockup on the left and the app menu on the right.
 *  `logoHeight` overrides the default 34px lockup and `menuSize` the default
 *  44px hamburger for a specific screen (e.g. the larger welcome / /students
 *  header); both omitted everywhere else, so other screens are unaffected.
 *
 *  One artwork only, on purpose: the horizontal PathwayEd lockup. This
 *  component used to default to the square "Pathway Education" crest, but that
 *  is the LEGAL wordmark, reserved for footer/legal use; the product mark is
 *  PathwayEd everywhere a user sees the app. The old `mark` prop is gone with
 *  it, so a crest cannot quietly come back through a call site. */
export function TopMenu(
  { logoHeight, menuSize }: { logoHeight?: number; menuSize?: number } = {},
) {
  return (
    <div className="topbar">
      <img
        className="markimg"
        src={logoImg}
        alt="PathwayEd"
        style={{ height: logoHeight ?? 34 }}
      />
      <HeaderMenu size={menuSize} />
    </div>
  )
}
