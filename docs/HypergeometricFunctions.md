---

# HypergeometricFunction Complete Specification (Corrected)

## 1. Class Hierarchy

```
HypergeometricFunction<P, C, N>
├── RealHypergeometricPolynomialFunction      (P=Real, C=RealPolynomial, N=RealPolynomialNullaryFunction)
├── ComplexHypergeometricPolynomialFunction   (P=Complex, C=ComplexPolynomial, N=ComplexPolynomialNullaryFunction)
├── RationalHypergeometricFunction            (P=Real, C=RationalFunction, N=RationalNullaryFunction)
└── ComplexRationalHypergeometricFunction     (P=Complex, C=ComplexRationalFunction, N=ComplexRationalNullaryFunction)
```

## 2. Type Parameters

| Parameter | Meaning | Concrete Types |
|-----------|---------|----------------|
| `P` | Scalar type for Pochhammer parameters α, β | `Real`, `Complex` |
| `C` | Polynomial/Rational type for symbolic computation | `RealPolynomial`, `ComplexPolynomial`, `RationalFunction`, `ComplexRationalFunction` |
| `N` | NullaryFunction type producing C | `RealPolynomialNullaryFunction`, `ComplexPolynomialNullaryFunction`, `RationalNullaryFunction`, `ComplexRationalNullaryFunction` |

## 3. HypergeometricFunction Internal State

| Field | Type | Mutated By | Description |
|-------|------|------------|-------------|
| `α` | `P` (vector) | `init()` | Upper Pochhammer parameters |
| `β` | `P` (vector) | `init()` | Lower Pochhammer parameters |
| `p` | `Integer` | `init()` | `α.dim()` |
| `q` | `Integer` | `init()` | `β.dim()` |
| `N` | `Integer` | `determineDegree()` | Truncation order from smallest negative integer in α |
| `z` | `C` | `initialize()` or `evaluate()` | **Series argument - receives arg function output** |
| `f` | `N` | `compile()` | Compiled series: `Σn→zⁿ·∏k→αₖ₍ₙ₎/(n!·∏k→βₖ₍ₙ₎){n=0…N}` |
| `F` | `Expression<Object,C,N>` | `compile()` | Expression that produces `f` |
| `context` | `Context` | `initializeContext()` | Contains p, q, α, β, N, z |
| `initialized` | `boolean` | `initialize()` | Guards one-time setup |
| `argIsConstant` | `boolean` | `init()` | Determines which arg function field is used |
| `constantArgFunc` | `N` | `init()` | Used when `argIsConstant=true` |
| `inputDependentArgFunc` | `Function<C,C>` | `init()` | Used when `argIsConstant=false` |

## 4. init() Method Variants

### 4.1 Constant Argument (NullaryFunction)

```java
init(Class<P>, Class<C>, Class<N>, α, β, N constantArg)
```

| Action | Effect |
|--------|--------|
| Set `argIsConstant` | `true` |
| Store arg function | `constantArgFunc = constantArg` |
| `inputDependentArgFunc` | remains `null` |

### 4.2 Input-Dependent Argument (Function<C,C>)

```java
init(Class<P>, Class<C>, Class<N>, α, β, Function<C,C> inputDependentArg)
```

| Action | Effect |
|--------|--------|
| Set `argIsConstant` | `false` |
| Store arg function | `inputDependentArgFunc = inputDependentArg` |
| `constantArgFunc` | remains `null` |

## 5. evaluate() Data Flow

```java
public final C evaluate(Object input, int order, int bits, C res)
```

### Step-by-Step Execution

```
┌─────────────────────────────────────────────────────────────────────────┐
│ STEP 1: Lazy initialization                                             │
├─────────────────────────────────────────────────────────────────────────┤
│ if (!initialized) {                                                     │
│     initialize();  // sets up f, and if argIsConstant, populates z      │
│ }                                                                       │
└─────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────┐
│ STEP 2: Populate z with argument value                                  │
├─────────────────────────────────────────────────────────────────────────┤
│ if (argIsConstant) {                                                    │
│     // z already populated in initialize()                              │
│     // input parameter is IGNORED                                       │
│ } else {                                                                │
│     // input is passed to arg function, result written to z             │
│     inputDependentArgFunc.evaluate((C) input, order, bits, z);          │
│     //                              ▲                          ▲        │
│     //                              │                          │        │
│     //                          READ ONLY                  MUTATED      │
│ }                                                                       │
└─────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────┐
│ STEP 3: Compute series using z                                          │
├─────────────────────────────────────────────────────────────────────────┤
│ return f.evaluate(null, order, bits, res);                              │
│ // f reads z (injected field), computes Σn→zⁿ·..., writes to res        │
└─────────────────────────────────────────────────────────────────────────┘
```

### Critical: What Gets Mutated Where

| Variable | Who Provides | Who Mutates | What It Contains After |
|----------|--------------|-------------|------------------------|
| `input` | Caller | Nobody | Symbolic indeterminate OR null |
| `z` | HypergeometricFunction | `argFunc.evaluate()` or `initialize()` | Transformed argument (e.g., `-ⅈ/(2x)`) |
| `res` | Caller | `f.evaluate()` | Final series result |

## 6. Concrete Subclass Instantiation

| Subclass | P | C | N | Scalar Type |
|----------|---|---|---|-------------|
| `RealHypergeometricPolynomialFunction` | `Real` | `RealPolynomial` | `RealPolynomialNullaryFunction` | `Real` |
| `ComplexHypergeometricPolynomialFunction` | `Complex` | `ComplexPolynomial` | `ComplexPolynomialNullaryFunction` | `Complex` |
| `RationalHypergeometricFunction` | `Real` | `RationalFunction` | `RationalNullaryFunction` | `Real` |
| `ComplexRationalHypergeometricFunction` | `Complex` | `ComplexRationalFunction` | `ComplexRationalNullaryFunction` | `Complex` |

## 7. HypergeometricFunctionNode State

| Field | Type | Computed From | Purpose |
|-------|------|---------------|---------|
| `α` | `Node<D,R,F>` | Parsed | Upper parameters AST |
| `β` | `Node<D,R,F>` | Parsed | Lower parameters AST |
| `arg` | `Node<D,R,F>` | Parsed | Argument AST |
| `αβDependsOnInput` | `boolean` | `α.dependsOn(indepVar) \|\| β.dependsOn(indepVar)` | Whether init() goes in initializer or generate() |
| `argumentDependsOnInput` | `boolean` | `arg.dependsOn(indepVar)` | Whether arg is NullaryFunction or Function<C,C> |
| `isNullaryFunctionOrHasScalarCodomain` | `boolean` | `expression.isNullaryFunction() \|\| hasScalarCodomain` | Whether element intermediate is needed |
| `hasScalarCodomain` | `boolean` | `coDomainType ∈ {Real, Complex, Fraction}` | Outer function returns scalar |
| `elementType` | `Class<?>` | Derived from coDomainType | Type of element field |
| `elementFieldName` | `String` | Generated | Name of element field |
| `hypergeometricFunctionClass` | `Class<?>` | Derived | Which subclass to instantiate |
| `argFunctionClass` | `Class<?>` | Derived | NullaryFunction or Function<C,C> |
| `argFunctionFieldName` | `String` | Generated | Name of compiled arg function field |
| `indeterminateFieldName` | `String` | Generated (Cases 4,8 only) | **Name of indeterminate field** |

## 8. Outer CoDomain → Internal Type Mapping

| Outer CoDomain | isScalarCodomain | elementType | hypergeometricFunctionClass |
|----------------|------------------|-------------|----------------------------|
| `Real` | true | `RationalFunction` | `RationalHypergeometricFunction` |
| `Complex` | true | `ComplexRationalFunction` | `ComplexRationalHypergeometricFunction` |
| `Fraction` | true | `RationalFunction` | `RationalHypergeometricFunction` |
| `RealPolynomial` | false | `RealPolynomial` | `RealHypergeometricPolynomialFunction` |
| `ComplexPolynomial` | false | `ComplexPolynomial` | `ComplexHypergeometricPolynomialFunction` |
| `RationalFunction` | false | `RationalFunction` | `RationalHypergeometricFunction` |
| `ComplexRationalFunction` | false | `ComplexRationalFunction` | `ComplexRationalHypergeometricFunction` |

## 9. The 8 Cases

| Case | αβDependsOnInput | argumentDependsOnInput | isScalarCodomain |
|------|------------------|------------------------|------------------|
| 1 | false | false | false |
| 2 | false | false | true |
| 3 | false | true | false |
| 4 | false | true | true |
| 5 | true | false | false |
| 6 | true | false | true |
| 7 | true | true | false |
| 8 | true | true | true |

### Case Analysis

| Case | Where init() | argIsConstant | Outer Domain | Input to hyp.evaluate() | z becomes | element | Final |
|------|--------------|---------------|--------------|-------------------------|-----------|---------|-------|
| 1 | initializer | true | C | null (ignored) | arg value | N/A | hyp.evaluate() return |
| 2 | initializer | true | scalar | null (ignored) | arg value | hyp result | element.evaluate(scalar) |
| 3 | initializer | false | C | outer's input (type C) | argFunc(input) | N/A | hyp.evaluate() return |
| 4 | initializer | false | scalar | **indeterminate field** | argFunc(x) | hyp result | element.evaluate(scalar) |
| 5 | generate() | true | C | null (ignored) | arg value | N/A | hyp.evaluate() return |
| 6 | generate() | true | scalar | null (ignored) | arg value | hyp result | element.evaluate(scalar) |
| 7 | generate() | false | C | outer's input (type C) | argFunc(input) | N/A | hyp.evaluate() return |
| 8 | generate() | false | scalar | **indeterminate field** | argFunc(x) | hyp result | element.evaluate(scalar) |

## 10. Cases 4 & 8: The Indeterminate Solution

### Problem
- Outer function domain: scalar (e.g., `Complex`)
- Arg function signature: `Function<C, C>` (e.g., `ComplexRationalFunction → ComplexRationalFunction`)
- Cannot pass scalar to arg function expecting polynomial/rational

### Solution
Add field `indeterminateFieldName` of type `C`, initialized to the polynomial `x` (identity).

### Data Flow for Cases 4 & 8

```
┌─────────────────────────────────────────────────────────────────────────┐
│ Generated class field: indeterminateℚℂ = new ComplexRationalFunction() │
│ Class initializer:     indeterminateℚℂ.identity()  // now represents x │
└─────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────┐
│ In evaluate(Complex y, ...):                                            │
│                                                                         │
│   hyp.init(α, β, argFunc);                                              │
│   hyp.evaluate(indeterminateℚℂ, 1, bits, element);                      │
│   //           ▲                              ▲                         │
│   //           │                              │                         │
│   //       READ: x                    WRITE: series in x                │
│   //                                                                    │
│   // Inside hyp.evaluate():                                             │
│   //   argFunc.evaluate(indeterminateℚℂ, ..., z)                        │
│   //   // z now contains e.g. -ⅈ/(2x) as ComplexRationalFunction        │
│   //   f.evaluate(..., element)                                         │
│   //   // element now contains series result as function of x           │
│                                                                         │
│   return element.evaluate(y, order, bits, result);                      │
│   //                      ▲                  ▲                          │
│   //                      │                  │                          │
│   //              actual scalar      final scalar result                │
└─────────────────────────────────────────────────────────────────────────┘
```

### What Each Variable Contains

| Variable | Type | Contains |
|----------|------|----------|
| `indeterminateℚℂ` | `ComplexRationalFunction` | The polynomial `x` (never mutated) |
| `z` (inside hyp) | `ComplexRationalFunction` | `-ⅈ/(2x)` after argFunc runs |
| `element` | `ComplexRationalFunction` | `Σn→(-ⅈ/(2x))ⁿ·...` - the series as rational function in x |
| `y` | `Complex` | Actual scalar input value |
| `result` | `Complex` | `element(y)` - series evaluated at y |

## 11. Generated Code Per Case

### Case 2: αβ constant, arg constant, scalar output

```java
// Class initializer:
hyp.init(α, β, argNullaryFunc);
hyp.evaluate(null, 1, bits, element);  // element populated once

// evaluate(Complex y, ...):
return element.evaluate(y, order, bits, result);
```

### Case 4: αβ constant, arg depends on input, scalar output

```java
// Class fields:
ComplexRationalFunction indeterminateℚℂ = new ComplexRationalFunction();

// Class initializer:
indeterminateℚℂ.identity();
hyp.init(α, β, argFunc);
hyp.evaluate(indeterminateℚℂ, 1, bits, element);  // symbolic computation

// evaluate(Complex y, ...):
return element.evaluate(y, order, bits, result);  // substitute actual value
```

### Case 6: αβ depends on input, arg constant, scalar output

```java
// evaluate(Complex y, ...):
hyp.init(α(y), β(y), argNullaryFunc);  // α,β computed from y
hyp.evaluate(null, 1, bits, element);
return element.evaluate(y, order, bits, result);
```

### Case 8: αβ depends on input, arg depends on input, scalar output

```java
// Class fields:
ComplexRationalFunction indeterminateℚℂ = new ComplexRationalFunction();

// Class initializer:
indeterminateℚℂ.identity();

// evaluate(Complex y, ...):
hyp.init(α(y), β(y), argFunc);
hyp.evaluate(indeterminateℚℂ, 1, bits, element);  // symbolic with x
return element.evaluate(y, order, bits, result);   // substitute y
```

***
