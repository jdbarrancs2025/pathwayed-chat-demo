import { describe, it, expect } from 'vitest'
import { readdirSync, readFileSync, statSync } from 'node:fs'
import { join } from 'node:path'

/**
 * GUARD: no em-dashes or en-dashes in copy that reaches a user.
 *
 * They render inconsistently across the devices families actually use, they are
 * awkward to read aloud (Nikki speaks this copy through TTS), and mixing them with
 * hyphens looks careless on a screen shown to a school.
 *
 * Scope: every non-test source file under src/. Code COMMENTS are exempt, since
 * nobody reads those but us. This mirrors the check on misconception explanations
 * in misconceptions.test.ts, which covers the copy that is generated rather than
 * written inline.
 */

const SRC = join(process.cwd(), 'src')
const DASHES = /[–—]/

function sourceFiles(dir: string, out: string[] = []): string[] {
  for (const entry of readdirSync(dir)) {
    const full = join(dir, entry)
    if (statSync(full).isDirectory()) {
      sourceFiles(full, out)
    } else if (/\.tsx?$/.test(entry) && !/\.test\.tsx?$/.test(entry)) {
      out.push(full)
    }
  }
  return out
}

/** A line that is purely a code comment. Not user-facing, so not our business. */
function isComment(line: string): boolean {
  const t = line.trimStart()
  return t.startsWith('//') || t.startsWith('*') || t.startsWith('/*')
}

describe('no dash characters in user-facing copy', () => {
  const offenders: string[] = []
  for (const file of sourceFiles(SRC)) {
    const lines = readFileSync(file, 'utf8').split(/\r?\n/)
    lines.forEach((line, i) => {
      if (isComment(line) || !DASHES.test(line)) return
      offenders.push(`${file.replace(process.cwd(), '.')}:${i + 1}  ${line.trim()}`)
    })
  }

  it('has none anywhere under src/, outside comments', () => {
    expect(offenders, `Replace with a comma, a period, or a plain hyphen:\n${offenders.join('\n')}`).toEqual([])
  })
})
