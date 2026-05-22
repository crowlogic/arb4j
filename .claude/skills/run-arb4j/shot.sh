#!/usr/bin/env bash
#
# arb4j GUI screenshot harness — launch a JavaFX application class on a
# headless Xvfb display, let it render, screenshot the screen, then kill it.
#
#   shot.sh                              # arb.applications.Expressor → /tmp/arb4j-shots/<class>.png
#   shot.sh arb.applications.SymbolPalette
#   shot.sh <fqcn> <outfile.png> <seconds-to-wait>
#
# Requires: xvfb-run, Xvfb, ImageMagick `import` (apt-get install xvfb x11-apps imagemagick).
# JavaFX 26 here ships no Monocle headless platform, so a real (virtual) X
# display is mandatory — there is no display-less path.
set -euo pipefail

# UTF-8 is mandatory (Unicode-named arb classes); force it for the JVM launch.
export LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$SKILL_DIR/../../.." && pwd)"
cd "$ROOT"

FQCN="${1:-arb.applications.Expressor}"
OUT="${2:-/tmp/arb4j-shots/$(basename "$FQCN").png}"
WAIT="${3:-22}"
mkdir -p "$(dirname "$OUT")"
LOG="$(dirname "$OUT")/$(basename "$FQCN").log"

CP="$(cat class.path):build/classes"

xvfb-run -a -s "-screen 0 1280x900x24" bash -c '
  java --enable-native-access=ALL-UNNAMED -Djava.library.path=. \
    -Dprism.order=sw \
    --module-path "'"$CP"'" --add-modules arb4j,javafx.controls \
    --add-opens javafx.controls/javafx.scene.control.skin=arb4j \
    --add-opens javafx.controls/javafx.scene.control.cell=arb4j \
    --add-opens javafx.graphics/com.sun.javafx.tk.quantum=arb4j \
    --add-opens javafx.graphics/javafx.stage=arb4j \
    -cp "'"$CP"'" "'"$FQCN"'" >"'"$LOG"'" 2>&1 &
  APP=$!
  sleep "'"$WAIT"'"
  import -window root "'"$OUT"'"
  kill $APP 2>/dev/null; wait $APP 2>/dev/null
  exit 0    # do not let the SIGTERM exit code (143) abort the caller
'
if [ -s "$OUT" ]; then
  echo "screenshot: $OUT"
  ls -la "$OUT"
else
  echo "FAILED: no screenshot written; app log:" >&2
  grep -vE "loadLibrary|Restricted|enable-native|^WARNING" "$LOG" | tail -20 >&2
  exit 1
fi
