# The σ-table / sum-operand caching: how it SHOULD work vs. what is running now

> **Resolution shipped (commit `01efd2eb`).** The exponential is fixed by two
> coupled changes, both respecting the cardinal rules (no shared caches, guard
> intact):
> 1. **σfunc is now memoized.** `shouldCache()` caches an integer-indexed body
>    when its upstream is itself a generated functional
>    (`upstreamExpression == null || upstreamExpression.isGeneratedFunctional()`):
>    σ returns a `Sequence` ⇒ σfunc caches by k; the Σ operand's upstream `a`
>    returns a value ⇒ it stays uncached (it depends on the enclosing k as §2
>    describes, so caching it by j alone would serve stale terms).
> 2. **The σ-table is filled bottom-up** by `OrthogonalPolynomialMomentFunctionalSequence.warmTo(M,bits)`,
>    called from `MuntzPadeApproximant` before each Φ(M). This is the principled
>    way to memoize the cyclic {σ,α,β,h} recurrence without sharing caches:
>    computing it top-down memoized a partial ∅ (α(j) read σ(j)(j+1) while α(j)
>    was in flight); filling the triangular tableau in dependency order means
>    every read is of a fully-computed cell. Result: ~33K accesses → polynomial
>    (~8.5 hits per distinct value), no OOM, no ∅; full suite 0 errors.
>
> The freeze-the-index ideal in Part 1 remains the longer-term target (it would
> let `warmTo` and the operand's `k` field both disappear); `warmTo`'s precondition
> (consumers must warm before top-down reads) is documented on the method and is
> the one implicit-contract smell to encapsulate later. The rest of this document
> is the original analysis that led here.

---


This document has three jobs:

1. Explain, with the actual generated code, **exactly what is happening** — what
   writes which field, what reads it.
2. Describe **the ideal design**: how a sane compiler would emit this so that
   *everything caches, with no special cases and nothing ever overwritten.*
3. Describe **the half-assed patch job presently running**: every kludge, why it
   exists, and what it costs.

Two concrete symptoms anchor everything:

- **Symptom A (silent):** building the tanh approximant performs ~**34.7 million**
  cache lookups for only ~**300** distinct values. Answers are right; the machine
  does 35M redundant evaluations.
- **Symptom B (loud, if you "just turn caching on"):** the Müntz `a(k)` recurrence
  returns wrong numbers (tanh → 0.7304 instead of 0.7616).

Both come from the same root: a generated function is allowed to read a field that
something else rewrites between calls.

---

# Part 0 — The one fact everything hinges on

A function in the expression language can take more than one index: `σ : j ➔ k ➔ …`,
or a sum `Σ_{j} body(j, k)` whose body needs both the loop variable `j` and the
enclosing `k`.

But every generated `evaluate` method has exactly **one** index slot:

```
evaluate(index, order, bits, result)
```

So when a function needs a *second* index, the compiler has to deliver it some other
way. **How it delivers that second index is the entire story.** There are two ways:

- **Freeze it in the instance** — set it once when the instance is built, never change
  it. (This is what makes a value cacheable.)
- **Rewrite it in a field before each call** — mutate a field, then call. (This is what
  makes a value *un*-cacheable and fragile.)

The compiler currently does the *first* for two-index sequences (`σ`) and the *second*
for sum operands. That inconsistency is the bug.

---

# Part 1 — THE IDEAL DESIGN (how it is supposed to work)

## 1.1 One uniform rule for every indexed function

> Every generated function instance is built with its *outer* indices **frozen at
> construction**, and computes a value from its **one index argument** plus that frozen
> state. Its result for a given argument therefore never changes, so the instance
> memoizes results in its own private cache, keyed by the argument. Nothing is ever
> overwritten; nothing is ever shared between instances.

That single rule covers *both* two-index sequences and sum/product operands — they are
the same kind of object and should be emitted the same way.

## 1.2 A two-index sequence `σ : j ➔ k ➔ …`

- Outer class `σ`: `σ.evaluate(j)` builds a **new** inner object, sets its `j` **once**,
  and returns it. `σ` caches inner objects by `j` (one per `j`, forever).
- Inner class `σfunc`: holds a frozen `j`; `σfunc.evaluate(k)` computes `σ(j)(k)` and
  **caches it by `k`** in its own cache. Because `j` never changes for that object, the
  cached value is always valid.

Cost: each `(j,k)` cell computed once → polynomial. This half already works today.

## 1.3 A sum `… r · Σ_{j=1}^{k-2} a(j)·a(k-1-j)` — *identical* treatment

The body `a(j)·a(k-1-j)` needs `j` (the loop variable, the argument) and `k` (the
enclosing index). In the ideal design `k` is treated **exactly like `σfunc`'s `j`**:

- When `a.evaluate(k)` reaches the sum, it builds **a new operand instance for this
  `k`**, sets the operand's `k` **once**, and loops `j`.
- The operand holds a frozen `k`; `operand.evaluate(j)` returns `a(j)·a(k-1-j)` and may
  cache by `j`. Because `k` never changes for that object, any cached value is valid.
- The next `a.evaluate(k')` builds a **different** operand instance with a different
  frozen `k'`. The two never interfere.

(For the sum specifically the cache is optional — each `j` is visited once per `k`, so
there is no reuse to gain — but the point is **correctness through a frozen index**, not
a rewritten one. Keep it cached for uniformity or skip it; either is correct once `k`
is frozen.)

## 1.4 Wiring: a tree of instances, built top-down, no runtime Context lookups

- Every reference field (`σfunc.α`, `a.operandF0001`, `m.a`, …) is bound to a **fresh
  instance**, created and configured by its parent at construction time. The parent
  passes down the dependency and variable references it already holds.
- `this.<f>` is **never** `this`, and **no instance is shared between two reference
  sites**. The instance graph is therefore a **tree**.
- Generated code **never** calls `context.lookupFunctionInstance(...)` at runtime to
  find a shared instance. The Context is a compile-time registry of *classes*, not a
  runtime pool of *instances*.

## 1.5 What that buys you, for free

- **No re-entry.** A tree has no cycles, so no instance is ever on the call stack twice,
  so no instance's scratch fields are ever clobbered mid-computation. The `evaluating`
  re-entrancy guard becomes a tripwire that *never fires* — proof the invariant holds,
  not a mechanism doing work.
- **Caching is unconditional.** Every integer-indexed instance caches its own results.
  There is no `shouldCache()` gate to get wrong, because every value is a pure function
  of (argument, frozen state). Symptom A cannot happen.
- **No staleness.** No field is rewritten between uses, so no cache can hold a value
  computed under a now-changed index. Symptom B cannot happen.
- **Polynomial cost**, always.

---

# Part 2 — WHAT IS ACTUALLY RUNNING (the half-assed patch job)

## 2.1 `shouldCache()` is a blunt rule that starves the inner sequence

```java
boolean shouldCache() {
   return domainType.equals(Integer.class) && upstreamExpression == null;
}
```

`upstreamExpression == null` is only true for **top-level** sequences. The inner
`σfunc` (the `k➔…` half of `σ:j➔k➔…`) has `upstreamExpression == σ`, so it is **denied a
cache**. So `σfunc.evaluate(k)` recomputes the 3-term recurrence on every call, and each
call spawns three deeper calls → `φ^j` blow-up → **34.7M lookups at 256 bits** (Symptom
A).

Why the rule is written this blunt: the *same* `upstreamExpression != null` test also
happens to exclude the sum operand (§2.2), whose caching *would* corrupt. So one crude
rule throws out `σfunc`'s needed cache in order to deny the operand a cache it must not
have. Baby, meet bathwater.

**Ideal:** §1.2 — `σfunc` always caches by `k`. No gate.

## 2.2 The sum operand reads a `k` field that `a.evaluate` rewrites every call

Generated operand (decompiled, trimmed):

```java
class operandF0001 {
   a       a;
   Integer k;                                  // a FIELD, not an argument
   ComplexPolynomial evaluate(Integer j, ...) {
      return a.evaluate(j).mul( a.evaluate( (this.k - 1) - j ) );   // reads this.k
   }
}
```

Generated enclosing `a` (decompiled, trimmed):

```java
ComplexPolynomial evaluate_body(Integer k, ...) {
   this.operandF0001.k.set(k);                 // <-- THE ONLY WRITER. runs every call.
   for (j = 1; j <= k-2; j++)
      sum.add( this.operandF0001.evaluate(j) );
}
```

The field `operandF0001.k` is overwritten at the top of **every** `a.evaluate`. The
operand's output for a given `j` therefore depends on which `a(…)` ran most recently —
it is not a function of `j` alone. Trace:

1. `a.evaluate(4)` → `operandF0001.k = 4` → `operandF0001.evaluate(1)` = `a(1)·a(2)`.
   If cached: `cache[1] = a(1)·a(2)`.
2. `a.evaluate(3)` → `operandF0001.k = 3` → `operandF0001.evaluate(1)` should be
   `a(1)·a(1)`, but the cache returns the stale `a(1)·a(2)` from step 1. **Wrong**
   (Symptom B). The wrong term poisons `m(3)=a(4)` → σ → h → α → Φ → tanh.

So today the operand is left **uncached** (it falls in the `upstreamExpression != null`
bucket), which is accidentally correct but only because §2.1's blunt rule also catches
it.

**Ideal:** §1.3 — build a fresh operand per `k`, freeze `k`, never rewrite. Then it is a
clean function and caching is safe (or unnecessary).

## 2.3 `privateToOwner` — patches *sharing*, not the rewritten field

A recent commit added `FunctionMapping.privateToOwner`, set on NAry operands
(`NAryOperationNode`), and read in `constructReferencedFunctionInstanceIfItIsNull`: a
`privateToOwner` operand is **not** fetched from the Context's shared pool — each owning
`a` instance allocates its own operand.

What it fixed: previously the operand was pulled from the Context and **shared across
recursion levels**. Level `a(4)` set the shared `k=4`, then recursed into `a(3)` which
overwrote the shared `k=3`; when `a(4)` resumed it computed `a((3-1)-j)` and the index
went **negative** → `when(k=1,…)` has no `k≤0` base case → infinite descent →
StackOverflow. `privateToOwner` gives each `a` its own operand, so a *deeper* `a` no
longer clobbers a *shallower* one's `k`.

What it did **not** fix: within a single `a` instance that computes several `k` (e.g.
`a1` computes `a(3)`, then `a(2)`, then `a(1)` while filling a convolution), that one
operand's `k` field is **still rewritten** each call. So the operand is still not a clean
function of `j`; it still cannot be cached. `privateToOwner` is a patch over §2.2, not a
cure.

**Ideal:** §1.3 makes `privateToOwner` unnecessary — a per-`k` operand with a frozen `k`
is automatically private to one `k` and one owner.

## 2.4 Generated `initialize()` calls `context.lookupFunctionInstance(...)` at runtime

`constructReferencedFunctionInstanceIfItIsNull` emits, for a reference field, code that
asks the Context for a **canonical shared instance** and only allocates a fresh one as a
fallback. That shared instance is exactly how the operand (before §2.3) and other
cluster members ended up aliased across reference sites, producing the cycles that the
re-entrancy guard then has to catch. The pulled patch bolts on extra conditions (skip if
`privateToOwner`; skip if the found instance's `evaluating` flag is already true) to
dodge the worst cases.

**Ideal:** §1.4 — generated code never consults the Context for instances. The parent
hands every child a fresh instance at construction. No lookup, no sharing, no cycle, no
need for the dodges.

## 2.5 The re-entrancy guard — a tripwire doing a mechanism's job

Each generated `evaluate` is wrapped in `if (this.evaluating) throw …; this.evaluating =
true; try { … } finally { this.evaluating = false; }`. In the ideal tree-of-instances
design this can never trigger. Today it *does* trigger (e.g. `InverseFunctionTest`,
`α→σfunc→α`) precisely because §2.4's sharing puts an instance on its own call stack
twice. The guard is correct to exist as a permanent tripwire; the fact that it *fires* is
the symptom that §2.4 is still wrong.

(Project rule: the guard must **not** be removed. The fix is to remove the *sharing* that
makes it fire — §1.4 — not the guard.)

---

# Part 3 — The gap at a glance

| Concern | Ideal (§1) | Presently running (§2) |
|--|--|--|
| Inner sequence `σfunc` cache | always cached by `k`; `j` frozen at birth | **no cache** → 34.7M recomputations |
| Sum operand's extra index `k` | **frozen** once per `k`-instance | **rewritten** every `a.evaluate` via `operandF0001.k.set(k)` |
| Operand instances | one per `k`, in a tree | one per owner (`privateToOwner` patch), `k` still rewritten within it |
| `shouldCache()` | does not exist; cache always | blunt `Integer && upstream==null`; wrong for `σfunc`, accidentally-right for operand |
| Wiring | parent passes fresh instances down | generated code calls `context.lookupFunctionInstance` at runtime |
| Re-entrancy guard | never fires (tree ⇒ acyclic) | fires (sharing ⇒ cycles), patched with `evaluating`-checks |
| Cost | polynomial, always | exponential lookups (correct values, 35M times) |

---

# Part 4 — What to actually change (in priority order)

1. **Give every integer-indexed instance a cache; delete the `shouldCache()` gate.**
   Safe *only after* step 2, because today the gate is the one thing keeping the
   rewritten-field operand from being cached and corrupting.
2. **Stop rewriting indices into fields.** Emit a sum/product operand as a fresh
   instance per outer index with that index **frozen at construction** (like `σ` builds
   `σfunc` per `j`). After this, no generated function reads a field that another method
   rewrites — the operand is a pure function of its argument, so step 1 is safe and
   `privateToOwner` becomes redundant.
3. **Bind every reference to a fresh instance at construction; remove runtime
   `lookupFunctionInstance` from generated `initialize()`.** The instance graph becomes a
   tree; the re-entrancy guard stops firing on its own.
4. **Keep the re-entrancy guard** as the tripwire that proves the tree invariant holds.

The throughline: the present code passes a needed second index through a **rewritten
field**, then spends three separate patches (`shouldCache` exclusion, `privateToOwner`,
the `evaluating` lookup-skip) coping with the fallout. Freeze the index instead and all
three patches disappear, and caching can be on everywhere with no exceptions.
