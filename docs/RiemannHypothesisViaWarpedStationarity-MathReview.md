# Mathematical Review: Riemann Hypothesis via Warped Stationarity

Document under review: the content common to
`RiemannHypothesisViaWarpedStationarity.tex` (DAG-emitted) and
`RHViaWarpedStationarity-classical.tex` (both produced from the same
`RiemannHypothesisProof-DAG.json`, commit `26eedf9f`).

Scope note. This review reports only mathematical propositions whose truth is
not established by the document as written. It does not assert any claim is
false, does not construct counterexamples, and does not issue a verdict on the
document. Axioms (ax:Z, ax:ψasymp, ax:HL, ax:RS, ax:Wiener29, ax:PW,
ax:Akhiezer) are taken as given; their external citations are not adjudicated.

## Findings

### Finding 1 — Fixable
- **Location**: Proof of thm:WSS, diagonal-term paragraph.
- **Claim as written**: "The diagonal term (n, σ) contributes
  (1/U) Σ_{n≤N(t)} (1/n) ∫ cos(η ω_n(t)) dt, which converges by lem:ωbound
  and bounded convergence to a finite limit A(η)."
- **What is relied on but not established in the text**: Bounded convergence
  is invoked for an inner sum whose length N(t) = ⌊√(t/(2π))⌋ tends to
  infinity with t, so the integrand Σ_{n≤N(t)} (1/n) cos(η ω_n(t)) is not
  uniformly dominated by an integrable function of t on (0, ∞). The
  partial sums Σ_{n≤N(t)} 1/n grow like ½ log(t/(2π)), so the bounded-
  convergence hypothesis is not satisfied in the form stated.
- **What would establish it**: Rewrite the double average as
  (1/U) ∫₀^{Θ⁻¹(U)} Σ_{n≤N(t)} (1/n) cos(η ω_n(t)) dt and apply Cesàro /
  Abel-type summation: fix M, split n ≤ M versus M < n ≤ N(t); the tail
  contribution is bounded by Σ_{n>M} 1/n · (time spent with n ≤ N(t)),
  which for t ≥ 2π n² gives (1/U) ∫ 1_{n ≤ N(t)} dt ≤ 2π n² · Θ'(·)⁻¹
  times … then take M → ∞ after U → ∞. Alternatively, show uniform
  convergence of the Cesàro means of (1/n) cos(η ω_n(t)) to an explicit
  absolutely-convergent series, and conclude A(η) = Σ_{n≥1} (1/n) · a_n(η)
  with |a_n(η)| ≤ 1 and the partial-sum convergence established by
  Kronecker's lemma or by the prime-number-theorem-free elementary
  asymptotic for Σ 1/n.

### Finding 2 — Fixable
- **Location**: Proof of thm:WSS, off-diagonal paragraph.
- **Claim as written**: "off-diagonal (m ≠ n), … phase slopes … ≥ ½
  |log(m/n)| for m ≠ n … one integration by parts … yields o(U)."
- **What is relied on but not established in the text**: The phase
  derivative of cos((ϑ(t) − t log m) ± (ϑ(t+δ) − (t+δ) log n)) has
  leading-order term involving ϑ'(t)·(1∓1) and a log(m/n) term. A uniform
  lower bound ½|log(m/n)| on the phase slope is stated without derivation,
  and for near-diagonal pairs m and n close, |log(m/n)| ≈ |m−n|/n may be
  small, so the bound deteriorates with n. The integration-by-parts
  estimate with weight (mn)^{−1/2} summed over m, n ≤ N(t) is asserted to
  be o(U) but the sum Σ_{m≠n} (mn)^{−1/2} / |log(m/n)| is delicate; the
  "Montgomery–Vaughan near-diagonal bound" is named but not stated, and
  Montgomery–Vaughan is a theorem about sums ∫|Σ a_n e^{iλ_n t}|² dt, not
  an off-the-shelf tool for the stated double integral.
- **What would establish it**: Make the Montgomery–Vaughan (or Hilbert-
  type) inequality invocation explicit in the form
  ∫₀^U |Σ_{n≤N} a_n e^{iα_n u}|² du ≤ Σ_n |a_n|² · (U + C·Δ⁻¹),
  where Δ = min_{m≠n} |α_m − α_n|, with α_n = log n so Δ ≍ 1/N; and
  verify that, after writing the off-diagonal contribution as the L² norm
  of the exponential sum on a window of length U, the factor Σ |a_n|² ≤
  Σ_{n≤N} 1/n = 𝓞(log N) and the U+N correction give an overall o(U) after
  division by U and limit U → ∞.

### Finding 3 — Fixable
- **Location**: Proof of thm:WSS, continuity-at-0 paragraph.
- **Claim as written**: "Continuity at 0: |c[Y](η) − c[Y](0)|² ≤ c[Y](0) ·
  (c[Y](0) − ℜ c[Y](η)) → 0 via the explicit diagonal series."
- **What is relied on but not established in the text**: The inequality
  |c[Y](η) − c[Y](0)|² ≤ c[Y](0)(c[Y](0) − ℜc[Y](η)) is the standard
  Cauchy–Schwarz bound for positive-definite functions; its use here
  requires c[Y] to be positive-definite, which is established. The "→ 0"
  step then requires ℜ c[Y](η) → c[Y](0) as η → 0, i.e. continuity of
  ℜ c[Y] at 0. The document's argument that this holds "via the explicit
  diagonal series" is not spelled out; the diagonal limit A(η) was
  constructed as a pointwise limit, and pointwise limits of continuous
  functions need not be continuous.
- **What would establish it**: Show that the diagonal series A(η) is
  uniformly convergent on a neighborhood of η = 0 (e.g. by bounding the
  tail Σ_{n>M} (1/n) |cos(η ω_n) − 1| ≤ Σ_{n>M} (1/n) · |η|²ω_n²/2
  uniformly for |η| ≤ η₀), which would make A continuous at 0 as a uniform
  limit of continuous functions. Then c[Y] = A + (antidiagonal) +
  (off-diagonal) + (remainder) with the last three vanishing uniformly on
  compact η-sets, giving continuity of c[Y] at 0.

### Finding 4 — Fixable
- **Location**: Proof of thm:bandlim, computation of dQ/dx.
- **Claim as written**: "dQ/dx = (−(σ − μ) x − 2σ (c + log n)) /
  (2 x^{1/2} P̂(x)²)" and "the bound |dQ/dx| ≤ ((|μ|+1)/(2λ²)) x^{−3/2} +
  ((c + log n)/λ²) x^{−5/2}."
- **What is relied on but not established in the text**: Direct
  differentiation of Q(x) = x^{1/2}/P̂(x) with P̂(x) = (σ−μ)x −
  σ(c + log n) gives
  dQ/dx = (½ x^{−1/2} · P̂(x) − x^{1/2} · (σ−μ)) / P̂(x)²
        = (P̂(x) − 2(σ−μ) x) / (2 x^{1/2} P̂(x)²)
        = (−(σ−μ) x − σ(c + log n)) / (2 x^{1/2} P̂(x)²).
  The document's numerator has coefficient 2 on σ(c + log n) rather than 1;
  and the corresponding second term of the stated bound,
  ((c + log n)/λ²) x^{−5/2}, should carry a factor of ½ rather than 1 after
  using |P̂(x)| ≥ λx in the denominator. Neither constant affects the
  order β_n^{−1/2} of the final estimate, but as written the arithmetic
  does not match the definition of P̂(x).
- **What would establish it**: Replace the stated dQ/dx numerator by
  −(σ−μ)x − σ(c + log n), and the corresponding bound second term by
  ((c + log n)/(2λ²)) x^{−5/2}; update the subsequent constant C₁(c, |μ|)
  accordingly. The conclusion |𝓙_{n,σ}| ≤ C₁(c, |μ|) β_n^{−1/2} remains.

### Finding 5 — Fixable
- **Location**: Proof of thm:bandlim, change-of-variable step
  "Change of variable u ↦ x with du/dx = 1/ϑ″(Θ⁻¹(u)) > 0 (lem:ϑ″)".
- **Claim as written**: du/dx = 1/ϑ″(Θ⁻¹(u)).
- **What is relied on but not established in the text**: From
  x(u) = Θ'(Θ⁻¹(u)) = ϑ'(Θ⁻¹(u)) + c, differentiation gives
  dx/du = ϑ″(Θ⁻¹(u)) · (Θ⁻¹)'(u) = ϑ″(Θ⁻¹(u)) / Θ'(Θ⁻¹(u)) =
  ϑ″(Θ⁻¹(u)) / x, so du/dx = x / ϑ″(Θ⁻¹(u)), not 1/ϑ″(Θ⁻¹(u)).
  The integral identity ∫|Q'(u)|du = ∫|dQ/dx|dx that is used afterwards is
  itself correct (it follows from |Q'(u)|du = |dQ/dx|·|dx/du|·du =
  |dQ/dx|·|dx|), independent of the stated relation for du/dx; but the
  intermediate formula as written is incorrect.
- **What would establish it**: State the change of variable as
  ∫|Q'(u)| du = ∫|dQ/du| du = ∫|dQ/dx|·|dx|, which follows from
  Q'(u) = (dQ/dx)(dx/du) together with |dx/du| du = |dx|; positivity of
  dx/du on the relevant range follows from ϑ″ > 0 on (0, ∞) (lem:ϑ″),
  ensuring x is a diffeomorphic reparametrization.

### Finding 6 — Fixable
- **Location**: Proof of thm:bandlim, remainder paragraph, bound on
  the total phase slope.
- **Claim as written**: "for large t the total phase slope
  μ Θ'(t) + (d/dt) arg R(t) is ≥ |μ| c ⁄ 2".
- **What is relied on but not established in the text**: The quantity
  μ Θ'(t) + (d/dt)arg R(t) can be negative (when μ < 0), so "≥ |μ| c / 2"
  cannot be meant in the real-ordering sense. Reading the bound as
  applying to the absolute value |μ Θ'(t) + (d/dt) arg R(t)|, the
  estimate relies on |μ Θ'(t)| ≥ |μ| · c for t large enough that
  ϑ'(t) ≥ 0 (so Θ'(t) = ϑ'(t) + c ≥ c), together with
  |(d/dt) arg R(t)| = 𝓞(t^{-1/2}) < (|μ| c)/2 for t large.
- **What would establish it**: Rephrase as
  |μ Θ'(t) + (d/dt) arg R(t)| ≥ |μ| Θ'(t) − |(d/dt) arg R(t)| ≥
  |μ| c − C t^{-1/2} ≥ |μ| c / 2 for t ≥ t₀(|μ|, c), using
  Θ'(t) = ϑ'(t) + c ≥ c once ax:ψasymp ensures ϑ'(t) ≥ 0 for t large.

### Finding 7 — Fixable
- **Location**: Proof of thm:WSS, antidiagonal and remainder paragraphs.
- **Claim as written**: "The antidiagonal, off-diagonal, and remainder
  terms are 𝓞(U) times o(1) by integration-by-parts applied to their
  oscillatory phase slopes (≥ 2ϑ'(t) − 𝓞(1) for σ ≠ σ'), … together with
  Cauchy–Schwarz on the R cross-terms."
- **What is relied on but not established in the text**: For the
  antidiagonal (σ ≠ σ') contribution, integration by parts with phase
  slope ≥ 2ϑ'(t) − 𝓞(1) gives a per-term estimate of order
  1/(2ϑ'(t)) ≤ 1/(log(t/(2π)) − 𝓞(1)) summed against the (mn)^{−1/2}
  weight; after summing over n ≤ N(t) this gives a bound of order
  log N(t) / log t on the integrand, and the final division by U =
  𝓞(T log T) gives o(1). The document asserts the result but the
  integration-by-parts bookkeeping with the (mn)^{−1/2} weights and the
  endpoint contributions at t = 2π n² is not written out.
- **What would establish it**: Write
  A_{n,σ,σ'}(T) := ∫₀^{Θ⁻¹(U)} (n m)^{-1/2} cos(phase) dt
  with phase slope bounded below by 2ϑ'(t) − C for σ ≠ σ'; single
  integration by parts gives |A_{n,σ,σ'}(T)| ≤ 2 (nm)^{−1/2} sup
  1/(2ϑ'(t) − C) + ∫ |(nm)^{−1/2}|′·… with all endpoint and derivative
  terms bounded. Sum |A_{n,σ,σ'}| ≤ C · Σ_{n≤N(T)} (1/n) · 1/log T =
  𝓞(1), which is o(U) after division by U → ∞.

## Notes on arguments examined and judged established

The following steps were examined explicitly and are taken to be established
by the document as written; they are listed here only to document that the
review considered them.

- thm:RH itself: given thm:Yzeros, lem:Zfact, lem:Θdiffeo, and ax:Z, the
  chain ζ(½+it) = 0 ⇔ Z(t) = 0 ⇔ Y(Θ(t)) = 0 ⇔ Θ(t) is a real zero of Y is
  routine once the three cited results are available.
- lem:c*, lem:Θdiffeo, lem:Zfact, lem:ϑ″, lem:ωbound: each is a direct
  calculation from the named axioms, established by the proofs given.
- cor:Bochner: Bochner's theorem as applied to a positive-definite
  continuous (at 0) function is routine.
- cor:supp: given thm:bandlim and ax:Wiener29, dominated convergence with
  the integrand bounded by |K[T](m)|² · (2π/Θ(T)), which is uniformly
  bounded in T on {|m| > 1} by thm:bandlim's conclusion, gives the
  support claim; a short explicit dominated-convergence argument is
  present in the proof.
- thm:Yentire: direct application of ax:PW with τ = 1 given cor:supp and
  cor:Bochner. The hypothesis μ[Y](ℝ) = 2 is verified by cor:Bochner and
  supp μ[Y] ⊆ [−1, 1] ⊆ [−τ, τ] is verified by cor:supp.
- thm:Yzeros: direct application of ax:Akhiezer with τ = 1, given
  thm:Yentire (exponential type ≤ 1), Y real on ℝ (from def:Y, since Z is
  real on ℝ and Θ' > 0 gives real square root), and cor:supp (support in
  [−1, 1] ⊆ [−2τ, 2τ] = [−2, 2]).

## Summary

Seven findings, all fixable. Each concerns a local step in the proofs of
thm:WSS or thm:bandlim where the argument as written either invokes a
convergence theorem whose hypotheses are not verified in place (Findings 1,
2, 3, 7), or contains a local arithmetic or differential-calculus slip that
does not alter the order of the final estimate (Findings 4, 5, 6).

The target theorem thm:RH is derived from thm:Yzeros, lem:Zfact,
lem:Θdiffeo, and ax:Z by a chain of equivalences that is routine given the
cited intermediate results.
