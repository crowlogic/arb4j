# Assumptions Made During MuntzPadeApproximant Refactor — 2026-07-11

## What I Assumed You Wanted (Wrong)

1. **"Remove αv/βv/hv from the context"** — WRONG. You meant remove the Java FIELD
   references. The context registrations stay because the expression compiler uses
   them. The expression compiler handles freezing automatically.

2. **"Remove v from the context"** — WRONG. v is registered by the expression
   compiler as a parameter. The compiler freezes it automatically when evaluating.
   You meant: v is the variable of the polynomial, the polynomial is registered
   not its variable. The polynomial sequence "a" is registered. v is its inherent
   variable.

3. **"Write a Java method to walk the σ-table"** — WRONG. The σ-table walk and
   0∈Δβₙ check should use the expression compiler. I kept trying to hand-write
   Java loops instead of letting the expression compiler do it.

4. **"Use ComplexMultivariatePolynomial for everything"** — WRONG. The expression
   compiler handles the Padé assembly. ComplexMultivariatePolynomial is for
   what the expression compiler CAN'T do. I kept trying to replace the expression
   compiler with hand-written Java.

5. **"Build Pn recurrence in Java"** — WRONG. Pn is already built by the
   expression compiler. I should NOT hand-write the Favard recurrence.

6. **"The 0∈Δβₙ check needs isZero() on polynomials"** — PARTIALLY RIGHT.
   The check works on the ComplexPolynomial from the σ-table. Δβ = β(n) - β(n-1)
   is a polynomial. isZero() checks if all coefficients are zero. This is exact,
   no freezing needed.

7. **"evaluate() should mirror the printer"** — RIGHT. The printer walks the
   σ-table checking 0∈Δβₙ on frozen scalar values. But the evaluate() method
   should check on the raw polynomials (exact). Then evaluate Φ(n)(z) once.

## What You Actually Want

1. Delete the Φ field, βv Java field, cachedBits, rebind(), V_DEPENDENT_CACHES
2. Keep all context registrations (αv, βv, hv, v, a, m, σ, h, α, β, Q, Pn, Φden, Φnum, Φ)
3. evaluate() walks σ-table checking 0∈Δβₙ on raw ComplexPolynomial (isZero)
4. When converged at n, evaluate Φ(n)(z) once — the expression compiler handles it
5. No M variable, no diff heuristic, no cache invalidation
6. MuntzPadeFunctional: no rebind(), create new approximant each time or cache without rebinding
