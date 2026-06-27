#!/usr/bin/env bash
#
# arb4j driver — compile and run a Java program against the built arb4j
# library (native libarblib.so + classes + dependency classpath).
#
#   run.sh                       # runs the bundled Smoke.java
#   run.sh path/to/Probe.java    # compiles + runs your own probe
#
# The program's public class name must match its filename (Probe.java →
# class Probe). Exit code is the program's exit code. This is the
# import-and-call path most arb4j work (expression compiler, math) needs.
set -euo pipefail

# UTF-8 is mandatory: arb has Unicode-named classes (Riemannξ, σField, …) and
# javac fails to read them under a non-UTF-8 locale ("Malformed input … input
# contains unmappable characters"). Force it regardless of the caller's env.
export LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$SKILL_DIR/../../.." && pwd)"   # .claude/skills/run-arb4j -> repo root
cd "$ROOT"

SRC="${1:-$SKILL_DIR/Smoke.java}"
[ -f "$SRC" ] || { echo "driver: no such file: $SRC" >&2; exit 2; }

# The native libarblib.so is prebuilt & committed (statically-linked
# FLINT/MPFR/GMP), so it normally just exists — only run `make` (which rebuilds
# FLINT etc.) if it is genuinely absent. The Java artifacts are cheap to (re)make.
if [ ! -f libarblib.so ]; then
  echo "driver: libarblib.so missing, rebuilding native lib (make)…" >&2
  make >&2
fi
if [ ! -f class.path ] || [ ! -d build/classes ]; then
  echo "driver: Java artifacts missing, building (mvn install -Dmaven.test.skip=true)…" >&2
  mvn -q install -Dmaven.test.skip=true >&2
fi

CP="build/classes:$(cat class.path)"
OUT="$(mktemp -d)"
trap 'rm -rf "$OUT"' EXIT
MAIN="$(basename "$SRC" .java)"

javac -cp "$CP" -d "$OUT" "$SRC"
exec java --enable-native-access=ALL-UNNAMED \
          -Djava.library.path=. \
          -cp "$OUT:$CP" \
          "$MAIN"
