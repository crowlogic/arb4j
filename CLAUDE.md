# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

arb4j is a Java API wrapping the C library [arblib](http://arblib.org)/FLINT (arbitrary precision real and complex ball arithmetic) via a SWIG-generated JNI bridge, plus an expression compiler that turns Unicode-rich mathematical notation directly into JVM bytecode via ASM. See `README.md` for the full feature tour and the compilation ordering rule.

## Cardinal rule: NEVER GUESS

When debugging or diagnosing a problem, do not speculate. This applies to every artifact the user receives — final output, intermediate thinking, commit messages, issue bodies, comments, reasoning. There is always a deterministic path to the answer: generated source/bytecode (`-Darb4j.saveClasses=true -Darb4j.decompileClasses=true`, then read `compiled/<name>.java`/`.class`), raw bytecode (`javap -p -c compiled/<name>.class`), `arb4j.trace`/`traceNodes` logging, isolated reproducers with print statements, a debugger. Use them.

Words like "suspicion", "I bet", "probably", "my guess is", "likely", "might be", "could be" are banned from any token stream the user sees, including reasoning. If a step in a causal chain isn't directly verified, verify it before claiming it. State only what evidence supports. The cost of guessing in a JVM-bytecode + native-arb stack is wasted hours chasing the wrong cause — a tool gives the answer in seconds.

## Cardinal rule: ALL CODE IS PERMANENT — there is no such thing as a throwaway probe

Every line of code written for this repository is permanent and belongs in the
repository. The concepts of a "throwaway probe", "scratch program", "temporary
reproducer", "one-off script", "disposable test harness", or any equivalent are
**forbidden** — they do not exist here. Do not write code with the intent to
delete it, do not `.gitignore` it, and do not stash it in `/tmp`.

The words "throwaway", "throw-away", "probe" (as a noun for scratch code),
"scratch", "disposable", "temporary" (applied to code/scripts/tests), and every
derivative are banned from source, comments, tests, scripts, commit messages,
issues, PRs, and reasoning.

Concretely:

- When asked to create unit tests, create **unit tests** — permanent classes
  under `src/test/java/...`, committed. Never a "probe" or "throwing code". ❌
- Verification programs, reproducers, and experiments that work out math are
  **permanent** and live under `scripts/` (committed) — never `/tmp`, never
  deleted. ❌ (see the existing tracked `scripts/*.arb`, `scripts/*.py`.)
- Do not write a program "just to check something" and throw it away. If it was
  worth writing, it is worth committing where the next contributor can re-run it.
- Never rely on `.gitignore` to make a piece of code vanish. If code exists, it
  is tracked.

If you catch yourself reaching for a "quick probe to verify X", stop: write it
as a permanent, committed artifact (a real test or a tracked `scripts/` file)
from the start.

## Cardinal rule: NEVER manipulate expression strings programmatically

Expression strings (the bodies passed to `*.express(...)`, `*.compile(...)`, `*.declare(...)`) are LITERAL source code that the compiler parses into AST → bytecode. They must always be **string literals** at the call site.

The following are all forbidden, without exception:

- Concatenation with `+` to splice in a runtime value: `"P:n➔" + name + "(n-1)"` ❌
- `String.format(...)` or `printf`-style templating to build an expression body ❌
- `String.replace(...)` / `replaceAll` on an expression to substitute a name ❌
- Building an expression body via `StringBuilder` or any character-by-character assembly ❌
- Any kind of name renaming inside a generated expression body ❌

If a naming collision in a shared `Context` is forcing the temptation to do any of the above — **rethink the architecture instead**. Possible answers: a per-instance `Context`, sharing pre-compiled `Sequence` instances through Java fields rather than context names, a parent-class refactor to admit two siblings cleanly, or a new compiler feature (e.g. a fixed `self` keyword inside recurrence bodies). String manipulation of expressions is never the answer.

This rule applies even when the alternative seems clumsy. The expression compiler is the authoritative tool; programmatic source-code construction is what we're trying to eliminate, not perform.

## Build environment (non-obvious requirements)

- **Java 26** is required (`--enable-preview` is used by the launchers). Set `JAVA_HOME=/usr/lib/jvm/java-26-openjdk-amd64`.
- **No FLINT install is needed.** `libarblib.so` is a **prebuilt, committed, statically-linked** binary (FLINT/MPFR/GMP are linked statically into it) tracked at `src/main/resources/native/libarblib.so`, with a repo-root `libarblib.so` symlink to it; it is also packaged into the jar at `native/libarblib.so`. Building and running need only this committed `.so` — there is no runtime dependency on a system `libflint`/`libmpfr`/`libgmp`.
- **UTF-8 locale is mandatory** — several source files have Unicode names (`σField.java`, `RiemannζFunction.java`, `RiemannξFunction.java`). Without `LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8`, `javac` fails with `Invalid filename: ??Field.java`.
- **`make` is only needed when the SWIG interface files (`native/*.i`) change.** It runs SWIG + clang to regenerate `arb_wrap.c` and relink `libarblib.so` (fetching and building GMP/MPFR/FLINT statically into `~/.cache/arb4j` the first time — a slow, one-off step). For all ordinary Java work the committed `.so` is already current, so just run `mvn`, which consumes the `.so` via `-Djava.library.path=${project.basedir}` (set automatically by the surefire plugin and the `bin/*` wrappers).

## Common commands

```bash
# Ordinary build (the committed static libarblib.so is already current)
mvn install -Dmaven.test.skip=true

# Rebuild the native lib — ONLY needed after editing a SWIG interface file
# (native/*.i). Fetches+builds GMP/MPFR/FLINT statically into ~/.cache/arb4j
# on first run, then relinks libarblib.so.
make && mvn install -Dmaven.test.skip=true

# Run all tests (Java 26; the committed libarblib.so is used as-is)
mvn test

# Run a single test method
mvn test -Dtest=RealTest#testSqrt
mvn test -Dtest='RationalFunctionTest#testPowers'

# Run with expression-compiler tracing (issue #994 reproduction recipe)
mvn -Ptrace test -Dtest=Foo#bar
# Equivalent to passing: -Darb4j.trace=true -Darb4j.traceNodes=true
#                        -Dlogback.configurationFile=logback-debug.xml

# Run any main class with the full module/classpath wiring
bin/run arb.applications.Expressor      # or just `bin/expressor`
bin/symbolPalette                       # JavaFX symbol picker
bin/arbshell                            # JShell preloaded with arb.* imports (see shell.start)
```

`bin/run` reads `class.path` (regenerated by `mvn` via the `build-classpath` execution bound to `generate-sources`) and adds the JavaFX `--add-modules` / `--add-opens` flags. If `class.path` is stale or missing after a Maven dependency change, re-run `mvn generate-sources` (or any phase past it).

## Tracing / debugging flags

System properties read at static init in `arb.expressions.Expression`:

| Property | Effect |
|---|---|
| `-Darb4j.saveClasses=true` | Write generated `.class` files into `compiled/` |
| `-Darb4j.decompileClasses=true` | Run vineflower over the generated class and dump `.java` next to it |
| `-Darb4j.saveGraphs=true` | Dump GraphViz of the AST |
| `-Darb4j.trace=true` | Log every parse/compile step |
| `-Darb4j.traceNodes=true` | Log per-node bytecode emission |

A test can also flip these per-call with `Expression.saveClasses = true;` (see `README.md` for an example). The `compiled/` directory already contains ~1000 cached decompiled artifacts and is gitignored via the `/build/` and `/compiled` patterns.

## Architecture, in three layers

### 1. Native wrappers — `arb.*` (top-level package)

Each top-level class (`Real`, `Complex`, `Integer`, `Float`, `Magnitude`, `RealPolynomial`, `ComplexPolynomial`, `ComplexMatrix`, `Fraction`, `RationalFunction`, …) is a thin Java holder for an arblib native struct, generated/assisted by the SWIG `.i` files in `native/`. Two invariants apply everywhere:

- **All such types are `AutoCloseable`** — they own native memory. Always use try-with-resources or call `.close()` explicitly. Generated expression-compiler classes also implement `AutoCloseable` and dispose every intermediate variable in their emitted `close()`.
- **Fluent "last-arg is result" convention** — `x.sqrt(128)` and `x.sqrt(128, x)` are equivalent; pass `new Real()` (or similar) as the trailing arg to avoid clobbering the receiver. This shape is what the bytecode emitter targets, so changing a method's signature shape can break generated code at runtime, not compile time.

### 2. Expression compiler — `arb.expressions.*`

The pipeline: `Expression.parseRoot` (recursive-descent, Unicode-aware) → an AST whose `Node` subclasses live in `arb.expressions.nodes` (binary/unary/nary subpackages). Each `Node` implements its own `generate(...)` (ASM bytecode emission), `differentiate(...)` (symbolic), and `simplify(...)`. The compiler emits a class into `ExpressionClassLoader`, then instantiates it and uses reflection (`Class.getFields()`) to inject variable and function references via `Context.injectVariableReferences` / `Context.injectFunctionReferences`.

There is one ordering rule: when `express` instantiates a generated class, every class that expression references must already be defined in the `ExpressionClassLoader`. Instantiation calls `injectVariableReferences` / `injectFunctionReferences`, which resolve every field type via reflection. There is no second pass.

- `parseCompileAndRegister(name, …, expression, …, context)` — emits bytecode and registers the `FunctionMapping`. Does not instantiate.
- `express(name, …, expression, …, context)` — calls `parseCompileAndRegister` then instantiates and injects references.

Call `parseCompileAndRegister` for every function that must be defined before instantiation, then `express` last. See `README.md` for the full walkthrough. The self-reference guard in `Expression.constructReferencedFunctionInstanceIfItIsNull` handles single self-recursive sequences automatically.

### 3. Hand-written math — `arb.functions.*`

`Function`, `Functional`, `NullaryFunction`, `Sequence`, `RealFunction`, `ComplexFunction`, etc., plus subpackages by domain (`real/`, `complex/`, `integer/`, `rational/`, `algebraic/`, `polynomials/orthogonal/{real,complex}`). These are the typed function interfaces that generated classes implement — e.g. `RealPolynomialSequence` is the interface implemented by the generated `T.class` for Chebyshev polynomials. `Expression<D, C, F>` is parameterized over Domain, Codomain, and the implemented Function type; those generics drive the bytecode generator's field declarations and signatures (they are *not* decorative).

### Applications and tooling — `arb.applications.*`

JavaFX programs: `Expressor` (AST tree-list viewer), `SymbolPalette`, `ReferenceBrowser`, `BandLimitedWhiteNoiseSampler`, `HardyZSampler`, `LemniscateLab`, etc. Each has a launcher in `bin/`. The module-info exports JavaFX-specific packages, and the `bin/run` wrapper handles all the `--add-opens` / `--add-modules` boilerplate.

## Tests

JUnit 4 under `src/test/java/arb/`, mirroring the main package layout (`arb.expressions.*Test`, `arb.functions.*Test`, etc.). Tests routinely flip `Expression.saveClasses = true` so the generated `.class` ends up in `compiled/` for inspection — preserve that pattern when writing new tests for compiler issues.

### NEVER look at surefire reports for pass/fail status

`build/surefire-reports/` accumulates `.txt` and `.xml` files from every test class that has ever been run in this checkout, including:
- transient test classes the user created and deleted,
- generated bytecode classes from `arb.expressions.*` runs that happened to land under packages like `arb.fuckedup.*`,
- old test classes that no longer exist in any branch.

Maven does not clean these between runs. Aggregating `Tests run:` lines from `build/surefire-reports/*.txt` will count phantom failures from tests that do not exist in the current source tree, and lead to claims like "X test is failing" when X is not even on master.

**Only ever trust the live `mvn test` console output for the current run.** If a previous output was lost, re-run `mvn test` — do not read the report directory.

### NEVER propose, suggest, or implement "fallback" paths

A fallback is an admission that the primary method silently doesn't work in
some regime, paired with a hidden hand-off to a different method whose answer
may disagree with the first. That is transparent degradation — the user gets
a number with no indication that the algorithm changed under them, no
guarantee that the two methods agree on the boundary, and no way to reason
about which branch produced any given result. It is the opposite of what an
arbitrary-precision verified-arithmetic library exists to provide.

The following are all forbidden:

- Proposing "method A, with method B as a fallback when A converges slowly" ❌
- A sibling `evaluateXxx` whose only purpose is "if the main path fails, try this" ❌
- A `try { primary(); } catch { secondary(); }` shape over numerical evaluators ❌
- Heuristic dispatch on `|z|` or convergence speed that picks between two
  algorithms that produce numerically distinct (even if mathematically equal)
  answers ❌
- Any sentence in design notes, code comments, commit messages, or PR
  descriptions that contains the word "fallback" ❌

The correct stance for every function is: **pick one algorithm, prove it
correct on its full claimed domain, deliver a verified ball whose radius
actually encloses the truth, and refuse the inputs that are outside that
domain with an explicit exception.** If two algorithms are genuinely
appropriate for disjoint parameter regions (e.g. Slater series at z=0 vs.
z=∞), they are not fallbacks for each other — they are *the same algorithm*
expressed in two charts of the same analytic continuation, and the dispatch
between them is part of the algorithm's specification, not a degradation
path.

If a regime exists where no in-class method gives a verified answer, the
class must throw on those inputs. It must not silently return a less-accurate
result from a different method.

### NEVER use Java arrays of `Real` / `Complex` / `Integer` / `Float` / `Magnitude`

`Real`, `Complex`, `Integer`, `Float`, `Magnitude`, and the other top-level
`arb.*` ball-arithmetic types are **scalar-or-vector by themselves**. Each is a
single handle to an arblib struct that holds an array of `dim` ball elements
internally (the `elements` field, with `dim == 1` by default for a scalar).
They are constructed as scalars with `new Real()` / `new Complex()` and as
vectors with `Real.newVector(n)` / `Complex.newVector(n)`. Indexed access is
`x.get(i)`. The dimension is read with `x.dim()`.

The following are all **wrong** and must never appear in arb4j code:

- `Real[] a;`           ❌
- `Complex[] α;`        ❌
- `Integer[] N;`        ❌
- `Magnitude[] r;`      ❌
- `new Real[n]`         ❌
- `Complex[] elements`  ❌  (as a public field of a new class — `Complex.elements` is internal)
- `Real[].class`        ❌  in any reflective lookup

The correct shapes are:

- `Complex α = Complex.newVector(p);   α.set(...);   α.get(i);`  ✓
- `Real    A = Real.newVector(p);      A.set(...);   A.get(i);`  ✓
- `Complex z = new Complex();   z.re().set(...);   z.im().set(...);`  ✓  (scalar)

This matches `HypergeometricFunction`, `Real`, `Complex`, `ComplexMatrix`, and
every other type in the codebase. A `Real[]` is a Java array of arblib handles
— it doubles the allocation, breaks the single-handle ownership model that
`AutoCloseable.close()` relies on, defeats the SWIG layout the bytecode emitter
assumes, and indicates the author has not understood that `Real` is the vector.

If you find yourself reaching for `Real[]`, stop. The dimensions of every
parameter vector belong inside one `Real`/`Complex` handle, period.

### NEVER write Unicode escape sequences — always use the actual character

Never write `\uXXXX` in Java source, SWIG `.i` files, expression strings, or
anywhere else. Always write the literal Unicode character: `—` not `\u2014`,
`σ` not `\u03c3`, `➜` not `\u279c`, `Σ` not `\u03a3`, `κ` not `\u03ba`. The source
files are UTF-8 throughout. Unicode escapes are unreadable, error-prone, and
clash with the project's expression-language conventions where these characters
are first-class identifiers.

### Reference classes by simple name via an import — never fully-qualified inline

Add an `import` and write the simple name (`Integer`, `Sequence`, `SumNode`).
Never write a fully-qualified name (`arb.Integer`, `arb.functions.integer.Sequence`)
inline in code — it is noise that obscures the expression and signals a missing
import.

### Behavior lives on the type, dispatched by polymorphism

Each subclass owns its own behavior as overrides; let the JVM dispatch. Every
node-producing operation (`spliceInto`, `differentiate`, `integral`, …)
constructs the SAME concrete subclass it was called on — via an overridable
creation method — so the type, and therefore the behavior, is preserved through
the transformation.

### The words "body" and "curry" are FORBIDDEN

The words "body" and "curry" — and every derivative of either (curried,
currying, curries, "function body", "expression body", etc.) — must never appear
anywhere, for any reason: source, comments, commit messages, issues, PRs, and in
reasoning/thinking. Refer to a function's defining **expression** or
**definition** instead of its "body"; describe an `i➔j➔…` indexed function
sequence as exactly that — a nested/indexed function sequence — never as
"curried" or "currying".

### NEVER run destructive git commands on uncommitted source files

The working tree in this repo routinely contains hours of uncommitted work.
`git checkout <file>`, `git restore <file>`, `git reset --hard`, `git clean -fd`,
and `git stash drop` all permanently destroy that work. The user has explicitly
required monetary compensation for any work destroyed by these commands.

Before doing ANY git operation that could overwrite working-tree files:
  1. `git status --short` to see what is uncommitted.
  2. If anything material is modified or untracked, commit it to a WIP branch
     FIRST (`git checkout -b wip/<topic> && git add -A && git commit -m 'WIP'`),
     then perform the operation on the WIP branch — never on the working tree
     you care about.
  3. If a revert of one file is truly needed, copy that file out of the working
     tree to /tmp first, then restore it manually after the operation — do not
     rely on git to remember it.

## Packaging notes

- The `debian` Maven profile (used by `debian/rules`) emits a relocated classpath (`class.path.debian` → `/usr/share/arb4j/lib/...`) and stages every runtime dep into `target/dependency`. Default `mvn install` does neither.
- The `shade` execution is bound to `phase=none` — it doesn't run on a normal build. When invoked, it produces a fat jar with everything except JavaFX and `arb.*` relocated under `org.arblib.shaded.*`, and a follow-up `antrun` step rewrites `ch.qos.logback` literals inside the shipped `logback*.xml` (MSHADE-156 workaround). Don't add new third-party deps without adding a matching `<relocation>` entry.
