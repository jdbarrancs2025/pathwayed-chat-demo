import { Sparkles, GraduationCap, BookOpen, Users } from "lucide-react"

interface WelcomeMessageProps {
  onSuggestionClick: (message: string) => void
}

export function WelcomeMessage({ onSuggestionClick }: WelcomeMessageProps) {
  const suggestions = [
    {
      icon: BookOpen,
      text: "Help me understand fractions",
      color: "from-blue-500 to-indigo-500",
    },
    {
      icon: GraduationCap,
      text: "Tips for staying focused while studying",
      color: "from-emerald-500 to-teal-500",
    },
    {
      icon: Users,
      text: "How can I support my child's learning?",
      color: "from-amber-500 to-orange-500",
    },
  ]

  return (
    <div className="flex flex-col items-center justify-center h-full px-6 pt-16 pb-12 animate-in fade-in duration-500">
      {/* Animated mascot/icon area */}
      <div className="relative mb-8">
        {/* Glowing background */}
        <div className="absolute inset-0 bg-gradient-to-br from-accent/20 to-primary/20 rounded-full blur-3xl scale-150 animate-pulse" />

        {/* Main icon container */}
        <div className="relative w-24 h-24 bg-gradient-to-br from-primary to-[#2a4a7f] rounded-3xl flex items-center justify-center shadow-2xl shadow-primary/30 rotate-3 hover:rotate-0 transition-transform duration-300">
          <Sparkles className="w-12 h-12 text-white" />

          {/* Decorative dots */}
          <div className="absolute -top-2 -right-2 w-5 h-5 bg-accent rounded-full shadow-lg shadow-accent/50 animate-bounce" style={{ animationDelay: "0ms" }} />
          <div className="absolute -bottom-1 -left-3 w-3 h-3 bg-amber-400 rounded-full shadow-lg animate-bounce" style={{ animationDelay: "150ms" }} />
          <div className="absolute top-1/2 -right-4 w-2 h-2 bg-emerald-400 rounded-full shadow-lg animate-bounce" style={{ animationDelay: "300ms" }} />
        </div>
      </div>

      {/* Welcome text */}
      <div className="text-center mb-10 max-w-md">
        <h2 className="text-2xl md:text-3xl font-bold text-primary mb-3">
          Hi there! I'm PathwayEd
        </h2>
        <p className="text-slate-500 text-base md:text-lg leading-relaxed">
          Your friendly learning companion. I'm here to help students, teachers, and parents with anything education-related!
        </p>
      </div>

      {/* Suggestion chips */}
      <div className="w-full max-w-lg space-y-3">
        <p className="text-xs uppercase tracking-wider text-slate-400 text-center mb-4 font-medium">
          Try asking me...
        </p>

        <div className="grid gap-3">
          {suggestions.map((suggestion, index) => (
            <button
              key={index}
              onClick={() => onSuggestionClick(suggestion.text)}
              className="group flex items-center gap-4 w-full p-4 bg-white rounded-2xl border-2 border-slate-100 hover:border-accent/30 shadow-sm hover:shadow-md transition-all duration-200 text-left hover:scale-[1.02] active:scale-[0.98]"
              style={{
                animationDelay: `${index * 100}ms`,
              }}
            >
              {/* Icon */}
              <div className={`flex-shrink-0 w-10 h-10 rounded-xl bg-gradient-to-br ${suggestion.color} flex items-center justify-center shadow-md group-hover:scale-110 transition-transform duration-200`}>
                <suggestion.icon className="w-5 h-5 text-white" />
              </div>

              {/* Text */}
              <span className="flex-1 text-slate-600 group-hover:text-slate-800 font-medium transition-colors">
                "{suggestion.text}"
              </span>

              {/* Arrow indicator */}
              <div className="flex-shrink-0 w-8 h-8 rounded-full bg-slate-50 group-hover:bg-accent/10 flex items-center justify-center transition-colors">
                <svg
                  className="w-4 h-4 text-slate-400 group-hover:text-accent group-hover:translate-x-0.5 transition-all"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                </svg>
              </div>
            </button>
          ))}
        </div>
      </div>

      {/* Fun footer note */}
      <p className="mt-10 text-xs text-slate-400 text-center">
        Powered by{" "}
        <span className="font-semibold text-primary">Pathway Education</span>
        {" "}· Making learning fun for everyone
      </p>
    </div>
  )
}
