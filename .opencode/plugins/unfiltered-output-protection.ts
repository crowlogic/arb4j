const FILTER_WORDS = ["tail", "head", "grep", "rg", "awk", "sed", "cut", "sort", "uniq", "wc"]

function isBlocked(cmd: string): boolean {
  const s = cmd.trim()
  let i = 0
  while (i < s.length) {
    const c = s[i]
    if (c === '"') { i++; while (i < s.length && s[i] !== '"') i++; i++; continue }
    if (c === "'") { i++; while (i < s.length && s[i] !== "'") i++; i++; continue }
    if (c === "\\" && i + 1 < s.length) { i += 2; continue }
    if (c === "2" && s[i + 1] === ">" && s[i + 2] === "&" && s[i + 3] === "1") { i += 4; continue }
    if (c === "|") {
      i++
      while (i < s.length && s[i] === " ") i++
      let w = ""
      while (i < s.length && s[i] !== " " && s[i] !== "|") { w += s[i]; i++ }
      if (FILTER_WORDS.includes(w)) return true
      continue
    }
    if (c === ">") {
      if (i > 0 && s[i - 1] === "2") { i++; continue }
      return true
    }
    if (c === "<") return true
    i++
  }
  return false
}

export default {
  id: "unfiltered-output-protection",
  async server(_input: any, _options: any) {
    return {
      "tool.execute.before": async (input: any, output: any) => {
        if (input.tool !== "bash") return
        const cmd = output.args.command || ""
        if (isBlocked(cmd)) {
          throw new Error(
            "BLOCKED: output filtering forbidden.\n" +
            "Command: " + cmd + "\n" +
            "Run commands unfiltered. Pipes to text filters and file redirects are forbidden.\n" +
            "Allowed: | tee, | cat, 2>&1 | tee"
          )
        }
      },
    }
  },
}
