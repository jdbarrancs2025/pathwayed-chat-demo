import { useState } from "react"
import { Delete, Eraser } from "lucide-react"
import { cn } from "@/lib/utils"

interface MathKey {
  label: string
  value: string
}

interface MathKeyboardProps {
  onInsert: (value: string) => void
  onBackspace: () => void
  onClear: () => void
  disabled?: boolean
}

type KeyboardTab = "standard" | "scientific"

const fractionKeys: MathKey[] = [
  { label: "1/2", value: "1/2" },
  { label: "1/3", value: "1/3" },
  { label: "2/3", value: "2/3" },
  { label: "1/4", value: "1/4" },
  { label: "3/4", value: "3/4" },
  { label: "a/b", value: "/" },
]

const symbolKeys: MathKey[] = [
  { label: "+", value: "+" },
  { label: "-", value: "-" },
  { label: "x", value: "*" },
  { label: "÷", value: "/" },
  { label: "=", value: "=" },
  { label: "( )", value: "()" },
]

const scientificRow1: MathKey[] = [
  { label: "√", value: "√" },
  { label: "°", value: "°" },
  { label: "^", value: "^" },
  { label: "π", value: "π" },
  { label: "%", value: "%" },
  { label: "²", value: "²" },
]

const scientificRow2: MathKey[] = [
  { label: "³", value: "³" },
  { label: "<", value: "<" },
  { label: ">", value: ">" },
  { label: "≤", value: "≤" },
  { label: "≥", value: "≥" },
  { label: "≠", value: "≠" },
]

const numberKeys: MathKey[] = [
  { label: "7", value: "7" },
  { label: "8", value: "8" },
  { label: "9", value: "9" },
  { label: "4", value: "4" },
  { label: "5", value: "5" },
  { label: "6", value: "6" },
  { label: "1", value: "1" },
  { label: "2", value: "2" },
  { label: "3", value: "3" },
  { label: "0", value: "0" },
  { label: ".", value: "." },
]

function KeyButton({
  keyDef,
  onInsert,
  disabled,
}: {
  keyDef: MathKey
  onInsert: (value: string) => void
  disabled?: boolean
}) {
  return (
    <button
      type="button"
      onClick={() => onInsert(keyDef.value)}
      disabled={disabled}
      className={cn(
        "h-9 rounded-xl border border-slate-200 bg-white text-slate-700 text-sm font-semibold",
        "hover:border-primary/25 hover:text-primary hover:bg-primary/5 transition-colors",
        "disabled:opacity-50 disabled:cursor-not-allowed"
      )}
      aria-label={`Insert ${keyDef.label}`}
    >
      {keyDef.label}
    </button>
  )
}

export function MathKeyboard({
  onInsert,
  onBackspace,
  onClear,
  disabled,
}: MathKeyboardProps) {
  const [activeTab, setActiveTab] = useState<KeyboardTab>("standard")

  return (
    <div className="mb-2 rounded-2xl border border-slate-200 bg-slate-50/80 p-2 sm:p-3">
      {/* Tab toggle */}
      <div className="flex gap-1 mb-2 p-0.5 rounded-lg bg-slate-100 w-fit">
        <button
          type="button"
          onClick={() => setActiveTab("standard")}
          className={cn(
            "px-3 py-1 rounded-md text-xs font-semibold transition-colors",
            activeTab === "standard"
              ? "bg-primary text-primary-foreground shadow-sm"
              : "text-slate-500 hover:text-slate-700"
          )}
        >
          Standard
        </button>
        <button
          type="button"
          onClick={() => setActiveTab("scientific")}
          className={cn(
            "px-3 py-1 rounded-md text-xs font-semibold transition-colors",
            activeTab === "scientific"
              ? "bg-primary text-primary-foreground shadow-sm"
              : "text-slate-500 hover:text-slate-700"
          )}
        >
          Scientific
        </button>
      </div>

      {/* Tab content */}
      {activeTab === "standard" ? (
        <>
          <div className="grid grid-cols-3 sm:grid-cols-6 gap-1.5">
            {fractionKeys.map((keyDef) => (
              <KeyButton
                key={`fraction-${keyDef.label}`}
                keyDef={keyDef}
                onInsert={onInsert}
                disabled={disabled}
              />
            ))}
          </div>
          <div className="mt-1.5 grid grid-cols-3 sm:grid-cols-6 gap-1.5">
            {symbolKeys.map((keyDef) => (
              <KeyButton
                key={`symbol-${keyDef.label}`}
                keyDef={keyDef}
                onInsert={onInsert}
                disabled={disabled}
              />
            ))}
          </div>
        </>
      ) : (
        <>
          <div className="grid grid-cols-3 sm:grid-cols-6 gap-1.5">
            {scientificRow1.map((keyDef) => (
              <KeyButton
                key={`sci1-${keyDef.label}`}
                keyDef={keyDef}
                onInsert={onInsert}
                disabled={disabled}
              />
            ))}
          </div>
          <div className="mt-1.5 grid grid-cols-3 sm:grid-cols-6 gap-1.5">
            {scientificRow2.map((keyDef) => (
              <KeyButton
                key={`sci2-${keyDef.label}`}
                keyDef={keyDef}
                onInsert={onInsert}
                disabled={disabled}
              />
            ))}
          </div>
        </>
      )}

      {/* Number row + actions (shared) */}
      <div className="mt-1.5 grid grid-cols-3 sm:grid-cols-6 gap-1.5">
        {numberKeys.map((keyDef) => (
          <KeyButton
            key={`number-${keyDef.label}`}
            keyDef={keyDef}
            onInsert={onInsert}
            disabled={disabled}
          />
        ))}
        <button
          type="button"
          onClick={onBackspace}
          disabled={disabled}
          className={cn(
            "h-9 rounded-xl border border-slate-200 bg-white text-slate-700",
            "hover:border-primary/25 hover:text-primary hover:bg-primary/5 transition-colors",
            "disabled:opacity-50 disabled:cursor-not-allowed inline-flex items-center justify-center"
          )}
          aria-label="Delete last character"
        >
          <Delete className="h-4 w-4" />
        </button>
        <button
          type="button"
          onClick={onClear}
          disabled={disabled}
          className={cn(
            "h-9 rounded-xl border border-slate-200 bg-white text-slate-700",
            "hover:border-primary/25 hover:text-primary hover:bg-primary/5 transition-colors",
            "disabled:opacity-50 disabled:cursor-not-allowed inline-flex items-center justify-center"
          )}
          aria-label="Clear input"
        >
          <Eraser className="h-4 w-4" />
        </button>
      </div>
    </div>
  )
}
