# Zeta Spectral Reconstruction — Animation Sweep Runbook

## What this produces

A 100-frame animation showing the temporal evolution of the stationary
spectral reconstruction of
\[
  \zeta\bigl(\tfrac{1}{2} + i\theta^{-1}(\tau)\bigr)
\]
as the integration window upper limit `T_MAX` grows geometrically from
`1000` to `10000`. Each frame is a 1920×1080 PNG containing the usual
three panels (reconstruction comparison, cumulative spectral measure,
spectral distribution function). Frames are stitched into `animation.mp4`
via `ffmpeg` at 10 fps with `libx264` / `yuv420p`.

## Repository and entry point

- Repo: `crowlogic/arb4j`, branch `master`
- Main class: `arb.applications.ZetaSpectralReconstruction`
- Relevant commits:
  - `4ba951a` — residual color crimson → firebrick
  - `67b0560` — headless render and parallel T_MAX sweep

## Command-line flags added

| Flag | Meaning |
| --- | --- |
| `--T_MAX=<double>` | Override `T_MAX` (default `1000.0`) |
| `--N_T=<int>` | Override `N_T` (default `80000`); `DT` recomputed |
| `--render=<pngpath>` | Render a single frame headlessly to the given PNG and exit |
| `--sweep=N,DIR[,FPS[,tMin[,tMax]]]` | Spawn N child JVMs, one per frame, geometrically spaced `T_MAX` in `[tMin, tMax]`, stitch with ffmpeg at `FPS` into `DIR/animation.mp4` |

Sweep defaults: `FPS = 10`, `tMin = 1000`, `tMax = 10000`.

## Frame parameters

For frame `i ∈ {0, …, 99}`:

\[
  T_{\mathrm{MAX},i} = 1000 \cdot 10^{\,i/99}, \qquad
  N_{T,i} = \mathrm{round}\bigl(80000 \cdot T_{\mathrm{MAX},i}/1000\bigr).
\]

Endpoints: `T_MAX_0 = 1000` exactly, `T_MAX_99 = 10000` exactly.
Scaling `N_T` linearly with `T_MAX` keeps `DT` fixed across frames so the
time grid resolution is constant.

## Output layout

```
/tmp/sweep_out/
  frame_0000_T_1000.00.png
  frame_0001_T_1023.53.png
  ...
  frame_0099_T_10000.00.png
  animation.mp4
```

Missing-frame rule: the sweep driver skips any frame whose PNG already
exists on disk, so a crashed or interrupted run can be resumed by
re-issuing the same command.

## Prerequisites

- JDK 25 at `/usr/lib/jvm/java-25-openjdk-amd64`
- Maven
- `Xvfb` on `$PATH` (for headless JavaFX rendering; Monocle is unavailable
  due to version mismatch with JavaFX 25.0.2)
- `ffmpeg` on `$PATH`
- `libarblib.so` present in the project root

## Build

```
cd /path/to/arb4j
export LC_ALL=C.UTF-8 LANG=C.UTF-8
export JAVA_HOME=/usr/lib/jvm/java-25-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
mvn -q compile
mvn -q dependency:build-classpath -Dmdep.outputFile=/tmp/cp.txt
```

Note: this project writes class files to `build/classes/`, not
`target/classes/`.

## Smoke test (single tiny frame, ~20 seconds)

```
cd /path/to/arb4j
export DISPLAY=:99
pgrep Xvfb >/dev/null || Xvfb :99 -screen 0 1920x1080x24 &
CP="/path/to/arb4j/build/classes:$(cat /tmp/cp.txt)"
FX_MP=$(cat /tmp/cp.txt | tr ':' '\n' \
        | grep -E 'javafx-(base|graphics|controls|swing)-25' \
        | tr '\n' ':' | sed 's/:$//')

mkdir -p /tmp/sweep_smoke
java -ea --enable-preview --illegal-native-access=allow \
     --sun-misc-unsafe-memory-access=allow \
     -Djava.library.path=/path/to/arb4j --enable-native-access=ALL-UNNAMED \
     --module-path "$FX_MP" \
     --add-modules javafx.base,javafx.graphics,javafx.controls,javafx.swing \
     -cp "$CP" arb.applications.ZetaSpectralReconstruction \
     --T_MAX=50.0 --N_T=2000 --render=/tmp/sweep_smoke/frame_tiny.png
```

Expect `/tmp/sweep_smoke/frame_tiny.png` at roughly 180 KiB, 1920×1080.

## Full sweep (100 frames)

```
cd /path/to/arb4j
export DISPLAY=:99
pgrep Xvfb >/dev/null || Xvfb :99 -screen 0 1920x1080x24 &
CP="/path/to/arb4j/build/classes:$(cat /tmp/cp.txt)"
FX_MP=$(cat /tmp/cp.txt | tr ':' '\n' \
        | grep -E 'javafx-(base|graphics|controls|swing)-25' \
        | tr '\n' ':' | sed 's/:$//')

java -ea --enable-preview --illegal-native-access=allow \
     --sun-misc-unsafe-memory-access=allow \
     -Djava.library.path=/path/to/arb4j --enable-native-access=ALL-UNNAMED \
     --module-path "$FX_MP" \
     --add-modules javafx.base,javafx.graphics,javafx.controls,javafx.swing \
     -cp "$CP" arb.applications.ZetaSpectralReconstruction \
     --sweep=100,/tmp/sweep_out,10
```

## Parallelism and cost

The sweep driver launches up to `Runtime.getRuntime().availableProcessors()`
child JVMs concurrently. Each child JVM itself uses `IntStream.parallel()`
for the density pass, so on a machine with `P` cores the system oversubscribes
to `P × P` threads at peak. This is intentional — the only goal is wall-clock
minimization.

Per-frame compute scales roughly linearly with `T_MAX` at fixed `DT`, so the
final frame (`T_MAX = 10000`) is about ten times the cost of the first
(`T_MAX = 1000`). Total cost is dominated by the upper end of the range.

## Resuming

Re-invoke the exact same `--sweep=` command. The driver enumerates the
target frame paths, skips any whose PNG already exists, schedules the
remaining ones, and then runs `ffmpeg` over the complete set once all
child JVMs have terminated.

## ffmpeg invocation (executed automatically at end of sweep)

```
ffmpeg -y -framerate <FPS> -i <DIR>/frame_%04d_T_*.png \
       -c:v libx264 -pix_fmt yuv420p <DIR>/animation.mp4
```

(The exact argument list is assembled in Java via `ProcessBuilder`; no
shell script is involved.)

## Constants (as of commit `67b0560`)

```
T0            = 6.289835988
T_MAX         = 1000.0     (mutable; --T_MAX overrides)
T_DISPLAY_MAX = 100.0
N_T           = 80000      (mutable; --N_T overrides)
N_OMEGA       = 10240
OMEGA_LO      = -3.0
OMEGA_HI      = +1.0
BITS          = 128
D_OMEGA       = 4/10240
OMEGA_BAND_LO = -2.0
OMEGA_BAND_HI =  0.0
K_LO ≈ 2560,  K_HI ≈ 7680,  K_ZERO = 7680
```

## Plot color key

| Series | Color |
| --- | --- |
| True ζ | default (dark) |
| Closed-band ζ_st | cornflowerblue, dashed |
| Open-band ζ_st | darkgreen, solid |
| Pedestal-removed ζ_st | purple, solid |
| Pedestal constant | gray, dashed |
| Residual R(τ) = ζ − ζ_st | firebrick, solid |
| Empirical cumulative power | black scatter |
| Theoretical power ramp | red, dashed |
| Off-band deficit Δ(ω) | magenta scatter |
