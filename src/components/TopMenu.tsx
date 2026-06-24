import logoImg from '@/assets/logo.png'
import { HeaderMenu } from '@/components/HeaderMenu'

/** Top bar with the PathwayEd mark on the left and the app menu on the right. */
export function TopMenu() {
  return (
    <div className="topbar">
      <img className="markimg" src={logoImg} alt="PathwayEd" />
      <HeaderMenu />
    </div>
  )
}
