---
name: run-arb4j
description: Build, run, smoke-test, and screenshot arb4j — the Java/JNI arbitrary-precision (arb/FLINT) math library and its Unicode expression-to-JVM-bytecode compiler. Use when asked to run/launch/build/test arb4j, evaluate an expression or an arb computation, drive the arbshell JShell REPL, or screenshot a JavaFX app (Expressor, SymbolPalette).
---

# Running arb4j

arb4j is a **library**, not an app: a Java API over the C library
[arb](http://arblib.org)/FLINT (arbitrary-precision real/complex ball
arithmetic) via a SWIG-generated JNI bridge, plus an expression compiler that
turns Unicode math notation (`x➔x²+1`, `Σ`, `∫`, `tanh`) directly into JVM
bytecode with ASM. There are also a few auxiliary JavaFX apps.

The way you drive it is to **compile and run a small Java program against the
built library** — that's the import-and-call path almost all work
(expression compiler, math functions) touches. The driver
`.claude/skills/run-arb4j/run.sh` does exactly that. There is also the
`arbshell` JShell REPL for interactive poking, and `shot.sh` to screenshot
the JavaFX apps.

All paths below are relative to the repo root (the directory with `pom.xml`
and `Makefile`). The driver scripts live in `.claude/skills/run-arb4j/`.

## Prerequisites

This container already had the toolchain (verified `swig` 4.4.0, `clang`
21.1.8, `mvn` 3.9.12, `java` 26.0.1). **No FLINT/MPFR/GMP install is needed**:
`libarblib.so` is a prebuilt, committed, statically-linked binary (FLINT/MPFR/GMP
linked statically into it), so there is no runtime dependency on system math
libraries. On a fresh Ubuntu box the equivalent is just the JDK, Maven, and (only
if you intend to rebuild the native lib after a SWIG `.i` change) the C
toolchain:

```bash
# build + run the Java side: Java 26 + Maven is enough — the committed .so is used as-is
sudo apt-get install -y openjdk-26-jdk maven
# ONLY if you edit a SWIG interface file (native/*.i) and must relink the .so;
# the first such build fetches+builds GMP/MPFR/FLINT 3.3.1 statically itself:
sudo apt-get install -y clang swig libxdo-dev
# only for the JavaFX GUI screenshot path (shot.sh):
sudo apt-get install -y xvfb x11-apps imagemagick
```

**UTF-8 locale is mandatory** — several classes have Unicode names
(`σField`, `Riemannξ`), and `javac`/`java` fail to read them under a
non-UTF-8 locale (`Malformed input … unmappable characters`). The driver
scripts (`run.sh`, `shot.sh`) `export LANG=LC_ALL=en_US.UTF-8` themselves;
if you run `make`/`mvn`/`bin/arbshell` directly, set it first:

```bash
export LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
```

## Build

`libarblib.so` is **prebuilt and committed** (statically-linked
FLINT/MPFR/GMP), so the normal path is a **single `mvn` step** — no `make`:

```bash
mvn -q install -Dmaven.test.skip=true
```

This compiles the Java into `build/classes` and writes the dependency classpath
to `class.path`. You only need `make` when you **edit a SWIG interface file
(`native/*.i`)**; it reruns SWIG + clang and relinks the `.so` (fetching and
building GMP/MPFR/FLINT 3.3.1 statically into `~/.cache/arb4j` the first time):

```bash
make   # ONLY after a native/*.i change
```

`run.sh` auto-runs `mvn` if `class.path` or `build/classes` is missing, and only
falls back to `make` if the committed `libarblib.so` is absent — so for the agent
path you usually don't invoke either directly.

## Run (agent path) — compile + run a Java program

Default smoke (native arithmetic + expression compiler + the Riccati–Müntz–
Padé tanh oracle); prints `PASS …`/`SMOKE OK`, exits non-zero on any failure:

```bash
.claude/skills/run-arb4j/run.sh
```

Bring your own probe — write a `.java` file whose public class matches the
filename, then run it through the driver (this is the main workflow for
exercising a change to the compiler or a math function):

```bash
cat > /tmp/Probe.java <<'EOF'
import arb.functions.real.RealFunction;
public class Probe {
  public static void main(String[] a) {
    RealFunction f = RealFunction.express("x➔sin(x)+cos(x)");
    System.out.println("f(0) = " + f.eval(0) + " (expect 1.0)");
  }
}
EOF
.claude/skills/run-arb4j/run.sh /tmp/Probe.java
```

The driver compiles against `build/classes:$(cat class.path)` and runs with
`--enable-native-access=ALL-UNNAMED -Djava.library.path=.` (so the JNI bridge
finds `libarblib.so`). Edit `.claude/skills/run-arb4j/Smoke.java` to change
the default smoke.

## Run (interactive) — arbshell JShell REPL

`bin/arbshell` is a JShell preloaded with `arb.*` imports (`shell.start`). It
reads from stdin, so you can drive it non-interactively:

```bash
printf 'var x = new Real(); x.set("4",128); System.out.println("sqrt(4)="+x.sqrt(128,new Real()).doubleValue());\n/exit\n' | bin/arbshell
```

Prints `sqrt(4)=2.0`. For an interactive session, run `bin/arbshell` under
tmux and use `send-keys`/`capture-pane`.

## Screenshot (JavaFX GUI) — shot.sh

The JavaFX apps (`arb.applications.Expressor` — an AST tree-list viewer;
`arb.applications.SymbolPalette` — the symbol picker) need a display. `shot.sh`
launches one on a headless Xvfb screen, waits for it to render, screenshots
the screen, and kills it:

```bash
.claude/skills/run-arb4j/shot.sh
.claude/skills/run-arb4j/shot.sh arb.applications.SymbolPalette /tmp/arb4j-shots/palette.png 18
```

Screenshots land in `/tmp/arb4j-shots/`. The first command writes
`/tmp/arb4j-shots/arb.applications.Expressor.png` (verified: renders the
toolbar — Toggle Context / Save / Load / Graph — the Codomain/Function
dropdowns, the `∫ ∂ π √ ⊥` symbol palette, and the function table).

## Test

```bash
mvn test
```

838 JUnit tests; expect `BUILD SUCCESS`, `Tests run: 838, Failures: 0,
Errors: 0`. A single class/method: `mvn test -Dtest=RealTest#testSqrt`.

## Profile (why is something slow) — bin/profile

`bin/profile` records a run with Java Flight Recorder (built into the JDK, low
overhead, no native agent) and prints a hot-method report. Because arb math is
native (FLINT via JNI), each native call is sampled as its Java wrapper frame
(`arb.arblib.*`), so JNI-boundary costs are visible.

```bash
bin/profile --test MuntzPadeApproximantPrecisionTest   # profile a JUnit test
bin/profile arb.applications.SomeMain arg1              # profile a main class
REPS=8 bin/profile arb.functions.complex.SomeProbe      # REPS → sole arg
```

It prints two rankings: **top executing methods** (top of stack — shows the
raw native primitive, e.g. `fmpz_cmp`) and **top hot application frames** (first
non-JDK/JNI caller — the arb method actually responsible, e.g.
`arb.Integer.compareTo`). For a one-shot expensive operation, profile a small
main that repeats it (more samples = cleaner attribution) rather than the test.
The recording is left at `/tmp/arb4j-profile.jfr` (override with `JFR=`); reopen
it with `jfr print` or JDK Mission Control. To analyse who calls a hot frame:

```bash
jfr print --events jdk.ExecutionSample --stack-depth 30 /tmp/arb4j-profile.jfr \
  | grep -B3 'fmpz_cmp'          # callers of a hot native primitive
```

## Gotchas

- **arb/FLINT types own native memory.** Every `Real`, `Complex`, `Integer`,
  `ComplexPolynomial` is `AutoCloseable`; GC does **not** free the native
  struct. Use try-with-resources or `.close()`. A leak is silent.
- **"Last arg is the result" convention.** `x.sqrt(128, out)` writes into
  `out` and returns it; `x.sqrt(128)` returns a fresh receiver. The bytecode
  emitter targets this shape — passing the wrong destination is a runtime,
  not compile-time, error.
- **Expression strings are literal source.** Never build an expression body
  by string concatenation/`format`/`replace` — they're parsed to AST→bytecode
  and must be string literals at the call site (see `CLAUDE.md`).
- **JavaFX 26 here ships no Monocle headless platform** — `-Dglass.platform=
  Monocle -Dmonocle.platform=Headless` fails with `ClassNotFoundException:
  com.sun.glass.ui.monocle.MonoclePlatformFactory`. A real (virtual) X display
  via `xvfb-run` is the only GUI path; `shot.sh` already does this.
- **`-q` `mvn` prints nothing on success.** No output from
  `mvn -q install -Dmaven.test.skip=true` means it worked; check for `ERROR`.
- **Native-access warnings are noise.** `WARNING: … restricted method …
  System::loadLibrary` on every JVM start is expected; `run.sh` passes
  `--enable-native-access=ALL-UNNAMED` to suppress most of it.

## Troubleshooting

- `UnsatisfiedLinkError` / `libarblib.so not found` → the native lib isn't
  built or `-Djava.library.path=.` is missing. Run `make`; use `run.sh`
  (it sets the library path).
- `cannot find symbol` for `arb.*` at `javac` → `class.path`/`build/classes`
  stale or missing. Re-run `mvn -q install -Dmaven.test.skip=true`.
- `shot.sh` prints `FAILED: no screenshot written` → read the dumped app log;
  usually a missing `--add-opens` for a new JavaFX surface the app touches,
  or the app needs longer than the default 22s to render (pass a larger
  third argument).
- `class.path` references jars under `~/.m2` that don't exist → run a Maven
  phase past `generate-sources` (e.g. `mvn -q install -Dmaven.test.skip=true`)
  to regenerate it.
