import { useState } from 'react'
import { useNavigate } from 'react-router'
import { Calculator, BookOpen, PenTool, Upload, Calendar, Clock } from 'lucide-react'
import { PageLayout } from '@/components/PageLayout'
import { Button } from '@/components/ui/button'
import { Checkbox } from '@/components/ui/checkbox'
import { RadioGroup, RadioGroupItem } from '@/components/ui/radio-group'
import { Label } from '@/components/ui/label'
import { useAppContext } from '@/context/AppContext'
import type { FocusAreas } from '@/lib/types'

const focusAreaOptions = {
  math: [
    { value: 'fractions', label: 'Fractions' },
    { value: 'geometry', label: 'Geometry' },
  ],
  reading: [
    { value: 'main-idea', label: 'Main Idea' },
    { value: 'vocabulary', label: 'Vocabulary' },
  ],
  writing: [
    { value: 'short-response', label: 'Short Response' },
    { value: 'paragraph-writing', label: 'Paragraph Writing' },
  ],
} as const

const subjectConfig = {
  math: {
    icon: Calculator,
    label: 'Math',
    color: 'text-blue-600',
    bgColor: 'bg-blue-50',
    borderColor: 'border-blue-200',
    accentColor: 'bg-blue-600',
  },
  reading: {
    icon: BookOpen,
    label: 'Reading',
    color: 'text-emerald-600',
    bgColor: 'bg-emerald-50',
    borderColor: 'border-emerald-200',
    accentColor: 'bg-emerald-600',
  },
  writing: {
    icon: PenTool,
    label: 'Writing',
    color: 'text-amber-600',
    bgColor: 'bg-amber-50',
    borderColor: 'border-amber-200',
    accentColor: 'bg-amber-600',
  },
} as const

type SubjectKey = keyof typeof focusAreaOptions

export function TeacherSetup() {
  const navigate = useNavigate()
  const { setFocusAreas } = useAppContext()

  const [selectedFocusAreas, setSelectedFocusAreas] = useState<FocusAreas>({
    math: [],
    reading: [],
    writing: [],
  })
  const [timeframe, setTimeframe] = useState<'this-week' | 'until-test'>('this-week')

  const toggleFocusArea = (subject: SubjectKey, value: string) => {
    setSelectedFocusAreas((prev) => {
      const current = prev[subject]
      const isSelected = current.includes(value)
      return {
        ...prev,
        [subject]: isSelected
          ? current.filter((v) => v !== value)
          : [...current, value],
      }
    })
  }

  const hasAnySelection =
    selectedFocusAreas.math.length > 0 ||
    selectedFocusAreas.reading.length > 0 ||
    selectedFocusAreas.writing.length > 0

  const handleContinue = () => {
    if (!hasAnySelection) return
    setFocusAreas(selectedFocusAreas)
    navigate('/student')
  }

  return (
    <PageLayout title="Teacher Setup" showBack backTo="/">
      <div className="space-y-8 pb-6 animate-in fade-in slide-in-from-bottom-2 duration-300">
        {/* Header */}
        <div className="text-center relative">
          <div className="absolute inset-0 -top-4 bg-gradient-to-b from-primary/5 to-transparent rounded-3xl -z-10" />
          <h1 className="text-2xl sm:text-3xl font-bold text-primary mb-2">
            Assign Practice Focus for This Session
          </h1>
          <p className="text-muted-foreground text-sm sm:text-base max-w-md mx-auto">
            Choose what students should practice during this session
          </p>
        </div>

        {/* Focus Areas Section */}
        <section className="space-y-4">
          <h2 className="text-sm font-semibold text-muted-foreground uppercase tracking-wider flex items-center gap-3">
            <span className="h-px flex-1 bg-gradient-to-r from-transparent via-border to-border" />
            <span className="flex items-center gap-2">
              <span className="w-1.5 h-1.5 rounded-full bg-[#e85a24]" />
              Focus Areas
            </span>
            <span className="h-px flex-1 bg-gradient-to-l from-transparent via-border to-border" />
          </h2>

          <div className="space-y-4">
            {(Object.keys(focusAreaOptions) as SubjectKey[]).map((subject) => {
              const config = subjectConfig[subject]
              const Icon = config.icon
              const options = focusAreaOptions[subject]
              const selectedCount = selectedFocusAreas[subject].length

              return (
                <div
                  key={subject}
                  className={`rounded-xl border-2 ${config.borderColor} ${config.bgColor} p-4 transition-all duration-200 ${
                    selectedCount > 0 ? 'shadow-md' : ''
                  }`}
                >
                  {/* Subject header */}
                  <div className="flex items-center gap-3 mb-3">
                    <div
                      className={`p-2 rounded-lg ${config.accentColor} text-white shadow-sm`}
                    >
                      <Icon className="h-4 w-4" />
                    </div>
                    <span className={`font-semibold ${config.color}`}>
                      {config.label}
                    </span>
                    {selectedCount > 0 && (
                      <span
                        className={`ml-auto text-xs font-medium px-2 py-0.5 rounded-full ${config.accentColor} text-white`}
                      >
                        {selectedCount} selected
                      </span>
                    )}
                  </div>

                  {/* Checkbox options */}
                  <div className="grid grid-cols-2 gap-2">
                    {options.map((option) => {
                      const isChecked = selectedFocusAreas[subject].includes(
                        option.value
                      )
                      return (
                        <label
                          key={option.value}
                          className={`flex items-center gap-3 p-3 rounded-lg cursor-pointer transition-all duration-150 ${
                            isChecked
                              ? 'bg-white shadow-sm border border-transparent'
                              : 'bg-white/50 hover:bg-white/80 border border-transparent'
                          }`}
                        >
                          <Checkbox
                            checked={isChecked}
                            onCheckedChange={() =>
                              toggleFocusArea(subject, option.value)
                            }
                            className="data-[state=checked]:bg-primary data-[state=checked]:border-primary"
                          />
                          <span
                            className={`text-sm font-medium ${
                              isChecked ? 'text-primary' : 'text-muted-foreground'
                            }`}
                          >
                            {option.label}
                          </span>
                        </label>
                      )
                    })}
                  </div>
                </div>
              )
            })}
          </div>
        </section>

        {/* Upload Assignment Section */}
        <section className="space-y-3">
          <h2 className="text-sm font-semibold text-muted-foreground uppercase tracking-wider flex items-center gap-3">
            <span className="h-px flex-1 bg-gradient-to-r from-transparent via-border to-border" />
            <span className="flex items-center gap-2">
              <span className="w-1.5 h-1.5 rounded-full bg-[#e85a24]" />
              Assignment
            </span>
            <span className="h-px flex-1 bg-gradient-to-l from-transparent via-border to-border" />
          </h2>

          <div className="relative group">
            <div className="absolute -inset-0.5 bg-gradient-to-r from-[#1e3a6e]/20 via-[#e85a24]/20 to-[#1e3a6e]/20 rounded-2xl opacity-50 blur-sm" />
            <Button
              variant="outline"
              disabled
              className="relative w-full h-auto py-5 flex items-center justify-center gap-4 border-dashed border-2 bg-white/80 backdrop-blur-sm rounded-xl hover:bg-white/90 transition-all"
            >
              <div className="p-2.5 rounded-xl bg-gradient-to-br from-slate-100 to-slate-50 border border-slate-200/50">
                <Upload className="h-5 w-5 text-muted-foreground" />
              </div>
              <div className="text-left">
                <span className="block font-semibold text-muted-foreground">
                  Upload Assignment
                </span>
                <span className="text-xs text-muted-foreground/70">
                  Coming soon
                </span>
              </div>
            </Button>
          </div>
        </section>

        {/* Timeframe Section */}
        <section className="space-y-3">
          <h2 className="text-sm font-semibold text-muted-foreground uppercase tracking-wider flex items-center gap-3">
            <span className="h-px flex-1 bg-gradient-to-r from-transparent via-border to-border" />
            <span className="flex items-center gap-2">
              <span className="w-1.5 h-1.5 rounded-full bg-[#e85a24]" />
              Timeframe
            </span>
            <span className="h-px flex-1 bg-gradient-to-l from-transparent via-border to-border" />
          </h2>

          <RadioGroup
            value={timeframe}
            onValueChange={(value: 'this-week' | 'until-test') =>
              setTimeframe(value)
            }
            className="grid grid-cols-2 gap-3"
          >
            <label
              className={`flex items-center gap-3 p-4 rounded-xl border-2 cursor-pointer transition-all duration-150 ${
                timeframe === 'this-week'
                  ? 'border-primary bg-primary/5 shadow-sm'
                  : 'border-border hover:border-primary/30 bg-white'
              }`}
            >
              <RadioGroupItem value="this-week" id="this-week" />
              <div className="flex items-center gap-2">
                <Clock
                  className={`h-4 w-4 ${
                    timeframe === 'this-week'
                      ? 'text-primary'
                      : 'text-muted-foreground'
                  }`}
                />
                <Label
                  htmlFor="this-week"
                  className={`cursor-pointer font-medium ${
                    timeframe === 'this-week'
                      ? 'text-primary'
                      : 'text-muted-foreground'
                  }`}
                >
                  This week
                </Label>
              </div>
            </label>

            <label
              className={`flex items-center gap-3 p-4 rounded-xl border-2 cursor-pointer transition-all duration-150 ${
                timeframe === 'until-test'
                  ? 'border-primary bg-primary/5 shadow-sm'
                  : 'border-border hover:border-primary/30 bg-white'
              }`}
            >
              <RadioGroupItem value="until-test" id="until-test" />
              <div className="flex items-center gap-2">
                <Calendar
                  className={`h-4 w-4 ${
                    timeframe === 'until-test'
                      ? 'text-primary'
                      : 'text-muted-foreground'
                  }`}
                />
                <Label
                  htmlFor="until-test"
                  className={`cursor-pointer font-medium ${
                    timeframe === 'until-test'
                      ? 'text-primary'
                      : 'text-muted-foreground'
                  }`}
                >
                  Until test date
                </Label>
              </div>
            </label>
          </RadioGroup>
        </section>

        {/* Continue Button */}
        <div className="pt-4">
          <Button
            onClick={handleContinue}
            disabled={!hasAnySelection}
            className="w-full h-12 text-base font-semibold rounded-xl shadow-lg shadow-primary/20 transition-all duration-200 hover:shadow-xl hover:shadow-primary/30 disabled:shadow-none"
          >
            {hasAnySelection ? 'Save & Continue' : 'Select at least one focus area'}
          </Button>

          {!hasAnySelection && (
            <p className="text-center text-xs text-muted-foreground mt-3">
              Choose focus areas above to continue
            </p>
          )}
        </div>
      </div>
    </PageLayout>
  )
}
