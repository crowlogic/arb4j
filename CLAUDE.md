# arb4j — operating notes

## **NEVER READ SUREFIRE REPORTS. EVER.**

**Files under `target/surefire-reports/` and `build/surefire-reports/` are FORBIDDEN as a source of truth.** They are written at the end of a Maven test run and persist across sessions, configurations, and code edits. Reading them and reporting their contents as the current behavior of a test is a banned operation.

**The user has stated, verbatim: "I have never once operated on stale data." The agent will not either.**

The ONLY permitted sources for what a test is currently doing are:

1. The console output captured from a Maven invocation **executed in the current session**.
2. The debug log file produced by `logback-debug.xml` from a run **executed in the current session**.

If those sources do not exist for the question being asked, the test must be re-run. No exceptions, no shortcuts, no "the report file says". This applies to `*.txt`, `*.xml`, and any other artifact under any `surefire-reports/` directory in arb4j, bonanzai, or anywhere else.

## Read these first

Before making any change, read `README.md` and `DEVELOPING.md` in the
repository root. They are authoritative for project conventions; this file
is supplementary.

## Build/test conventions

- Maven only. Never Gradle.
- JDK 26: `JAVA_HOME=/home/user/jdk26 PATH=$JAVA_HOME/bin:$PATH`. The Oracle
  tarball is unpacked there; if it isn't present, fetch and extract
  `https://download.oracle.com/java/26/latest/jdk-26_linux-x64_bin.tar.gz`
  before building.
- Compiled output goes to `build/classes`, not `target/`.
- Working tree lives at `/home/user/workspace/arb4j`. Never create a
  parallel checkout under `/tmp` — there is exactly one tree, and it
  persists across sandbox restarts.
- Build flow from a fresh checkout (does both native and Java):
  ```
  cd /home/user/workspace/arb4j
  JAVA_HOME=/home/user/jdk26 PATH=$JAVA_HOME/bin:$PATH make            # SWIG + clang -> libarblib.so
  JAVA_HOME=/home/user/jdk26 PATH=$JAVA_HOME/bin:$PATH mvn install     # full test suite + install jar
  ```
  Surefire passes `-Djava.library.path=${project.basedir}` so
  `libarblib.so` must sit at the repo root (the Makefile builds it there).
- Native sources: `native/*.i` (SWIG) -> `src/main/java/arb/*.java` (generated).
  **Never edit `src/main/java/arb/<RootClass>.java` files that have the
  SWIG header banner.** Edit the corresponding `.i` file in `native/` and
  re-run `make`. The Makefile regenerates `arb_wrap.c` and the Java
  bindings under `src/main/java/arb/`. SWIG version 4.3.0 (Debian) writes
  a different banner than 4.4.0; the version-banner diff is cosmetic.
- Run the full regression suite (`mvn install`) — never compile in a loop.

## Thin jar + class.path

The Debian package ships the thin jar plus one discrete jar per
transitive runtime dependency. There is no shade plugin; there is no
relocation. Every dependency lives at canonical coordinates under
`/usr/share/arb4j/lib/`, and `/usr/share/arb4j/class.path` is a single
colon-separated line listing each one as
`/usr/share/arb4j/lib/<basename>.jar`.

Two `maven-dependency-plugin` executions in `pom.xml` produce the
staged outputs at `prepare-package` time, so a plain `mvn install`
(which is what `debian/rules override_dh_auto_build` runs via
`make install`) leaves them in the build tree:

- `build-classpath-debian` writes `build/class.path.debian` with
  `<prefix>/usr/share/arb4j/lib</prefix>` rewriting every entry.
- `copy-dependencies-debian` copies every runtime-scope jar into
  `build/dependency/`.

`debian/rules override_dh_auto_install` then:

- installs `build/arb4j-<version>.jar` to `/usr/share/java/arb4j-<version>.jar`
  (with `arb4j.jar` symlink)
- installs every `build/dependency/*.jar` to `/usr/share/arb4j/lib/`
- installs `build/class.path.debian` to `/usr/share/arb4j/class.path`
- iterates over `javafx-*-linux.jar` and `j2v8_linux_*.jar` under
  `/usr/share/arb4j/lib/` and `unzip -j -o '*.so'` each one into
  `/usr/lib/jni/`. `unzip` exits status 11 when a jar contains no
  `.so` entries; the rule tolerates that by `|| true`.

`/usr/share/arb4j/env.sh` exports
`ARB4J_CLASSPATH=$ARB4J_JAR:$(tr '\n' ':' < $ARB4J_HOME/class.path | sed 's/:$//')`.

## Launching JavaFX without a JPMS module

JavaFX rides on the classpath, not as a resolved JPMS module. That
triggers `com.sun.javafx.application.LauncherImpl`'s
`Error: JavaFX runtime components are missing, and are required to run this application`
guard whenever the JVM's configured main class extends
`javafx.application.Application`. The fix is `arb.applications.Launcher`
— a class that does **not** extend `Application` and calls
`Application.launch(Class.forName(argv[0]).asSubclass(Application.class), tail)`.
Every `/usr/bin/<wrapper>` ends with
`-classpath $CLASSPATH arb.applications.Launcher $@`, so the per-app
script passes its FQCN through `$@`.

`debian/install-bin.sh` performs the rewrite at `dh_auto_install` time:

- strips `--module-path $CLASSPATH`, `--add-modules arb4j`,
  `--add-modules javafx.controls`
- strips every `--add-opens javafx.<module>/<pkg>=<target>` flag and the
  `$OPENS` shell variable (no JPMS module ⇒ nothing to open)
- substitutes `arb.applications.Launcher $@` for the bare `$@` tail

## FHS Debian layout

| path | contents |
|---|---|
| `/usr/share/java/arb4j-<version>.jar` + `arb4j.jar` symlink | thin jar (project classes only) |
| `/usr/share/arb4j/lib/*.jar` | every transitive runtime dependency, one jar each |
| `/usr/share/arb4j/class.path` | colon-separated `/usr/share/arb4j/lib/<basename>.jar` for every dependency |
| `/usr/lib/jni/libarblib.so` + javafx natives + libj2v8 | unzipped from `lib/javafx-*-linux.jar` and `lib/j2v8_linux_*.jar` |
| `/usr/share/arb4j/env.sh` | exports `ARB4J_HOME`, `ARB4J_JAR`, `ARB4J_NATIVE_DIR`, `ARB4J_LIB_DIR`, and `ARB4J_CLASSPATH=$ARB4J_JAR:<class.path-contents>` |
| `/usr/share/arb4j/{pom.xml,version,shell.start}` | runtime metadata + jshell preamble |
| `/usr/bin/<wrapper>` | every `bin/*` (except `updateClasspath`) rewritten by `debian/install-bin.sh` |

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

The compiler is a symbolic engine. Numerical evaluation of an operator
is never offered automatically and never expected by default. No
quadrature, no finite differences, no fallback of any kind, ever. The
word "fallback" is not a concept that may be invoked under any
circumstances.

If an operator's symbolic rewrite chain cannot reduce a given operand,
the node throws `CompilerException` at construction time, naming the
unhandled subtree. It does not silently degrade to a numerical
evaluator.

A caller who genuinely wants a numerical integral, derivative, or
solver must construct it explicitly themselves — e.g. by writing their
own integrator, calling `Real.integrate(...)` directly with a
hand-built integrand, or wiring an arb quadrature primitive into a
custom `Function`. They must opt in by name. The expression compiler
never offers it, never suggests it, never serves it.

This applies to every fractional, integral, differential, and
special-function operator past, present, and future. The existing
`CaputoFractionalDerivativeNode` integral-form path is grandfathered
in as an internal closed-form-rewrite scaffold (the integrand is built
symbolically and registered as a Context function); no new operator
may introduce a quadrature path on the rationale that "Caputo does it".
