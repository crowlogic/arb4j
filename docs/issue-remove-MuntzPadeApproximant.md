# Removal of `MuntzPadeApproximant` — architectural correction

## What was wrong

The class `MuntzPadeApproximant` (and the design of `MuntzPadeFunctional` that delegated to it) was built on a fundamentally wrong premise: that the σ-table / Jacobi / Padé computation should be parameterized by a **scalar value of `v`**, and that the whole hierarchy must be rebuilt or rebound for each such value.

### The σ-table is ℂ[v]-valued polynomial algebra, NOT point evaluation

The moment sequence `k ↦ aₖ(v)` lives in ℂ[v] — each moment is a polynomial in `v`. The Chebyshev/Wheeler σ-table and the derived Jacobi sequences `α(j)(v)`, `β(j)(v)`, `h(j)(v)` are therefore **polynomials** in ℂ[v]. They are compiled once and valid for **all** `v`.

The old code:
1. Registered `v` as a **scalar** `Complex` in the expression context (`context.registerVariable("v", this.v)`)
2. Built `αvSeq:n➔α(n)(v)` — evaluating the polynomial α(n) at a specific `v`, producing **scalars** instead of polynomials
3. Built `βvSeq`, `hvSeq` the same way — discarding the polynomial structure
4. Required `rebind(v, bits)` to change `v` — a point-wise recomputation of the scalar chains
5. Treated the entire σ-table as a point-specific computation that needed re-freezing per `v`

This is architecturally wrong because:
- The σ-table over ℂ[v] is constructed once, symbolically, by the `OrthogonalPolynomialMomentFunctionalSequence`. No `v` value enters it.
- The polynomial variable `v` belongs to the moments (`a(k) ∈ ℂ[v]`), not to the σ-table construction machinery.
- Evaluating α(j), β(j), h(j) at a specific `v` is a **separate** operation that happens at the very end (when computing the rational approximant at a given `(v, t)`), not during σ-table assembly.
- The Padé approximant φ(M)(z) = Φnum(M)(z)/Φden(M)(z) is a rational function in `z` whose coefficients are themselves ℂ[v] polynomials. It is defined for all `v`, not frozen at one.

### `MuntzPadeApproximant` implemented the wrong concept

`MuntzPadeApproximant` was a class that:
- Held a **scalar** `v` and registered it in the context as a runtime variable
- Built αvSeq/βvSeq/hvSeq that **evaluated** ℂ[v]-polynomials at that specific `v`, discarding the ℂ[v] structure
- Required `rebind(v)` to change `v` and invalidate the v-dependent caches
- Implemented `ComplexFunction.evaluate(t)` with a convergence criterion based on diff-magnitude thresholds (wrong termination criterion — should be `0 ∈ Δβₙ`)

This is exactly backwards: the σ-table is compiled once over ℂ[v], and `v` enters only as the symbolic variable of the coefficient polynomials. No scalar v-value should ever be injected into the context.

### Wrong termination criterion

The `evaluate(t, ...)` method used a diff-magnitude threshold (`diffMag.compareTo(threshold) <= 0`) to decide convergence of the M-iteration. The correct criterion — already implemented in `PadePrinter` — is `0 ∈ Δβₙ`: the ball arithmetic interval of the change in β contains zero, meaning the recurrence has reached a fixed point.

## Changes

1. **Deleted** `MuntzPadeApproximant.java` entirely.
2. **Removed** all `v`-as-scalar registration from `MuntzPadeFunctional`:
   - No `context.registerVariable("v", ...)` (was injecting a scalar into context)
   - No `αvSeq`/`βvSeq`/`hvSeq` (these evaluated ℂ[v]-polynomials at a specific v — wrong)
   - No `rebind(v, bits)` (no v to rebind)
3. `MuntzPadeFunctional` now builds all sequences in its constructor (mSeq, ops, σ, α, β, h, Pn, Φden, Φnum, Φ), the same way `MuntzPadeApproximant`'s constructor did, but **without** v.  
4. `RiccatiMuntzPadeFunctional` no longer evaluates through `MuntzPadeFunctional.evaluate(v, ...)`; the printer and tests access the functional directly.
5. `PadePrinter` now works with the polynomial sequences αSeq, βSeq, hSeq directly — no αvSeq/βvSeq/hvSeq.
6. `makeExpressionApproximant` deleted — the expression mode now builds `a(k) = diff(f(t), t^k)/Γ(k+1)` via the expression compiler with no Java lambda.
