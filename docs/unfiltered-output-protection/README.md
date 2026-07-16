# unfiltered-output-protection

OpenCode plugin that blocks output filtering in bash commands. Prevents `| head`, `| tail`, `| grep`, `>`, `>>`, `<` redirects. Allows `| tee`, `| cat`, `2>&1`.

## Install

```bash
bash docs/unfiltered-output-protection/install.sh
```

Then restart opencode and activate the plugin in the TUI plugin list (command palette → Plugins).

## What it blocks

- `| head`, `| tail`, `| grep`, `| rg`, `| awk`, `| sed`, `| cut`, `| sort`, `| uniq`, `| wc`
- `> file`, `>> file`, `< file`
- `2>&1 > file` (redirect after stderr merge)

## What it allows

- `| tee`, `| cat`
- `2>&1` alone
- `2>&1 | tee`
