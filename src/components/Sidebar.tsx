import { Switch } from "@/components/ui/switch"
import { MessageSquarePlus, Volume2 } from "lucide-react"
import logo from "@/assets/logo.png"

export type Persona = "student" | "teacher" | "parent"

interface SidebarProps {
  persona: Persona
  onPersonaChange: (persona: Persona) => void
  autoplayVoice: boolean
  onAutoplayVoiceChange: (enabled: boolean) => void
  onNewChat: () => void
}

export function Sidebar({
  persona,
  onPersonaChange,
  autoplayVoice,
  onAutoplayVoiceChange,
  onNewChat,
}: SidebarProps) {
  const personas: { value: Persona; label: string }[] = [
    { value: "student", label: "Student" },
    { value: "teacher", label: "Teacher" },
    { value: "parent", label: "Parent" },
  ]

  return (
    <div className="flex flex-col h-full bg-gradient-to-b from-[#2a4a7f] to-[#1a2f52] text-white p-4 rounded-3xl">
      {/* Logo in white card */}
      <div className="flex justify-center pt-4 pb-8">
        <div className="bg-white rounded-2xl p-3 shadow-lg shadow-black/20">
          <img
            src={logo}
            alt="PathwayEd"
            className="h-14 w-auto"
          />
        </div>
      </div>

      {/* Persona Selection - Centered nav style */}
      <nav className="flex flex-col items-center space-y-2 mb-8">
        {personas.map((option) => (
          <button
            key={option.value}
            onClick={() => onPersonaChange(option.value)}
            className={`
              w-full max-w-[180px] py-3 px-6 rounded-full text-center font-medium
              transition-all duration-200 ease-out
              ${
                persona === option.value
                  ? "bg-white/20 shadow-inner"
                  : "hover:bg-white/10"
              }
            `}
          >
            {option.label}
          </button>
        ))}
      </nav>

      {/* Autoplay Voice Toggle */}
      <div className="flex flex-col items-center mb-6">
        <button
          onClick={() => onAutoplayVoiceChange(!autoplayVoice)}
          className={`
            flex items-center gap-3 py-3 px-6 rounded-full
            transition-all duration-200 ease-out
            ${autoplayVoice ? "bg-white/20" : "hover:bg-white/10"}
          `}
        >
          <Volume2 className="h-5 w-5 opacity-80" />
          <span className="font-medium">Voice</span>
          <Switch
            checked={autoplayVoice}
            onCheckedChange={onAutoplayVoiceChange}
            className="data-[state=checked]:bg-accent ml-1 scale-90"
          />
        </button>
      </div>

      {/* Spacer */}
      <div className="flex-1" />

      {/* New Chat Button at bottom */}
      <div className="flex justify-center pb-4">
        <button
          onClick={onNewChat}
          className="
            flex items-center gap-2 py-3 px-6 rounded-full
            bg-accent hover:bg-accent/90 text-white font-semibold
            transition-all duration-200 ease-out
            shadow-lg shadow-accent/30 hover:shadow-accent/40
            hover:scale-[1.02] active:scale-[0.98]
          "
        >
          <MessageSquarePlus className="h-5 w-5" />
          New Chat
        </button>
      </div>
    </div>
  )
}
