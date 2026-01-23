import { RadioGroup, RadioGroupItem } from "@/components/ui/radio-group"
import { Switch } from "@/components/ui/switch"
import { Button } from "@/components/ui/button"
import { Label } from "@/components/ui/label"
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
  return (
    <div className="flex flex-col h-full bg-sidebar text-sidebar-foreground p-6">
      {/* Logo */}
      <div className="mb-8">
        <img
          src={logo}
          alt="PathwayEd"
          className="h-12 w-auto"
        />
      </div>

      {/* Persona Toggle */}
      <div className="mb-8">
        <Label className="text-sm font-medium text-sidebar-foreground/70 mb-3 block">
          I am a...
        </Label>
        <RadioGroup
          value={persona}
          onValueChange={(value) => onPersonaChange(value as Persona)}
          className="space-y-2"
        >
          {[
            { value: "student", label: "Student" },
            { value: "teacher", label: "Teacher" },
            { value: "parent", label: "Parent" },
          ].map((option) => (
            <div
              key={option.value}
              className="flex items-center space-x-3 rounded-xl px-4 py-3 transition-colors hover:bg-sidebar-accent cursor-pointer"
              onClick={() => onPersonaChange(option.value as Persona)}
            >
              <RadioGroupItem
                value={option.value}
                id={option.value}
                className="border-sidebar-foreground/50 text-sidebar-primary data-[state=checked]:bg-sidebar-primary data-[state=checked]:border-sidebar-primary"
              />
              <Label
                htmlFor={option.value}
                className="text-sidebar-foreground cursor-pointer font-medium"
              >
                {option.label}
              </Label>
            </div>
          ))}
        </RadioGroup>
      </div>

      {/* Autoplay Voice Toggle */}
      <div className="mb-8">
        <div className="flex items-center justify-between rounded-xl px-4 py-3 bg-sidebar-accent/50">
          <div className="flex items-center space-x-3">
            <Volume2 className="h-5 w-5 text-sidebar-foreground/70" />
            <Label
              htmlFor="autoplay-voice"
              className="text-sidebar-foreground font-medium cursor-pointer"
            >
              Autoplay Voice
            </Label>
          </div>
          <Switch
            id="autoplay-voice"
            checked={autoplayVoice}
            onCheckedChange={onAutoplayVoiceChange}
            className="data-[state=checked]:bg-sidebar-primary"
          />
        </div>
      </div>

      {/* Spacer */}
      <div className="flex-1" />

      {/* New Chat Button */}
      <Button
        onClick={onNewChat}
        className="w-full bg-accent hover:bg-accent/90 text-accent-foreground rounded-xl py-6 font-semibold"
      >
        <MessageSquarePlus className="mr-2 h-5 w-5" />
        New Chat
      </Button>
    </div>
  )
}
