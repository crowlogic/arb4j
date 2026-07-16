import type { Plugin } from "@opencode-ai/plugin"

const PROTECTED_CMDS = ["mvn test", "mvn install", "make", "npm test", "yarn test"]
const FILTER_WORDS = ["tail", "head", "grep", "rg", "awk", "sed", "cut", "sort", "uniq", "wc"]

function commandAfterProtected(cmd: string): string | null {
  const trimmed = cmd.trim()
  for (const p of PROTECTED_CMDS) {
    const idx = trimmed.indexOf(p)
    if (idx === -1) continue
    return trimmed.slice(idx + p.length)
  }
  return null
}

function hasFilter(rest: string): boolean {
  const words = rest.split(/\s+/).filter(Boolean)
  for (const w of words) {
    if (FILTER_WORDS.includes(w)) return true
  }
  return false
}

function hasRedirection(rest: string): boolean {
  return /[|]/.test(rest) || /\x3e{1,2}/.test(rest) || /\x3c/.test(rest)
}

export default (async () => {
  return {
    "tool.execute.before": async (input: any, output: any) => {
      const toolName = output?.tool || input?.tool || ""
      if (toolName !== "bash") return
      const args = output?.args || input?.args || {}
      const cmd = args.command || ""
      const rest = commandAfterProtected(cmd)
      if (rest !== null && (hasFilter(rest) || hasRedirection(rest))) {
        throw new Error(
          "BLOCKED: output filtering forbidden on build/test commands.\n" +
          "Command: " + cmd + "\n" +
          "Run it unfiltered. | > >> are forbidden on mvn test, mvn install, make, npm test, yarn test."
        )
      }
    },
  }
}) satisfies Plugin
