# Solution methodology for constant-coefficient fractional Riccati equations

This document captures the end-to-end solution methodology that combines the
Müntz–Tau Puiseux expansion, the Chebyshev/Wheeler construction of an
orthogonal polynomial sequence from a moment functional, and Padé
resummation, producing globally convergent rational approximants for
constant-coefficient fractional Riccati equations — and, as a direct
consequence, for the rough Heston characteristic function.

Companion documents:

- `ThePadeMuntzSpectralTauMethodForConstantCoeffecientFractionalRiccations.pdf`
  (§9: the underlying analytical framework, Stahl compact, convergence
  theorems).
- Issue [crowlogic/arb4j#1021](https://github.com/crowlogic/arb4j/issues/1021)
  (the implementation plan for `OrthogonalPolynomialMomentFunctionalSequence`
  and `OrthogonalPolynomialFractionalRiccatiMomentFunctionalSequence`).

## Step 1 — Inputs

Three polynomials in a parameter `u` and a fractional order:

    P(u), Q(u), R(u) ∈ ℝ[u]  or  ℂ[u]
    μ(u) ∈ (0, 1]

These define the constant-coefficient fractional Riccati equation

    D^{μ(u)} y(t; u) = P(u) + Q(u)·y(t; u) + R(u)·y(t; u)²,
    I^{1−μ(u)} y(0; u) = 0.

## Step 2 — Moment sequence `m(k; u)` from the Gamma-ratio convolution recurrence

The Müntz–Tau ansatz `y(t; u) = Σ_{k≥1} a_k(u)·t^{kμ(u)}` substituted into
the Volterra form gives

    a_1(u)     = P(u)/Γ(μ(u) + 1)
    a_{k+1}(u) = Γ(kμ(u) + 1)/Γ((k+1)μ(u) + 1)
                 · ( Q(u)·a_k(u)
                   + R(u)·Σ_{j+ℓ=k, j,ℓ≥1} a_j(u)·a_ℓ(u) )

Set `m(k; u) := a_{k+1}(u)`. This is the moment sequence of a quasi-definite,
signed (never positive-definite) moment functional
`𝓛 : ℝ[x] → ℝ[u]` defined by `𝓛[x^k; u] = m(k; u)`.

## Step 3 — Chebyshev/Wheeler recursion produces the OPS recurrence coefficients

    S(−1, k; u) = 0
    S( 0, k; u) = m(k; u)
    S( n, k; u) = S(n−1, k+1; u)
                  − (S(n−1, n;   u)/S(n−1, n−1; u))·S(n−1, k; u)
                  − (S(n−1, n−1; u)/S(n−2, n−2; u))·S(n−2, k; u)

with the convention `S(−1, −1; u) := 1`. Cost: `Θ(M²)` ring operations in
`ℝ[u]` (or `ℂ[u]`) to depth `M`.

The three-term recurrence coefficients of the OPS, in the convention

    P_{n+1}(x; u) = (A_n(u)·x + B_n(u))·P_n(x; u) − C_n(u)·P_{n−1}(x; u),

are

    A(n; u) = 1
    B(n; u) = − S(n, n+1; u)/S(n, n; u)
    C(n; u) =   S(n, n;   u)/S(n−1, n−1; u)

with seeds `P_0 = 1`, `P_1(x; u) = x − m(1; u)/m(0; u)`.

## Step 4 — Padé denominator from OPS, Padé numerator from twin recurrence

The diagonal `[M/M]` Padé denominator of `g(z; u) = Σ_{k≥1} a_k(u)·z^k` is
`P_M(x; u)` reciprocal-flipped:

    Q̂_M(z; u) = z^M · P_M(1/z; u).

The Padé numerator satisfies the **same** three-term recurrence with shifted
seeds (`P^{(1)}_{−1} = −1`, `P^{(1)}_0 = 0`), reciprocal-flipped to give the
numerator. Both assemble in one line via the reciprocal flip.

## Step 5 — Globally convergent rational approximant

The local Müntz–Tau series `g(z; u) = Σ a_k(u)·z^k` has finite Stahl radius
and diverges outside it. The Padé approximant

    R_M(z; u) = z · P̂_M*(z; u) / Q̂_M*(z; u)

inherits no such radius. By Stahl's theorem applied to `g`, `R_M` converges
uniformly on compacts of `ℂ \ Δ_g(u)`, where `Δ_g(u) ⊂ ℂ \ ℝ` is the Stahl
compact (proven disjoint from `ℝ` by the Volterra contraction argument of
§9.5). Substituting `z = t^{μ(u)}` returns the solution `y(t; u)` on all of
`t ∈ [0, ∞)`.

The eigenvalues of the truncated Jacobi matrix `J_M(u)` — built from
`(A_n(u), B_n(u), C_n(u))` — condense on `Δ_g(u)` as `M → ∞`. None are real
to working precision; this is the quantitative signed-quasi-definiteness of
the functional.

## Step 6 — Same machinery for the integrated Riccati

`Y(t; u) := ∫_0^t y(s; u) ds` has Müntz–Tau expansion

    Y(t; u) = Σ_{k≥1} a_k(u) · t^{kμ(u) + 1} / (kμ(u) + 1).

The factor `1/(kμ(u) + 1)` is *another* Gamma ratio (it is
`Γ(kμ(u) + 1)/Γ(kμ(u) + 2)`), so the integrated moment sequence

    ṁ(k; u) := m(k; u) / (kμ(u) + 1)

is just the Riccati moment sequence reweighted by a known Gamma ratio in `k`.
Run the same Chebyshev/Wheeler recursion on `ṁ` instead of `m` to get the OPS
of the **integrated moment functional** `𝓛̃`, whose Padé denominators give a
globally convergent rational approximant of the integrated Riccati function
on `ℂ \ Δ_{G}(u)`.

The class hierarchy from issue #1021 handles this for free.
`OrthogonalPolynomialFractionalRiccatiMomentFunctionalSequence` already
abstracts the moment supplier; an
`OrthogonalPolynomialIntegratedFractionalRiccatiMomentFunctionalSequence`
differs only in the `momentSequence()` override that emits
`m(k; u)/(kμ(u) + 1)` instead of `m(k; u)`. Same Chebyshev/Wheeler core,
same Padé assembly, same Stahl convergence.

## Step 7 — Rough Heston characteristic function

In rough Heston, the log-price characteristic function is

    φ_T(u) = exp( θ · ∫_0^T h(s; u) ds + V_0 · I^{1−α} h(T; u) )

where `h(t; u)` solves a constant-coefficient fractional Riccati of the form

    D^α h = ½·(−u² − iu) + (iuρν − λ)·h + ½·ν²·h²,

i.e.

    (P(u), Q(u), R(u), μ) = (½(−u² − iu), iuρν − λ, ½ν², α).

Plugging this `(P, Q, R, μ)` into:

- **Step 2** builds the Riccati moment sequence `m(k; u)`.
- **Steps 3–5** build the globally convergent rational approximant
  `h^{[M/M]}(t; u)`.
- **Step 6** builds the globally convergent rational approximant
  `H^{[M/M]}(t; u) := ∫_0^t h(s; u) ds` directly, without ever integrating
  `h` numerically.

Then

    φ_T(u) = exp( θ · H^{[M/M]}(T; u) + V_0 · I^{1−α} h^{[M/M]}(T; u) )

is the rough Heston characteristic function, computed without Adams scheme,
without ODE integration, without asymptotic patching. Three Padé expansions
evaluated at scalar `(T, u)` and combined.

The `I^{1−α}` of the rational `h^{[M/M]}` is itself a Padé expansion on the
same Müntz basis (fractional integration on `t^{kα}` is a Gamma ratio per
term — Step 6 again). So **every component of `φ_T(u)` is a Padé approximant
on the same OPS family**.

## Status of each component

| Component | Status |
|---|---|
| Müntz–Tau coefficient recurrence (Step 2) | Implemented as `RiccatiMuntzPadeFunctional.a` in arb4j today |
| Chebyshev/Wheeler `S(n, k)` (Step 3) | To implement (issue #1021) |
| OPS recurrence coefficients `(A, B, C)` (Step 3) | Falls out of Step 3 |
| Reciprocal-polynomial flip (Step 4) | `RealPolynomial.reciprocalFlip()`, to add |
| Padé numerator via twin recurrence (Step 4) | Sibling class in #1021 |
| Stahl compact `Δ_g(u)` and convergence (Step 5) | Mathematical content already in §9 of the manuscript |
| Integrated-Riccati moment sequence `ṁ(k; u)` (Step 6) | One-line subclass override |
| Rough-Heston `φ_T(u)` assembly (Step 7) | Two `evaluate` calls + an `exp` |

The fast `O(M)` Laguerre–Freud / string-equation path stays as a separate
optimization (Magnus's framework applied to the Riccati moment functional);
everything above is the `Θ(M²)` universal construction that goes in first.

## Novelty

A literature survey across the fractional-Riccati / Padé / orthogonal-
polynomial communities (May 2026) shows:

- The closest existing rational-approximation work for rough Heston —
  Gatheral–Radoičić (2019, 2024) and Callegaro–Grasselli–Pagès (2020) —
  treats *one specific* Riccati equation by asymptotic patching (short-time +
  long-time series matched via a small linear system) or by power-series +
  Adams hybrid. Neither identifies the Padé denominators as the OPS of a
  moment functional, neither is constructive for arbitrary `(P, Q, R)`, and
  neither generalizes to integrated or fractionally-integrated Riccati
  solutions.
- The classical OPS-from-moments framework (Chihara, Gautschi, Magnus,
  Van Assche) has never been applied to moment sequences arising from
  fractional Riccati equations.
- No existing library implements OPS construction over a coefficient ring
  `ℝ[u]` / `ℂ[u]` (the Fourier parameter lives at the polynomial level, not
  the scalar level), which is required for characteristic-function
  applications.

The methodology above is therefore a state-of-the-art universal solution
mechanism for the entire four-parameter family of constant-coefficient
fractional Riccati equations — three polynomial parameters
`(P(u), Q(u), R(u)) ∈ ℝ[u]³` (or `ℂ[u]³`) and one fractional order
`μ ∈ (0, 1]` — with the rough Heston characteristic function as one direct
application.

## Extension to arbitrary real μ > 1 (future work, not in scope)

The current scope is `μ ∈ (0, 1]`. The method extends to any real `μ > 0`
by the standard Caputo splitting; this note records the extension so a
future user or contributor can pick it up without rederiving it.

**Splitting.** For real `μ > 0`, write `μ = n + ν` with `n := ⌊μ⌋ ∈ ℤ_{≥0}`
and `ν := μ − n ∈ [0, 1)`. The Caputo derivative is

    D^μ f(t) = D^ν ( D^n f(t) )

so an order-`μ` IVP is an order-`ν` Caputo IVP on the `n`-th ordinary
derivative, with `⌈μ⌉ = n + 1` initial conditions when `ν ≠ 0` (or `n`
when `ν = 0`).

**Müntz basis.** For `μ = n + ν`, `ν ∈ (0, 1)`, the natural basis for the
solution is

    { t^{n + kν} : k = 0, 1, 2, … }   ∪   { t^0, t^1, …, t^{n−1} }

The polynomial part covers the `n` initial conditions; the fractional part
is the same Müntz lattice `t^{kν}` shifted by `t^n`. The Müntz–Tau
coefficient recurrence has the same Gamma-ratio + convolution shape as the
`μ ∈ (0, 1]` case, with `(kμ + 1)` replaced by `(kν + n + 1)` in the Gamma
ratios and seeds determined by the initial conditions instead of by
`P(u)/Γ(μ + 1)` alone.

**What transfers unchanged.**

- Steps 3–4 (Chebyshev/Wheeler, OPS recurrence extraction, reciprocal
  flip): unchanged. These steps see only the moment sequence `m(k; u)` and
  do not care about its origin.
- Step 6 (integrated / fractionally integrated Riccati): unchanged.
  Fractional integration `I^ρ` of any real order `ρ > 0` acts on `t^{n+kν}`
  by another Gamma ratio, so the integrated moment sequence is the
  Riccati moment sequence reweighted by a known `k`-dependent Gamma ratio.
- Step 7 assembly for characteristic functions: unchanged.
- The class hierarchy in issue #1021: unchanged. The Riccati subclass
  already takes `μ` as input; supplying any real `μ > 1` requires only that
  the moment-supplier expression and the seeds be parameterized by the
  `(n, ν)` split. No new abstract class.

**What needs new work.**

- The Volterra contraction proof in §9.5 (Stahl compact disjoint from `ℝ`)
  is stated for `μ ∈ (0, 1]`. For `μ > 1` the analogous result follows from
  the standard fixed-point argument on the iterated Volterra operator,
  but with different contraction constants; the proof needs to be redone.
  Until then, Step 5 (global Stahl convergence on `ℂ \ Δ_g(u)`) is a
  conjecture for `μ > 1`, not a theorem.
- Initial-data wiring in the class: the constructor needs to accept the
  `⌈μ⌉` initial conditions instead of assuming `y(0) = 0`.
- The classical Riccati boundary case (`μ = 1`, `n = 1`, `ν = 0`) is
  already a degenerate case of the current framework; nothing new needed
  there.

**Status.** Deferred. Constant-coefficient fractional Riccati for `μ ∈ (0, 1]`
is what motivates the current implementation (rough Heston characteristic
function lives entirely in `μ = H + 1/2 ∈ (1/2, 1)` with `H ∈ (0, 1/2)`).
The `μ > 1` extension is recorded here so it can be picked up later without
rediscovery.
