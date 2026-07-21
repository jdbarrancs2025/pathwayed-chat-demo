import logoCrest from '@/assets/logo.png'
import logoHorizontal from '@/assets/logo-horizontal.png'
import { HeaderMenu } from '@/components/HeaderMenu'

/** Top bar with the PathwayEd mark on the left and the app menu on the right.
 *  `logoHeight` overrides the default 52px mark and `menuSize` the default 44px
 *  hamburger for a specific screen (e.g. the larger welcome / /students header);
 *  both omitted everywhere else, so other screens are unaffected.
 *
 *  `mark` selects the artwork: the default square crest (the kid heroes on
 *  /students and KidHome rely on it) or the horizontal PathwayEd lockup used on
 *  parent-facing screens. The horizontal mark is wide, so it defaults to a
 *  shorter 34px height rather than the crest's 52px. */
export function TopMenu(
  { logoHeight, menuSize, mark = 'crest' }:
    { logoHeight?: number; menuSize?: number; mark?: 'crest' | 'horizontal' } = {},
) {
  const isHorizontal = mark === 'horizontal'
  const src = isHorizontal ? logoHorizontal : logoCrest
  const height = logoHeight ?? (isHorizontal ? 34 : undefined)
  return (
    <div className="topbar">
      <img
        className="markimg"
        src={src}
        alt="PathwayEd"
        style={height ? { height } : undefined}
      />
      <HeaderMenu size={menuSize} />
    </div>
  )
}
