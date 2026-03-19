# VariableNode Resolution Specification

## Variable Kinds

There are exactly five kinds of variable a `VariableNode` can represent.
The resolution logic tries them in priority order; first match wins.

### 1. Context Variable

A variable whose name matches a key in `expression.context.variables`.
These are externally provided named constants or parameters.

- **Resolved by:** `resolveContextualVariable()`
- **`reference.type` set to:** `instanceVariable.getClass()`
- **Codegen:** `loadThisAndFieldOntoStack` (field access on generated class)
- **Examples:**
  - `a` in `RealFunction.express("x+a", context)` where `context.registerVariable("a", someReal)`
  - `v`, `z` in Bessel expressions where they are context-provided parameters
  - `α`, `β` in `P:n➔when(n=0,1,n=1,(C(1)*x-β+α)/2,...)` (Jacobi polynomials)

### 2. Independent Variable (Non-Nullary)

The input parameter of the function. Either explicitly named via arrow syntax
(`n➔...`, `x➔...`, `t➔...`) or the first free variable encountered when
no arrow is present. Only exists when `expression.isNullaryFunction()` is false.

- **Resolved by:** `isIndependent()` returns true, `!expression.isNullaryFunction()`
- **`reference.type` set to:** `expression.domainType`
- **Codegen:** `loadInputParameter` (first argument of `evaluate()`)
- **Examples:**
  - `x` in `RealFunction.express("x^2+1")` — domain is `Real`
  - `n` in `RationalFunctionSequence.express("n➔(½-z/2)ⁿ")` — domain is `Integer`
  - `t` in `RealFunction.express("sin(t)")`

### 3. Independent Variable (Nullary)

When the expression is nullary (`domainType == Object.class`), there is no
input parameter, but a variable still appears. This variable is the placeholder
variable of the codomain type. Since there is no input parameter, the independent
variable and the placeholder variable are the same thing.

- **Resolved by:** `isIndependent()` returns true, `expression.isNullaryFunction()`
- **`reference.type` set to:** `expression.coDomainType`
- **Codegen:** `generateFunctionalVariableIdentity` (allocate + `.identity()`)
- **Examples:**
  - `x` in `RationalFunction.express("x/2")` — codomain is `RationalFunction`
  - `x` in `RealPolynomialNullaryFunction.express("x^2+1")` — codomain is `RealPolynomial`
  - `x` in `RationalFunction.express("½-x/2")` → produces `(-x+1)/2`

### 4. Placeholder Variable (NEW)

When the expression is non-nullary AND the codomain implements `Function`
(i.e. `expression.isInterfaceFunctional()` is true), a second free variable
may appear that is neither the independent variable nor a context variable
nor an upstream variable. This is the **placeholder variable** of the
codomain type — the variable of the output polynomial/rational function/etc.

Only **one** placeholder variable is allowed per expression. A second
unresolved free variable throws `CompilerException`.

- **Resolved by:** new resolution step: not context, not independent, not upstream,
  `expression.isInterfaceFunctional()` is true, `expression.placeholderVariable == null`
- **`reference.type` set to:** `expression.coDomainType`
- **Codegen:** `generateFunctionalVariableIdentity` (allocate + `.identity()`)
- **New field on Expression:** `public VariableNode<D,C,F> placeholderVariable`
- **Examples:**
  - `z` in `RationalFunctionSequence.express("n➔(½-z/2)ⁿ")` — `n` is independent (Integer), `z` is placeholder (RationalFunction)
  - `x` in `P:n➔when(n=0,1,n=1,(C(1)*x-β+α)/2,else,...)` — `n` is independent, `α`/`β` are context, `x` is placeholder
  - `x` in `f:k➔√((2*k+½)/π)*...*j(2*k,x)` — `k` is independent, `x` is placeholder

### 5. Upstream Variable

A variable that matches the independent variable of a containing (upstream)
expression. Occurs inside sub-expressions created by Σ, Π, or lambda bodies.

- **Resolved by:** `resolveUpstreamVariables()` walks `expression.acceptUntil()`
- **`reference.type` set to:** upstream expression's `domainType`
- **`upstreamInput` set to:** `true`
- **Codegen:** linked field from containing class
- **Examples:**
  - `x` inside a product body `Πk➔f(k,x){k=1…N}` where `x` is the outer expression's input
  - `t` in nested lambda `n➔t➔sin(tⁿ)` — `t` is the inner expression's independent variable, `n` is upstream

### 6. Undefined

None of the above. Throws `CompilerException`.

---

## Resolution Priority Table

| Priority | Condition | Kind | `reference.type` | Codegen |
|----------|-----------|------|-------------------|---------|
| 1 | Name found in `context.variables` | Context | `instanceVariable.getClass()` | field access |
| 2 | `isIndependent()` AND nullary | Independent (nullary) | `coDomainType` | `.identity()` |
| 3 | `isIndependent()` AND NOT nullary | Independent (input) | `domainType` | `loadInputParameter` |
| 4 | `isInterfaceFunctional()` AND `placeholderVariable == null` | Placeholder | `coDomainType` | `.identity()` |
| 5 | Found in upstream expression | Upstream | upstream's `domainType` | linked field |
| 6 | None | UNDEFINED | — | throw `CompilerException` |

**Row 4 is the only new addition.** It requires a new `placeholderVariable`
field on `Expression`. The field is assigned during resolution. If a second
variable hits row 4 and `placeholderVariable` is already assigned, it falls
through to row 6 and throws — only one placeholder is allowed.

---

## Relationship Between Independent and Placeholder

| Expression Type | `isNullaryFunction()` | `isInterfaceFunctional()` | Independent Variable | Placeholder Variable | Relationship |
|----------------|----------------------|--------------------------|---------------------|---------------------|-------------|
| `RealFunction` (Real→Real) | false | false | `x` (domainType=Real) | N/A | No placeholder possible; codomain is scalar |
| `RealNullaryFunction` (Object→Real) | true | false | `x` if present (coDomainType=Real) | N/A | No placeholder possible; codomain is scalar |
| `RationalNullaryFunction` (Object→RationalFunction) | true | true | `x` (coDomainType=RationalFunction) | same as independent | They collapse to one variable because there's no input |
| `RationalFunctionSequence` (Integer→RationalFunction) | false | true | `n` (domainType=Integer) | `z` (coDomainType=RationalFunction) | Distinct variables; `n` is input, `z` is placeholder |
| `RealPolynomialFunction` (RealPolynomial→RealPolynomial) | false | true | `x` (domainType=RealPolynomial) | could exist if a second free var appears | Independent is the input polynomial; placeholder would be the output polynomial's variable |
| `RealBivariateFunction` (Real→RealFunction) | false | true (codomain is RealFunction) | first variable (domainType=Real) | second variable (coDomainType=RealFunction) | Classic bivariate split |

---

## Why This Is Complete

Every variable encountered during parsing must be exactly one of:

1. **Already known** — its name is in `context.variables` → Context Variable
2. **The input** — it matches or becomes the independent variable → Independent Variable
3. **The output type's variable** — the codomain is functional and no placeholder is yet assigned → Placeholder Variable
4. **From an enclosing scope** — it matches an upstream expression's independent variable → Upstream Variable
5. **None of the above** → Undefined, throw error

There is no sixth option. There is no stack of placeholder variables.
There is no concept of "formal", "declared", or "indeterminate" variable.
A placeholder variable is simply the single variable that the output
functional type uses as its own variable, declared by its appearance in
the expression, limited to exactly one per expression.

