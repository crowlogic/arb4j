
# `NAryOperationNode<D, R, F>` — Complete Documentation

`NAryOperationNode` is the abstract base class in the [arb4j expression compiler](https://github.com/crowlogic/arb4j/blob/master/src/main/java/arb/expressions/nodes/nary/NAryOperationNode.java) that represents n-ary operations — summations ($\Sigma$) and products ($\Pi$) — over an integer range. It dynamically generates JVM bytecode via ASM to evaluate expressions like $\sum_{k=a}^{b} f(k)$ or $\prod_{k=a}^{b} f(k)$ at runtime .

Subclasses like `SumNode` (identity = `"additiveIdentity"`, operation = `"add"`) and `ProductNode` (identity = `"multiplicativeIdentity"`, operation = `"mul"`) supply the specific combining operation and identity element, while this class handles all parsing, compilation, loop generation, and variable propagation .

## Type Parameters and Class Hierarchy

The class extends `Node<D, R, F>` and is parameterized by three generics: `D` is the domain type of the enclosing expression (e.g., `Real`, `Complex`), `R` is the codomain type (the result type, e.g., `Real`, `RealPolynomial`), and `F extends Function<? extends D, ? extends R>` is the function interface the enclosing expression implements. The operand itself is always an `Expression<Integer, R, Sequence<R>>` — it maps an `Integer` index to a result of type `R`, which is the key to how the loop body works.

## Field Inventory

| Field | Type | Purpose |
| :-- | :-- | :-- |
| `identity` | `String` | Name of the identity method to call on the accumulator (e.g., `"additiveIdentity"` for sums, `"multiplicativeIdentity"` for products) |
| `operation` | `String` | Name of the combining method (e.g., `"add"` or `"mul"`) |
| `symbol` | `String` | Unicode symbol (`"Σ"` or `"Π"`) for `toString()` |
| `prefix` | `String` | Prefix for naming intermediate variables (e.g., `"sum"` or `"product"`) |
| `lowerLimit` / `upperLimit` | `Node<D,R,F>` | AST nodes representing the bounds of iteration |
| `indexVariableFieldName` | `String` | Field name for the loop index variable (e.g., `"k"`) |
| `operand` | `Expression<Integer, R, Sequence<R>>` | The compiled operand sub-expression |
| `operandExpressionString` | `String` | The raw text of the operand before compilation |
| `operandFunctionFieldName` | `String` | Field name on the generated class holding the compiled operand `Function` instance |
| `operandValueFieldName` | `String` | Field name for the intermediate output buffer passed to `operand.evaluate()` |
| `upperLimitFieldName` | `String` | Field name for the evaluated upper-limit `Integer` |
| `beginLoop` / `endLoop` | `Label` | ASM labels marking the top and exit of the loop |
| `generatedType` | `Class<?>` | The actual runtime result type (may be demoted from polynomial to scalar) |
| `fieldName` | `String` | (inherited) The field name of the accumulator variable |

## Constructor and Parsing

### Primary Constructor

```java
public NAryOperationNode(Expression<D, R, F> expression,
                         String identity, String prefix,
                         String operation, String symbol)
```

This constructor is called during parsing when the expression compiler encounters `Σ` or `Π` (or their functional forms `sum(...)`, `prod(...)`). It performs three parsing steps immediately:

**Step 1 — `extractOperandExpression()`**: Scans the raw expression string forward from the current parse position. It looks for the arrow character `➔` to extract the index variable name (the text before the arrow, e.g., `"k"` in `k➔f(k){k=1…n}`). Then it locates the range specification `{k=` to determine where the operand body ends. Everything between the current position and the range specification is extracted as `operandExpressionString`. The parser position is advanced to the `{` character.

**Step 2 — `parseOperatorLimitSpecifications()`**: Consumes `{`, reads the index variable name after the brace, verifies it matches any name already extracted from the arrow syntax, calls `expression.require('=')`, then delegates to `parseLowerLimit()` (which calls `expression.resolve()` and then `expression.require('…')`) and `parseUpperLimit()` (which calls `expression.resolve()` and then `expression.require('}')`). The lower and upper limits become fully parsed `Node` subtrees.

**Step 3**: The index variable is registered in `expression.context.variables` so downstream parsing recognizes it as a known symbol.

### Splice Constructor

```java
public NAryOperationNode(Expression<D, R, F> expression,
                         String identity, String prefix,
                         String operation, String symbol,
                         String operandExpression,
                         Node<D,R,F> lowerLimit,
                         Node<D,R,F> upperLimit)
```

Used by `spliceInto()` to create a copy of this node transplanted into a different expression tree. No parsing occurs — the operand string and pre-built limit nodes are supplied directly.

## The `generate` Method — Bytecode Emission

This is the central method. It emits JVM bytecode that implements the entire n-ary loop. Here is the exact sequence of operations:

```java
public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
```


### Phase 1 — Type Resolution (`assignTypes`)

```java
resultType = assignTypes(resultType);
```

If the enclosing expression (and all its ancestors) have no indeterminate variable, the result type is demoted to scalar via `scalarType()` — for example, `RealPolynomial` becomes `Real`. If an indeterminate variable does exist and the result type is a polynomial type, `generatedType` is set to that polynomial type. This ensures summations that don't involve a free variable produce scalar results rather than degree-0 polynomials.

### Phase 2 — Field Name Allocation (`assignFieldNamesIfNecessary`)

```java
assignFieldNamesIfNecessary(resultType);
```

Allocates two field names on the generated class if not already assigned: `operandFunctionFieldName` (for the `Function` instance that evaluates the operand body) and `operandValueFieldName` (for the intermediate result buffer). These are obtained from `expression.getNextIntermediateVariableFieldName()` and `expression.newIntermediateVariable()` respectively.

### Phase 3 — Index Variable Preparation (`prepareIndexVariable`)

```java
prepareIndexVariable();
```

Checks if the index variable (e.g., `k`) already exists as an intermediate variable. If it does and isn't of type `Integer`, a `CompilerException` is thrown. If it doesn't exist, it is registered via `expression.registerIntermediateVariable(indexVariableFieldName, Integer.class, true)`. This creates a field on the generated class to hold the loop counter.

### Phase 4 — Operand Compilation (`compileOperandExpression`)

```java
if (operand == null) {
    compileOperandExpression(resultType);
}
```

This is where the operand body string is compiled into a standalone `Expression<Integer, R, Sequence<R>>`. The call to `Function.parse(...)` recursively invokes the expression compiler to produce a new class for the operand function. The compiled operand is then registered via `registerOperand()`, which creates a `FunctionMapping` and adds it to `expression.referencedFunctions` so the parent expression's class initialization can instantiate it. Context variable propagation initializers are also registered at this point.

### Phase 5 — Variable Propagation (`propagateInputToOperand`)

```java
propagateInputToOperand(mv);
```

Generates bytecode that copies variable values from the parent expression into the operand's fields before the loop runs. This has two sub-phases:

**5a — Independent Variable Propagation** (`propagateIndependentVariableToOperand`): If the parent expression has an independent variable (e.g., `x` in $\sum_{k=0}^{n} x^k$), bytecode is emitted to:

1. Load the operand's field for that variable
2. If null, allocate a new instance via `new` + default constructor and assign it
3. Call `.set(inputParameter)` to copy the current evaluation input into the operand

**5b — Ancestor Variable Propagation** (`propagateAscendentIndependentVariablesToOperand`): For each variable the operand references that is marked `ascendentInput` (meaning it was captured from an enclosing scope), the same null-check-then-allocate-then-set pattern is used, except it reads from `this.fieldName` rather than the method input parameter.

### Phase 6 — Accumulator Initialization (`initializeResultVariable`)

```java
initializeResultVariable(mv, resultType);
```

Allocates an intermediate variable field for the accumulator and emits bytecode to call the identity method on it. For `SumNode` this calls `additiveIdentity()` (sets to zero), for `ProductNode` it calls `multiplicativeIdentity()` (sets to one). The field name is stored in `this.fieldName`.

### Phase 7 — Index Initialization (`setIndexToTheLowerLimit`)

```java
setIndexToTheLowerLimit(mv);
```

Emits: load the index field, generate the lower limit node's bytecode (which pushes the lower bound value), then call `index.set(lowerLimitValue)`. The stack is cleaned with `pop`.

### Phase 8 — Upper Limit Evaluation (`generateUpperLimit`)

```java
loadIndexVariable(mv);
generateUpperLimit(mv);
```

The index is loaded onto the stack (it will be used by the comparison at loop top). A new intermediate field `upperLimitFieldName` is allocated for the upper limit, the upper limit node generates its value, and `set()` copies it into the field. This evaluates the upper bound once before the loop begins.

### Phase 9 — The Loop

The loop structure in bytecode is:

```
beginLoop:
    index.compareTo(upperLimit)
    if (result > 0) goto endLoop

    // inner loop body:
    load accumulator
    load operandFunction
    load index
    load bits
    load operandValue (output buffer)
    operandFunction.evaluate(index, bits, operandValue)  // → pushes result
    cast to generatedType
    load bits
    accumulator.add(result, bits)   // or .mul() for products
    pop
    index.increment()

    goto beginLoop
endLoop:
```

**`generateInnerLoop`** emits exactly this sequence. The `combine` method calls `invokeMethod` for the operation name (`"add"` or `"mul"`) with signature `(generatedType, int) → generatedType`, meaning the accumulator's add/mul method takes the operand value and a precision parameter.

### Phase 10 — Result Assignment (`assignResult`)

```java
assignResult(mv, resultType);
```

If this node is the root of the expression (`isResult == true`), the method's result parameter (slot from the `evaluate` method signature) is loaded, cast, and then `set()` is called to copy the accumulator into it. If this node is an intermediate computation, it simply loads the accumulator onto the stack so the parent node can consume it.

## Variable Propagation Bytecode Pattern

Both `propagateIndependentVariableToOperand` and `propagateAscendentIndependentVariablesToOperand` follow the same null-guard pattern in generated bytecode:

```
// Pseudocode for the emitted bytecode:
if (this.operand.varName == null) {
    this.operand.varName = new VarType();
}
this.operand.varName.set(sourceValue);
```

This ensures operand fields are lazily allocated and always carry current values. The "set by value" semantics (calling `.set()` rather than assigning a reference) are critical because arb4j types like `Real` and `Integer` are mutable precision-tracked objects — reference sharing would cause aliasing bugs.

## `extractOperandExpression` — Parsing Details

This method performs raw string scanning (not recursive-descent) to isolate the operand body from the enclosing expression text. It handles two syntactic forms:

- **Operator form**: `Σk➔f(k){k=a…b}` — the arrow `➔` separates the index variable from the body, and `{k=` marks the range specification.
- **Function form**: `sum(k➔f(k),k=a…b)` — a comma followed by `k=` marks the range specification (detected via `functionFormLookingFor`).

The method extracts the substring between the current position and the range specification start as the operand expression, then repositions the parser at the `{` for `parseOperatorLimitSpecifications` to continue.

## `compileOperandExpression` — Sub-Expression Compilation

```java
operand = Function.parse(operandFunctionFieldName,
                         operandExpressionString,
                         expression.context,
                         Integer.class,
                         resultType,
                         Function.class,
                         operandFunctionFieldName,
                         expression);
```

This recursively invokes the full expression compiler to produce a new class. The domain is always `Integer` (the index), the codomain is `resultType`, and the parent expression's `Context` is shared so the operand can reference the same variables and functions. After compilation, `registerOperand` creates a `FunctionMapping` and stores it in `expression.referencedFunctions` so the class-loading infrastructure knows to instantiate and wire up the operand.

## Tree Operations

### `spliceInto`

Creates a deep copy of this node transplanted into a new expression. The operand expression string, identity, prefix, operation, symbol, and index variable name are carried over. Lower and upper limits are recursively spliced. The operand is not re-compiled — it will be re-compiled on demand during `generate`.

### `substitute`

Replaces a variable throughout the expression. It tears down the existing operand (clearing `operandFunctionFieldName`, `operandValueFieldName`, and `operand`), re-allocates field names, re-compiles the operand, then calls `operand.substitute()` and recursively substitutes in both limits. This is a destructive operation on the node's state.

### `getBranches`

Returns the branches of the operand's AST spliced into the parent expression. Results are cached in `cachedOperandBranches`. This is used for tree traversal by parent infrastructure.

### `dependsOn`

Returns `true` if the lower limit, upper limit, or operand body depends on the given variable. For the operand, it splices the variable into the operand's expression space before checking.

## Output Formatting

### `toString`

Produces a canonical string representation: `Σf(k){k=a…b}` where the operand is either the compiled operand's `toString()` or the raw operand expression string.

### `typeset`

Produces LaTeX: `\sum_{k = a}^{b}{f(k)}` (with `"mul"` replaced by `"prod"` and `"add"` replaced by `"sum"` in the command name).

## `scalarType`

If the result type is `RealPolynomial`, it is demoted to `Real`. Other types pass through unchanged. This prevents the n-ary operation from producing polynomial-typed results when no indeterminate variable is present in the expression hierarchy.

## `hashCode` / `equals`

Equality is defined by the upper limit, operation name, and lower limit. The operand body is not included in equality — two n-ary nodes with the same bounds and operation type are considered equal regardless of body.

## Lifecycle Diagram

The overall lifecycle from source text to executing bytecode is:

1. **Parse** — Constructor calls `extractOperandExpression()` then `parseOperatorLimitSpecifications()`, producing AST nodes for limits and a raw string for the operand body
2. **Compile** — `generate()` calls `compileOperandExpression()`, which recursively compiles the operand into its own `Expression` class via `Function.parse()`
3. **Wire** — `propagateInputToOperand()` emits bytecode to copy live variable values from parent to operand fields
4. **Loop** — The main loop bytecode evaluates the operand at each integer index, combining results via the identity/operation pair
5. **Return** — `assignResult()` copies the accumulator to the output parameter or leaves it on the stack
