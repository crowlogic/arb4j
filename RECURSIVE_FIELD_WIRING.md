# Recursive Self-Field Wiring in Generated Evaluators

## The problem

A generated sequence class such as `a` (type `Integer → ComplexFunction`) contains a
field `public a a` whose purpose is to supply the recursive sub-evaluations the
sequence needs to compute each term.  The naive reading — "assign `this.a = this`
so the sequence can call itself" — violates **A3** and corrupts evaluation.

Every generated evaluator owns mutable scratch registers (`vℂ0010`, `vℝ0002`, …),
a `TreeMap` cache, and an `isInitialized` flag.  Assigning `this.a = this` means any
recursive call re-enters the *same* object while its scratch registers still hold
intermediate values from the outer call.  ARB ball arithmetic mutates in place; the
outer call's partial result is silently overwritten.  The computed value is wrong and
the error is not detectable without a closed-form reference.

## Why only two instances are needed

Consider the first-order recurrence

```
a(1)    = base(v)
a(k)    = f( a(k-1)(v), S(k)(v) )       k ≥ 2
```

`a(k)` depends only on `a(k-1)`.  That is a **recurrence of order one**: each
term needs exactly the previous term, nothing further back.

If `aOuter` is asked for term `k`, it creates (and caches) an `afunc` whose
`.a` field points to `aInner`.  `aInner` is then asked for term `k-1`, creates
its own `afunc` whose `.a` field points back to `aOuter`.  `aOuter` is then
asked for term `k-2` — already cached — and so on, alternating down to the base
case.

```
aOuter.evaluate(4)  →  afunc_4.a = aInner
aInner.evaluate(3)  →  afunc_3.a = aOuter
aOuter.evaluate(2)  →  afunc_2.a = aInner   (cached after first call)
aInner.evaluate(1)  →  afunc_1  (base case, does not recurse into .a)
```

The two instances share the work: even-indexed terms accumulate in `aOuter.cache`,
odd-indexed terms in `aInner.cache`.  Every term is computed exactly once.
The evaluators never re-enter each other's scratch registers because each
`afunc` is a *separate object* whose own scratch registers are untouched by the
sibling `a` instance.

For a recurrence of order `d`, the minimum number of distinct `a` instances
required is `d + 1`.  For the Rough Heston Riccati recurrence `d = 1`, so
**two instances suffice**.

## Correct wiring

```java
// In the compiler's initialization-emitter, or in hand-written test setup:
a aOuter = new a();
a aInner = new a();

// Wire scalars on both — they must share the same parameter values.
aOuter.λ = λ;  aOuter.μ = μ;  aOuter.ν = ν;  aOuter.ρ = ρ;
aInner.λ = λ;  aInner.μ = μ;  aInner.ν = ν;  aInner.ρ = ρ;

// Two-instance ping-pong — neither aliases this, A3 satisfied.
aOuter.a = aInner;
aInner.a = aOuter;

aOuter.initialize();
aInner.initialize();
```

Any peer that needs to call the sequence (e.g. `operandF0001` inside `Sfunc`,
or `S` itself) should receive `aOuter` as its `.a` field so it hits the same
shared caches.

## What the compiler must emit

For a generated sequence class `C` that has a recursive self-field `C.c`:

1. **Declaration**: emit `public C c;` in the generated class.
2. **In `evaluate()`**: before calling `var.initialize()` on a newly
   constructed `C` instance, emit `var.c = this.c;` so the child receives
   the sibling evaluator rather than constructing a fresh orphan chain.
3. **In `initialize()`**: do *not* emit `this.c.c = this.c;`.  That line
   turns the sibling into a self-aliased singleton and re-introduces the A3
   violation one level down.
4. **For every peer class** `P` that holds a field of type `C` (e.g.
   `Sfunc.operandF0001` holds `operandF0001.a : C`):
   - `P` must declare `public C c;`.
   - The sequence class `S` whose `evaluate()` creates `P` instances must
     emit `var.c = this.c;` before `var.initialize()`.
   - `P.initialize()` must emit `this.operandF0001.c = this.c;`.
   - `P.initialize()` must *not* emit `this.c.c = this.c;`.

## The sins to remove from every generated `initialize()`

The pattern

```java
this.a.a = this.a;
```

appearing in any `initialize()` method (whether in `S`, `operandF0001`,
`afunc`, or any other generated class) is an A3 violation and must be
deleted.  It converts the correctly-wired separate sibling into a
self-aliased loop, undoing the two-instance design.

Likewise

```java
if (this.a == null) {
    this.a = new a();
}
this.a.a = this.a;   // ← delete this line
```

The null-guard `new a()` is acceptable as a fallback for classes that do
not receive an injected sibling (they will form their own independent
two-instance pair lazily), but the `this.a.a = this.a` assignment that
follows it is never acceptable.
