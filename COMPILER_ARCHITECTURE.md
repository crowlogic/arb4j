# arb4j Expression Compiler Architecture

Source root: `src/main/java/arb/expressions/`

---

## Table of Contents

1. [Overview](#1-overview)
2. [Parser Layer](#2-parser-layer)
3. [AST Node Hierarchy](#3-ast-node-hierarchy)
4. [Expression Class](#4-expression-class)
5. [Context and FunctionMapping](#5-context-and-functionmapping)
6. [Codegen Pipeline](#6-codegen-pipeline)
7. [NAryOperationNode Codegen](#7-naryoperationnode-codegen)
8. [The Cyclic-Reference Bug](#8-the-cyclic-reference-bug)
9. [Generated-Class Shape](#9-generated-class-shape)
10. [Class Loading](#10-class-loading)
11. [Caching and Memoization](#11-caching-and-memoization)
12. [Cross-Cutting Invariants and Known Bug Patterns](#12-cross-cutting-invariants-and-known-bug-patterns)

---

## 1. Overview

The arb4j expression compiler is an in-process JIT that converts a mathematical expression string into a Java class implementing a typed `Function<D,C>` interface, loaded and instantiated at runtime. No intermediate representation beyond the AST and the ASM `ClassWriter` byte array is produced. The pipeline has six distinct layers whose responsibilities are partitioned as follows.

### End-to-End Flow

```
  text source  →  Parser/Expression.parse()  →  AST (Node tree)
               →  Expression.optimize()         (CSE, static hoisting, jet dedup)
               →  Expression.generate()         (ASM bytecode via ClassWriter)
               →  ExpressionClassLoader.defineClass()
               →  Expression.instantiate()      (reflection + Context wiring)
               →  live Function<D,C> instance
```

### Layer Responsibilities

| Layer | Class(es) | Role |
|---|---|---|
| Parser | `Parser.java`, `Expression.java` (parse methods) | Unicode normalization, tokenization, recursive-descent production of AST nodes |
| AST | `nodes/Node.java` and all subclasses | Tree structure, symbolic differentiation, simplification, code generation dispatch |
| Compilation driver | `Expression.java` (compile/generate/instantiate) | Orchestrates field declaration, `initialize()` generation, `evaluate()` generation, class loading |
| Type registry | `Context.java`, `FunctionMapping.java` | Named variable and named function bindings shared across related expressions |
| Bytecode helpers | `Compiler.java` | Static ASM utility methods (load/store/invoke/cast helpers) |
| Class loading | `ExpressionClassLoader.java` | Defines generated classes into the JVM within a per-Context loader |

`Expression<D,C,F>` is simultaneously a parser, an AST holder, a codegen driver, and a runtime metadata container. The three type parameters `D` (domain), `C` (codomain), and `F extends Function<? extends D, ? extends C>` (function interface) flow through the entire pipeline.

---

## 2. Parser Layer

### 2.1 Pre-processing (`Parser.normalize`, lines 355–381)

Before any tokenization, the raw expression string is normalized by `Parser.normalize()`:

- Multiple arrow variants (`->`, `⇒`, `→`, `➜`, `↦`, `⟶`, `⟼`) are replaced with the canonical `➔` (U+2794).
- `...` and `..` are replaced with the Unicode ellipsis `…`.
- Italic `𝑖` and capital `I` are replaced with `ⅈ` (imaginary unit).
- Invisible Unicode formatting characters (category `Cf`) are stripped.
- Superscript letter-started runs such as `tⁿ⁻¹` are collapsed to `t^(n-1)` by `collapseSuperscriptRuns()` (lines 299–339). Bare `⁻¹` sequences (e.g. `a⁻¹`, `f⁻¹(x)`) are left untouched for the parser's dedicated inverse-notation handling.

### 2.2 Character Classes

`Parser.java` contains static helpers used by the parser cursor inside `Expression.java`:

| Helper | Purpose |
|---|---|
| `isNumeric(char)` | Matches `0-9`, `.`, `∞`, fraction glyphs (½, ¼, etc.) |
| `isIdentifyingCharacter(int, boolean)` | Matches ASCII letters, Greek/blackletter chars, `ⅈ`, `√`, `₀`, superscript letters, `_` but explicitly excludes `Σ` so sum syntax is never treated as a name start |
| `isGreekOrBlackLetter(int)` | Unicode range `0391–03A9` (uppercase Greek), `03B1–03C9` (lowercase Greek), plus the explicit set in `greekAndBlackLetterChars` |
| `isSubscript(char)` | Matches `₀–₉` and `ₐ ₑ ₒ ₓ ₔ ₕ ₖ ₗ ₘ ₙ ₚ ₛ ₜ` |
| `isSuperscriptLetter(int)` | Checks membership in `superscriptChars` set (26 lowercase + 20 uppercase + 8 Greek superscript letters) |

### 2.3 Tokenizer Cursor

The tokenizer is embedded directly in `Expression.java`. The cursor state is three fields:

```
int position;            // current index into expression string
char character;          // character at position (high surrogate for supplementary chars)
char previousCharacter;  // character before most recent advance
```

`nextCharacter()` (Expression.java line 4574) advances by one code point, setting `character` to `getExpression().charAt(position)`. For supplementary Unicode characters (code points > U+FFFF), `currentCodePoint()` (line 4550) reads the full code point via `codePointAt`; all supplementary-aware tests call `currentCodePoint()` rather than `character`.

`nextCharacterIs(char...)` (line 5042) skips spaces then conditionally consumes one of the listed characters.

`CursorState` record (line 603) captures `(position, character, previousCharacter)` for backtrack-safe lookahead; `saveCursor()` / `restoreCursor()` (lines 607–619) use it.

### 2.4 Recursive Descent

The main recursive-descent entry point is `Expression.resolve()`, which dispatches to `resolveOperand()` (line 1687), then resolves binary operators by precedence. `resolveOperand()` recognizes the following:

| Start character | Node produced |
|---|---|
| `[` | `VectorNode` |
| `(` or `⁽` | parenthesized sub-expression |
| `∂` | `DerivativeNode` |
| `Đ` or `ꟲD` | Caputo fractional derivative |
| `∫` | `IntegralNode` |
| `Π` or `∏` | `ProductNode` |
| `∑` or `Σ` | `SumNode` |
| digit, `.`, `∞`, fraction glyph | numeric `LiteralConstantNode` |
| identifier character | `resolveIdentifier()` → `FunctionNode` / `VariableNode` / literal keyword |

### 2.5 Arrow Syntax and Currying

When the cursor is on an identifier and `parseExplicitInputVariableIfPresent()` (line 639) succeeds (i.e., the token is followed by `➔` or by `(params)=`), the parser treats it as a lambda declaration and calls `parseInputVariableAssignment()` (line 1775). This:

1. Sets `deferVariableResolution = true` on the new sub-expression.
2. Constructs a cloned child `Expression` with `upstreamExpression = this`.
3. Resolves the codomain functional type via `resolveChildDomain` / `resolveChildCoDomain`.
4. Recursively parses the lambda body into the child expression's `rootNode`.

Multi-parameter forms `(k,q)➔body` are handled by `parseParenParameterList()` (line 745): the first parameter becomes the independent variable and the rest are appended to `pendingParameterList` (line 733), which is consumed by the lambda parser to declare additional upstream-input variables.

### 2.6 Special-Syntax Grammar Features

| Syntax | Handled by |
|---|---|
| `Σf(k){k=lo…hi}` | `SumNode` constructor → `NAryOperationNode` |
| `Πf(k){k=lo…hi}` | `ProductNode` constructor → `NAryOperationNode` |
| `Σf(k,j){k=lo…hi,j=lo2…hi2}` | `parseMultisumIndices()` inside `NAryOperationNode` |
| `Σname∶ℓ=lo…hi` | family-binding in `registerFamilyFunction()` |
| `∫a^b f(x) dx` | `IntegralNode` |
| `∂f(x)` | `DerivativeNode` |
| `f⁻¹(x)` | `InverseFunctionNode` via `resolveIdentifier()` line 5714 |
| `ḟ(x)` | `resolveFunctionDerivative()` via combining dot (U+0307) |
| `f̈(x)` | `resolveFunctionSecondDerivative()` via combining two-dots (U+0308) |
| Common fractions `½ ¼ ¾ ⅓ …` | `isNumeric` → `LiteralConstantNode` with field name from `fractionConstantFieldNames` |
| `tⁿ⁻¹` | `collapseSuperscriptRuns()` → `t^(n-1)` before any parsing |
| `When(cond, yes, no)` | `WhenNode` |
| `He(n,x)` style calls | `FunctionNode` → looks up in `Context.functions` |
| `J_ν(x)` / `J0(x)` | `BesselFunctionNodeOfTheFirstKind` |

### 2.7 Identifier Resolution

`resolveIdentifier()` (line 5709) obtains a `VariableReference` by calling `resolveVariableReference()`, then chooses among:

- `⁻¹` followed by `(` → `InverseFunctionNode`
- `⁻¹` without `(` → `pow(-1)` rewrite
- `(` → `resolveFunction()` which tries `Context.functions` first, then member-function dispatch
- combining dot / two-dots → derivative shorthand
- otherwise → `resolveSymbolicLiteralConstantKeywordOrVariable()` which checks whether the reference name is a known symbolic constant (`π`, `e`, `ⅈ`, `∞`, `γ` etc.) and creates either a `LiteralConstantNode` or a `VariableNode`

---

## 3. AST Node Hierarchy

### 3.1 Generic Type Parameters

Every node is `Node<D, R, F extends Function<? extends D, ? extends R>>` where:

- `D` — domain type (e.g. `Integer`, `Real`, `Complex`, `RealPolynomial`)
- `R` — range / codomain type
- `F` — the `Function` interface type of the enclosing expression

These three parameters are propagated unchanged through unary and binary subtrees, and switched at the boundary of n-ary operand sub-expressions (which always have `D=Integer`, `F=Sequence<R>`).

### 3.2 Abstract Interface of Node

Key abstract and virtual methods on `Node<D,R,F>` (Node.java):

| Method | Signature | Purpose |
|---|---|---|
| `generate(MethodVisitor, Class<?>)` | abstract | Emits JVM bytecode for this subtree |
| `type()` | abstract | Returns the Java class of the value this node produces on the operand stack |
| `differentiate(VariableNode<D,R,F>)` | abstract | Returns the symbolic derivative AST node |
| `integral(VariableNode<D,R,F>)` | default throws | Returns the symbolic integral AST node |
| `fractionalDerivative(var, order)` | default wraps in `CaputoFractionalDerivativeNode` | Caputo fractional derivative |
| `accept(Consumer<Node<D,R,F>>)` | abstract | Post-order visitor traversal |
| `dependsOn(VariableNode<D,R,F>)` | concrete | Returns true if any `VariableNode` in this subtree references the given variable |
| `simplify()` | virtual | Algebraic simplification; returns simplified node (may be a new node) |
| `replaceConstantNodes()` | virtual | Wraps input-independent non-leaf subtrees in `StaticNode` |
| `isEquivalentTo(Node<?,?,?>)` | virtual | Structural equivalence check for CSE |
| `spliceInto(Expression<E,S,G>)` | abstract | Clones this node and all subtrees into a new expression context |
| `substitute(String, Node<E,S,G>)` | virtual | Replaces all `VariableNode`s with given name with the substitution subtree |
| `resolveVariables()` | virtual | Late-binding resolution of deferred `VariableNode` references |
| `resolveFunctions()` | virtual | Late-binding resolution of `FunctionNode` references |
| `isLeaf()` | default false | Overridden by leaf nodes |
| `isRootNode` | public boolean field | True when this node should store result into the `result` parameter |

### 3.3 Node Categories

#### Leaf Nodes

| Class | Description |
|---|---|
| `VariableNode<D,R,F>` | Reference to an input variable, context variable, or upstream-input variable. Holds a `VariableReference<D,C,F>`. On `generate()`, emits `GETFIELD this.varName`. On `accept()`, calls `t.accept(this)` only. |
| `LiteralConstantNode<D,R,F>` | A numeric constant (`"3.14"`, `"½"`, `"π"`, `"e"`, `"ⅈ"` etc.). Declares a final field in the generated class and emits `GETFIELD` on it. |
| `StaticNode<D,R,F>` | Wrapper for a constant (input-independent) subtree. Declared as a field; computed once in `evaluateStaticSubexpressions()` and subsequently loaded by `GETFIELD`. |
| `SharedNode<D,R,F>` | CSE wrapper. Canonical occurrence computes and stores via `PUTFIELD`; subsequent occurrences only load via `GETFIELD`. |

#### Unary Nodes (`nodes/unary/`)

| Class | Symbol / Trigger |
|---|---|
| `UnaryOperationNode<D,R,F>` | Abstract base; wraps a single operand node |
| `FunctionNode<D,R,F>` | Named function call `f(arg)` — looks up `Context.functions` or member methods |
| `FunctionalEvaluationNode<D,R,F>` | Postfix application `f(arg)` when `f` is already a functional value |
| `NegationNode` | Unary minus |
| `AbsoluteValueNode` | `|x|` postfix |
| `FactorialNode` | `n!` postfix |
| `FloorNode` / `CeilingNode` | `⌊x⌋` / `⌈x⌉` postfix |
| `GammaFunctionNode` | `Γ(x)` |
| `BesselFunctionNodeOfTheFirstKind` | `J_ν(x)` |
| `SphericalBesselFunctionNodeOfTheFirstKind` | `j_ν(x)` |
| `LommelPolynomialNode` | `R_{m,ν}(x)` |
| `HypergeometricFunctionNode` | `pFq(a;b;z)` |
| `MittagLefflerFunctionNode` | `E_{α,β}(z)` |
| `BetaFunctionNode` | `B(a,b)` |
| `BinomialCoefficientNode` | `C(n,k)` |
| `GammaJetNode`, `LogGammaJetNode`, `HardyZJetNode`, `RiemannSiegelThetaJetNode`, `SineIntegralJetNode`, `ZetaJetNode` | Jet (Taylor-series bundle) evaluations for special functions |
| `JetNode` | Base for all jet nodes; manages `JetState` stamp-based memoization |
| `InverseFunctionNode` | Compositional inverse `f⁻¹(x)` |
| `LambertWFunctionNode` | `W(z)` |
| `WhenNode` | Piecewise `When(cond, yes, no)` |
| `BooleanNegationNode` | `!x` |

#### Binary Nodes (`nodes/binary/`)

| Class | Symbol |
|---|---|
| `BinaryOperationNode<D,R,F>` | Abstract base; `left` and `right` child nodes |
| `AdditionNode` | `+` |
| `SubtractionNode` | `-` |
| `MultiplicationNode` | `*` (or juxtaposition) |
| `DivisionNode` | `/` |
| `ExponentiationNode` | `^` |
| `RisingFactorialNode` | Pochhammer symbol `(x)_n` |
| `ComparisonNode` | `<`, `>`, `<=`, `>=`, `=`, `≠` |
| `BooleanCombinatorNode` | `&&`, `||` |
| `Integration` | Definite integral node emitting numerical integration call |

#### N-ary Nodes (`nodes/nary/`)

| Class | Symbol |
|---|---|
| `NAryOperationNode<D,R,F>` | Abstract base for bounded accumulations |
| `SumNode<D,R,F>` | `Σ` / `∑` |
| `ProductNode<D,R,F>` | `Π` / `∏` |

#### Integral / Derivative Nodes (`nodes/`)

| Class | Purpose |
|---|---|
| `DerivativeNode` | Symbolic differentiation via `∂` prefix |
| `IntegralNode` | Symbolic / numerical integral via `∫` prefix |
| `NumericalIntegralNode` | Numerical integration (Gauss–Legendre) |
| `PolynomialIntegralNode` | Exact polynomial antiderivative |
| `RiemannLiouvilleFractionalIntegralNode` | Riemann–Liouville fractional integral |
| `CaputoFractionalDerivativeNode` | Caputo fractional derivative via `Đ^(α)` |
| `LimitNode` | Limit node |

#### Miscellaneous

| Class | Purpose |
|---|---|
| `ElseNode` | Piecewise else branch |
| `CongruenceClass` | Groups equivalent nodes for CSE |
| `CachedNode` | Marks subtrees as already-cached during optimization |
| `WeightedPartitionEnumeratorNode` | Drives partition enumeration for `Σname∶ℓ=lo…hi` syntax |
| `VectorNode` | `[a,b,c]` vector literal |

### 3.4 Key Tree-Walking Invariants

All `accept()` implementations must be post-order (children before `this`). Every recursive AST walker that might encounter a cyclic or already-visited node must guard with an `IdentityHashMap`-keyed visited set (see Section 12). The `NAryOperationNode.accept()` (NAryOperationNode.java line 214) descends into `operandExpression.rootNode` via a cast, which crosses the `D`/`Integer` type boundary.

---

## 4. Expression Class

`Expression<D,C,F>` (Expression.java, 6374 lines) has three roles:

### 4.1 AST Owner

| Field | Type | Purpose |
|---|---|---|
| `rootNode` | `Node<D,C,F>` | Root of the parsed AST |
| `expression` (string) | `String` | Current string representation; kept in sync with rootNode via `updateStringRepresentation()` |
| `className` | `String` | JVM binary name of the class to generate |
| `domainType` | `Class<? extends D>` | Domain type |
| `coDomainType` | `Class<? extends C>` | Codomain type |
| `functionClass` | `Class<? extends F>` | Function interface |
| `functionName` | `String` | Name assigned to this expression (used as field name for peer references) |

### 4.2 Compilation Driver Fields

| Field | Type | Purpose |
|---|---|---|
| `compiledClass` | `Class<F>` | Set after successful `loadFunctionClass()` |
| `instructions` | `byte[]` | Raw bytecode from `ClassWriter.toByteArray()` |
| `instance` | `F` | The canonical compiled instance; set by `instantiate()` |
| `generationContext` | `GenerationContext` | Enum state machine: `Evaluation` \| `Initialization` \| `StaticEvaluation` |
| `nextLocalVariableSlot` | `int` | Next free local slot in `evaluate()`; starts at 5 (slots 0–4 are `this`, input, order, bits, result) |
| `optimized` | `boolean` | Guard preventing repeated optimize passes |
| `hasStaticNodes` | `boolean` | Set after `replaceConstantNodes()` if any `StaticNode`s remain |

### 4.3 Runtime Metadata Fields

| Field | Type | Purpose |
|---|---|---|
| `referencedVariables` | `HashMap<String, VariableNode<D,C,F>>` | All variables referenced in this expression's body |
| `referencedFunctions` | `HashMap<String, FunctionMapping<?,?,?>>` | All function references in this expression's body |
| `literalConstants` | `HashMap<String, LiteralConstantNode<D,C,F>>` | Literal constant nodes keyed by their string representation |
| `intermediateVariables` | `HashMap<String, IntermediateVariable<D,C,F>>` | Temporary scratch variables declared as fields |
| `declaredVariables` | `HashSet<String>` | Names already declared as fields (idempotency guard) |
| `initializers` | `LinkedList<Consumer<MethodVisitor>>` | User-registered bytecode emitters called inside `initialize()` |
| `dependencies` | `List<Dependency>` | Topologically-sorted function reference order from `declareFunctionReferences()` |
| `upstreamExpression` | `Expression<?,?,?>` | Parent expression in the lambda-nesting chain; `null` for top-level |
| `subExpressions` | `List<Expression<?,?,?>>` | Child expressions produced by arrow lambdas |
| `functionalChild` | `Expression<?,?,?>` | The immediate functional child when this is a curried expression |
| `partialDerivativeCache` | `Map<String, F>` | Memoized partial derivatives keyed by variable name |

### 4.4 GenerationContext State Machine

`generationContext` (line 583) is an enum with three values (`GenerationContext.java`):

| Value | Active during | Effect on `bits` loading |
|---|---|---|
| `Evaluation` | `evaluate(D, int, int, C)` body generation | `ILOAD 3` gives `bits` |
| `Initialization` | `initialize()` body generation | No `bits` parameter; a fixed literal must be used |
| `StaticEvaluation` | `evaluateStaticSubexpressions(D, int, int, C)` body generation | `ILOAD 3` gives `bits`, same as Evaluation |

Nodes that need to load `bits` call `Compiler.loadBitsParameterOntoStack()`, which emits `ILOAD 3` only during `Evaluation`/`StaticEvaluation` contexts. During `Initialization` context the generated `initialize()` uses a hardcoded precision constant for any literal constants that need initialization.

### 4.5 upstreamExpression Chain

When a lambda expression `k➔body` or `(n,x)=body` is parsed, `parseInputVariableAssignment()` (line 1775) creates a child `Expression` with `upstreamExpression = this`. This chain:

- Determines which variables are "upstream-input" (visible from an ancestor but not declared in this expression's own scope).
- Controls `shouldCache()` (line 144): only top-level expressions (`upstreamExpression == null`) with integer domain are cached.
- Is walked by `nestedTypeString()` (line 398) for type-signature introspection.
- Feeds `declareVariables()` (line 1540): the parent's independent variable is declared as a field on the child so it can receive by-value copies.

### 4.6 compile(), optimize(), generate()

The entry point is `Expression.compile()` (line 1232):

```
compile() {
  if (compiledClass != null) return this;   // idempotent
  if (context == null) context = new Context();
  if (instructions == null) optimizeAndGenerate();
  compiledClass = loadFunctionClass(className, instructions, context);
}
```

`optimizeAndGenerate()` (line 1258):

1. `optimize()` (line 5067): calls `deduplicateJets()`, `replaceConstantNodes()`, `eliminateCommonSubexpressions()`. Sets `optimized = true`.
2. `generate()`: opens `ClassWriter`, declares header, calls `declareFields()`, generates `<init>()`, `initialize()`, `evaluate()`, and ancillary methods, then stores bytecode via `storeInstructions()`.
3. `loadFunctionClass()`: registers bytecode with `ExpressionClassLoader` and calls `loadClass()`.

---

## 5. Context and FunctionMapping

### 5.1 Context

`Context` (Context.java, 731 lines) is the shared environment for a cluster of related expressions. It is the unit of class loading: each `Context` owns exactly one `ExpressionClassLoader`.

```java
public class Context implements AutoCloseable {
  public final ObservableMap<String, Named>   variables;      // named arb values
  public final FunctionMappings               functions;      // named function mappings
  public ExpressionClassLoader               classLoader;    // per-context class loader
  public Map<String, Dependency>             functionReferenceGraph; // for topological sort
}
```

`variables` is a `JavaFX ObservableMap<String, Named>`. `Named` is the common superinterface of `Real`, `Complex`, `Integer`, `RealPolynomial`, etc. Any concrete arb value can be registered as a context variable.

`functions` is a `FunctionMappings` (extends `HashMap<String, FunctionMapping<?,?,?>>`) keyed by function name.

### 5.2 Variable Injection

After instantiation, `Context.injectVariableReferences(F f)` (line 296) iterates `variables` and reflectively writes each value into the matching public field on the compiled instance. `findAssignableField()` (line 284) is used to select the field by name AND type assignability, because a name can appear both in `variables` (as, say, a `Real` named `v`) and in `functions` (as a function returning `Real` also named `v`); two public fields with the same name but different descriptors can coexist in one JVM class.

### 5.3 Function Injection

`Context.injectFunctionReferences(F f)` (line 225) iterates `functions` and writes each `FunctionMapping.instance` into the matching public field on `f`. Same `findAssignableField` filtering applies.

### 5.4 FunctionMapping

`FunctionMapping<D,R,F>` (FunctionMapping.java, 235 lines) is the declaration record for one named function:

| Field | Purpose |
|---|---|
| `functionName` | JVM field name / class name (no dots) |
| `domain` | `Class<D>` of the domain |
| `coDomain` | `Class<R>` of the codomain |
| `functionClass` | `Class<F>` of the function interface |
| `expression` | The `Expression<D,R,F>` whose compiled class implements this mapping (may be `null` for hand-written functions) |
| `expressionString` | The original source string (for lazily compiling `expression`) |
| `instance` | The compiled and instantiated `F`; `null` until `instantiate()` is called |
| `declaredAs` | Cached JVM field descriptor string |

Key methods:

- `functionFieldDescriptor()` (line 108): returns `Lsomething;` where `something` is the class/interface internal name. When `functionClass` is an interface, returns the interface descriptor. When the class is not yet compiled (expression-only mapping), returns `L<functionName>;` using a forward-reference symbolic name that the JVM resolves lazily.
- `declare(ClassVisitor, String)` (line 146): emits `visitField(ACC_PUBLIC, name, descriptor, null, null)` on the outer class.
- `instantiate()` (line 132): compiles if necessary and calls `expression.instantiate()`.

### 5.5 Forward-Declaration and parseCompileAndRegister

The idiomatic pattern for mutually-recursive functions (`a ↔ S`) is:

```java
context.registerFunctionMapping("a", null, Integer.class, Real.class, Sequence.class, true, null, null);
// ... parse a's expression which references S
// ... parse S's expression which references a
```

`Function.parseCompileAndRegister(...)` uses this: it registers a mapping with a non-null `expression` but `instance == null`. The generated `initialize()` bytecode uses the symbolic class name (the `functionName` string) rather than a resolved `Class<?>` reference, deferring resolution to JVM class-loading time — by which point the entire recursive cluster has been compiled (Expression.java lines 1270–1302 comment block).

### 5.6 populateFunctionReferenceGraph / sortDependencies

`Context.populateFunctionReferenceGraph()` (line 420) constructs `functionReferenceGraph: Map<String, Dependency>` by iterating `functions`. For each mapping whose expression is non-null, the mapping's `expression.getReferencedFunctions().keySet()` (minus self-references) becomes the dependency list. `Utensils.sortDependencies()` topologically sorts this graph; `Utensils.detectStructuralCycle()` throws if a cycle is present among compile-time references. The sorted `dependencies` list governs the order in which function fields are declared in `declareFields()` and the order in which `initializeReferencedFunctionVariableReferences()` is called in `initialize()`.

---

## 6. Codegen Pipeline

`Expression.generate()` opens an ASM `ClassWriter(COMPUTE_FRAMES)` and emits a complete JVM class. The class:

- Has binary name `className` (a simple unqualified identifier).
- Implements `functionClass` (e.g. `RealFunction`) plus `Typesettable`, `AutoCloseable`, `Initializable`, `Named`.
- Extends `Object`.

The following sections trace `generate()` step by step.

### 6.1 declareFields (lines 1359–1377)

```java
protected void declareFields(ClassVisitor cw) {
    cw.visitField(ACC_PUBLIC, "isInitialized", "Z", null, null);           // boolean
    if (hasStaticNodes) {
        cw.visitField(ACC_PUBLIC, "staticPrecision", "I", null, null);     // int
    }
    declareContext(cw);                // protected Context context
    declareSourceExpressionField(cw); // public Expression expression
    declareCacheField(cw);            // private final TreeMap cache  (when shouldCache())
    if (!coDomainType.isInterface()) {
        declareLiteralConstants(cw);  // one field per LiteralConstantNode
    }
    declareFunctionReferences(cw);   // one field per referenced function, in dep order
    declareVariables(cw);            // upstream-input vars + context vars
    declareJetStampFields(cw);       // evalStamp + jetStamp_X for each JetState
    declareDerivativeCacheField(cw); // public ArrayList derivativeCache
}
```

**Fields emitted:**

| Field name | Descriptor | Purpose |
|---|---|---|
| `isInitialized` | `Z` (boolean) | Guards `initialize()` re-entry |
| `staticPrecision` | `I` (int) | Tracks the precision at which `evaluateStaticSubexpressions` last ran; `-1` = stale |
| `context` | `Larb/expressions/Context;` | The shared context |
| `expression` | `Larb/expressions/Expression;` | Back-pointer to this `Expression` object |
| `cache` | `Ljava/util/TreeMap;` | Integer→C memoization table (only when `shouldCache()`) |
| literal constant fields | varies | One per `LiteralConstantNode`; name from `LiteralConstantNode.fieldName` |
| function reference fields | `L<functionName>;` | One per `FunctionMapping` in dependency order |
| variable fields | varies | One per context variable or upstream-input variable |
| `evalStamp` | `I` | Incremented on each `evaluate()` call (only when `JetNode`s present) |
| `jetStamp_X` | `I` | One per unique `JetState`; compared to `evalStamp` to skip redundant jet computation |
| `derivativeCache` | `Ljava/util/ArrayList;` | Holds `Function` derivatives for Taylor series |

### 6.2 Constructor `<init>()`

The generated constructor calls `super()` (i.e., `Object.<init>`) and then initializes:

- The `cache` field via `generateCacheFieldInitializer()` (line 158): `this.cache = new TreeMap()`.
- Each `LiteralConstantNode` field via `generateLiteralConstantInitializers()` (line 3522): numeric fields are set via `arb.Integer.set(long)` or `Real.set(String, int)` etc.
- Each `IntermediateVariable` field via `generateIntermediateVariableInitializers()` (line 3507): allocates the scratch object.

### 6.3 generateInitializationCode (line 2776)

`initialize()` is a public void no-arg method. Its body is generated by `generateInitializationCode()`:

```
initialize() {
  1. generateCodeToThrowErrorIfAlreadyInitialized(mv)
     // if (isInitialized) throw new AssertionError("already initialized")

  2. generateDerivativeCacheFieldInitializer(mv)
     // this.derivativeCache = new ArrayList()

  3. addChecksForNullVariableReferences(mv)
     // for each declared variable field: assert this.varName != null

  4. generateReferencedFunctionInstances(mv)          // line 3551
     // for each mapping in referencedFunctions.values():
     //   constructReferencedFunctionInstanceIfItIsNull(mv, mapping)

  5. propagateUpstreamInputVariablesToNestedFunctions(mv)
     // copy this.v, this.μ etc. into each nested function's corresponding fields

  6. for each Dependency in dependencies:
     //   generateDependencyAssignments(mv, dependency)

  7. generationContext = Initialization
     //   for each initializer in initializers: initializer.accept(mv)
     // (this is where NAryOperationNode registers propagateContextVariablesToOperand)
  8. generationContext = Evaluation (restored)

  9. if (recursive): generateSelfReference(mv)

  10. generateCodeToSetIsInitializedToTrue(mv)
      // this.isInitialized = true
}
```

#### 6.3.1 constructReferencedFunctionInstanceIfItIsNull (line 1267)

For each `FunctionMapping mapping` in `referencedFunctions`:

```
if (this.<mapping.functionName> == null) {
    this.<mapping.functionName> = new <typeInternalName>();
    this.<mapping.functionName>.context = this.context;
}
```

The class name used in `NEW` and `INVOKESPECIAL` is the symbolic `mapping.functionName` string, not a resolved class. The JVM resolves it lazily on first execution — by which point the outer compile chain has defined all classes. The `context` propagation at lines 1295–1300 injects the live populated `Context` into the newly allocated instance so its own `initialize()` can see the registered functions and variables.

#### 6.3.2 generateReferencedFunctionInstances (line 3551)

Calls `constructReferencedFunctionInstanceIfItIsNull` for every mapping in `referencedFunctions.values()`.

#### 6.3.3 propagateUpstreamInputVariablesToNestedFunctions

For each referenced function `f` whose expression is known, iterates `context.variableClassStream()` and emits for each variable `v`:

```
if (this.f.v == null) this.f.v = new VarType();
this.f.v.set(this.v);
```

This is the variable-injection path used when `mapping.instance` was non-null at codegen time (haveLiveInstance branch in `generateFunctionInitializer`, line 2684).

### 6.4 generateEvaluateMethod

The evaluate method has signature `C evaluate(D in, int order, int bits, C result)` at the bytecode level (all erased to `Object, int, int, Object`). Its generation:

```
evaluate(in, order, bits, result) {

  [if hasStaticNodes]:
    if (this.staticPrecision < bits) {
      this.evaluateStaticSubexpressions(in, order, bits, result);
    }

  [if shouldCache()]:
    C cached = this.cache.get(in);   // cache peek prologue
    if (cached != null) {
      result.set(cached); return result;
    }

  [if order > 1]:     // Taylor series path (line ~210)
    goto taylorLabel;

  [if functional codomain — isGeneratedFunctional()]:
    <generateFunctionalElement(mv)>  // see 6.4.1
    return result;

  [else]:
    rootNode.generate(mv, coDomainType);  // recursive AST emit
    [if isRootNode]: store result
    ARETURN;

  [taylorLabel]:
    generateTaylorSeriesPath(mv, taylorLabel);  // line 210
}
```

#### 6.4.1 generateFunctionalElement (line 2517)

When `coDomainType.isInterface()` is true (i.e., `RealFunction`, `ComplexFunction`, etc. as codomain), `evaluate()` must return a new function object rather than a scalar. `generateFunctionalElement()` does:

1. Creates `functional = newFunctionalExpression()`: a child `Expression` cloned from `this` with the functional interface as its function class.
2. Splices the parent's independent variable into the child: `functionalIndependentVariable = getIndependentVariable().spliceInto(functional).asVariable()`.
3. Calls `functional.generate()` recursively — this compiles the child class.
4. Emits `new <functional.className>()` onto the operand stack.
5. Emits `DUP` + `INVOKESPECIAL <init>()V`.
6. If `functionalDependsOnIndependentVariable`: calls `copyIndependentVariableToFunctionalByValue()` to copy `this.in.set(input)` into the new instance.
7. `propagateUpstreamInputVariablesToFunctional(mv, functional)` (line 2577): for each upstream variable referenced by the functional, emits:
   ```
   if (funcInst.varName == null) funcInst.varName = new VarType();
   funcInst.varName.set(this.varName);
   ```
8. `propagateContext(mv, functional)`: wires `funcInst.context = this.context`.
9. `invokeInitializationMethod(mv, functional)`: emits `DUP` + `INVOKEVIRTUAL initialize()V`.
10. Falls through to `return result` (the functional instance IS the result for functional codomain).
11. Returns `functional.compile()` which triggers compilation of the child class.

### 6.5 newInstance (line 4979) and instantiate (line 3962)

`newInstance()` (line 4979) calls `compiledClass.getDeclaredConstructor().newInstance()`. It does NOT set `this.instance`.

`instantiate()` (line 3962) is the full wiring sequence:

```java
F freshInstance = newInstance();                          // no-arg constructor
instantiateAndInjectReferencedFunctions(freshInstance);  // line 4422
injectReferences(freshInstance);                         // Context-side injection
verifyFieldGraphAcyclic(freshInstance);                  // line 4219
cloneNonReentrantReferencedFunctions(freshInstance);
populateSourceExpressionBackPointer(freshInstance);
instance = freshInstance;
return freshInstance;
```

#### 6.5.1 instantiateAndInjectReferencedFunctions (line 4422)

For each `FunctionMapping mapping` in `referencedFunctions` where `mapping.instance == null` and `mapping.expression != null`:

1. Calls `mapping.instantiate()` recursively — this compiles and instantiates the dependent expression.
2. Reflectively writes the instance onto the parent: `parentClass.getField(name).set(parentInstance, referencedInstance)` (only if the field is currently null).
3. Calls `context.injectVariableReferences(referencedFunction)` and `context.injectFunctionReferences(referencedFunction)` to propagate context variables into the dependent.

This is the fix-up path for forward-declared mappings (registered with `expression != null` but `instance == null`).

#### 6.5.2 verifyFieldGraphAcyclic (line 4219)

A post-instantiation runtime DFS over the live field graph. It uses two maps:

- `visited: IdentityHashMap<Object, Boolean>` — prevents re-visiting the same instance twice (handles structural sharing and cycles).
- `firstSeen: IdentityHashMap<FunctionMapping, Object>` — records the first instance observed for each `FunctionMapping`. If a second distinct instance is found for the same mapping, throws `CyclicFunctionReferenceException`.

This verifier detects the allocate-and-wire-per-frame mistake (the bug described in Section 8) post-hoc. It does not fix it.

---

## 7. NAryOperationNode Codegen

`NAryOperationNode<D,R,F>` (NAryOperationNode.java, 1229 lines) compiles bounded sums and products into a loop.

### 7.1 assignFieldNames (line 260)

Called from the constructor before `parseOperand()`:

```java
protected void assignFieldNamesIfNecessary(Class<?> resultType) {
    if (operandFunctionFieldName == null) {
        operandFunctionFieldName =
            expression.getNextIntermediateVariableFieldName("operand", Function.class);
        // → "operandF0001", "operandF0002", etc.
    }
    if (operandValueFieldName == null) {
        operandValueFieldName =
            expression.newIntermediateVariable("value", resultType);
        // → "value0001", etc.
    }
}
```

The `operandFunctionFieldName` is also used as the generated class name for the operand sub-expression.

### 7.2 parseOperand (line 528)

```java
private void parseOperand() {
    // 1. Check for arrow-syntax: k➔body
    String arrowVar = expression.parseExplicitInputVariableIfPresent();
    if (arrowVar != null) indexVariableFieldName = arrowVar;

    // 2. Create operand expression with Integer domain
    operandExpression = new Expression<>(Integer.class, operandCoDomain, Sequence.class);
    operandExpression.continueParsingFrom(expression);  // sync cursor
    operandExpression.upstreamExpression = expression;
    operandExpression.setContext(expression.getContext());
    operandExpression.className = operandFunctionFieldName;  // class name = field name

    // 3. Assign input variable or defer
    if (arrowVar != null) {
        VariableNode<Integer,R,Sequence<R>> indexVar =
            new VariableNode<>(operandExpression, ..., false);
        operandExpression.assignInputVariable(indexVar);
    } else {
        operandExpression.deferVariableResolution = true;
    }

    // 4. Parse the body
    operandExpression.rootNode = operandExpression.resolve();

    // 5. Sync parent cursor forward past what the child consumed
    expression.continueParsingFrom(operandExpression);
    operandExpression.updateStringRepresentation();

    // 6. Register in Context
    registerOperand(operandFunctionFieldName, operandExpression);
    propagateContextVariablesToOperand();
}
```

The critical ordering: `continueParsingFrom` before `resolve()`, then `continueParsingFrom` again after, then `updateStringRepresentation()`. Setting `expression.string` before `resolve()` would cause nested `NAryOperationNode` constructors to see the parent sigil at position 0 and recurse without bound.

### 7.3 registerOperand (line 565 / 1046)

```java
void registerOperand(String expr, Expression<Integer,R,Sequence<R>> operandExpression) {
    operandMapping = expression.getContext().registerFunctionMapping(
        operandFunctionFieldName, null, Integer.class,
        operandExpression.coDomainType, Sequence.class,
        true, operandExpression, expr);
    expression.registerReferencedFunction(operandFunctionFieldName, operandMapping);
}
```

The mapping is registered with `instance = null` and `expression = operandExpression`. The operand class is compiled lazily by `ExpressionClassLoader.findClass()` (line 112) the first time the outer class references its name.

### 7.4 propagateInputToOperand bytecode (lines 924–995)

Called from the generated `evaluate()` of the outer class for each loop iteration. Emits:

```
// For the outer expression's independent variable (e.g. 'n' from a real function n↦Σf(k))
if (this.operandFXXXX.n == null) this.operandFXXXX.n = new DomainType();
this.operandFXXXX.n.set(input);   // propagate by value

// For each upstream-input variable v that the operand references:
if (this.operandFXXXX.v == null) this.operandFXXXX.v = new VarType();
this.operandFXXXX.v.set(this.v);   // propagate by value
```

The null-check-then-allocate pattern is the `if (peer == null) peer = new Peer()` problematic guard discussed in Section 8. Lines 880–916 (`propagateContextVariableToOperand`) and lines 966–984 (`generateCodeToPropagateIndependentUpstreamVariablesToOperand`) contain this pattern. The problem: if the operand was instantiated with peers already injected, re-allocating new instances here breaks the shared memo caches.

### 7.5 Generated Loop Structure

The body of the outer `evaluate()` for a sum/product:

```
arb.Integer index  = new arb.Integer();   // local slot indexVariableLocalSlot
C accumulator      = this.<valueField>;   // from outer class field
C scratch          = this.<scratchField>;
C upperCache       = this.<upperField>;

accumulator.identity();              // 0 for sum, 1 for product
index.set(lowerLimit);
upperCache.set(upperLimit);

while (index.compareTo(upperCache) <= 0) {
    this.<operandFXXXX>.evaluate(index, 1, bits, scratch);  // call operand
    accumulator = accumulator.<operation>(scratch, bits);    // add/mul
    index.increment();
}

result.set(accumulator);
return result;
```

`propagateInputToOperand(mv)` is emitted immediately before the loop body inside `evaluate()`.

### 7.6 Inner-Level Peer-Lifting (lines 770–820)

Multi-index sums `Σf(k,j){k=lo1…hi1, j=lo2…hi2}` are parsed by `parseMultisumIndices()` (line 755). Each additional index variable creates a nested `NAryOperationNode` inside `currentOperandExpression`:

```
outer NAry (index k, body = innerLevel)
  innerLevel NAry (index j, body = original f(k,j) body)
    innerOperandExpression (class "operandF0002") hosts f(k,j)
```

The inner level's `operandMapping` is registered in `currentOperandExpression.getContext()` and added to `currentOperandExpression.registerReferencedFunction(...)`. The `initializeReferencedFunctionVariableReferences` call at line 3577 injects context variables into each level in sequence.

---

## 8. The Cyclic-Reference Bug

### 8.1 Canonical Example: Riccati Müntz Recurrence

Issues: #982, #993, #995, #996, #997, #1000.

The recurrence for the fractional Riccati equation involves two mutually recursive sequences:

```
a(k) = (sum involving S)
S(k) = (sum involving a)
```

In arb4j expression notation:

```
a: Σa_body{k=0…n}     // body references S(k)
S: Σs_body{k=0…n}     // body references a(k)
```

Both `a` and `S` reference each other through sum operands. The operand `Sequence` classes (`operandFXXXX`) themselves reference both `a` and `S` as peer fields.

### 8.2 How the Bug Manifests

**During evaluate(k):**

In the generated `evaluate(k)` of the `a` class, `propagateInputToOperand` emits (simplified):

```java
if (this.operandF0001.S == null) this.operandF0001.S = new S();
this.operandF0001.S.set(...);
```

This `new S()` creates a fresh instance of `S` with no memo cache entries and no peer fields (`a`, `operandF0001`) wired. Similarly, the `S.evaluate()` body creates a `new a()` inside `propagateInputToOperand` on each call.

**During initialize():**

```java
if (this.S == null) this.S = new S();
this.S.context = this.context;
```

If `this.S` was already set by `instantiateAndInjectReferencedFunctions()` to a properly-wired canonical instance, this null-check saves it. But if `this.S` was null (because the forward-declared mapping had no `instance` yet at injection time), a fresh uninitialized `S` is allocated.

**Result:**

Every recursive descent through `evaluate` allocates fresh `a` and `S` instances. These fresh instances have:
- Disjoint memo caches: they cannot see each other's results.
- Un-wired peer fields: their `initialize()` has not been called.
- No context-variable injection (v, μ are null).

The system either NPEs (`this.He is null`) or produces infinite recursion consuming the memo cache.

### 8.3 Current State: verifyFieldGraphAcyclic (commit 1424670)

The verifier added in `Expression.verifyFieldGraphAcyclic()` (line 4219) walks the live field graph after instantiation. When two distinct instances of the same `FunctionMapping` are reachable from the root, it throws:

```
CyclicFunctionReferenceException: Two distinct instances of FunctionMapping 'S'
are reachable from the root:
  first   : S@123456 (registry-canonical)
  second  : S@789ABC reachable via <root>.operandF0001.S
This indicates allocate-and-wire-per-frame initialization...
```

This is a post-hoc detector; it does not fix the bug.

### 8.4 Required Fix (Issue #1000, Points #3 and #11)

The correct fix is **allocate-all-then-wire-all** with a **visited-set on every recursive walker**:

1. Allocate all instances in the cluster first (using symbolic forward references) without any wiring.
2. Then, in a second pass, set all peer fields using the canonical registry instances.
3. Every method that recursively walks the field graph (`invalidateCache`, `cloneFunction`, `initialize`, etc.) must accept and check an `IdentityHashMap<Object,Boolean> visited` parameter to avoid unbounded re-entry on cyclic graphs.

### 8.5 Issue #1000: Catalog of 14 Mistakes

| # | Site | Description | Disposition |
|---|---|---|---|
| 1 | `propagateContextVariableToOperand` (NAryOp line 879) | `if (operand.field == null) operand.field = new T()` inside `initialize()` re-allocates fresh instances that bypass the canonical registry | **Unimplemented fix** |
| 2 | `generateCodeToPropagateIndependentVariableToOperand` (NAryOp line 997) | Same allocate-on-null pattern for the outer expression's independent variable propagation | **Unimplemented fix** |
| 3 | `generateCodeToPropagateIndependentUpstreamVariablesToOperand` (NAryOp line 939) | Same pattern for upstream-input variables | **Unimplemented fix** |
| 4 | `propagateUpstreamInputVariablesToFunctional` (Expression line 2577) | Same allocate-on-null for functional child propagation | **Unimplemented fix** |
| 5 | `constructReferencedFunctionInstanceIfItIsNull` (Expression line 1267) | `if (this.f == null) { this.f = new F(); this.f.context = this.context; }` — allocates new instance instead of reusing canonical | **Unimplemented fix** |
| 6 | `generateSelfReference` (Expression line 3556) | Self-referential null-guard `if (this.self == null) this.self = new Self()` — correct pattern but only works if called after all other allocations | **Partial** |
| 7 | `generatePeerOperandSelfInjections` (Expression line 3593) | Emits peer injection but uses `if (!peer.isInitialized) peer.initialize()` which allocates sub-instances without visited-set | **Unimplemented fix** |
| 8 | `instantiateAndInjectReferencedFunctions` (Expression line 4422) | Calls `mapping.instantiate()` recursively then reflectively writes instance; correct only when no cycle | **Partial** |
| 9 | `shouldCache()` (Expression line 144) | Returns true for integer-domain top-level; generated functionals (inner lambdas) skip the cache entirely even when they should memoize | **Unimplemented** |
| 10 | `Utensils.detectStructuralCycle` (via `declareFunctionReferences`) | AST-based cycle detection runs at compile time but misses runtime cycles produced by propagate-on-frame | **Reverted / insufficient** |
| 11 | Every `Node.accept()` walk (`nodeStream`, `accept` visitor) | None of these walkers carry a visited-set; on a mutually-recursive AST they risk stack overflow | **Unimplemented fix** |
| 12 | `cloneNonReentrantReferencedFunctions` (Expression line 4091) | Called after `verifyFieldGraphAcyclic` so it does not produce false positives; but the cloning itself creates non-canonical instances that would re-trigger the verifier if called in a cycle | **Partial** |
| 13 | `invalidateCache(Set)` (generated method) | Generated with an identity visited-set guard (Expression line 2866), so this walker is correct | **Implemented** |
| 14 | `verifyFieldGraphAcyclic` / `walkFieldGraphForCycleCheck` (Expression line 4280) | Uses `IdentityHashMap visited` correctly; detects post-hoc but does not prevent | **Detector only** |

---

## 9. Generated-Class Shape

### 9.1 Typical Fields

For a sum expression `S: n↦Σ(k*a(k)){k=0…n}` compiled as a `RealSequence`:

```java
public class S implements RealSequence, Typesettable, AutoCloseable, Initializable, Named {
    public boolean     isInitialized;
    public int         staticPrecision;       // if static nodes present
    protected Context  context;
    public Expression  expression;            // back-pointer
    // literal constant fields (none in this example)
    public a           a;                     // referenced function field
    public operandF0001 operandF0001;         // the operand Sequence class
    // intermediate variable fields
    public Real        value0001;             // accumulator
    public Real        value0002;             // scratch
    public Integer     value0003;             // index upper bound cache
    public ArrayList   derivativeCache;
}
```

### 9.2 evaluate(Integer n, int order, int bits, Real result)

Bytecode outline for the above (pseudocode):

```java
public Real evaluate(Integer n, int order, int bits, Real result) {
    // cache peek (when shouldCache())
    Real cached = (Real) this.cache.get(n);
    if (cached != null) { result.set(cached); return result; }

    // propagate input to operand
    if (this.operandF0001.n == null) this.operandF0001.n = new Integer();
    this.operandF0001.n.set(n);

    // loop
    this.value0001.identity();         // accumulator = 0
    this.value0003.set(n);             // cachedUpper = n
    Integer index = new Integer();     // local slot 5
    index.set(0);                       // lower = 0
    while (index.compareTo(this.value0003) <= 0) {
        this.operandF0001.evaluate(index, 1, bits, this.value0002);  // scratch
        this.value0001 = this.value0001.add(this.value0002, bits);
        index.increment();
    }
    result.set(this.value0001);

    // cache poke
    this.cache.put(n.clone(), result.clone());
    return result;
}
```

### 9.3 initialize()

```java
public void initialize() {
    assert !isInitialized : "already initialized";
    this.derivativeCache = new ArrayList();
    // null-checks for referenced variables
    assert this.context != null : "context is null";
    // instantiate referenced functions
    if (this.a == null) {
        this.a = new a();
        this.a.context = this.context;
    }
    if (this.operandF0001 == null) {
        this.operandF0001 = new operandF0001();
        this.operandF0001.context = this.context;
    }
    // propagate variables to nested functions
    if (this.operandF0001.v == null) this.operandF0001.v = new Real();
    this.operandF0001.v.set(this.v);
    // ...
    this.isInitialized = true;
}
```

### 9.4 operandF0001 class shape

The operand sub-expression `k*a(k)` compiled as `Sequence<Real>`:

```java
public class operandF0001 implements Sequence<Real>, ... {
    public boolean    isInitialized;
    protected Context context;
    public Expression expression;
    public a          a;               // referenced peer
    // intermediate variables
    public Real       ℝ0001;           // scratch for k*a(k)
    public ArrayList  derivativeCache;

    public Real evaluate(Integer k, int order, int bits, Real result) {
        // k is the input; a.evaluate(k, 1, bits, ℝ0001)
        this.a.evaluate(k, 1, bits, this.ℝ0001);
        // multiply k * ℝ0001 → result
        result.set(k).mul(this.ℝ0001, bits, result);
        return result;
    }
    public void initialize() {
        if (this.a == null) { this.a = new a(); this.a.context = this.context; }
        // ...
        this.isInitialized = true;
    }
}
```

### 9.5 The Heston / Probabilist Hermite Failing Case

The error `this.He is null` from `operandF0001.evaluate` arises in the pattern where:

1. The outer expression `S` compiles `operandF0001` which has field `He` (a `HermitePolynomialSequence`).
2. `S.instantiate()` calls `instantiateAndInjectReferencedFunctions()` which walks `referencedFunctions` and sees `He` with `mapping.instance == null` (forward-declared).
3. `mapping.instantiate()` is called for `He`, but `He`'s `initialize()` tries to call back into `S` via a field `S` on the `He` instance, which is null.
4. `injectReferences()` for `operandF0001` happens but `He` has already been written to `operandF0001.He` without having `S` wired into `He.S`.

The root is mistake #5 above: each `constructReferencedFunctionInstanceIfItIsNull` call allocates a fresh `He` with no context. When `operandF0001.evaluate()` is first called, `operandF0001.He` is the fresh uninitialized instance, so `He.evaluate()` NPEs on its own dependent fields.

### 9.6 Hardy-Z Bessel Coefficient Case

For an expression like `Z(t) = 2 * Σ J₀(2π√k t) {k=1…N}`, the generated outer class has:

- Field `HardyZJetField` of type `HardyZJetNode`'s generated class.
- Field `evalStamp` and `jetStamp_0` for memoizing the Hardy-Z jet computation.
- The operand class computes `J₀(2π√k·t)` via `BesselFunctionNodeOfTheFirstKind`, calling the FLINT native `arb_hypgeom_bessel_j` method.

The jet fields are separate from the loop accumulator; jet nodes emit:

```java
if (this.jetStamp_0 != this.evalStamp) {
    // recompute the jet polynomial at current t
    this.hardyZJet.evaluate(t, maxCoeffOrder, bits, this.jetPoly);
    this.jetStamp_0 = this.evalStamp;
}
result.set(this.jetPoly.getCoefficient(coeffIndex));
```

---

## 10. Class Loading

### 10.1 ExpressionClassLoader

`ExpressionClassLoader` (ExpressionClassLoader.java, 157 lines) extends `ClassLoader`. One instance is created per `Context` (Context.java line 138).

**Key fields:**

| Field | Type | Purpose |
|---|---|---|
| `pendingBytecodes` | `HashMap<String, byte[]>` | Bytecodes registered before `loadClass` is called |
| `compiledClasses` | `HashMap<String, Class<?>>` | Classes already defined by this loader |
| `context` | `Context` | The owning context; used for on-demand compilation |

### 10.2 Registration and Loading Sequence

1. `Expression.generate()` calls `ClassWriter.toByteArray()` to produce `instructions`.
2. `Expression.loadFunctionClass()` calls `context.classLoader.registerBytecodes(className, instructions)`.
3. `context.classLoader.loadClass(className)` is called (via `loadFunctionClass`).
4. `ClassLoader.loadClass` delegates to the parent first. If the class is already on the classpath (e.g. pre-compiled by Maven plugin), it is returned from the system loader without ever calling `findClass`.
5. If not found by the parent, `findClass(name)` is invoked:
   - Checks `compiledClasses` (already defined in this loader).
   - Looks up `pendingBytecodes.remove(name)`: if found, calls `defineClass(name, bytecodes, ...)` and caches in `compiledClasses`.
   - Falls back to `context.getFunctionMapping(name)`: if a mapping with a non-null `expression` is found, calls `mapping.instantiate()` to trigger compilation on demand.
   - Falls back to searching all mappings by `functionClass.getName()`.
   - Throws `ClassNotFoundException` if none succeed.

### 10.3 Mutual Recursion Across Loaders

All classes in a mutually-recursive cluster (e.g. `a`, `S`, `operandF0001`, `operandF0002`) share the same `Context` and therefore the same `ExpressionClassLoader`. When the JVM resolves `NEW a` inside `operandF0001.initialize()`, it asks the loader that defined `operandF0001` for class `a`. Since that loader is the context's `ExpressionClassLoader` and `a` was registered in `pendingBytecodes` before `operandF0001.class` was loaded, the resolution succeeds.

### 10.4 Context.resetClassLoader()

`Context.resetClassLoader()` discards the current `ExpressionClassLoader` and creates a new one. All `FunctionMapping.invalidateDescriptorCache()` calls should accompany a reset to prevent stale field descriptors referencing classes defined by the old loader.

---

## 11. Caching and Memoization

### 11.1 shouldCache()

`Expression.shouldCache()` (line 144):

```java
public boolean shouldCache() {
    return domainType.equals(Integer.class) && upstreamExpression == null;
}
```

Only top-level expressions (not inner lambdas) with integer domain are cached. This means:
- A sequence `n↦f(n)` at the top level is cached.
- The operand sub-expression (`operandFXXXX`, which is always `Integer→R`) is NOT cached because `upstreamExpression != null`.
- Real-domain expressions are never cached (the domain is continuous, so an integer key would lose precision).

Issue #993 mistake #9: this rule intentionally (but arguably incorrectly) skips caching for generated functionals (inner lambdas with arrow syntax). If an inner lambda such as `k↦He(k,x)` is evaluated many times with the same `k` but different outer contexts, it recomputes each time.

### 11.2 Cache Structure

When `shouldCache()`, `declareCacheField()` (line 149) emits:

```java
private final TreeMap<arb.Integer, C> cache;
```

The constructor initializer allocates it: `this.cache = new TreeMap()`.

### 11.3 Peek Prologue

At the top of the generated `evaluate()` body, when `shouldCache()`:

```java
C cached = (C) this.cache.get(in);   // INVOKEVIRTUAL TreeMap.get
if (cached != null) {
    result.set(cached);
    return result;
}
```

### 11.4 Poke Epilogue

After the result is computed and before `ARETURN`:

```java
this.cache.put(in.clone(), result.clone());
```

The key and value are cloned because `in` and `result` are mutable objects reused across calls by the caller.

### 11.5 invalidateCache

The generated `invalidateCache(Set alreadyInvalidated)` method (emitted by `generateInvalidateStaticCacheMethod`, line 2850) is the cycle-safe cache invalidator:

```java
public void invalidateCache(Set alreadyInvalidated) {
    if (!alreadyInvalidated.add(this)) return;  // visited-set guard
    if (hasStaticNodes) this.staticPrecision = -1;
    if (shouldCache()) this.cache.clear();
    // recurse into referenced function fields
    for each referenced function f:
        if (this.f != null) this.f.invalidateCache(alreadyInvalidated);
}
```

This is one of the correctly implemented cycle-safe walkers (mistake #13 in the table is resolved). The no-arg overload `invalidateCache()` allocates a fresh `IdentityHashMap`-backed set and delegates.

### 11.6 staticPrecision

When `hasStaticNodes` is true, the generated `evaluate()` checks:

```java
if (bits > this.staticPrecision) {
    this.evaluateStaticSubexpressions(in, order, bits, result);
}
```

`evaluateStaticSubexpressions()` computes each `StaticNode` delegate and stores the result into the corresponding field, then sets `this.staticPrecision = bits`. This ensures that when the caller requests higher precision, static subexpressions are recomputed at the new precision. When `invalidateCache()` is called, `staticPrecision` is reset to `-1`, forcing re-evaluation on the next `evaluate()` call regardless of the bits argument.

---

## 12. Cross-Cutting Invariants and Known Bug Patterns

### 12.1 Every Recursive Walker Needs a Visited-Set

Any method that recursively traverses the field graph or AST of potentially mutually-recursive expressions must use an `IdentityHashMap<Object, Boolean>` visited set to prevent unbounded recursion. The existing implementations are audited below:

| Walker | Has visited-set? | Notes |
|---|---|---|
| `invalidateCache(Set)` | Yes | Identity-set-backed `Set`, correct |
| `verifyFieldGraphAcyclic` | Yes | `IdentityHashMap<Object, Boolean>`, correct |
| `walkFieldGraphForCycleCheck` | Yes | Called by verifier, correct |
| `cloneNonReentrantReferencedFunctions` | No | Only walks one level; no recursive descent |
| `instantiateAndInjectReferencedFunctions` | No | Calls `mapping.instantiate()` recursively; may cycle |
| `generatePeerOperandSelfInjections` | No | Walks `referencedFunctions` but not the live graph |
| `Node.nodeStream()` / `accept()` | No | Pure AST walker; cycles possible only if AST has back-edges |
| `dependsOn()` | No | Pure AST walk; assumes DAG |
| `simplify()` | No | Assumes DAG |
| `replaceConstantNodes()` | No | Assumes DAG |

### 12.2 Self-Edge Handling

A function is "recursive" if its own class name appears in its `referencedFunctions` map. This is tracked by the `recursive` boolean field on `Expression` and handled by `generateSelfReference()` (line 3556), which emits the same null-guarded allocation as for non-self peers but also calls `generatePeerOperandSelfInjections()` to wire the self-reference into operand sub-classes.

`verifyFieldGraphAcyclic` (line 4219) explicitly seeds `firstSeen` with the root's own mapping so that self-edges (fields pointing back to the root) are not reported as cycles — a field `a.a → a_instance` is a legitimate self-reference, not a clone-divergence.

### 12.3 Foreign-Context Detection

`instanceBelongsToForeignContext()` (line 4258) is used by `walkFieldGraphForCycleCheck` to stop the DFS when it reaches an instance whose `context` field points to a different `Context`. Hand-written function classes (e.g. `JacobiPolynomialSequence`) construct their own internal `Context`; from the outer registry's perspective they are single opaque values. Without this guard the verifier would descend into the inner context's mappings and false-positive on its own mutual references.

### 12.4 Compile Re-entrancy Guard

`Expression.compile()` (line 1232) returns immediately if `compiledClass != null`. This idempotency guard prevents double-compilation in recursive chains where two expressions call `compile()` on each other. However, it also means that if a mapping's `expression.compile()` is called while `instructions` is still being generated (before the `ClassWriter` has been closed), the second call returns `null` (since `compiledClass` is still null but `instructions` is non-null). The assertion `assert context != null` at line 1252 would fire in this case.

### 12.5 Field Name Collisions

The `Parser.sanitizeFieldName()` (line 742) method replaces characters illegal in JVM field names with two-letter ASCII sequences (`(` → `LP`, `)` → `RP`, `/` → `Sl`, etc.). This is applied to function names and variable names that come from user expression strings. The `transformToAcceptableJavaIdentifier()` method (line 383) applies a broader transformation for class names, replacing unicode mathematical symbols with ASCII equivalents.

Intermediate variable names are assigned by `getNextIntermediateVariableFieldName()` which uses a typed counter from `context.intermediateVariableCounters` keyed by `Class<?>`, producing names like `ℝ0001`, `ℂ0002`, `ℤ0003`, `operandF0001`, `valueF0001`, etc. (using the unicode type prefixes from `Compiler.typePrefixes`, line 97).

### 12.6 COMPUTE_FRAMES and Stack Map Correctness

All `ClassWriter` instances are created with `ClassWriter.COMPUTE_FRAMES` (set in `Expression.generate()`), delegating stack map frame computation entirely to ASM. This eliminates the need to manually track operand stack height and local variable types across branches, at the cost of a one-time computation overhead during compilation. Since expressions are compiled once and evaluated many times, this trade-off is always correct. Attempting to emit manual frame descriptors would be fragile given the conditional branches in the generated `evaluate()` body (cache check, static-precision check, Taylor-series branch).

### 12.7 Symbol Dispatch Summary

The complete precedence ladder parsed by `resolve()` / `resolveOperand()` / binary-resolution:

```
resolveOperand                     (primary: literal, variable, functional, prefix-ops)
  → resolvePostfixOperators        (!, |x|, ⌊⌋, ⌈⌉, postfix-application)
  → resolveExponentiation          (^)
  → resolveMultiplicationOrDivision (* / ÷)
  → resolveAdditionOrSubtraction   (+ -)
  → resolveComparisons             (< > <= >= = ≠)
  → resolveBooleanCombinator       (&& ||)
```

When `coDomainType.isInterface()`, a successful `parseExplicitInputVariableIfPresent()` at any point in `resolveOperand()` triggers a recursive sub-expression via `parseInputVariableAssignment()`, short-circuiting the remaining binary-op resolution.
