# Borel-Padé-Ei+ Pipeline: Design Document

Resolves [#1177](https://github.com/crowlogic/arb4j/issues/1177).

## 1. Overview

This document maps the techniques from Castillo (2026) / arXiv:2403.17170v2 —
Borel-Écalle summation, diagonal Padé in the Borel plane, partial fraction
decomposition, directional Laplace transforms, and exponential integral (Ei+)
reconstruction — to specific arb4j subsystems.

The pipeline approximates functions with essential singularities (e.g.,
Painlevé I tritronquée solutions) from divergent asymptotic series:

```
Divergent Series → Borel Transform → Padé [N/N] → Partial Fractions → Ei+ Combination
```

## 2. Technique-to-Subsystem Mapping

### 2.1 Borel Transform

**Mathematical operation**: Given a divergent asymptotic series
`S_{2N}(x) = Σ_{k=0}^{2N} a_k / x^{k+1}`, the Borel transform produces a
polynomial in the Borel variable `p`:

```
F_{2N}(p) = Σ_{k=0}^{2N} a_k p^k / k!
```

**arb4j subsystem**: New utility class `BorelTransform` operating on `Real[]`
coefficients. Uses `Real.gamma(k+1)` for k! (or `Real.rising(1, k)` for the
Pochhammer symbol). The factorial division is exact in ball arithmetic:
`b_k = a_k / Γ(k+1)` computed via `arb_div`.

**Dependencies**: `Real` arithmetic, `Real.gamma` (existing SWIG binding to
`arb_hypgeom_gamma`).

### 2.2 Diagonal Padé Approximant in the Borel Plane

**Mathematical operation**: Construct the `[N/N]` Padé approximant of
`F_{2N}(p)` about `p = 0`. This is a rational function `A_N(p)/B_N(p)` with
`deg A ≤ N`, `deg B ≤ N`, `B(0) = 1`.

**arb4j subsystems** (three options, in order of preference):

1. **`MuntzPadeApproximant`** (existing): General adaptive Müntz-Padé. For
   classical Padé (μ=1), set α=1, v=0. The σ-table automatically determines
   the RKHS dimension. The `ΦnumSeq` and `ΦdenSeq` sequences give the
   numerator/denominator polynomials.

2. **`EpsilonTable`** (existing): Wynn's epsilon table, whose even-order columns
   are diagonal Padé `[m/m]` approximants. Works directly from series
   coefficients. `limit()` drives to convergence.

3. **`DiagonalPadePair`** (existing): Direct construction of `[M/M]` Padé pair
   from Taylor coefficients. Uses the qd algorithm internally.

**For the Borel-Padé pipeline**: Option 1 (`MuntzPadeApproximant`) is preferred
because it integrates with the σ-table termination certificate. The Borel
transform produces coefficients `b_k = a_k/k!`, which are registered as a
`RealSequence` in a `Context`, and the approximant builds the Padé directly.

### 2.3 Partial Fraction Decomposition

**Mathematical operation**: Decompose `A_N(p)/B_N(p)` into simple poles:

```
A_N(p)/B_N(p) = Σ_{k=1}^{N} c_k / (p - p_k)
```

**arb4j subsystems**:

- **Root isolation**: `ComplexPolynomial.roots(int bits)` → FLINT's
  `acb_poly_roots` via SWIG. Returns a `Complex` vector of ball-enclosed roots.
  Existing in codebase, tested in `MuntzPadeRKHSTest.testSupportRoots`.

- **Residue computation**: For each root `p_k`, the residue is
  `c_k = A_N(p_k) / B'_N(p_k)`. The derivative `B'_N` is computed via
  `ComplexPolynomial.derivative()`. The division is ball arithmetic. Alternatively,
  if the roots are simple: `c_k = A_N(p_k) / Π_{j≠k} (p_k - p_j)`.

- **Data type**: `RoughHestonPartialFractionExpansion` (existing pattern) holds
  poles + residues. A new `BorelPartialFraction` class can generalize this for
  the Borel plane context.

### 2.4 Directional Laplace Transform + Ei+ Reconstruction

**Mathematical operation**: The directional Laplace transform of each partial
fraction term yields:

```
L_θ{1/(p - p_k)} = -e^{-p_k x} Ei+(p_k x)
```

where `Ei+(z) = -E_1(-z)` and `E_1` is the exponential integral.

**arb4j subsystems**:

- **`arb_hypgeom_expint(s, z, prec)`** (newly added SWIG binding): Computes
  `E_s(z)` for real `s` and real/complex `z`. `E_1(z)` = `expint(1, z)`.
  `Ei+(z) = -E_1(-z) = -expint(1, -z)`.

- **`acb_hypgeom_expint(s, z, prec)`** (newly added SWIG binding): Complex
  version for complex `z`.

- **Convenience methods**: `Real.expint(s, bits)` and `Complex.expint(s, bits)`
  added to `Real.i` and `Complex.i`.

- **Final reconstruction**:

```
f_{N,θ}(x) = -Σ_{k=1}^{N} c_k · exp(-p_k · x) · Ei+(p_k · x)
```

where each term is: `c_k * (-exp(-p_k*x)) * (-expint(1, -p_k*x))` in ball
arithmetic. The exponential `exp(-p_k*x)` uses `Complex.exp()`.

### 2.5 Analytic Continuation

**Mathematical operation**: The function element `(f_{N,θ}, Π_θ)` where
`Π_θ = {x : Re(x·e^{iθ}) > 0}` extends to a sectorial neighborhood by
rotating the integration ray.

**arb4j subsystem**: This is inherent in the choice of integration angle θ.
The directional Laplace transform selects which poles to include/exclude. In
practice, θ is chosen to avoid all poles `{p_k}` in the Borel plane. The
`Complex` ball arithmetic handles the analytic continuation automatically.

## 3. Prototype Implementation

### 3.1 Classes

| Class | Location | Role |
|-------|----------|------|
| `BorelTransform` | `arb.series.BorelTransform` (new) | Divides series coefficients by k! |
| `BorelPadeEiPlusReconstructor` | `arb.series.BorelPadeEiPlusReconstructor` (new) | Full pipeline: Borel → Padé → partial fractions → Ei+ |
| `BorelPadeEiPlusTest` | Test file (new) | Verifies pipeline on known examples |

### 3.2 Algorithm (BorelPadeEiPlusReconstructor)

```java
public Complex evaluate(Real[] asymptoticCoeffs, int N, double x, int bits) {
    // 1. Borel transform: b_k = a_k / k!
    Real[] borelCoeffs = BorelTransform.transform(asymptoticCoeffs, N, bits);

    // 2. Build Padé [N/N] via MuntzPadeApproximant (μ=1, classical)
    //    Register borelCoeffs as a RealSequence in a Context
    //    Evaluate Φden(N) and Φnum(N) to get polynomials

    // 3. Find poles: roots of Φden(N)(p)
    Complex poles = denomPoly.roots(bits);

    // 4. Compute residues: c_k = Φnum(p_k) / Φden'(p_k)
    //    (or via partial fraction decomposition)

    // 5. Reconstruct: f(x) = -Σ c_k · exp(-p_k · x) · Ei+(p_k · x)
    //    where Ei+(z) = -expint(1, -z)
    Complex result = new Complex();
    for each pole p_k with residue c_k:
        Complex pkx = p_k * x;
        Complex eiminus = (-pkx).exp(bits);       // e^{-p_k x}
        Complex eip = (-pkx).expint(one, bits);   // Ei+(p_k x) = -E_1(-p_k x)
        result += c_k * eiminus * eip;
    return -result;
}
```

## 4. Painlevé I Benchmark Test

### 4.1 Setup

PI: `y'' = 6y² - z`. Boutroux transformation maps to:

```
x = (24z)^{5/4} / 30,   y = -√(z/6) · (1 + h(x))
```

The transformed equation has asymptotic expansion:

```
h(x) ~ 4/(25x²) - 392/(625x⁴) + 6272/(625x⁶) - ...
```

which is factorially divergent.

### 4.2 Test procedure

1. Extract first 2N coefficients of the asymptotic expansion
2. Apply Borel transform
3. Build Padé [N/N] in the Borel plane
4. Partial fraction decomposition → poles {p_k} and residues {c_k}
5. Reconstruct via Ei+ at test points
6. Compare against high-precision numerical integration of PI
7. Verify error matches Stahl-theoretic predictions

## 5. Stahl-Theoretic Convergence Bounds

The Padé approximants converge in capacity on the maximal domain of
single-valuedness Ω = Ĉ \ {it : |t| ≥ 1}. The convergence rate is:

```
|h(x) - [N/N](x)| ≤ G_Ω(x)^N · ε_N
```

where `G_Ω(x) = |1 - √(1+x²)|/x|` is the Green's function of Ω at x.

In ball arithmetic, this bound is certified: the radius of the result ball
shrinks geometrically with N. The `MuntzPadeApproximant` σ-table termination
(`0 ∈ Δβₙ`) provides the runtime certificate that no further information is
retrievable at working precision.

## 6. Dependencies and Integration Points

| Component | Existing? | Action Required |
|-----------|-----------|-----------------|
| `arb_hypgeom_expint` SWIG binding | Yes (added) | None |
| `Real.expint()` / `Complex.expint()` | Yes (added) | None |
| `ComplexPolynomial.roots()` | Yes | None |
| `MuntzPadeApproximant` | Yes | Use with μ=1 for classical Padé |
| `EpsilonTable` | Yes | Alternative for series resummation |
| `BorelTransform` class | No | **Create** |
| `BorelPadeEiPlusReconstructor` class | No | **Create** |
| PI asymptotic coefficients | No | **Create** (hardcoded from paper) |
| PI reference values | No | **Create** (numerical integration) |

## 7. Benchmark Targets

| Metric | Target | Notes |
|--------|--------|-------|
| Precision | 10^{-20} to 10^{-60} | Matches paper's Figures 1 & 2 |
| Speed | < 1s for N=20 terms | Ball arithmetic overhead |
| Error certification | Ball radius < 10^{-18} | Rigorous, not heuristic |
| Pole isolation | All poles within 1% of paper values | Figure 3 comparison |
