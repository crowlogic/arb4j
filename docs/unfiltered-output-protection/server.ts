const FILTER_WORDS = ["tail", "head", "grep", "rg", "awk", "sed", "cut", "sort", "uniq", "wc"]

function extractTokens(cmd: string): string[] {
  const s = cmd.trim()
  const tokens: string[] = []
  let i = 0
  while (i < s.length) {
    const c = s[i]
    if (c === '"') { let t = ""; i++; while (i < s.length && s[i] !== '"') { t += s[i]; i++ }; i++; tokens.push(t); continue }
    if (c === "'") { let t = ""; i++; while (i < s.length && s[i] !== "'") { t += s[i]; i++ }; i++; tokens.push(t); continue }
    if (c === " ") { i++; continue }
    let t = ""
    while (i < s.length && s[i] !== " ") { t += s[i]; i++ }
    tokens.push(t)
  }
  return tokens
}

function isBlocked(cmd: string): string | null {
  const tokens = extractTokens(cmd)

  if (isMvnCommand(tokens) && hasMvnQuietFlag(tokens)) {
    return "BLOCKED: -q/--quiet forbidden on mvn commands.\n" +
           "Build headers (project scan, phase progression) must be visible so the agent can confirm the command ran."
  }

  const s = cmd.trim()
  let i = 0
  while (i < s.length) {
    const c = s[i]
    if (c === '"') { i++; while (i < s.length && s[i] !== '"') i++; i++; continue }
    if (c === "'") { i++; while (i < s.length && s[i] !== "'") i++; i++; continue }
    if (c === "\\" && i + 1 < s.length) { i += 2; continue }

    if (c === "|") {
      i++
      while (i < s.length && s[i] === " ") i++
      let w = ""
      while (i < s.length && s[i] !== " " && s[i] !== "|") { w += s[i]; i++ }
      if (w === "tee") {
        while (i < s.length && s[i] !== "|") i++
        if (i < s.length && s[i] === "|") {
          return `BLOCKED: nothing may be piped after tee.\ntee writes to file AND passes stdout through unfiltered. Any pipe after tee filters stdout.`
        }
        continue
      }
      if (FILTER_WORDS.includes(w)) {
        return `BLOCKED: output filtering forbidden.\nPipe to '${w}' detected.`
      }
      continue
    }
    if (c === ">") {
      if (i > 0 && s[i - 1] === "2") { i++; continue }
      return "BLOCKED: file redirect forbidden."
    }
    if (c === "<") return "BLOCKED: input redirect forbidden."
    i++
  }
  return null
}

function isMvnCommand(tokens: string[]): boolean {
  for (const t of tokens) {
    if (t === "mvn" || t.endsWith("/mvn")) return true
  }
  return false
}

function hasMvnQuietFlag(tokens: string[]): boolean {
  for (const t of tokens) {
    if (t === "-q" || t === "--quiet") return true
  }
  return false
}

export const UnfilteredOutputProtection = async (ctx: any) => {
  return {
    "tool.execute.before": async (input: any, output: any) => {
      if (input.tool !== "bash") return
      const cmd = output.args.command || ""
      const reason = isBlocked(cmd)
      if (reason) {
        throw new Error(
          reason + "\n\n" +
          "Command: " + cmd + "\n" +
          "Allowed: | tee (must be last pipe)"
        )
      }
    },
  }
}
