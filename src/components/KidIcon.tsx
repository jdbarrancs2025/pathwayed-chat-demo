/**
 * KidIcon — the curated, controlled illustration set for K–2 pre-reader items.
 * Hand-drawn inline SVGs (no external files, no generation): safe, consistent,
 * offline, CSP-friendly, and crisp at any size. Add a new object by adding one
 * entry here and its key to KID_IMAGES in preReaderTemplates.ts.
 */

type IconName =
  | 'apple' | 'star' | 'ball' | 'flower' | 'duck' | 'fish'
  // Phonics word pictures (beginning-sound proof).
  | 'cat' | 'gift' | 'hat' | 'key' | 'leaf' | 'moon' | 'pig' | 'ring' | 'sun' | 'tree' | 'van'

const PATHS: Record<IconName, { fill: string; svg: React.ReactNode }> = {
  apple: {
    fill: '#e5443b',
    svg: (
      <>
        <path d="M32 20c-4-6-12-6-16-2-5 5-4 16 2 24 3 4 7 8 14 8s11-4 14-8c6-8 7-19 2-24-4-4-12-4-16 2z" />
        <path d="M32 20c0-6 3-10 8-11" fill="none" stroke="#7a4a2b" strokeWidth="3" strokeLinecap="round" />
        <path d="M34 15c4-4 10-4 12 0-3 4-9 4-12 0z" fill="#5aa02c" />
      </>
    ),
  },
  star: {
    fill: '#f4b400',
    svg: <path d="M32 6l7 15 16 2-12 11 3 16-14-8-14 8 3-16L9 23l16-2z" />,
  },
  ball: {
    fill: '#3b7de5',
    svg: (
      <>
        <circle cx="32" cy="32" r="24" />
        <path d="M12 26c14 6 26 6 40 0M12 38c14-6 26-6 40 0M32 8v48" fill="none" stroke="#fff" strokeWidth="3" />
      </>
    ),
  },
  flower: {
    fill: '#e5679b',
    svg: (
      <>
        <circle cx="32" cy="14" r="9" />
        <circle cx="50" cy="32" r="9" />
        <circle cx="32" cy="50" r="9" />
        <circle cx="14" cy="32" r="9" />
        <circle cx="32" cy="32" r="8" fill="#f4b400" />
      </>
    ),
  },
  duck: {
    fill: '#f4b400',
    svg: (
      <>
        <ellipse cx="30" cy="40" rx="20" ry="13" />
        <circle cx="46" cy="26" r="10" />
        <path d="M54 25l8 2-8 4z" fill="#e58a24" />
        <circle cx="48" cy="24" r="2" fill="#2b2b2b" />
      </>
    ),
  },
  fish: {
    fill: '#2ca9a1',
    svg: (
      <>
        <ellipse cx="28" cy="32" rx="20" ry="12" />
        <path d="M48 32l14-9v18z" />
        <circle cx="18" cy="29" r="2.5" fill="#fff" />
      </>
    ),
  },
  cat: {
    fill: '#8a8f98',
    svg: (
      <>
        <path d="M14 22l3-12 12 9z" />
        <path d="M50 22l-3-12-12 9z" />
        <circle cx="32" cy="38" r="18" />
        <circle cx="26" cy="36" r="2.5" fill="#2b2b2b" />
        <circle cx="38" cy="36" r="2.5" fill="#2b2b2b" />
        <path d="M32 40l-3 4h6z" fill="#e5679b" />
      </>
    ),
  },
  gift: {
    fill: '#cc543c',
    svg: (
      <>
        <rect x="12" y="26" width="40" height="28" rx="2" />
        <rect x="28" y="26" width="8" height="28" fill="#f4b400" />
        <rect x="12" y="36" width="40" height="8" fill="#f4b400" />
        <circle cx="27" cy="22" r="6" fill="#f4b400" />
        <circle cx="37" cy="22" r="6" fill="#f4b400" />
      </>
    ),
  },
  hat: {
    fill: '#3b3f4a',
    svg: (
      <>
        <rect x="18" y="14" width="28" height="30" rx="2" />
        <rect x="18" y="36" width="28" height="7" fill="#cc543c" />
        <ellipse cx="32" cy="46" rx="26" ry="6" />
      </>
    ),
  },
  key: {
    fill: '#f4b400',
    svg: (
      <>
        <circle cx="20" cy="32" r="13" />
        <circle cx="20" cy="32" r="5" fill="#fff" />
        <rect x="30" y="28" width="28" height="8" />
        <rect x="50" y="36" width="5" height="9" />
        <rect x="42" y="36" width="5" height="9" />
      </>
    ),
  },
  leaf: {
    fill: '#5aa02c',
    svg: (
      <>
        <path d="M32 8C16 20 12 44 32 56 52 44 48 20 32 8z" />
        <path d="M32 12v42" fill="none" stroke="#3a7a1e" strokeWidth="2.5" />
      </>
    ),
  },
  moon: {
    fill: '#f4c84b',
    svg: <path d="M42 8a24 24 0 1 0 0 48A20 20 0 0 1 42 8z" />,
  },
  pig: {
    fill: '#e58aa0',
    svg: (
      <>
        <path d="M18 20l-3-9 11 5z" />
        <path d="M46 20l3-9-11 5z" />
        <circle cx="32" cy="36" r="18" />
        <ellipse cx="32" cy="42" rx="9" ry="6" fill="#d46a86" />
        <circle cx="29" cy="42" r="1.6" fill="#7a3a4a" />
        <circle cx="35" cy="42" r="1.6" fill="#7a3a4a" />
        <circle cx="26" cy="33" r="2" fill="#2b2b2b" />
        <circle cx="38" cy="33" r="2" fill="#2b2b2b" />
      </>
    ),
  },
  ring: {
    fill: '#f4b400',
    svg: (
      <>
        <circle cx="32" cy="40" r="16" fill="none" stroke="#f4b400" strokeWidth="6" />
        <path d="M32 8l9 11-9 9-9-9z" fill="#3b7de5" />
      </>
    ),
  },
  sun: {
    fill: '#f4b400',
    svg: (
      <>
        <g stroke="#f4b400" strokeWidth="4" strokeLinecap="round">
          <path d="M32 4v10M32 50v10M4 32h10M50 32h10M12 12l7 7M45 45l7 7M52 12l-7 7M19 45l-7 7" />
        </g>
        <circle cx="32" cy="32" r="14" />
      </>
    ),
  },
  tree: {
    fill: '#5aa02c',
    svg: (
      <>
        <rect x="28" y="36" width="8" height="20" fill="#7a4a2b" />
        <circle cx="32" cy="26" r="18" />
      </>
    ),
  },
  van: {
    fill: '#3b7de5',
    svg: (
      <>
        <rect x="8" y="24" width="48" height="22" rx="5" />
        <rect x="12" y="28" width="14" height="10" rx="2" fill="#bcd6f5" />
        <circle cx="20" cy="48" r="5" fill="#2b2b2b" />
        <circle cx="44" cy="48" r="5" fill="#2b2b2b" />
      </>
    ),
  },
}

export function KidIcon({ name, size = 40 }: { name: string; size?: number }) {
  const icon = PATHS[name as IconName]
  if (!icon) return null
  return (
    <svg width={size} height={size} viewBox="0 0 64 64" fill={icon.fill} aria-hidden="true" focusable="false">
      {icon.svg}
    </svg>
  )
}
