/**
 * Direct seed runner — apply a .sql file to the database without pasting into
 * the Supabase SQL editor.
 *
 *   bun run db:seed <path-to-sql-file>
 *
 * Connection: reads the DATABASE_URL environment variable (bun auto-loads .env).
 * The value is NEVER printed, echoed, or logged — only read from process.env.
 * Set it to your Supabase "URI" connection string, e.g.
 *   DATABASE_URL=postgresql://USER:PASSWORD@HOST:5432/postgres
 *
 * Execution uses node-postgres' simple query protocol (a plain string query),
 * so a file may contain multiple statements, DO $$ ... $$ blocks, and explicit
 * BEGIN/COMMIT — exactly like our seed files. Idempotent seeds are safe to
 * re-run. NOTICE messages (e.g. a seed's report block) and any returned rows
 * (e.g. SELECT counts) are printed so you can confirm what happened.
 */
import { readFileSync } from 'node:fs'
import { Client } from 'pg'

const url = process.env.DATABASE_URL
if (!url) {
  console.error(
    'ERROR: DATABASE_URL is not set. Add it to your local .env as the Supabase URI\n' +
      '  connection string, e.g. DATABASE_URL=postgresql://USER:PASSWORD@HOST:5432/postgres',
  )
  process.exit(1)
}

const file = process.argv[2]
if (!file) {
  console.error('Usage: bun run db:seed <path-to-sql-file>')
  process.exit(1)
}

let sqlText: string
try {
  sqlText = readFileSync(file, 'utf8')
} catch (err) {
  console.error(`ERROR: cannot read SQL file "${file}": ${(err as Error).message}`)
  process.exit(1)
}

// Supabase requires SSL. rejectUnauthorized:false avoids CA-bundle friction for
// this local dev tool; the connection is still encrypted.
const client = new Client({ connectionString: url, ssl: { rejectUnauthorized: false } })

// Surface RAISE NOTICE output (our report blocks emit counts here).
client.on('notice', (n) => console.log(`NOTICE: ${n.message ?? n}`))

try {
  await client.connect()
  console.log(`Connected. Running "${file}" (${sqlText.length} bytes)…`)
  const result = await client.query(sqlText)
  const results = Array.isArray(result) ? result : [result]
  for (const r of results) {
    if (r && Array.isArray(r.rows) && r.rows.length) {
      console.log(`— ${r.command ?? 'result'} (${r.rows.length} row${r.rows.length === 1 ? '' : 's'}):`)
      console.table(r.rows)
    }
  }
  console.log(`✅ Success: "${file}" executed with no errors.`)
} catch (err) {
  console.error(`❌ Failed running "${file}":`)
  console.error((err as Error).message)
  process.exitCode = 1
} finally {
  await client.end()
}
