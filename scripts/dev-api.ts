/**
 * Dev-only local API server (run with Bun). `vercel dev` does NOT serve this
 * repo's functions: it detects the Vite framework preset, runs `vite --port
 * $PORT`, and the vercel.json SPA catch-all rewrite makes its router throw
 * "Can't detect way to handle request" — so /api is never served as functions.
 *
 * This server mounts the SAME api/*.ts handlers (the real production code) on
 * :3000 so the Vite dev frontend (5173) can proxy /api here. It is never
 * deployed and never imported by the app — production still uses Vercel's own
 * serverless functions. Run: bun run scripts/dev-api.ts  (or: bun run dev:api)
 *
 * Note: only routes whose env keys exist locally will fully work. The mastery
 * test needs /api/chat, which needs ANTHROPIC_API_KEY (in .env). Voice/TTS
 * (transcribe/tts) need OPENAI/ELEVENLABS keys that aren't in the local .env.
 */
import { createServer, type IncomingMessage, type ServerResponse } from 'node:http'

const PORT = Number(process.env.DEV_API_PORT) || 3000
const ROUTE_RE = /^\/api\/([a-z0-9-]+)\/?$/i

type Handler = (req: unknown, res: unknown) => unknown | Promise<unknown>
const handlerCache = new Map<string, Handler>()

async function loadHandler(name: string): Promise<Handler | null> {
  const cached = handlerCache.get(name)
  if (cached) return cached
  try {
    const mod = await import(`../api/${name}.ts`)
    const handler = mod.default
    if (typeof handler !== 'function') return null
    handlerCache.set(name, handler)
    return handler
  } catch (err) {
    console.error(`[dev-api] failed to load api/${name}.ts:`, err)
    return null
  }
}

function readBody(req: IncomingMessage): Promise<Buffer> {
  return new Promise((resolve, reject) => {
    const chunks: Buffer[] = []
    req.on('data', (c) => chunks.push(c as Buffer))
    req.on('end', () => resolve(Buffer.concat(chunks)))
    req.on('error', reject)
  })
}

// Decorate Node's req/res to look enough like Vercel's req/res for our handlers
// (req.query, req.body; res.status().json()/send()). setHeader/write/end and
// headersSent already exist on Node's ServerResponse, so SSE streaming works.
function decorate(req: IncomingMessage, res: ServerResponse, url: URL, body: Buffer) {
  const r = req as IncomingMessage & { query: Record<string, string>; body: unknown }
  r.query = Object.fromEntries(url.searchParams)
  const ct = req.headers['content-type'] || ''
  if (ct.includes('application/json') && body.length) {
    try {
      r.body = JSON.parse(body.toString('utf8'))
    } catch {
      r.body = undefined
    }
  } else {
    r.body = body.length ? body : undefined
  }

  const w = res as ServerResponse & {
    status: (code: number) => ServerResponse
    json: (obj: unknown) => ServerResponse
    send: (data: unknown) => ServerResponse
  }
  w.status = (code: number) => {
    res.statusCode = code
    return res
  }
  w.json = (obj: unknown) => {
    if (!res.headersSent) res.setHeader('Content-Type', 'application/json')
    res.end(JSON.stringify(obj))
    return res
  }
  w.send = (data: unknown) => {
    res.end(typeof data === 'string' || Buffer.isBuffer(data) ? data : JSON.stringify(data))
    return res
  }
}

const server = createServer(async (req, res) => {
  const url = new URL(req.url || '/', `http://localhost:${PORT}`)
  const match = url.pathname.match(ROUTE_RE)
  if (!match) {
    res.statusCode = 404
    res.end('dev-api: not an /api/<name> route')
    return
  }
  const handler = await loadHandler(match[1])
  if (!handler) {
    res.statusCode = 404
    res.end(`dev-api: no handler for /api/${match[1]}`)
    return
  }
  try {
    const body = await readBody(req)
    decorate(req, res, url, body)
    await handler(req, res)
    if (!res.writableEnded) res.end() // guard against a handler that never responds
  } catch (err) {
    console.error(`[dev-api] /api/${match[1]} threw:`, err)
    if (!res.headersSent) {
      res.statusCode = 500
      res.setHeader('Content-Type', 'application/json')
    }
    if (!res.writableEnded) res.end(JSON.stringify({ error: 'dev-api internal error' }))
  }
})

// Only listen when run directly, so this file can be imported in a probe/test
// without binding a port.
if (import.meta.main) {
  server.listen(PORT, () => {
    console.log(`[dev-api] serving api/*.ts on http://localhost:${PORT} (Vite proxy target)`)
  })
}
