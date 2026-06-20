import { defineConfig, devices } from "@playwright/test"

/**
 * Playwright end-to-end test config.
 *
 * Tests run against the Vite production preview server (`bun run preview`,
 * default http://localhost:4173). The webServer block auto-starts that
 * preview when you run `bunx playwright test`; it is not started until then.
 *
 * Before the first run: `bunx playwright install` to download browsers.
 */
const PREVIEW_URL = process.env.PREVIEW_URL ?? "http://localhost:4173"

export default defineConfig({
  testDir: "./e2e",
  fullyParallel: true,
  forbidOnly: !!process.env.CI,
  retries: process.env.CI ? 2 : 0,
  reporter: "html",
  use: {
    baseURL: PREVIEW_URL,
    trace: "on-first-retry",
  },
  projects: [
    {
      name: "chromium",
      use: { ...devices["Desktop Chrome"] },
    },
  ],
  webServer: {
    command: "bun run preview",
    url: PREVIEW_URL,
    reuseExistingServer: !process.env.CI,
    timeout: 120_000,
  },
})
