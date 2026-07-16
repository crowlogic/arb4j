const FILTER_WORDS = ["tail", "head", "grep", "rg", "awk", "sed", "cut", "sort", "uniq", "wc"]

function isBlocked(cmd: string): boolean {
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
        if (i < s.length && s[i] === "|") return true
        continue
      }
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

export { isBlocked }

const PROTECTED = [
  // pipe to filter words — BLOCKED
  "echo foo | head",
  "echo foo | tail",
  "echo foo | grep bar",
  "echo foo | rg bar",
  "echo foo | awk '{print $1}'",
  "echo foo | sed 's/a/b/'",
  "echo foo | cut -d' ' -f1",
  "echo foo | sort",
  "echo foo | uniq",
  "echo foo | wc -l",
  "cat file | head",
  "cat file | tail -n 5",
  "git log | grep fix",
  "ls -la | sort | head",
  "echo foo | tail | head",

  // tee followed by pipe — BLOCKED
  "echo foo | tee /tmp/out.txt | head",
  "echo foo | tee /tmp/out.txt | grep bar",
  "mvn compile -pl . 2>&1 | tee shit.txt | grep 'SHIT' | head -69",
  "mvn test 2>&1 | tee /tmp/test.log | grep ERROR | head -20",
  "make 2>&1 | tee build.log | tail -5",

  // redirects — BLOCKED
  "echo foo > /tmp/out.txt",
  "echo foo >> /tmp/out.txt",
  "ls > out.txt",
  "cat file > out.txt",
  "echo foo < input.txt",

  // pipe + redirect combo — BLOCKED
  "echo foo > /tmp/out.txt | cat",
  "cat file | head > out.txt",
]

const ALLOWED = [
  // plain commands — ALLOWED
  "echo foo",
  "ls -la",
  "mvn test",
  "mvn install",
  "make",
  "cat file",
  "git status",
  "grep foo main.c",
  "head file.txt",
  "tail file.txt",

  // pipe to cat — ALLOWED
  "echo test | cat",
  "cat file | cat",

  // pipe to tee — tee must be last pipe — ALLOWED
  "echo foo | tee /tmp/out.txt",
  "make 2>&1 | tee /tmp/build.log",
  "mvn test 2>&1 | tee /tmp/test.log",

  // 2>&1 alone — ALLOWED
  "echo foo 2>&1",
  "make 2>&1",
  "mvn test 2>&1",

  // mvn with flags — ALLOWED
  "mvn test -Dtest=FooTest",
  "mvn -Ptrace test",
]

let passed = 0
let failed = 0

for (const cmd of PROTECTED) {
  if (isBlocked(cmd)) {
    passed++
  } else {
    failed++
    console.error(`FAIL (should block): ${cmd}`)
  }
}

for (const cmd of ALLOWED) {
  if (!isBlocked(cmd)) {
    passed++
  } else {
    failed++
    console.error(`FAIL (should allow): ${cmd}`)
  }
}

console.log(`${passed} passed, ${failed} failed`)
if (failed > 0) process.exit(1)
