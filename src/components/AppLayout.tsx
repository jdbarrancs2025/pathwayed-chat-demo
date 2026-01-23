import { useState } from "react"
import { Menu } from "lucide-react"
import { Button } from "@/components/ui/button"
import {
  Sheet,
  SheetContent,
  SheetTrigger,
} from "@/components/ui/sheet"
import { Sidebar, type Mode } from "@/components/Sidebar"

interface AppLayoutProps {
  children: React.ReactNode
  mode: Mode
  onModeChange: (mode: Mode) => void
  autoplayVoice: boolean
  onAutoplayVoiceChange: (enabled: boolean) => void
  onNewChat: () => void
}

export function AppLayout({
  children,
  mode,
  onModeChange,
  autoplayVoice,
  onAutoplayVoiceChange,
  onNewChat,
}: AppLayoutProps) {
  const [sidebarOpen, setSidebarOpen] = useState(false)

  const sidebarContent = (
    <Sidebar
      mode={mode}
      onModeChange={(newMode) => {
        onModeChange(newMode)
        setSidebarOpen(false)
      }}
      autoplayVoice={autoplayVoice}
      onAutoplayVoiceChange={onAutoplayVoiceChange}
      onNewChat={() => {
        onNewChat()
        setSidebarOpen(false)
      }}
    />
  )

  return (
    <div className="flex h-full bg-slate-100 overflow-hidden overscroll-none">
      {/* Desktop Sidebar - hidden on mobile/tablet, shows at lg breakpoint */}
      <aside className="hidden lg:block lg:w-72 xl:w-80 flex-shrink-0 py-2 pl-2">
        <div className="h-full rounded-3xl overflow-hidden">
          {sidebarContent}
        </div>
      </aside>

      {/* Mobile Header + Sheet */}
      <div className="flex flex-col flex-1 min-w-0 overflow-hidden">
        {/* Mobile/Tablet Header - visible until lg breakpoint */}
        <header className="lg:hidden flex items-center justify-between px-4 py-3 bg-gradient-to-r from-[#2a4a7f] to-[#1e3a6e]">
          <Sheet open={sidebarOpen} onOpenChange={setSidebarOpen}>
            <SheetTrigger asChild>
              <Button
                variant="ghost"
                size="icon"
                className="text-white hover:bg-white/10"
              >
                <Menu className="h-6 w-6" />
                <span className="sr-only">Open menu</span>
              </Button>
            </SheetTrigger>
            <SheetContent
              side="left"
              className="w-[85vw] sm:w-80 md:w-96 p-0 bg-transparent border-0"
            >
              {sidebarContent}
            </SheetContent>
          </Sheet>
          <span className="text-white font-semibold text-lg">
            PathwayEd
          </span>
          <div className="w-10" /> {/* Spacer for centering */}
        </header>

        {/* Main Content */}
        <main className="flex-1 overflow-hidden bg-white lg:rounded-3xl lg:my-2 lg:mr-2 shadow-sm">
          {children}
        </main>
      </div>
    </div>
  )
}
