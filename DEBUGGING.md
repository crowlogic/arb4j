# DEBUGGING

## Passing JVM Flags to Tests

The `pom.xml` surefire `<argLine>` includes `@{argLine}`, so you can pass additional JVM flags via:

```bash
mvn test -DargLine="-Darb4j.saveClasses=true -Darb4j.decompileClasses=true"
```

Or target a specific test:

```bash
mvn test -Dtest="ExpressionTest#testRationalFunctionDerivative" \
  -DargLine="-Darb4j.saveClasses=true -Darb4j.decompileClasses=true -Darb4j.trace=true"
```

All flags below are `-D` system properties passed inside `-DargLine="..."`.

## Expression Compiler Flags

| Flag | Default | Description |
|------|---------|-------------|
| `arb4j.saveClasses` | `false` | Writes generated `.class` files to the `compiled/` directory. Required for decompilation and bytecode inspection. |
| `arb4j.decompileClasses` | `false` | Decompiles saved `.class` files back to `.java` using Fernflower. Requires `arb4j.saveClasses=true`. Output goes to the same `compiled/` directory. Extremely useful for diagnosing `VerifyError` and type mismatch bugs. |
| `arb4j.verifyBytecode` | `false` | Wraps the ASM `ClassWriter` in a `CheckClassAdapter` that validates bytecode during generation, before the JVM even loads it. Catches bad stack frames and type errors earlier with better messages. |
| `arb4j.trace` | `false` | Enables verbose tracing throughout the expression compiler: parsing, variable resolution, code generation, and class loading. Produces a lot of output. |
| `arb4j.traceNodes` | `false` | Enables per-node tracing during code generation. Logs each `generate()` call with node type, result type, and expression context. |
| `arb4j.traceBinaryOperationSimplification` | `false` | Traces the simplification pass for binary operation nodes (addition, multiplication, etc.), showing before/after for each simplification step. |
| `arb4j.saveGraphs` | `false` | Saves AST graphs (for visualization/debugging of expression tree structure). |

## Typical Debugging Workflows

### VerifyError (bad bytecode)

```bash
mvn test -Dtest="ExpressionTest#testRationalFunctionDerivative" \
  -DargLine="-Darb4j.saveClasses=true -Darb4j.decompileClasses=true -Darb4j.verifyBytecode=true"
```

Then inspect `compiled/` for the `.class` and decompiled `.java` files. The decompiled Java shows exactly what the bytecode generator produced — compare against what it should have generated.

You can also disassemble with `javap`:

```bash
javap -c -p -v compiled/SomeGeneratedClass.class
```

### Type Resolution Bugs

```bash
mvn test -Dtest="SomeTest#someMethod" \
  -DargLine="-Darb4j.trace=true -Darb4j.traceNodes=true"
```

This shows variable resolution (`resolveReference`), type inference, and the full code generation sequence.

### Simplification Bugs

```bash
mvn test -Dtest="SomeTest#someMethod" \
  -DargLine="-Darb4j.traceBinaryOperationSimplification=true"
```

Shows each simplification step for binary operations (constant folding, identity elimination, etc.).

## Class File Locations

- Generated `.class` files: `compiled/<ClassName>.class`
- Decompiled `.java` files: `compiled/<ClassName>.java`
- Expression YAML dumps: `<ClassName>.yaml` (written by `saveToFile()` on certain errors)
