import { configDefaults, defineConfig } from 'vitest/config'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'
import path from 'path'

// https://vite.dev/config/
export default defineConfig({
  plugins: [react(), tailwindcss()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
    },
  },
  // Dev only: the vercel.json SPA rewrite (/(.*) -> /index.html) breaks
  // Vite's in-memory module requests under `vercel dev`, so we run the frontend
  // on Vite (5173) and proxy /api to a separate `vercel dev` (3000) which serves
  // the serverless functions. Does not affect the production build.
  server: {
    proxy: {
      '/api': 'http://localhost:3000',
    },
  },
  // Vitest runs unit tests only; Playwright owns e2e/ (its test() API is
  // incompatible with Vitest's collector).
  test: {
    exclude: [...configDefaults.exclude, 'e2e/**'],
  },
})
