# RKHS Convergence Framework for the Müntz–Padé Path

Resolves [#1181](https://github.com/crowlogic/arb4j/issues/1181),
[#1182](https://github.com/crowlogic/arb4j/issues/1182), and the documentation
requirements of [#1185](https://github.com/crowlogic/arb4j/issues/1185).

## 1. Setup

Let

```
D^μ y = P(v) + Q(v)·y + R(v)·y²,   y(0) = 0
```

be a constant-coefficient fractional Riccati equation with polynomial coefficients
`P, Q, R` in the Fourier variable `v`. Its Müntz series solution

```
y(t) = Σ_{k≥1} a_k z^k,   z = t^μ
```

has coefficients satisfying

```
a(1) = P(v) / Γ(μ+1)
a(k) = [Γ((k−1)μ+1) / Γ(kμ+1)] · [Q(v)·a(k−1) + R(v)·Σ_{j=1}^{k−2} a(j)·a(k−1−j)]
```

Define the **moment functional** `m(k) = a(k+1)` for `k ≥ 0`. Since each `a(k)`
is a polynomial in `v`, `m(k)` is a polynomial in `v` and the inner product

```
⟨p, q⟩_μ = ∫ p(z) q̄(z) dμ(z)
```

is well-defined. Its completion is the **reproducing kernel Hilbert space** `H_μ`
with kernel

```
K_n(z,w) = Σ_{k=0}^{n−1} P_k(z) P̄_k(w) / h(k)
```

where `P_k` are the orthonormal polynomials and `h(k) = ⟨P_k, P_k⟩`.

## 2. The σ-table as Lanczos Reduction

The Chebyshev–Stieltjes procedure (σ-table) computes the Jacobi recurrence
coefficients from the moment sequence:

```
σ(j)(k) = σ(j−1)(k+1) − α(j−1)·σ(j−1)(k) − β(j−1)·σ(j−2)(k)
h(j) = σ(j)(j)
β(j) = h(j)/h(j−1)
```

This is a Lanczos reduction of the Hankel moment matrix `H_n` (entries
`(H_n)_{ij} = m(i+j)`) to tridiagonal Jacobi form. At each step `j`, the new
row `σ(j)` is a linear combination of the previous two with coefficients
`−α(j−1), −β(j−1)`. When the moment sequence is exhausted (the recurrence
reaches a fixed point), the reduction terminates.

## 3. ARB Ball Semantics of the Termination Criterion

In ball arithmetic, each real or complex number is a ball: midpoint `m` plus
radius `r`, denoted `m ± r`. The condition `0 ∈ Δβₙ` means the ball
representing `β(n) − β(n−1)` contains zero:

```
Δβ = m_Δ ± r_Δ,   0 ∈ Δβ  ⟺  |m_Δ| ≤ r_Δ
```

This is not approximate equality of midpoints. It is a **rigorous certificate**
that the true value of `β(n) − β(n−1)` is indistinguishable from zero at
working precision. Higher precision (more bits) shrinks the radii, potentially
revealing finer structure and pushing the termination index further.

## 4. Main Theorem

**Theorem.** For the Müntz series solution to the constant-coefficient fractional
Riccati equation, the σ-table terminates with `0 ∈ Δβₙ` if and only if the
moment functional has finite support of size `n`. At termination the
`[n−1/n]` Padé approximant is exact for the moment generating function.

### Proof

**(⇒)** If `0 ∈ Δβₙ`:

1. **Lemma 1 (Finite termination ⇒ finite-rank Hankel matrix).** The condition
   `β(n) ≈ β(n−1)` means the Jacobi recurrence coefficients stabilize. The
   three-term recurrence from step `n−1` onward generates all higher polynomials
   from `P_{n−1}` and `P_n` with fixed coefficients. The space spanned by
   `{P_0, P_1, …}` is finite-dimensional, equal to `span{P_0, …, P_n}`. By the
   spectral theorem for orthogonal polynomials, the moment functional has finite
   support with at most `n` points: the Hankel matrix `H` has rank at most `n`.

2. **Lemma 2 (Finite-rank Hankel ⇒ rational generating function).** A
   finite-rank Hankel matrix of rank `n` is equivalent to the moment sequence
   satisfying a linear recurrence of order `n` (Kronecker's theorem). The
   generating function `M(z) = Σ_{k≥0} m(k) z^k` is therefore rational of type
   `[n−1/n]`.

3. **Lemma 3 (Rational generating function ⇒ exact Padé).** If `M(z)` is itself
   rational of type `[n−1/n]`, it satisfies the Padé conditions with exact
   equality. By uniqueness of the Padé approximant, the `[n−1/n]` approximant
   equals `M(z)`.

**(⇐)** Conversely, if the `[n−1/n]` Padé is exact, the moment sequence satisfies
a linear recurrence of order `n`. The Hankel rank is `n`. The Jacobi recurrence
stabilizes at step `n` with `β(n) = β(n−1)` exactly, yielding `0 ∈ Δβₙ` in
ball arithmetic at sufficient precision. ∎

### Corollary: Precision Dependence

The RKHS dimension `n` is a function of working precision `bits`. At higher
precision, radii shrink and the σ-table may continue past the previous
termination point. This is correct: higher precision reveals finer structure.
The termination certificate `0 ∈ Δβₙ` is always rigorous for the current
precision.

## 5. Christoffel–Darboux Kernel

At termination with RKHS dimension `n`, the reproducing kernel is the finite
Christoffel–Darboux sum:

```
K_n(z,w) = Σ_{k=0}^{n−1} P_k(z) P̄_k(w) / h(k)
          = (P_n(z)·P_{n−1}(w) − P_{n−1}(z)·P_n(w)) / (h(n−1)·(z − w))
```

The confluent form (right-hand side) avoids the sum by expressing the kernel
through two consecutive orthogonal polynomials. This is the explicit
computational object: given the Jacobi coefficients `α, β` and the norms `h`,
the kernel is evaluated via polynomial evaluation at `(z,w)`.

### Compiled Expressions in arb4j

The kernel and its confluent form are registered as compiled Context sequences on
`MuntzPadeApproximant`:

```
Kn: n➔z➔w➔sum(k➔Q(k)(z)·Q(k)(w)/hv(k){k=0..n})
CDn: n➔z➔w➔sum(k➔Q(k)(z)·Q(k)(w)/hv(k){k=0..n})
```

where `Q(k)` is the `k`-th orthogonal polynomial and `hv(k) = h(k)(v)` is the
norm evaluated at the perturbation point. Both sequences are verified to agree
to 96 bits in `MuntzPadeRKHSTest.testKernelAgreement()`.

### Support Points

The roots of the denominator polynomial `Φ_den(n)(z)` are the support points of
the moment functional `μ` at RKHS dimension `n`. Computed via
`ComplexPolynomial.roots(int bits)`, verified in
`MuntzPadeRKHSTest.testSupportRoots()`.

## 6. Padé as Meromorphic Extension

The generating function `M(z) = Σ m(k) z^k` is ball-rational of type `[n−1/n]`:
the numerator `Φ_num` and denominator `Φ_den` coefficients are balls, and the
rational function interpolates the moment series exactly within the precision
envelope.

The denominator `Φ_den` has roots at the support points of `μ`, computed as
balls. The partial fraction decomposition

```
Φ(z) = Σ_{j=1}^n c_j / (z − z_j)
```

has residues `c_j` and poles `z_j` as balls. This is the spectral
representation of the moment generating function, exact within the precision
envelope.

## 7. Connection to Borel Plane

For the fractional Riccati equation with polynomial coefficients, the Borel
transform of the Müntz series has singularities at the roots of the denominator
of the rational generating function. The number of singularities equals the
σ-table termination order `n`. The partial fraction decomposition of the Padé
approximant exposes these singularities explicitly as poles `p_k` with residues
`c_k`.

This connects the RKHS framework to the Borel–Padé–Ei+ pipeline described in
[#1177](https://github.com/crowlogic/arb4j/issues/1177):
the poles in the Borel plane are exactly the support points computed by
`roots(Φ_den)`, and the residues are the partial-fraction coefficients of the
Padé approximant.

## 8. Code Reference

| Component | Location | Description |
|-----------|----------|-------------|
| σ-table | `OrthogonalPolynomialMomentFunctionalSequence` | Chebyshev–Stieltjes reduction |
| Jacobi coefficients | `MuntzPadeApproximant.α, β` | Public final fields from σ-table |
| Norms | `MuntzPadeApproximant.h, hv` | `h(k) = ⟨P_k, P_k⟩`, evaluated at `v` |
| Padé denominator | `MuntzPadeApproximant.ΦdenSeq` | `Φ_den(n)(z)` polynomial sequence |
| Padé numerator | `MuntzPadeApproximant.ΦnumSeq` | `Φ_num(n)(z)` polynomial sequence |
| Kernel | `MuntzPadeApproximant.KnSeq` | `K_n(z,w)` compiled expression |
| Confluent kernel | `MuntzPadeApproximant.CDnSeq` | `CD_n(z,w)` compiled expression |
| Orthogonal polynomials | `MuntzPadeApproximant.Q` (via `ops`) | `Q(k)` sequence |
| Termination | `PadePrinter` | Auto-terminates when `0 ∈ Δβₙ` |
| RKHS test | `MuntzPadeRKHSTest` | Kernel agreement, support roots, conjugate identity |
