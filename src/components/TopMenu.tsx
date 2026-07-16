import lockupImg from '@/assets/pathwayed-logo-horizontal.png'
import badgeImg from '@/assets/pathwayed-badge-notagline.png'
import { HeaderMenu } from '@/components/HeaderMenu'

/** Top bar with the PathwayEd mark on the left and the app menu on the right.
 *  `logoHeight` overrides the default 52px mark and `menuSize` the default 44px
 *  hamburger for a specific screen (e.g. the larger welcome / /students header);
 *  both omitted everywhere else, so other screens are unaffected.
 *
 *  `mark` picks the artwork, and the two are NOT interchangeable by size:
 *
 *    lockup (default) — the horizontal icon + wordmark, ~5:1. Right for the
 *      52px bar, where its wordmark still reads.
 *    badge — icon stacked over the wordmark, 1:1. Only for the big headers
 *      (/students at 156, KidHome at 208). Its wordmark is 105px of a 1000px
 *      canvas, so at the default 52px bar it renders ~5.5px tall and is a
 *      smudge rather than type. Do not make this the default. */
export function TopMenu({
  logoHeight,
  menuSize,
  mark = 'lockup',
}: { logoHeight?: number; menuSize?: number; mark?: 'lockup' | 'badge' } = {}) {
  return (
    <div className="topbar">
      <img
        className="markimg"
        src={mark === 'badge' ? badgeImg : lockupImg}
        alt="PathwayEd"
        style={logoHeight ? { height: logoHeight } : undefined}
      />
      <HeaderMenu size={menuSize} />
    </div>
  )
}
