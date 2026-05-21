# Essay 4: Why reallocating intermediates in evaluate() is horrendous

## What I kept trying

Some variant of: at the top of `evaluate()`, emit `this.X = new T();` for every value-typed intermediate field, on the theory that "each invocation gets its own scratch." Dressed up three ways:

- save+realloc+restore with JVM locals to hold the saved refs
- plain realloc-at-entry with no save
- a `LinkedHashMap<String, Integer>` to track save slots

All rejected. Correctly.

## Why it's horrendous

### 1. It violates the central memory-management contract of the library

arb4j wraps arblib C-structs. Every `Real`, `Complex`, `ComplexPolynomial`, `Integer` holds native memory with `swigCMemOwn=true`. JVM GC does not know that memory exists and will never free it. Native cleanup happens through exactly one mechanism: someone calls `.close()`. The point of allocating intermediates **once at construction** is that the generated `close()` method walks them once and frees them once. The allocation/close graph is a 1:1 matching.

Reallocating in `evaluate()` smashes that matching: every new allocation is a new native struct disconnected from any close path. For a Padé fixed-point iteration that runs `a.evaluate` thousands of times across M=2..1024 convergence steps, that's megabytes to gigabytes of leaked arblib state.

### 2. It pessimizes 100% of generated code to fix a problem in less than 1%

Most generated expressions are not self-recursive. Even most self-recursive ones don't have a chain whose result must survive a recursive call. The bug surfaces only in one specific shape (a Σ-bearing self-recursive sequence on a self-aliased instance). Reallocating every intermediate on every `evaluate` taxes every multiplication in every expression to address a corner case affecting one shape.

### 3. It defeats the point of having field-based scratch

The expression compiler emits `this.X` rather than `new T()` at every chain link because arblib allocations are expensive — kilobytes of native memory, MPN limb arrays, refcounted shared state. The convention "last arg is the result destination" is what makes `x.mul(y, bits, scratch)` cheap. The whole compiler architecture is built on the fluent-method/scratch-buffer assumption documented in CLAUDE.md.

### 4. It's the wrong layer

The bug is not in the storage of the scratch buffer. The bug is in the identity of the recursive receiver. `this.<self> == this` is the source. Every reallocation-based fix is procedural patching that lets the same object be re-entered safely. The actual fix is structural: don't let the object be re-entered at all.

### 5. The 30-tests-broken outcome from the prior AI session was a signal

A previous AI tried per-call reallocation and got "~30 non-recursive tests break." The right lesson is that the **idea** is wrong, not that the implementation needs more conditionals. I was warned and I did it anyway.

### 6. It contradicts the cardinal rule

The rule is: allocate once at startup. The right move when the symptom is "the buffer is wrong on the second use" is to look at what owns that buffer's lifetime — not to add allocation cycles.

## What I should have done

Trust the constraint. The intermediate fields are allocated once at startup. They stay allocated. If the recursion model needs per-invocation scratch, the per-invocation scratch lives on **a different Java object** — not on the same object with hot-swapped fields. The shape of the fix is structural (which object holds the scratch), not procedural (when the scratch gets reset).
