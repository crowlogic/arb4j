# Stage 2–3 notes — Heston CF and the Fourier pricer

## The convention (memorize this, everything hangs on it)

`heston_cf(u, T, p)` is the characteristic function of the **de-drifted log
return** X_T = log(S_T/S_0) − (r−q)T, i.e. ψ(u) = E[e^{iuX_T}]. Market inputs
(S, r, q) never touch the model CF; the pricer reattaches them through the
forward F = S·e^{(r−q)T}. Two free identities become test gates:

- ψ(0) = 1 — any CF at 0.
- ψ(−i) = E[e^{X_T}] = E[S_T]/F = 1 — the martingale property of the
  discounted stock. If your CF gets this wrong, your drift or your Riccati
  solution is wrong, full stop.

This matches El Euch–Rosenbaum's L(a, T) (CF of log(S_T/S_0) at r = 0), which
is why the rough extension later is a CF swap and nothing else.

## The Little Heston Trap (the discriminating interview question)

Heston's 1993 closed form contains a complex logarithm,
log[(1 − g₁e^{dT}) / (1 − g₁)] with g₁ = (β+d)/(β−d). The log of a complex
number is multivalued; software returns the principal branch, with a cut along
the negative real axis. As maturity T grows, the argument of that log spirals
in the complex plane and **crosses the cut**, so the principal-branch value
jumps by 2πi. The CF then has spurious discontinuities in u, and Fourier
prices are silently, plausibly wrong — the classic failure is long-dated
options at certain parameter sets.

The fix (Albrecher–Mayer–Schoutens–Tistaert 2007) is pure algebra: rewrite
with g₂ = 1/g₁ = (β−d)/(β+d) and e^{−dT}. Mathematically identical; but with
the decaying exponential the log's argument stays near 1, away from the cut,
so the principal branch is continuous for typical parameters. The lesson worth
saying in an interview: **a formula and its floating-point evaluation are
different objects** — choosing the branch-safe algebraic form is part of the
implementation, not an optimization.

Guard in the tests: at T = 10, sweep u finely and assert the CF curve has no
jumps.

## Structural gates instead of memorized numbers

The CF tests pin identities a wrong implementation cannot fake:

1. ψ(0) = 1, ψ(−i) = 1 (normalization, martingale).
2. ψ(−u) = conj(ψ(u)), |ψ(u)| ≤ 1 — X is a real random variable.
3. **ξ → 0 collapse:** with ρ = 0 and tiny ξ, variance follows the ODE path
   v(t) = θ + (v0−θ)e^{−κt}, so X_T is exactly Gaussian with variance
   w = θT + (v0−θ)(1−e^{−κT})/κ and ψ(u) = exp(−(iu+u²)w/2). This exercises
   κ, θ, v0 in closed form — the same role the α→1 gate plays for rough
   Heston later. (Tested at ξ = 1e-3, not 0: the CF has a 0/0 at ξ = 0, and
   the κθ/ξ² prefactor makes tiny-ξ floating-point cancellation-prone.)

Literature price values (Heston 1993 / Albrecher et al. tables) still need to
be pinned before Stage 6 — the rough spec requires "published-value tests" as
its entry gate.

## Gil-Pelaez pricing, and why the pricer is model-agnostic

With m = log(F/K):

P₂ = 1/2 + (1/π)∫₀^∞ Re[e^{ium} ψ(u)/(iu)] du — risk-neutral P(S_T > K).
P₁ = same integral with ψ(u−i) — exercise probability under the **stock
numeraire**. call = e^{−rT}(F·P₁ − K·P₂).

Read that against Black-Scholes: C = S e^{−qT} Φ(d₁) − K e^{−rT} Φ(d₂) is the
special case where the two probabilities have closed forms. The complex shift
u ↦ u − i *is* the d₂ → d₁ measure change, one abstraction level up. That's
also why ψ must accept complex arguments.

The pricer takes ψ as a function argument. It contains zero Heston-specific
code — this is the binding architectural constraint from the rough-Heston
spec, honored now so Stage 7 is `u -> rough_heston_cf(u, T, p)` and done.

## AD note

`ForwardDiff.gradient` flows through CF → quadrature → price (tested against
central finite differences for all five parameters). Everything downstream of
`HestonParams` is type-generic; `Complex{Dual}` arithmetic does the rest. When
calibration arrives: differentiate *prices*, and map to implied-vol space via
the implicit-function shortcut dσ/dC = 1/vega rather than pushing Duals
through the iterative inverter.
