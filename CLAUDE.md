# arb4j — operating notes

## Read these first

Before making any change, read `README.md` and `DEVELOPING.md` in the
repository root. They are authoritative for project conventions; this file
is supplementary.

## Build/test conventions

- Maven only. Never Gradle.
- JDK 26: `JAVA_HOME=/tmp/jdk-26+35 PATH=$JAVA_HOME/bin:$PATH`.
- Compiled output goes to `build/classes`, not `target/`.
- Read `DEVELOPING.md` before touching the build.
- `.swig` files must be updated whenever `Real` or `Complex` change.
- Run the full regression suite (`mvn test`) — never compile in a loop.

## Shaded fat jar

`maven-shade-plugin` rolls every transitive dependency into
`build/arb4j-<version>.jar` (≈32 MB). Third-party libs are relocated under
`org.arblib.shaded.*`. JavaFX classes stay at canonical `javafx.*` paths
because user code references them directly.

JavaFX linux-classifier native libraries (`libglass.so`, `libprism_*.so`,
`libjavafx_*.so`, `libdecora_sse.so`, `libglassgtk3.so`) sit at the jar
root, alongside `libj2v8_linux_x86_64.so`. The Debian rules unzip every
`.so` from the shaded jar into `/usr/lib/jni` so the JVM resolves them via
`-Djava.library.path=$ARB4J_NATIVE_DIR`.

## Launching JavaFX from a fat jar

`com.sun.javafx.application.LauncherImpl` aborts with
`Error: JavaFX runtime components are missing, and are required to run this application`
whenever the configured main class extends `javafx.application.Application`
*and* `javafx.graphics` is not a resolved JPMS module. Because the fat jar
puts JavaFX on the classpath (unnamed module), that guard fires every
time.

The fix is `arb.applications.Launcher` — a class that does **not** extend
`Application` and calls `Application.launch(Class.forName(argv[0]).asSubclass(Application.class), tail)`.
Every `/usr/bin/<wrapper>` ends with
`-classpath $CLASSPATH arb.applications.Launcher $@`, so the per-app
script just passes its FQCN through `$@`.

`debian/install-bin.sh` performs the rewrite at `dh_auto_install` time:

- strips `--module-path $CLASSPATH`, `--add-modules arb4j`,
  `--add-modules javafx.controls`
- strips every `--add-opens javafx.<module>/<pkg>=<target>` flag and the
  `$OPENS` shell variable (no JPMS module ⇒ nothing to open)
- substitutes `arb.applications.Launcher $@` for the bare `$@` tail

## FHS Debian layout (`dad73f4` and later)

| path | contents |
|---|---|
| `/usr/share/java/arb4j.jar` | shaded fat jar (versioned + symlink) |
| `/usr/lib/jni/libarblib.so` + javafx natives + libj2v8 | unzipped from fat jar |
| `/usr/share/arb4j/env.sh` | exports `ARB4J_HOME`, `ARB4J_JAR`, `ARB4J_NATIVE_DIR`, `ARB4J_CLASSPATH=$ARB4J_JAR` |
| `/usr/share/arb4j/{pom.xml,version,shell.start}` | runtime metadata + jshell preamble |
| `/usr/bin/<wrapper>` | every `bin/*` (except `updateClasspath`) rewritten by `debian/install-bin.sh` |

There is no `/usr/share/arb4j/lib/` and no `/usr/share/arb4j/class.path`
— the fat jar is the entire classpath.

Build: `JAVA_HOME=/tmp/jdk-26+35 PATH=$JAVA_HOME/bin:$PATH dpkg-buildpackage -b -us -uc -nc -d`.
The `-d` flag skips the missing `openjdk-26-jdk` build dep (the JDK is
unpacked under `/tmp` instead).

## Headless JavaFX

JavaFX 26 on Linux uses GTK via the openjfx `glassgtk3` native. There is
**no Monocle path** in the openjfx Maven artifacts. Headless runs require
a real X protocol stream — `xvfb-run` is the standard solution.

Two helpers under `bin/`:

- `bin/xvfbrun <wrapper> [args...]` — wraps any arb4j launcher with an
  ephemeral Xvfb server (`--auto-servernum --server-args "-screen 0
  ${XVFB_SCREEN:-1920x1200x24}"`). Use this when you want to run an
  interactive UI without a display, e.g. for smoke-testing a build.
- `bin/snapshot <Application-FQCN> <out.png> [settleSeconds]` — boots any
  `javafx.application.Application` subclass shipped inside `arb4j.jar`,
  waits for the first showing stage, settles for the requested duration,
  takes a `Scene.snapshot(...)` PNG, and exits. Backed by
  `arb.applications.ScreenshotDriver`.

`ScreenshotDriver` does not subclass the target — it launches the
Application class via reflection on a daemon thread, then polls
`Window.getWindows()` from the JavaFX thread until the primary stage is
showing. This works for every `arb.applications.*` app: `Expressor`,
`SymbolPalette`, `ReferenceBrowser`, `RandomWaveSampler`,
`BandLimitedWhiteNoiseSampler`, `LemniscateLab`, `TODO`,
`InverseShiftedPhasePullbackSampler`, `StationaryGaussianProcessSampler`
subclasses, and anything else.

Examples:

```sh
bin/snapshot arb.applications.Expressor          /tmp/expressor.png       3
bin/snapshot arb.applications.SymbolPalette      /tmp/palette.png         2
bin/snapshot arb.applications.RandomWaveSampler  /tmp/rws.png             4
XVFB_SCREEN=2560x1440x24 bin/snapshot \
            arb.applications.ReferenceBrowser    /tmp/refbrowser.png      3
```

The pre-existing `arb.applications.SamplerScreenshotDriver` (in
`src/test/java`) is the older RandomWaveSampler-specific equivalent and is
kept for the existing test that uses it.

## Git workflow

Standard `git add` / `git commit` / `git push` only. No stash, no
branches, no resets. Push origin master with
`api_credentials=["github"]`.

## Numerics policy

No numerics. No numerical evaluation. No quadrature fallback. No finite
differences. No numerical fallback of any kind, ever. Every operator
must resolve symbolically through closed-form rewrite rules; if the
rewrite chain cannot reduce an operand, fail loudly at compile time —
do not fall back to a numerical evaluator. The word "fallback" is not
a concept that may be invoked under any circumstances.

This applies to every fractional, integral, differential, and special-
function operator past, present, and future. The existing
`CaputoFractionalDerivativeNode` integral-form path is grandfathered
in as an internal closed-form-rewrite scaffold (the integrand is built
symbolically and registered as a Context function); no new operator
may introduce a quadrature path on the rationale that "Caputo does it".
