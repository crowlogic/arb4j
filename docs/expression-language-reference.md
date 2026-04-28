# The arb4j Expression Language — A Reference Exegesis

**Version:** master @ commit `d641e98` (2026-04-28)
**Source root:** `arb/expressions/` (84 files)
**Audience:** the author and other mathematicians using arb4j to express mathematical objects directly, without coefficient bookkeeping.

This document is a complete walkthrough of the arb4j expression compiler — what the language **is**, what every operator does, what types it dispatches over, and which mathematical idioms are first-class. The emphasis is on what makes it a **mathematician's language** rather than a programmer's: polynomials are objects you multiply, sums are folds over an index, and the type of the operand body decides the algebra.

Every claim cites a file:line. Every operator is illustrated with at least one expression drawn verbatim from production code.

---

## 1. What an arb4j expression *is*

An arb4j expression is a parsed, typechecked, JVM-bytecode-compiled function

    f : D → R

where `D` is the *domain type* (`Integer`, `Real`, `Complex`, `Object`, …), `R` is the *codomain type* (any of the dispatch types listed below), and the concrete *function class* `F` is a Java interface like `RealFunction`, `ComplexFunction`, `ComplexSequence`, `ComplexPolynomialNullaryFunction`, `RealPolynomial​NullaryFunction`, etc. The triple `<D, R, F>` parameterises [`Expression<D, C, F>`](file:///tmp/arb4j/src/main/java/arb/expressions/Expression.java) and threads through every node of the parsed AST. The `Function.express(name, source, context)` factory parses the source string, builds the AST, runs `optimize()`, then emits a fresh JVM class via ASM whose `evaluate(D t, int order, int bits, R res)` body realises the expression. The compiled class is cached under a derived class name so that re-issuing the same source string returns the same class.

The cardinal rule of the language is that **the codomain type chooses the algebra**. The same expression `a + b` compiles to `acb_add` when both operands are `Complex`, to `acb_poly_add` when both are `ComplexPolynomial`, to `acb_mat_add` when both are `ComplexMatrix`. The same `prod(k ➔ … {k=a..b})` syntax compiles to a JVM loop whose body invokes `acb_mul` for `Complex`, `acb_poly_mul` for `ComplexPolynomial`, and `acb_mat_mul` for `ComplexMatrix`. There is no separate "polynomial expression language" or "matrix expression language" — there is one language, and the algebra it speaks is chosen by the type of the result.

### 1.1 The dispatch types

Every type the compiler can promote to or operate on is registered in `Compiler.typePrefixes` ([`Compiler.java:98–131`](file:///tmp/arb4j/src/main/java/arb/expressions/Compiler.java#L98)):

| Type | Sigil | Role |
|---|---|---|
| `Integer` | ℤ | arbitrary-precision integer index/limit |
| `Fraction` | q | exact rational |
| `Real` | ℝ | real ball (arb `arb_t`) |
| `Complex` | ℂ | complex ball (arb `acb_t`) |
| `AlgebraicNumber` | 𝔸 | algebraic number |
| `RealPolynomial` | Xℝ | real polynomial (`arb_poly_t`) |
| `ComplexPolynomial` | Xℂ | complex polynomial (`acb_poly_t`) |
| `IntegerPolynomial` | Xℤ | integer polynomial |
| `RealMatrix` | ℝᵐˣⁿ | real matrix |
| `ComplexMatrix` | ℂᵐˣⁿ | complex matrix |
| `RationalFunction` | ℚ | real rational function |
| `ComplexRationalFunction` | ℚℂ | complex rational function |
| `RealSequence` | Sℝ | ℤ → ℝ |
| `ComplexSequence` | Sℂ | ℤ → ℂ |
| `IntegerSequence` | Sℤ | ℤ → ℤ |
| `FractionSequence` | Sq | ℤ → ℚ |
| `RealFunction` | Fℝ | ℝ → ℝ |
| `ComplexFunction` | Fℂ | ℂ → ℂ |
| `RealToComplexFunction` | Fℝℂ | ℝ → ℂ |
| `Function` | F | generic |

The promotion rules for scalar-to-scalar coercion live in `Compiler.canBeAssignedTo` ([`Compiler.java:171–202`](file:///tmp/arb4j/src/main/java/arb/expressions/Compiler.java#L171)). They are exactly the inclusions one expects: ℤ ↪ ℚ ↪ ℝ ↪ ℂ, and each scalar embeds into the polynomial / rational-function / matrix algebra over itself.

### 1.2 Compilation lifecycle

A call to `RealFunction.express("h(x) ➔ exp(-x²)")` proceeds:

1. **Source normalisation.** All arrow variants ➜ ↦ ⟶ ⟼ are folded to the canonical ➔. (User invariant: "All arrows should be the same.")
2. **Parser entry.** `Expression(D, R, F, source, context)` constructs an `Expression` and runs `parse()`. The parser has a single-character cursor; `nextCharacter()` ([`Expression.java:4248`](file:///tmp/arb4j/src/main/java/arb/expressions/Expression.java#L4248)) advances it.
3. **Independent variable extraction.** If the source begins `name : x ➔ body` or `x ➔ body`, `evaluateOptionalIndependentVariableSpecification` ([`Expression.java:1731`](file:///tmp/arb4j/src/main/java/arb/expressions/Expression.java#L1731)) binds `x` as the independent variable.
4. **AST build.** `resolve()` ([`Expression.java:5211`](file:///tmp/arb4j/src/main/java/arb/expressions/Expression.java#L5211)) is the precedence-climb entry point. It returns a `Node<D, R, F>`.
5. **Optimise.** Tree-rewriting passes run.
6. **Codegen.** `generate()` ([`Expression.java:1831`](file:///tmp/arb4j/src/main/java/arb/expressions/Expression.java#L1831)) uses ASM to emit a class extending the function interface, with one field per intermediate variable, one field per registered context function, and one method `evaluate(...)` whose body walks the AST and emits `INVOKEVIRTUAL` calls into arb4j's typed method library.
7. **Instantiate.** The class is loaded by `ExpressionClassLoader` and instantiated.

The bytecode loop emitted by an n-ary node is the canonical idiom — see §5.

---

## 2. Lexer and grammar

### 2.1 Operator precedence

The grammar is precedence-climbed top-down. From [`Expression.java:5211`](file:///tmp/arb4j/src/main/java/arb/expressions/Expression.java#L5211):

```
resolve              = exponentiateMultiplyAndDivide  ('+'|'-' exponentiateMultiplyAndDivide)*
exponentiateMultDiv  = exponentiate                   ('*'|'×'|'·'|'⋅'|'/'|'÷' exponentiate)*
exponentiate         = resolveOperand                 ('^' resolveOperand | superscript_digits)?
resolveOperand       = '['  vector ']'
                     | '('  resolve ')'
                     | '∂'  derivativeBody
                     | 'Đ'  fracDeriv
                     | '∫'  integrand
                     | 'Π'|'∏' productBody
                     | 'Σ'|'∑' sumBody
                     | NUMERIC_LITERAL
                     | IDENTIFIER  ( '⁻¹(' arg ')' | '(' args ')' | '̇' | '̈' | identifierTail )
                     | 'ꟲD'  fracDeriv
postfix              = '!' | '!!' | '⌊…⌋' | '⌈…⌉' | '|…|' | '(' arg ')'
```

Multiplication signs accepted: `*`, `×`, `ₓ`, `⋅`, `·` ([`Expression.java:4472`](file:///tmp/arb4j/src/main/java/arb/expressions/Expression.java#L4472)).
Subtraction signs: `-`, `₋`, `−` ([line 4457](file:///tmp/arb4j/src/main/java/arb/expressions/Expression.java#L4457)).
Division signs: `⁄`, `/`, `÷`, except followed by `∂` (which is the partial-derivative ratio form) ([line 4467](file:///tmp/arb4j/src/main/java/arb/expressions/Expression.java#L4467)).
Addition signs: `+`, `₊` ([line 4462](file:///tmp/arb4j/src/main/java/arb/expressions/Expression.java#L4462)).
Exponentiation: `^x` for atomic `x`, `^(...)` for parenthesised exponent, or *Unicode-superscript digits* ([line 4929](file:///tmp/arb4j/src/main/java/arb/expressions/Expression.java#L4929)) — `x²` is `pow(x, 2)` directly.

### 2.2 Function-declaration syntax

A top-level expression is one of:

```
body                                  // anonymous, the independent variable is inferred
x ➔ body                              // named arrow form, independent variable x
name : x ➔ body                       // named function with independent variable x
name : body                           // named function, independent variable inferred
```

The arrow `➔` is parsed in `parseExplicitInputVariableIfPresent` ([`Expression.java:636`](file:///tmp/arb4j/src/main/java/arb/expressions/Expression.java#L636)). Inside an n-ary body, the arrow rebinds the index variable: `sum(j ➔ a(j)·b(k−j) {j=1..k−1})`. The colon-prefix form `name : body` is the *function definition* used for sequences, e.g. `"A : 2*n + 1"` ([`ComplexBesselPolynomials.java:43`](file:///tmp/arb4j/src/main/java/arb/functions/polynomials/orthogonal/complex/ComplexBesselPolynomials.java#L43)).

### 2.3 The bound-index form `{k = a..b}`

Wherever an index variable must be bound to a finite range — sums, products, integrals, vectors of the form `[expr {k=a..b}]` — the grammar uses

    {k = a … b}     or equivalently     {k = a..b}

The dots may be `..` (two ASCII full stops) or `…` (the single Unicode ellipsis). The `=` may be followed by any literal or expression. The bound is **inclusive at both ends**; the body is evaluated for every integer index in `[a, b]`.

### 2.4 Identifiers, literals, special tokens

* **Identifiers** include any Unicode letter or letter-like symbol. Greek (`α`, `β`, `μ`, `Γ`, `Π`), letter-like math (`ℂ`, `ℜ`, `ℑ`, `ℰ`, `ℭ`), and ASCII alphanumerics are all valid identifier characters. Dotted accents `̇` and `̈` after an identifier are first- and second-derivative operators on a function name (parsed at [`Expression.java:5407`](file:///tmp/arb4j/src/main/java/arb/expressions/Expression.java#L5407)).
* **Numeric literals** can be integer, decimal, or arb-precision strings parseable by `Real.set(String)` / `Complex.set(String)` ([`Expression.java:1577`](file:///tmp/arb4j/src/main/java/arb/expressions/Expression.java#L1577)).
* **Inverse functions.** `f⁻¹(y)` parses to an `InverseFunctionNode` ([`Expression.java:5391`](file:///tmp/arb4j/src/main/java/arb/expressions/Expression.java#L5391)). Without parentheses, `x⁻¹` is just `pow(x, −1)`.
* **Subscript indexing.** `f₍ₖ₎` and `aₖ` — see §6.5.
* **Vector literal.** `[a, b, c]` constructs a `VectorNode` ([`Expression.java:1593`](file:///tmp/arb4j/src/main/java/arb/expressions/Expression.java#L1593)).
* **Absolute value.** Pipe-bracketed `|x|` ([line 5217](file:///tmp/arb4j/src/main/java/arb/expressions/Expression.java#L5217)).
* **Floor / ceiling.** `⌊x⌋`, `⌈x⌉` ([lines 5229, 5268](file:///tmp/arb4j/src/main/java/arb/expressions/Expression.java#L5229)).
* **Factorial / double factorial.** `n!`, `n!!` ([line 5240](file:///tmp/arb4j/src/main/java/arb/expressions/Expression.java#L5240)).
* **Rising factorial (Pochhammer).** `x₍n₎` or `x⋰n` ([line 5252](file:///tmp/arb4j/src/main/java/arb/expressions/Expression.java#L5252)).

---

## 3. Type promotion: how `a · b` chooses its algebra

Every binary operator (`+`, `−`, `·`, `/`, `^`) constructs a `BinaryOperationNode` whose result type is determined by a symmetric type table built in `BinaryOperationNode.initializeTypeMaps` ([`BinaryOperationNode.java:84–141`](file:///tmp/arb4j/src/main/java/arb/expressions/nodes/binary/BinaryOperationNode.java#L84)). The table is the algebra of inclusions:

| Left | Right | Result |
|---|---|---|
| `Real` | `Real` | `Real` |
| `Real` | `Complex` | `Complex` |
| `Real` | `RealPolynomial` | `RealPolynomial` |
| `Real` | `ComplexPolynomial` | `ComplexPolynomial` |
| `Complex` | `ComplexPolynomial` | `ComplexPolynomial` |
| `RealPolynomial` | `Complex` | `ComplexPolynomial` |
| `RealPolynomial` | `ComplexPolynomial` | `ComplexPolynomial` |
| `Fraction` | `Real` | `Real` |
| `Fraction` | `RealPolynomial` | `RealPolynomial` |
| `Integer` | `RealPolynomial` | `RealPolynomial` |
| `Integer` | `IntegerPolynomial` | `IntegerPolynomial` |
| `RealFunction` | `Real` | `RealFunction` |
| `RealFunction` | `Complex` | `ComplexFunction` |
| `ComplexFunction` | `RealFunction` | `ComplexFunction` |
| `ComplexSequence` | `Complex` | `ComplexSequence` |
| `RealSequence` | `Complex` | `ComplexSequence` |
| `ComplexSequence` | `ComplexFunction` | `ComplexFunctionSequence` |
| (every scalar S) | (its polynomial X[S]) | the polynomial X[S] |

`mapPolynomialType(scalarType, polyType)` ([line 143](file:///tmp/arb4j/src/main/java/arb/expressions/nodes/binary/BinaryOperationNode.java#L143)) registers, for any scalar S and its polynomial ring X[S], the entries `(S, X[S]) → X[S]`, `(ℤ, S) → S`, `(ℤ, X[S]) → X[S]`, `(ℚ, S) → S`, `(ℚ, X[S]) → X[S]`. So once the parser sees a polynomial-typed sub-tree anywhere in `a · b · c`, the whole product is polynomial-typed and the `·` becomes `acb_poly_mul` / `arb_poly_mul`.

The result-type lookup happens in `BinaryOperationNode.type()` ([later in the same file](file:///tmp/arb4j/src/main/java/arb/expressions/nodes/binary/BinaryOperationNode.java)) and the bytecode emitted in `generate()` invokes `INVOKEVIRTUAL` on `add` / `mul` of the result class, which for `ComplexPolynomial` is exactly the FLINT thin-wrapper around `acb_poly_*`.

**Operational consequence.** When you write

    P : sum(k ➔ a(k+1)·z^k {k=0..M−1}) · Q

with the outer expression typed as `ComplexPolynomial`, the body `a(k+1)·z^k` has type `Complex × ComplexPolynomial → ComplexPolynomial` (row 5 of the table), the `sum` folds with `acb_poly_add`, and the outer multiplication by `Q` is `acb_poly_mul`. There is no Java loop, no coefficient bookkeeping, no manual `set`/`get` on polynomial coefficients. The compiler emits the moral equivalent of the C call sequence

    acb_poly_zero(acc);
    for (k = 0; k <= M-1; ++k) {
        acb_poly_set_coeff_acb(monomial, k, 1);  // z^k, internally cached
        acb_poly_scalar_mul(term, monomial, a(k+1), bits);
        acb_poly_add(acc, acc, term, bits);
    }
    acb_poly_mul(P, acc, Q, bits);

— except that the monomial `z^k` is itself a literal in the AST whose evaluation is whatever arb4j compiles a polynomial power to, which is `acb_poly_pow` or its scalar-mul-by-monomial specialisation.

---

## 4. Binary operators in detail

Every binary operator extends `BinaryOperationNode` ([`BinaryOperationNode.java:41`](file:///tmp/arb4j/src/main/java/arb/expressions/nodes/binary/BinaryOperationNode.java#L41)). The operator string (`"add"`, `"mul"`, `"div"`, `"sub"`, `"pow"`) is the JVM method name invoked at evaluation; the symbol (`"+"`, `"·"`, …) is for `toString()` only.

### 4.1 `AdditionNode` (`+`, `₊`)

Source: [`AdditionNode.java:18`](file:///tmp/arb4j/src/main/java/arb/expressions/nodes/binary/AdditionNode.java#L18). Compiles to `INVOKEVIRTUAL Result.add(Result, int) Result`. Symbolic simplifications: `0 + x = x`, `x + 0 = x`, fraction merging `(a/b) + (c/d) = (a·d + b·c)/(b·d)` ([line 49 onward](file:///tmp/arb4j/src/main/java/arb/expressions/nodes/binary/AdditionNode.java#L49)).

### 4.2 `SubtractionNode` (`-`, `−`, `₋`)

`a − b` is parsed as `a + (−b)`; `−x` at the start of an expression is a `NegationNode`. Differentiation rule ∂(a−b) = ∂a − ∂b.

### 4.3 `MultiplicationNode` (`*`, `×`, `·`, `⋅`, `ₓ`)

Source: [`MultiplicationNode.java:21`](file:///tmp/arb4j/src/main/java/arb/expressions/nodes/binary/MultiplicationNode.java#L21). Dispatches to the result type's `mul` method. Includes integration-by-parts handling for polynomial × exp/trig products via the `Integration` static helper ([`Integration.java`](file:///tmp/arb4j/src/main/java/arb/expressions/nodes/binary/Integration.java)). Crucially: when `result` is `ComplexPolynomial`, this invokes `acb_poly_mul`. **The product of a polynomial-typed `sum(...)` and another polynomial-typed factor IS the operation you want for the Müntz–Padé numerator.**

### 4.4 `DivisionNode` (`/`, `÷`, `⁄`)

Standard binary divide, dispatching to the result type's `div`. For `Complex / Complex` → `Complex`; for `RealPolynomial / RealPolynomial` → `RationalFunction` (the result type table promotes to the field of fractions). For polynomial-by-scalar, division is scalar-division (no promotion).

### 4.5 `ExponentiationNode` (`^`, Unicode superscripts)

`x^n` for `Integer n` compiles to `pow(x, n, bits, result)`; for non-integer `n` over `Complex` it goes through `acb_pow`. The Unicode-superscript form `x²` ([`Expression.java:4929`](file:///tmp/arb4j/src/main/java/arb/expressions/Expression.java#L4929)) is parsed by `parseSuperscripts`.

### 4.6 `RisingFactorialNode` (`x₍n₎`, `x⋰n`)

The Pochhammer symbol (x)ₙ = x·(x+1)·…·(x+n−1). On `Complex`, this is `acb_rising`. On `Real`, `arb_rising`. Source: [`RisingFactorialNode.java`](file:///tmp/arb4j/src/main/java/arb/expressions/nodes/binary/RisingFactorialNode.java).

### 4.7 `ComparisonNode` (`=`, `≠`, `<`, `>`, `≤`, `≥`)

Used inside `when(...)` guards. Returns a boolean condition; not directly assignable as a value.

### 4.8 `BooleanCombinatorNode` (`∧`, `∨`, `&&`, `||`)

Composes `ComparisonNode`s.

### 4.9 `Integration` (helper, not a node)

Static helper used by `MultiplicationNode.integral` to recognise integrals of products `xⁿ·exp(αx)`, `xⁿ·sin/cos`, polynomial × exponential, etc., and rewrite them as closed-form anti-derivatives without falling back to numerical quadrature. This is one of the places where the language goes beyond term-rewriting into actual symbolic calculus.

---

## 5. The n-ary operators — the heart of polynomial-valued expressions

Two operators bind an integer index over a finite range and fold an operand expression with an associative binary operation:

| Sigil | Keyword | Identity | Fold |
|---|---|---|---|
| Σ, ∑ | `sum`  | `additiveIdentity` | `add` |
| Π, ∏ | `prod` | `multiplicativeIdentity` | `mul` |

Both are instances of `NAryOperationNode` ([`NAryOperationNode.java:92`](file:///tmp/arb4j/src/main/java/arb/expressions/nodes/nary/NAryOperationNode.java#L92)). The two concrete subclasses [`SumNode`](file:///tmp/arb4j/src/main/java/arb/expressions/nodes/nary/SumNode.java) and [`ProductNode`](file:///tmp/arb4j/src/main/java/arb/expressions/nodes/nary/ProductNode.java) only differ in which identity and fold method names they pass to the base.

### 5.1 Syntax

Two equivalent syntactic forms:

    sum(k ➔ body  {k = a..b})         ← function form
    Σ body  {k = a..b}                ← sigil form

The function form requires the trailing `)` ([`SumNode.java:43`](file:///tmp/arb4j/src/main/java/arb/expressions/nodes/nary/SumNode.java#L43)). The sigil form is equivalent. The `{k = a..b}` block binds the index and is *mandatory*; arb4j has no infinite-sum syntax (this would require uniform-convergence arguments that the compiler cannot supply).

### 5.2 What the operand expression is

The operand body `body` is parsed by `parseOperand` ([`NAryOperationNode.java:540`](file:///tmp/arb4j/src/main/java/arb/expressions/nodes/nary/NAryOperationNode.java#L540)) into a fresh `Expression<Integer, R, Sequence<R>>` — i.e. a sequence whose codomain is the same `R` as the enclosing expression's codomain (or a scalar promotion thereof: line 539's `scalarCoDomain` is used only when `R` is not itself a polynomial type). **This is the single design decision that makes the language polymorphic over algebras.**

If the enclosing expression has codomain `ComplexPolynomial`, the operand body is a `ComplexPolynomialSequence`: index `k ↦ ComplexPolynomial`. Each iteration produces a polynomial; the accumulator is also polynomial-typed; the `add`/`mul` invoked is the polynomial one.

If the enclosing codomain is `Complex`, the operand is a `ComplexSequence` `k ↦ Complex`, and `add`/`mul` are scalar.

If it is `ComplexMatrix`, the operand is a matrix-valued sequence and `mul` is `acb_mat_mul`.

### 5.3 What the bytecode looks like

From the class header doc at [`NAryOperationNode.java:66–80`](file:///tmp/arb4j/src/main/java/arb/expressions/nodes/nary/NAryOperationNode.java#L66):

    arb.Integer index = new arb.Integer();           // local slot
    accumulator.identity();                          // 0 for sum, 1 for prod
    index.set(lowerLimit);
    cachedUpper.set(upperLimit);
    while (index.compareTo(cachedUpper) <= 0) {
        accumulator = accumulator.operation(operand.evaluate(index, bits, scratch), bits);
        index.increment();
    }
    result.set(accumulator);

`accumulator`, `cachedUpper`, `scratch` are intermediate fields on the generated class. `operand` is itself a generated `Sequence<R>` field. The index is a method-local `arb.Integer`, never registered in the `Context`.

For an outer expression of codomain `ComplexPolynomial`:

* `accumulator.identity()` is `acb_poly_zero` (sum) or `acb_poly_one` (product).
* `accumulator.operation(scratch, bits)` is `acb_poly_add(acc, acc, scratch, bits)` or `acb_poly_mul(acc, acc, scratch, bits)`.
* `operand.evaluate(index, bits, scratch)` is the compiled body, returning a `ComplexPolynomial`.

This is *exactly* the FLINT polynomial loop you would write by hand, with the cardinal advantage that the loop body is itself the result of compiling a polynomial expression — so nested sums, products of polynomials in indexed scalar coefficients, polynomials whose coefficients are themselves the result of nested sums, are all built without a single line of Java coefficient code.

### 5.4 Differentiation and integration of n-ary nodes

`SumNode.differentiate` ([`SumNode.java:96`](file:///tmp/arb4j/src/main/java/arb/expressions/nodes/nary/SumNode.java#L96)) and `SumNode.integral` ([line 66](file:///tmp/arb4j/src/main/java/arb/expressions/nodes/nary/SumNode.java#L66)) implement the linearity rules

    ∂/∂x [Σₖ fₖ(x)] = Σₖ ∂fₖ/∂x
    ∫ [Σₖ fₖ(x)] dx = Σₖ ∫fₖ(x) dx

by cloning the operand expression, calling `differentiate`/`integral` recursively on its root, and wrapping it in a fresh `NAryOperationNode` with the same limits. `ProductNode` leaves these as `assert false : "TODO: …"` ([`ProductNode.java:38–48`](file:///tmp/arb4j/src/main/java/arb/expressions/nodes/nary/ProductNode.java#L38)) — derivative-of-a-product and integral-of-a-product over arbitrary index range require the multinomial Leibniz rule and have not yet been implemented.


---

## 6. Special nodes

### 6.1 `VariableNode`

Source: [`VariableNode.java`](file:///tmp/arb4j/src/main/java/arb/expressions/nodes/VariableNode.java). Wraps a `VariableReference` (name + optional bounds + index-variable flag). Resolves at codegen time to either a method-local slot (the independent variable, the index variable of an enclosing n-ary, the operand variable of a `Sequence` body) or a class field (anything registered in the `Context`).

### 6.2 `LiteralConstantNode`

Source: [`LiteralConstantNode.java`](file:///tmp/arb4j/src/main/java/arb/expressions/nodes/LiteralConstantNode.java). Holds a parsed numeric literal. Stored as a static final field on the generated class so that arb's arbitrary-precision ball is initialised once. Symbolic constants (`π`, `e`, `γ`, `i`) are recognised by `VariableReference.isLiteralConstant` and resolved to arb constants.

### 6.3 `VectorNode`

Source: [`VectorNode.java`](file:///tmp/arb4j/src/main/java/arb/expressions/nodes/VectorNode.java). Constructs a vector from `[x₁, x₂, …, xₙ]` syntax. The element type is determined by the same type-promotion table used for binary operators. Used heavily for matrix construction (where each row is a vector) and for tuple-valued returns.

### 6.4 `DerivativeNode`

Two surface syntaxes, both routed to [`DerivativeNode.java`](file:///tmp/arb4j/src/main/java/arb/expressions/nodes/DerivativeNode.java):

* **Prefix.** `∂f` or `∂(expr)` — differentiates with respect to the implicit independent variable.
* **Function form.** `diff(f)` ([`Expression.java:5307`](file:///tmp/arb4j/src/main/java/arb/expressions/Expression.java#L5307)).

The derivative is computed *symbolically* by recursively calling `Node.differentiate(VariableNode)` on the AST, applying the rules in each node's `differentiate` method. The dotted-accent form `f̈ = ∂²f/∂x²` (lines 5407, 5412) is a convenient shorthand. Higher-order derivatives are emitted by chaining.

### 6.5 `IntegralNode`

Source: [`IntegralNode.java`](file:///tmp/arb4j/src/main/java/arb/expressions/nodes/IntegralNode.java). Two forms:

    ∫ f(x) dx                          ← indefinite (returns the antiderivative as a polynomial or rational function)
    int(f(x), x, a, b)                 ← definite, function form

`PolynomialIntegralNode` is the specialised path when the integrand is polynomial — it produces the antiderivative coefficient-by-coefficient via `acb_poly_integral`.

### 6.6 `CaputoFractionalDerivativeNode` and `RiemannLiouvilleFractionalIntegralNode`

Sources: [`CaputoFractionalDerivativeNode.java`](file:///tmp/arb4j/src/main/java/arb/expressions/nodes/CaputoFractionalDerivativeNode.java), [`RiemannLiouvilleFractionalIntegralNode.java`](file:///tmp/arb4j/src/main/java/arb/expressions/nodes/RiemannLiouvilleFractionalIntegralNode.java). Surface syntaxes:

    Đ^α f                              ← Caputo fractional derivative (prefix)
    fracdiff(f, α)                     ← Caputo, function form
    fracint(f, α)                      ← Riemann–Liouville fractional integral

These nodes carry type-specific symbolic rules — the closed forms `Dᵅ tᵝ = Γ(β+1)/Γ(β−α+1) · t^(β−α)` and `Iᵅ tᵝ = Γ(β+1)/Γ(β+α+1) · t^(β+α)` are dispatched on the operand subtree (#984's I^μ implementation overrides `fractionalIntegral` on `VariableNode`, `ExponentiationNode`, `AdditionNode`, `NegationNode`, `MultiplicationNode` (constant·f), `DivisionNode` (f/constant), `LiteralConstantNode`, `FunctionNode` (inline body), and on `RiemannLiouvilleFractionalIntegralNode` itself for the semigroup `Iᵅ Iᵝ = I^(α+β)`).

### 6.7 `LimitNode`

`lim(x ➔ a, expr)` or `limit(x ➔ a, expr)`. Source: [`LimitNode.java`](file:///tmp/arb4j/src/main/java/arb/expressions/nodes/LimitNode.java).

### 6.8 `WhenNode` — the n-way switch

`when(cond₁, val₁, cond₂, val₂, …, else, valₑ)` ([`WhenNode.java`](file:///tmp/arb4j/src/main/java/arb/expressions/nodes/unary/WhenNode.java)). Each `condᵢ` is a comparison (`k = i`, `k < 3`, `k ≥ 0`, `k ≠ 0`) of an enclosing-scope variable to an integer literal. Two codegen paths:

1. **Lookup-switch.** When every predicate is `var = literal` with the same `var`, the JVM `lookupswitch` instruction is emitted: O(log n) dispatch.
2. **If-chain.** Otherwise, each predicate is evaluated to a JVM `int` 0/1 and branched with `IFEQ`.

The values may be of any codomain type; their type-unification follows the same rules as binary operators. This is what makes the orthogonal-polynomial recurrence

    P : n ➔ when(n=0, p₀, n=1, p₁, else, (A(n−1)·x + B(n−1))·P(n−1) − C(n−1)·P(n−2))

a well-typed `RealPolynomial`-valued `IntegerSequence` ([`RecurrentlyGeneratedOrthogonalPolynomialSequence.java:125`](file:///tmp/arb4j/src/main/java/arb/functions/polynomials/orthogonal/RecurrentlyGeneratedOrthogonalPolynomialSequence.java#L125)).

### 6.9 The Jet nodes

A *jet* is a power-series truncation: the value of a function at a point together with finitely many derivatives. arb4j has dedicated nodes for functions whose arb implementations natively return jets:

* `GammaJetNode` — Γ and its derivatives via `acb_hypgeom_gamma_jet`.
* `LogGammaJetNode` — log Γ jet.
* `ZetaJetNode` — ζ(s) jet, used for Riemann ζ derivatives at fixed s.
* `HardyZJetNode` — Hardy's Z(t) jet.
* `RiemannSiegelThetaJetNode` — Riemann–Siegel ϑ(t) jet.
* `SineIntegralJetNode` — Si(x) jet.

Each emits one arb call per evaluation, returning all requested derivatives at once. Surface syntax matches the function name: `Z(t)` → `HardyZJetNode`, `ζ(s)` → `ZetaJetNode`, `Γ(z)` → `GammaFunctionNode` (scalar) or `GammaJetNode` when a jet is requested.

### 6.10 Other unary nodes

* `BesselFunctionNodeOfTheFirstKind` — `J(n, x)`.
* `SphericalBesselFunctionNodeOfTheFirstKind` — `j(n, x)`.
* `LambertWFunctionNode` — `W(x)`.
* `LommelPolynomialNode` — `R(n, ν, x)`, the Lommel polynomial.
* `MittagLefflerFunctionNode` — `ℰ(α, β, z)` or `MittagLeffler(α, β, z)`.
* `BetaFunctionNode` — `Beta(a, b)`.
* `BinomialCoefficientNode` — `binom(n, k)`, `ℭ(n,k)`, or `(n choose k)`.
* `HypergeometricFunctionNode` — `pFq([a₁,…,aₚ]; [b₁,…,b_q]; z)`.
* `FunctionNode` — generic `f(arg)` call into a Context-registered function.
* `FunctionalEvaluationNode` — when a value `f` of function type is followed by `(arg)`, the parser builds this node ([`Expression.java:5426`](file:///tmp/arb4j/src/main/java/arb/expressions/Expression.java#L5426)). The compiler knows to invoke `f.evaluate(arg, bits, result)`.
* `InverseFunctionNode` — `f⁻¹(y)`. For the few functions arb supplies inverses for natively (e.g. `acb_lambertw`'s branches, `arb_atan`).
* `NegationNode`, `AbsoluteValueNode`, `FloorNode`, `CeilingNode`, `FactorialNode`, `BooleanNegationNode` — self-explanatory.

### 6.11 `CachedNode`, `SharedNode`, `StaticNode`

Optimisation wrappers introduced by `optimize()` after the AST is built but before codegen. `CachedNode` marks a sub-expression whose value depends only on parameters that change rarely, so the runtime caches the last result. `SharedNode` marks a sub-expression that occurs multiple times in the AST; the optimiser ensures it is computed once and reused. `StaticNode` marks a constant sub-expression that can be lifted to class initialisation.

### 6.12 `WeightedPartitionEnumeratorNode`, `CongruenceClass`, `ElseNode`

Specialised nodes for combinatorial enumeration (#nWeightedCompositions tests use the partition enumerator), congruence-class predicates, and the `else` keyword inside `when`.

---

## 7. The `Context` and `FunctionMapping` machinery

Source: [`Context.java`](file:///tmp/arb4j/src/main/java/arb/expressions/Context.java).

### 7.1 What a `Context` is

A `Context` is the symbol table the parser consults whenever it encounters an identifier that is not the independent variable, not an index variable, and not a literal constant. It contains:

* `variables` — a map `String → Named` of registered variables (any arb type that implements `Named`).
* `functions` — a `FunctionMappings` collection of registered named functions, each with a domain class, codomain class, function-class type, optional compiled `Expression`, and optional already-instantiated `Function` instance.

Contexts may be nested; expression sub-contexts (e.g. inside `DiagonalPade.asFunction`) typically copy the parent's variables in via `parent.variables.forEach((name, var) → subContext.variables.put(name, var))` so that user-facing parametric variables (`v`, `μ`, `p`, `q`, `r`) remain visible.

### 7.2 Variable registration

`registerVariable(name, variable)` ([`Context.java:634`](file:///tmp/arb4j/src/main/java/arb/expressions/Context.java#L634)) inserts a typed value. The variable's class determines its compile-time type: a `ComplexPolynomial` registered as `"z"` makes `z` parse as a `ComplexPolynomial`-typed identifier in any expression compiled against this context. A `Real` registered as `"v"` makes `v` parse as a `Real`-typed identifier.

The shorthand `Context.registerVariable(var)` uses `var.getName()` as the key, which is why arb's arithmetic-typed objects all carry a `Named` interface.

### 7.3 Function registration

Three patterns:

1. **Type declaration only** — `registerFunctionMapping(name, domainClass, codomainClass, functionClass)` creates a forward declaration so the parser can resolve `f(x)` to a function call without an instance attached. Used to break mutual recursion in cluster definitions ([`RiccatiMittagLefflerFunction.java:213`](file:///tmp/arb4j/src/main/java/arb/functions/complex/RiccatiMittagLefflerFunction.java#L213)).
2. **Compile and register** — `Sequence.parseCompileAndRegister(name, codomain, expression, sequenceClass, context)` parses an expression source, compiles it, and stores the resulting class + instance in the context under `name`.
3. **Instance binding** — register a forward declaration, then assign `mapping.instance = someAlreadyCompiledFunction; mapping.expression = (Expression) instance.getExpression();` ([`RiccatiMittagLefflerFunction.java:401–409`](file:///tmp/arb4j/src/main/java/arb/functions/complex/RiccatiMittagLefflerFunction.java#L401)). This is how derivatives of context functions, or hand-built adapters, are exposed under a name.

The compiler emits a class field for each context function the expression refers to. At class-instantiation time, `generateFunctionInitializer` ([referenced from `Compiler.java`](file:///tmp/arb4j/src/main/java/arb/expressions/Compiler.java)) injects the registered instance into that field via reflection.

---

## 8. Production idioms — polynomials defined by expression, not by coefficient

### 8.1 The orthogonal three-term recurrence

The single line at [`RecurrentlyGeneratedOrthogonalPolynomialSequence.java:125`](file:///tmp/arb4j/src/main/java/arb/functions/polynomials/orthogonal/RecurrentlyGeneratedOrthogonalPolynomialSequence.java#L125)

    P : n ➔ when(n = 0, p₀,
                 n = 1, p₁,
                 else,  (A(n−1)·x + B(n−1)) · P(n−1) − C(n−1) · P(n−2))

is the entire engine for every classical orthogonal polynomial family. The parser sees:

* `P` declared as a sequence `Integer → RealPolynomial` (the `coDomainType()` of the enclosing class is `RealPolynomial.class`).
* `A`, `B`, `C` resolved through the context as `RealSequence`s `Integer → Real`.
* `p₀`, `p₁` resolved as `RealPolynomial` variables in the context.
* `x` resolved as a `RealPolynomial` variable (the indeterminate).
* `A(n−1)·x` typed as `Real · RealPolynomial → RealPolynomial`.
* `(A(n−1)·x + B(n−1))` is `RealPolynomial + Real → RealPolynomial`.
* `… · P(n−1)` is `RealPolynomial · RealPolynomial → RealPolynomial` — a polynomial multiplication, dispatched to `arb_poly_mul`.
* `−C(n−1)·P(n−2)` likewise, then subtraction of two `RealPolynomial`s.

Hermite chooses `A(n) = 2`, `B(n) = 0`, `C(n) = 2n`, `p₁ = 2x` ([`HermitePolynomials.java:39–42`](file:///tmp/arb4j/src/main/java/arb/functions/polynomials/orthogonal/real/HermitePolynomials.java#L39)). Laguerre, Jacobi, Chebyshev, Legendre, Bessel each plug in different expressions for `A`, `B`, `C`. There is no Java loop anywhere in the chain.

### 8.2 The Müntz cluster — mutually recursive polynomial-valued sequences

From [`RiccatiMittagLefflerFunction.java:210–223`](file:///tmp/arb4j/src/main/java/arb/functions/complex/RiccatiMittagLefflerFunction.java#L210):

    // Forward-declare a so S can resolve a-references through the context
    context.registerFunctionMapping("a", Integer.class, Complex.class, ComplexSequence.class);

    // S(k) = Σⱼ a(j)·a(k−1−j)
    Sequence.parseCompileAndRegister("S", Complex.class,
        "S : k ➔ sum(j ➔ a(j)·a(k−1−j) {j = 1..k−2})",
        ComplexSequence.class, context);

    // a(k) = piecewise: closed-form initial term, then recurrence in S
    ComplexSequence a = ComplexSequence.express(
        "a : k ➔ when(k = 1, p(v)/Γ(μ+1),"
              + " else,  (Γ((k−1)·μ + 1)/Γ(k·μ + 1)) · (q(v)·a(k−1) + r(v)·S(k)))",
        context);

The forward declaration of `a` via `registerFunctionMapping` is what allows the `S`-expression to type-check against an as-yet-uninstantiated `a`. After `a` is compiled, its mapping's `instance` field is filled in.

The same file at [lines 401–432](file:///tmp/arb4j/src/main/java/arb/functions/complex/RiccatiMittagLefflerFunction.java#L401) builds the Jacobian-of-Müntz-coefficients-with-respect-to-`v` cluster `f`, `g`, `w` analogously, with `p_dv`, `q_dv`, `r_dv` registered as instance-bound `ComplexFunction`s carrying their parsed Expression for the field-injector to find.

### 8.3 The Bessel polynomials — sequence-of-polynomials with closed-form recurrence coefficients

From [`ComplexBesselPolynomials.java:43–47`](file:///tmp/arb4j/src/main/java/arb/functions/polynomials/orthogonal/complex/ComplexBesselPolynomials.java#L43):

    Aseq = ComplexSequence.express("A : 2·n + 1", context)
    Bseq = ComplexSequence.express("B : 0",       context)
    Cseq = ComplexSequence.express("C : −1",      context)

Each is a 1-line declaration of an integer-indexed sequence. They feed into the same three-term recurrence at line 125 and produce `Q(n) = (2n+1)·z·Q(n−1) − Q(n−2)` over `ComplexPolynomial`.

### 8.4 The hypergeometric polynomial idiom

`ComplexHypergeometricPolynomialFunction` ([`/tmp/arb4j/src/main/java/arb/functions/polynomials/ComplexHypergeometricPolynomialFunction.java`](file:///tmp/arb4j/src/main/java/arb/functions/polynomials/ComplexHypergeometricPolynomialFunction.java)) is a `HypergeometricFunction<Complex, ComplexPolynomial, ComplexPolynomialNullaryFunction>` — a polynomial-valued ₚFq whose argument is itself a constant `ComplexPolynomial`. The truncation to a polynomial happens because some upper parameter is a non-positive integer; arb4j detects this at evaluation time and stops the series exactly.

---

## 9. Polynomial-valued expressions in detail

### 9.1 The indeterminate

The indeterminate of a polynomial expression is whatever `RealPolynomial` or `ComplexPolynomial` variable is registered in the context as a unit polynomial — typically named `x` or `z`. The convention is `x.set(0).get(1).one()` (degree-1 polynomial with leading coefficient 1, i.e. the polynomial whose value at any point is the point itself). Once `x` is registered, every expression `x^k`, `c·x + d`, `P(x)·Q(x)` is polynomial-typed.

### 9.2 Polynomial arithmetic dispatched through `+`, `−`, `·`, `/`, `^`

Given a `ComplexPolynomial`-typed expression context:

    z + 1                  → acb_poly_add_si
    α · z                  → acb_poly_scalar_mul (where α is Complex)
    z²                     → acb_poly_pow (or scalar_mul of a cached monomial)
    P(z) + Q(z)            → acb_poly_add
    P(z) · Q(z)            → acb_poly_mul                          ← polynomial product
    P(z) / α               → acb_poly_scalar_div (α scalar)
    P(z) / Q(z)            → promotes to ComplexRationalFunction
    P(z)^k                 → repeated acb_poly_mul
    sum(k ➔ … {k=a..b})    → acb_poly_zero + loop of acb_poly_add
    prod(k ➔ … {k=a..b})   → acb_poly_one  + loop of acb_poly_mul

### 9.3 Polynomial composition

The expression `P(Q(z))` where both are polynomial-typed compiles to `acb_poly_compose` via the `FunctionalEvaluationNode` mechanism: `P` is loaded as a polynomial, `Q(z)` is the argument expression, and the call becomes `P.evaluate(Q(z), bits, result)` which on `ComplexPolynomial` is `acb_poly_compose`.

### 9.4 What is NOT directly in the expression language

Three operations on polynomials have no surface syntax in arb4j and require either Java or a sequence-of-polynomials trick:

1. **Coefficient extraction.** `[zᵏ] P(z)` — the *k*-th coefficient — is not a primitive. Workarounds: evaluate `P` at carefully chosen points and divide by `k!` (Taylor extraction); or build `P` as a `sum(k ➔ a(k)·z^k {…})` so the coefficient is the sequence `a` itself; or fall back to Java `P.get(k)`.
2. **Truncation `P mod z^N`.** Not a primitive. Workarounds: choose lengths in advance via `P.fitLength(N)`; or rely on the fact that allocating `P` of length `N+1` and assigning only the first `N+1` coefficients gives the truncation for free.
3. **Polynomial shift `P(z) ↦ z·P(z)`.** Not a single-token primitive in expression syntax, but is just `z · P` in any polynomial-typed expression — which is `acb_poly_shift_left` plus a multiplication by 1. Equivalently `P · x` works with `x` registered as the unit polynomial.

The first two limitations are why some of arb4j's algebraic algorithms still hold a `ComplexPolynomial` reference and call `.get(k)` or `.fitLength(M)` from Java. They are not language deficiencies in any deep sense — coefficient extraction is, mathematically, just functional evaluation against a basis-dual, and arb's `acb_poly_get_coeff_acb` is a one-liner; what's missing is a surface syntax that makes the dual element an expression.

---

## 10. Sequences and mutual recursion

A *sequence* is a function ℤ → R for some scalar codomain R. The compiler treats sequences as ordinary expressions whose domain class is `Integer`. The shorthand declaration `a : k ➔ body` parses to a function whose name is `a` and whose single bound variable is `k`. Recursive references — `a(k-1)`, `a(k-2)`, etc. — resolve through the **`Context`'s function-mapping table**, not by syntactic recursion: the compiler emits an `invokeinterface` call against the loaded mapping, and the JVM resolves the target the first time the call site is reached.

### 10.1 Forward declaration

When two sequences `a` and `S` reference each other (so neither can be parsed first because the other isn't compiled yet), the idiom is:

  1. Register a *forward declaration* for one of them: a `FunctionMapping` whose `instance` and `expression` are both null, but whose domain/codomain/functionClass are pinned. This is a single call to [`Context.registerFunctionMapping(name, domain, codomain, functionClass)`](file:///tmp/arb4j/src/main/java/arb/expressions/Context.java) (line numbers vary; the method takes four `Class<?>` arguments).
  2. Parse, compile, and register the **other** sequence (here `S`) — its references to `a` resolve to the forward-declaration mapping, so the compiler emits an `invokeinterface` against `ComplexSequence.evaluate` rather than recursing into a definition it doesn't have.
  3. Express the deferred sequence (here `a`) — `Sequence.express(...)` parses `a`, finds the forward mapping for itself, replaces it with a real one whose `expression` and (after instantiation) `instance` are populated, and returns the running instance. Cross-references from `S` to `a` are *backfilled* during `instantiate()` by [`instantiateAndInjectReferencedFunctions`](file:///tmp/arb4j/src/main/java/arb/expressions/Expression.java#L3848), which walks the mapping table and instantiates any mapping whose `instance` is null but whose `expression` is non-null, recursively.

The Riccati Müntz cluster is the textbook example. From [`RiccatiMittagLefflerFunction.java:213–221`](file:///tmp/arb4j/src/main/java/arb/functions/complex/RiccatiMittagLefflerFunction.java#L213):

    context.registerFunctionMapping("a", Integer.class, Complex.class, ComplexSequence.class);

    String sExpr = "S:k➔sum(j➔a(j)*a(k-1-j){j=1..k-2})";
    Sequence.parseCompileAndRegister("S", Complex.class, sExpr, ComplexSequence.class, context);

    String aExpr = "a:k➔when(k=1, p(v)/Γ(μ+1),"
                 + " else, (Γ((k-1)*μ+1)/Γ(k*μ+1))"
                 + "       *(q(v)*a(k-1)+r(v)*S(k)))";
    ComplexSequence a = ComplexSequence.express(aExpr, context);

The mathematical content is the convolution-and-recurrence

  S(k) = Σⱼ₌₁ᵏ⁻² a(j)·a(k−1−j),
  a(1) = p(v)/Γ(μ+1),
  a(k) = (Γ((k−1)μ+1)/Γ(kμ+1)) · (q(v)·a(k−1) + r(v)·S(k)),  k ≥ 2.

Three observations matter for understanding the language.

**(a) The convolution `S(k)` is a `sum`, not a `prod`.** Multiplying two power series whose coefficient sequences are `a` and `a` produces a new sequence whose `k`-th entry is the convolution Σⱼ a(j)·a(k−1−j). The `sum` n-ary operator with bound index `j=1..k-2` realises exactly this fold. There is no Java `for` loop and no per-call instantiation cost: the compiled bytecode emits one JVM loop that reuses `acb_t` scratch through the body.

**(b) `a` and `S` are *peers*, not nested.** `a` does not call into `S`'s class file by static name; both are independently compiled, and the cross-reference is a field whose value is the other instance, injected after both classes exist. This is what makes the cycle work.

**(c) `S(k)` for `k ≤ 2` is `sum` over an empty range** — the loop's lower bound `j=1` exceeds the upper bound `k-2` — and the language defines an empty `sum` to be `0` (the additive identity in the codomain), an empty `prod` to be `1`. The `when` clause in `a`'s definition handles the base case `k=1` separately precisely so that the recurrence's `r(v)·S(k)` term is well-defined for all `k ≥ 2`.

### 10.2 Three patterns for registering a function in a context

Reading through the production code reveals exactly three idioms.

**Pattern P₁ — `express(...)` returns an instance.** The most common: a Java field of type `ComplexFunction` (or `RealFunction`, `ComplexSequence`, etc.) is assigned the result of `Function.express(...)`. The expression is parsed, compiled, registered into the context with a `FunctionMapping` whose `expression` and `instance` are both populated, and the running instance is returned. Use this when the function will be both invoked from Java (`f.evaluate(...)`) and referenced from other expressions.

**Pattern P₂ — `parseCompileAndRegister(...)` registers but does not instantiate.** The expression is parsed and compiled, the mapping is recorded with `expression` set, but `instance` remains null until first use. Use this when the function is only referenced from inside another expression and will be instantiated lazily during the outer expression's `instantiate()` walk. The Müntz cluster's `S` uses this pattern: nothing in Java ever calls `S.evaluate(k)` directly.

**Pattern P₃ — `registerFunctionMapping(...)` declares without parsing.** Only the class signature is registered; `expression` and `instance` are null. Used purely to break a parse-time circular dependency. The next call to `parseCompileAndRegister` or `express` for the same name overwrites the placeholder.

The line between P₁ and P₂ is whether the Java code holds a reference to the instance. Both call into the same internals.

---

## 11. The compilation lifecycle in full

The journey from a string `"f:x➔x²+1"` to a JVM-bytecode-compiled function instance has five stages. Each is a method on `Expression`.

**Stage A: parse.** The `Expression(...)` constructor invokes the recursive-descent parser. Tokens are stripped and dispatched into the grammar's three precedence levels: `resolve` (highest — primaries, parentheses, function applications, indexed access), `exponentiateMultiplyAndDivide` (powers, multiplicative, division), `addAndSubtract` (additive). The parser sets `rootNode` to the AST root.

**Stage B: optimize.** [`Expression.optimize()` at line 4741](file:///tmp/arb4j/src/main/java/arb/expressions/Expression.java#L4741) runs a sequence of tree-rewriting passes: jet-derivative deduplication, parameter-invariant hoisting (lift loop-invariant subexpressions out of `sum`/`prod` bodies), shared-node identification, static-subexpression evaluation, and constant folding. The result is the `optimised` flag set true and `evaluateStaticSubexpressions` populated when applicable.

**Stage C: generate.** `Expression.generate()` walks the optimised AST and emits `instructions` (an `org.objectweb.asm.tree.ClassNode`). Every `Node.generate(MethodVisitor)` call contributes the JVM opcodes for that node. For a binary `+` node with `Complex`-typed operands, this is roughly `aload <left>; aload <right>; iload bits; aload result; invokestatic acb_add(Complex, Complex, int, Complex) → Complex`. For an n-ary `sum`, it emits the loop scaffolding (initialise accumulator to zero of the codomain type, set loop variable to lower bound, loop header, body, increment, conditional branch back).

**Stage D: load class.** [`compile()` at line 1153](file:///tmp/arb4j/src/main/java/arb/expressions/Expression.java#L1153) calls `loadFunctionClass(className, instructions, context)` which feeds the bytecode through the JVM's `ClassLoader.defineClass`. The result is a `Class<? extends F>` cached in the `compiledClass` field.

**Stage E: instantiate.** [`instantiate()` at line 3834](file:///tmp/arb4j/src/main/java/arb/expressions/Expression.java#L3834) calls `newInstance()` (reflective), then runs three injection passes: `instantiateAndInjectReferencedFunctions` recursively materialises every `FunctionMapping.instance` referenced by the compiled class; `injectReferences` walks the `referencedFunctions` map and writes each mapping's instance into the new object's corresponding field via `Field.set`; `cloneNonReentrantReferencedFunctions` deep-copies any reference whose function class has a `Cloneable` contract and whose instance is shared across siblings (this prevents thread-unsafe scratch from being aliased across re-entrant call sites). Finally `populateSourceExpressionBackPointer` writes `this` (the `Expression`) into the instance's public `expression` field, completing the round-trip from instance back to its source expression.

The order is deliberate. Mapping injection runs first so that when the source-expression back-pointer is set, every cross-reference is resolved. Cloning runs last so that the prototype graph is fully populated before any sibling needs its own private copy.

### 11.1 Why "never compile in a loop" is a hard rule

Stage C alone takes on the order of milliseconds for a non-trivial expression, dominated by ASM tree construction and the JVM's class verifier. Stage D adds a verifier pass plus a `defineClass` syscall. Stage E walks the entire mapping graph, which on a Müntz cluster of three or four functions costs another `defineClass` per peer. Inside a numerical inner loop these costs are catastrophic — a single `Function.express(...)` call inside `for (int k = 0; k < N; k++)` adds tens of milliseconds *per iteration* and quickly dominates the actual numerics. The standing rule is therefore: *every expression is parsed, compiled, and instantiated exactly once, outside the loop. Inside the loop only `instance.evaluate(...)` is called.* This rule is enforced by review, not by the compiler, but its violation is the single most common performance regression to look for.

### 11.2 Field injection and ThreadLocal scratch

When an expression references another function (`f(g(x))`, or `a(k-1)` inside `a`'s body), the compiler emits a private field of the appropriate function-interface type into the generated class — its name matches the referenced function's `functionName`. At instantiate-time, `injectReferences` reflectively writes the referenced instance into that field. Inside the JVM-bytecode body, calling the referenced function is then a single `aload this; getfield <name>; aload <arg>; iload bits; aload result; invokeinterface evaluate`. The reference lookup is *not* a hash-map indirection — that would be a per-call overhead. It is a `getfield` against a real Java field, exactly as if the referenced function were a hand-written instance variable. This is the source of the project's standing rule "Real ThreadLocal field, NOT hash maps".

---

## 12. The test directory as a usage tour

Every nuance of the language has at least one regression test under `src/test/java/arb/expressions/`. Reading that directory is the fastest way to internalise idioms. The most informative entries:

- **`ParserTest.java`** — exercises every grammar production: bound-variable expressions, indexed access on vectors, function declaration `name : x ➔ body`, nested `sum`/`prod`, `when` chains, all binary and unary operators.
- **`ExpressionTest.java`** — end-to-end tests of `express(...)` for scalar codomains. Each method names the property it pins (associativity, distributivity, type-promotion correctness, etc.).
- **`RealExpressionTest.java`** — same, restricted to `Real` codomain, including arctangent and log-of-Gamma evaluations against Wolfram-grade reference values.
- **`RealPolynomialFunctionExpressionCompilerTest.java`** — *the* file to read for polynomial-typed expressions. Confirms `acb_poly_add`, `acb_poly_mul`, polynomial composition, `sum(k ➔ … {k=…})` over a polynomial body, all dispatched through standard operators.
- **`BesselTargetFlatHoistingTest.java`** and **`BesselTargetHoistingTest.java`** — exercise the hoisting optimisation pass that lifts loop-invariant Bessel evaluations out of `sum` bodies.
- **`JetDerivativeOverhaulTest.java`** — the Jets framework: differentiation order tracking, automatic differentiation through every special function, equality of `f.derivative(n)` and the symbolic `∂ⁿf/∂xⁿ`.
- **`NestedFunctionalFixedPointTest.java`** — fixed-point iteration of an inner function within a `sum` body — the tightest test of `instantiate()`-time reference injection.
- **`RecompileAfterContextChangeTest.java`** — proves that mutating the context (rebinding a variable's value) does not require recompilation; only `instantiate()` need rerun, and even that is only required when a cross-reference's class has actually changed.
- **`SharedNodeTest.java`** — shared-subexpression detection during optimisation. Confirms that `f(x)·f(x) + f(x)` evaluates `f(x)` once and reuses the result, both at the AST level and in emitted bytecode.
- **`ContextNamespaceCoexistenceTest.java`** — two contexts holding overlapping function names do not collide; each compiled expression carries its context.
- **`InvalidateCacheTest.java`** — the source-cache invariant: re-issuing the same source string with the same context yields the same compiled class; mutating the context invalidates the cache only when the mutation can change the AST.

The unit tests under `src/test/java/arb/expressions/nodes/` extend this, one file per node type, covering both round-trip parsing-and-printing (`toString` ↔ source) and end-to-end evaluation against analytic reference values.

---

## 13. A worked redo: Müntz–Padé numerator as a polynomial expression

The reform that motivated this document: the Step 3 commit `891238d` of issue #990 computes the Müntz–Padé numerator as

  P(z) = (z·A(z)·Q(z)) mod z^(M+1)

where `A` is the Padé-approximant coefficient sequence (a `ComplexSequence`) and `Q` is the just-computed denominator polynomial. The committed implementation expands `A` into a `ComplexPolynomial` of length `M`, calls `acb_poly_mul` on the two polynomials, and truncates the result by allocating only `M+1` slots. The expression compiler can express the same product directly.

Build the polynomial expression for `P` as an n-ary fold over the indeterminate `z`:

    P : sum(k ➔ a(k+1)·z^k {k=0..M-1}) · Q

Reading this left to right with the full force of the language:

- `a` is the registered `ComplexSequence` mapping for the Padé coefficient sequence (forward-declared in the local context, then bound to the actually-computed sequence).
- `z` is the registered `ComplexPolynomial` indeterminate (the unit polynomial, `z.set(0).get(1).one()`, registered under the name `z`).
- `Q` is the registered `ComplexPolynomial` mapping for the denominator polynomial (registered as a constant of polynomial type — its expression is the literal value, and its `instance` is the previously computed `ComplexPolynomial` object).
- The inner `sum(k ➔ a(k+1)·z^k {k=0..M-1})` is an `NAryOperationNode` whose operand expression `a(k+1)·z^k` has codomain type `ComplexPolynomial` (because `z^k` is polynomial-typed and the `Complex` factor `a(k+1)` promotes through). The fold therefore dispatches through `acb_poly_add` and the accumulator is initialised to `acb_poly_zero`. The result of the sum is a `ComplexPolynomial` whose coefficient at `z^k` is `a(k+1)`, for `k = 0, …, M−1` — that is, the polynomial Σₖ₌₀^{M−1} aₖ₊₁ zᵏ.
- Multiplying by `Q` is one `acb_poly_mul` — the outer `·` operator on two `ComplexPolynomial`-typed operands.
- Truncation is **not** an expression-language operation. It is realised by allocating the result polynomial of length `M+1` before evaluation: the compiled `evaluate(...)` writes the product into that bounded buffer, and any coefficient beyond degree `M` is silently absent. (The committed Step 3 code does the same thing — `acb_poly_mul` writes into a buffer the caller has dimensioned, and dimensioning is a property of the `ComplexPolynomial` reference, not of the expression.)

The replacement plan, for the redo of #990 Step 3:

  1. In the existing `MuntzPadeFunction.solveHankel` method, after computing the denominator polynomial `Q` and the coefficient sequence `A`, build a child `Context` and register four mappings on it: the indeterminate `z` (a unit `ComplexPolynomial`), the coefficient sequence `a` (forward-declared then bound to the just-computed `A`), the denominator polynomial `Q` (registered with its already-computed value as the `instance`), and `M` (an `Integer` literal whose value is the cluster size).
  2. *Once*, outside any loop, parse and compile the expression `P : sum(k ➔ a(k+1)·z^k {k=0..M-1}) · Q` against this context. The result is a `ComplexPolynomialNullaryFunction` whose `evaluate(null, …, prec, result)` method writes `P(z)` into the caller's polynomial buffer in one call.
  3. Replace the body of `solveHankel`'s "compute numerator" section with a single invocation of `pExpr.evaluate(null, 0, prec, P)` against a `P` of length `M+1`, then assign `P` to the `MuntzPadeFunction`'s field.

This is the entire reform. The Java code holds no `ComplexPolynomial` scratch beyond the one final result; the `acb_poly_mul` call site disappears from Java; and the loop over coefficients is the JVM loop emitted by `NAryOperationNode.generate`, exactly the loop one would have written by hand and exactly the loop the compiler would have emitted regardless.

The standing rule "never compile in a loop" is satisfied: the expression is built and compiled once, before the outer iteration starts. The standing rule "we don't do any mod shit" is satisfied: there is no truncation primitive — the result polynomial's allocated length *is* the truncation. The standing rule "It is a sin to parse it when we already have it parsed" is satisfied: the expression instance is held as a field on `MuntzPadeFunction` and reused on every refresh. And the standing rule "you don't think of polynomials as bags of coefficients" is satisfied: the only references to coefficients in the expression are the *symbolic* `a(k+1)` index into the registered sequence, not a Java `for (int i = 0; i < n; i++) p.get(i).set(...)` loop.

---

## 14. What the language is not

The language is a typed algebraic expression language for analytic functions, polynomials, matrices, and rational functions. It is not, deliberately:

- **A general-purpose programming language.** No assignment, no mutation, no control flow except the multi-way `when` combinator. Every "statement" is an expression; every expression is referentially transparent given its context.
- **A symbolic-algebra system.** The compiler does not perform algebraic manipulation beyond constant folding, jet deduplication, parameter-invariant hoisting, and shared-subexpression identification. There is no `simplify`, no `expand`, no Gröbner-basis pass. What you write is what is evaluated.
- **A polynomial coefficient calculus.** Coefficient extraction, truncation modulo `zᴺ`, and explicit shift-by-`zᵏ` are not surface-syntax operations. Polynomials are values, not records: you multiply them, you compose them, you sum them as terms in series. When you need a coefficient, you have built the polynomial as a `sum(k ➔ a(k)·z^k {…})` and the coefficient is the symbolic argument `a(k)` — the language does not invert that direction.
- **A linear-algebra DSL.** Matrix algebra works (`A·B` dispatches to `acb_mat_mul`), but operations like row reduction, pivoting, and singular-value decomposition are Java methods on the matrix classes, not expression-level constructs. The language treats a matrix as a single algebraic value the same way it treats a complex number.
- **A loop language.** Every `sum` and `prod` is a fold over a bounded integer range with a body that is itself an expression. Unbounded folds, while loops, and early termination are not in the language; for those, the implementation falls back to Java.

These omissions are not accidental. They are the line between a mathematician's notation — the kind of notation in which `Pₙ(x) = (Aₙ₋₁ x + Bₙ₋₁) Pₙ₋₁(x) − Cₙ₋₁ Pₙ₋₂(x)` is a *single sentence* — and a programmer's representation, in which the same recurrence is two-dozen lines of buffer juggling. The compiler is what makes the first form executable without paying the second form's cost.

---

## Appendix A. Operator precedence summary

From highest to lowest binding, with the recursive-descent method that handles each level (in `Expression.java`):

| Precedence | Operators / Constructs | Method |
|---|---|---|
| 1 (highest) | identifiers, literals, `(…)`, function application `f(args)`, indexed access `v[k]`, `f‾¹` (inverse), bound expressions `expr {k=a..b}` | `resolve` |
| 2 | `^` (exponentiation), `·` and `*` (multiplication), `/` (division), `mod`, juxtaposition (implicit multiplication where unambiguous) | `exponentiateMultiplyAndDivide` |
| 3 | `+`, `−` (binary additive; `−` is also unary with the same precedence as multiplication when prefixed) | `addAndSubtract` |
| 4 | `=`, `<`, `>`, `≤`, `≥`, `≠` (comparison) | `parseComparison` |
| 5 | `∧`, `∨` (boolean combinators inside `when` predicates) | `parseBooleanCombinator` |
| 6 (lowest) | `:` (function declaration `name : x ➔ body`) | top-level `parse` |

The bound-expression construct `{k=a..b}` is parsed by `resolve` as a postfix on the immediately-preceding subexpression, which is why `sum(k ➔ a(k)·b(k){k=1..N})` parses as `sum(k ➔ ((a(k)·b(k)){k=1..N}))`, not as `sum((k ➔ a(k)·b(k)){k=1..N})` — the `{…}` binds to the operand expression, not to the `sum` form.

## Appendix B. The cardinal idioms in one page

A mathematician fluent in arb4j thinks in these patterns:

  Three-term recurrence:
    P : n ➔ when(n=0, p₀, n=1, p₁, else, (A(n-1)·x + B(n-1))·P(n-1) − C(n-1)·P(n-2))

  Power series with given coefficient sequence:
    f : x ➔ sum(k ➔ a(k)·x^k {k=0..N})

  Convolution:
    c : k ➔ sum(j ➔ a(j)·b(k-j) {j=0..k})

  Polynomial product (in a polynomial-typed context):
    R : P · Q

  Polynomial composition:
    P(Q(z))             — where both are polynomial-typed mappings

  Polynomial-times-power-series:
    R : sum(k ➔ a(k+1)·z^k {k=0..M-1}) · Q

  Definite integral as expression:
    F : x ➔ ∫(t ➔ f(x,t) {t=a..b})

  Functional fixed-point inside a sum:
    g : x ➔ sum(k ➔ f^(k)(x) {k=0..N})        — f^(k) is k-fold self-composition

  Caputo fractional derivative:
    D : x ➔ ∂ᵅf(x)                            — α non-integer triggers fractional path

In every case the expression is what a mathematician would write on the blackboard, and the compiler emits the corresponding bytecode loop. The reason the language is worth using is that the gap between the two — between mathematical notation and executable code — has been closed.
