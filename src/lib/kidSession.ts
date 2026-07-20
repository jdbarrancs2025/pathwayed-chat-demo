import { useSyncExternalStore } from 'react'

/**
 * Tracks whether a *child* is currently signed in on this device.
 *
 * The parent account stays the only real authenticated session — children are
 * profiles under it. This flag is a client-side marker (per browser tab, via
 * sessionStorage so a refresh inside a kid's space keeps them in it) that lets
 * the shared header gate the parent-facing exits (Parent dashboard / Settings /
 * Sign out) behind a parent PIN. It is set when a child is entered from the
 * "Who's learning today?" picker and cleared only when the parent verifies (or
 * when there is no parent PIN and they pass straight through).
 *
 * It is NOT a security boundary — the parent's token authorizes every real read.
 * It just keeps a child from wandering out of their space on a shared device.
 */
const KEY = 'pwe_kid_session'

const listeners = new Set<() => void>()

function emit() {
  for (const l of listeners) l()
}

function read(): boolean {
  try {
    return sessionStorage.getItem(KEY) === '1'
  } catch {
    return false
  }
}

/** Mark that a child has signed in (called from the picker on entry). */
export function enterKidSession() {
  try {
    sessionStorage.setItem(KEY, '1')
  } catch {
    /* private mode / storage disabled — gating simply won't persist */
  }
  emit()
}

/** Clear the kid session (parent verified, or open-access pass-through, or sign out). */
export function exitKidSession() {
  try {
    sessionStorage.removeItem(KEY)
  } catch {
    /* ignore */
  }
  emit()
}

export function isKidSessionActive(): boolean {
  return read()
}

function subscribe(cb: () => void) {
  listeners.add(cb)
  // Also react to changes coming from another tab.
  window.addEventListener('storage', cb)
  return () => {
    listeners.delete(cb)
    window.removeEventListener('storage', cb)
  }
}

/** Reactive hook: true while a child is signed in on this device. */
export function useKidSession(): boolean {
  return useSyncExternalStore(subscribe, read, () => false)
}
