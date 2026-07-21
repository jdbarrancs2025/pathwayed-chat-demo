import { useNavigate } from 'react-router'
import { useAppContext } from '@/context/AppContext'
import type { GradeBand } from '@/lib/types'
import logoImg from '@/assets/logo-horizontal.png'

const gradeBands: { value: GradeBand; label: string; sublabel: string; emoji: string }[] = [
  { value: '3-5', label: 'Grades 3\u20135', sublabel: 'Elementary', emoji: '\u270F\uFE0F' },
  { value: '6-8', label: 'Grades 6\u20138', sublabel: 'Middle School', emoji: '\uD83D\uDCDA' },
  { value: '9-12', label: 'Grades 9\u201312', sublabel: 'High School', emoji: '\uD83C\uDF93' },
]

export function GradeSelect() {
  const navigate = useNavigate()
  const { state, setGradeBand } = useAppContext()

  const handleSelect = (band: GradeBand) => {
    setGradeBand(band)
    navigate(state.mode === 'school' ? '/teacher-setup' : '/parent-setup')
  }

  return (
    <div className="h-dvh bg-white flex items-center justify-center px-4 py-8 overflow-y-auto">
      {/* Subtle background pattern — matches AccountSetup */}
      <div
        className="fixed inset-0 opacity-[0.02] pointer-events-none"
        style={{
          backgroundImage: `url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%231e3a6e' fill-opacity='1'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E")`,
        }}
      />

      <div className="relative w-full max-w-md text-center animate-in fade-in slide-in-from-bottom-4 duration-500">
        {/* Logo */}
        <div className="mb-8">
          <img
            src={logoImg}
            alt="PathwayEd"
            className="mx-auto h-12 sm:h-14 w-auto object-contain drop-shadow-md animate-in zoom-in duration-300"
          />
        </div>

        {/* Heading */}
        <h1 className="text-2xl sm:text-3xl font-bold text-primary mb-2 leading-tight">
          What grade level?
        </h1>
        <p className="text-muted-foreground mb-10 text-sm sm:text-base">
          This helps N.I.K.K.I. adjust questions and explanations appropriately
        </p>

        {/* Grade band buttons */}
        <div className="space-y-4">
          {gradeBands.map((band, i) => (
            <button
              key={band.value}
              onClick={() => handleSelect(band.value)}
              className={`group w-full rounded-2xl p-6 sm:p-8 shadow-lg transition-all duration-300 hover:scale-[1.02] active:scale-[0.98] focus:outline-none focus-visible:ring-4 ${
                i === 0
                  ? 'bg-gradient-to-br from-primary to-[#2a4a7f] text-white shadow-primary/20 hover:shadow-xl hover:shadow-primary/30 focus-visible:ring-primary/30'
                  : i === 1
                    ? 'bg-gradient-to-br from-[#e85a24] to-[#d04e1c] text-white shadow-accent/20 hover:shadow-xl hover:shadow-accent/30 focus-visible:ring-accent/30'
                    : 'bg-gradient-to-br from-[#4b5563] to-[#374151] text-white shadow-slate-400/20 hover:shadow-xl hover:shadow-slate-500/30 focus-visible:ring-slate-400/30'
              }`}
            >
              <div className="flex items-center gap-4">
                <span className="text-4xl sm:text-5xl transition-transform duration-300 group-hover:scale-110 group-hover:rotate-3">
                  {band.emoji}
                </span>
                <div className="text-left flex-1">
                  <div className="font-semibold text-lg sm:text-xl mb-1">
                    {band.label}
                  </div>
                  <div
                    className="text-sm sm:text-base text-white/80"
                  >
                    {band.sublabel}
                  </div>
                </div>
                <svg
                  className="w-5 h-5 sm:w-6 sm:h-6 opacity-60 transition-transform duration-300 group-hover:translate-x-1"
                  fill="none"
                  stroke="currentColor"
                  viewBox="0 0 24 24"
                >
                  <path
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    strokeWidth={2}
                    d="M9 5l7 7-7 7"
                  />
                </svg>
              </div>
            </button>
          ))}
        </div>

        {/* Back link */}
        <button
          onClick={() => navigate('/')}
          className="mt-10 text-xs text-muted-foreground/70 hover:text-primary transition-colors"
        >
          &larr; Back to account setup
        </button>
      </div>
    </div>
  )
}
