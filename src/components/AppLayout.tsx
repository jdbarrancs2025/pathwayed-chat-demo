import { useState } from "react"
import { Menu } from "lucide-react"
import { Button } from "@/components/ui/button"
import {
  Sheet,
  SheetContent,
  SheetTrigger,
} from "@/components/ui/sheet"
import { Sidebar, type Persona } from "@/components/Sidebar"

interface AppLayoutProps {
  children: React.ReactNode
}

export function AppLayout({ children }: AppLayoutProps) {
  const [persona, setPersona] = useState<Persona>("student")
  const [autoplayVoice, setAutoplayVoice] = useState(false)
  const [sidebarOpen, setSidebarOpen] = useState(false)

  const handleNewChat = () => {
    // Will be implemented in Phase 4
    console.log("New chat clicked")
  }

  const sidebarContent = (
    <Sidebar
      persona={persona}
      onPersonaChange={setPersona}
      autoplayVoice={autoplayVoice}
      onAutoplayVoiceChange={setAutoplayVoice}
      onNewChat={() => {
        handleNewChat()
        setSidebarOpen(false)
      }}
    />
  )

  return (
    <div className="flex h-screen bg-slate-100">
      {/* Desktop Sidebar - hidden on mobile */}
      <aside className="hidden md:block md:w-72 lg:w-80 flex-shrink-0 p-2">
        <div className="h-full">
          {sidebarContent}
        </div>
      </aside>

      {/* Mobile Header + Sheet */}
      <div className="flex flex-col flex-1 min-w-0">
        {/* Mobile Header */}
        <header className="md:hidden flex items-center justify-between px-4 py-3 bg-gradient-to-r from-[#2a4a7f] to-[#1e3a6e]">
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
              className="w-80 p-0 bg-transparent border-0"
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
        <main className="flex-1 overflow-hidden bg-white md:rounded-3xl md:m-2 md:ml-0 shadow-sm">
          {children}
        </main>
      </div>
    </div>
  )
}
