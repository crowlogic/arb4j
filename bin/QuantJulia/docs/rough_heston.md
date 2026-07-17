# Rough Heston on SPX: model, implementation, results

One page: what was built, how it was validated, and what the data actually
said. Data: CBOE SPX delayed-quote chain, 2026-07-02 close (spot 7483.24,
11,858 filtered OTM quotes, 50 expiries, T = 4 days … 2.5 years).

## Model and convention

Rough Heston (El Euch–Rosenbaum). Characteristic function of the de-drifted
log return X_T = log(S_T/S_0) − (r−q)T (identical convention to the classical
pricer, so the Fourier layer is shared):

ψ(u) = exp( κθ·I¹h(u,T) + v0·I^{1−α}h(u,T) ),  α = H + ½,
D^α h = −(u²+iu)/2 + (iuρξ−κ)h + (ξ²/2)h²,  h(0) = 0.

At α = 1 this is classical Heston exactly — the critical test gate.

## Numerics

- **Solver:** product-trapezoidal (Diethelm–Ford–Freed weights) made **fully
  implicit** — each step is a scalar complex quadratic, solved in closed form.
  Chosen after the textbook explicit predictor blew up (NaN) at the large
  Fourier arguments short-dated pricing needs: explicit stability demands
  |iuρξ−κ|·Δ^α ≲ 1, which is untenable at u ~ 10³. Implicit is
  unconditionally stable in the linear part and needs no predictor.
- **Observed convergence** (vs N = 4096 reference): order **1.61 at H = 0.1**
  (theory: 1+α = 1.6) and **2.0 at H = 0.49** (smooth limit). See
  `results/convergence.csv`.
- **Pricing:** Gil-Pelaez on fixed Gauss-Legendre nodes; ALL strikes of an
  expiry share the 2n CF evaluations, so the O(N²) solve is paid **per
  expiry**, not per option. Full-chain (11,858 quotes) rough evaluation: ~1 s.
- **AD:** ForwardDiff gradients through solver + quadrature verified against
  finite differences to ~1e-9 on all six parameters **including H** (the
  0^α NaN-partial landmine is handled explicitly).
- **Noise floor, stated:** solver error grows ~u^{3/2}, leaving an absolute
  price noise ~1e-3·(spot/100) — ≪ 1 bp of vol after vega weighting, visible
  only on microscopic far-wing prices.
- **Validation stack:** α→1 recovery to rtol 1e-6 (this gate caught two real
  bugs: the stability blow-up and a variable-shadowing bug in CF assembly);
  exact identities ψ(0)=ψ(−i)=1 for all H; classical CF cross-checked against
  an independent Monte Carlo simulation of the SDE (substituting for
  literature-value pinning — no trusted published table was available, and
  fabricating one would be worse; noted as open debt).

## Results — the honest version

**1. The market exhibits the rough signature.** Model-free fit of
|ATM skew| ∝ T^{H−1/2} across the chain (`results/skew_powerlaw.csv`):

| window | H |
|---|---|
| full 0.01–2.5y (50 expiries) | **0.107** |
| front T ≤ 0.16 | 0.165 |
| belly 0.03–1.04 | 0.097 |
| back T ≥ 0.5 | 0.022 |

H ≈ 0.11 sits squarely in the literature range (~0.05–0.15). The classical
model's calibrated skew cannot hold this power law: it is too steep at the
front (−2.0 vs market −1.4 at one week) and too flat at the back (−0.14 vs
−0.18 at 2.5y).

**2. Calibration nevertheless does not select roughness on this snapshot.**
Whole-surface, identical quote set / loss / optimizer for both models
(`results/rough_fit.csv`, `results/model_comparison.csv`):

| | classical | rough |
|---|---|---|
| cal-set IV RMSE | 85.2 bps | 85.5 bps |
| full-chain IV RMSE | 133.6 bps | 134.1 bps |
| calibrated H | — | **0.49, at the upper bound** |
| wall time | 9 s | 68 s |

Rough Heston converged to the classical corner (κ, θ, ξ, ρ, v0 match the
classical fit to 2–3%). The short-end-only duel (T ≤ 0.16,
`results/short_end_fit.csv`) is a dead heat too: 157.6 vs 157.6 bps, H again
at the bound, both models resorting to the extreme-κ contortion (κ ≈ 27,
v0 ≈ 0).

**3. Why both are true at once.** The chain is a weekend snapshot: front-end
implied vols are deflated by holiday calendar time, and the measured skews are
**non-monotone in maturity** (the 4-day expiry is flatter than the 7-day) —
distortions that are real for the market but unfittable by ANY time-homogeneous
model, rough or classical. That misfit (~150 bps at the front) dominates the
vega-weighted loss; the component roughness improves — the *scaling of skew
across maturities* — is a small part of the total. Within that floor, the
likelihood is flat in H and the optimizer drifts to the boundary. H is
**unidentified by this loss on this data**, not rejected by it: the model-free
skew diagnostic (H ≈ 0.11) and the calibration are answering different
questions.

**What would identify H:** business-time day counts (or intraday data away
from weekends/holidays), a skew-slope term in the loss, or joint fits across
several snapshot dates. Listed as future work, deliberately not bolted on to
manufacture a win.

## Costs

O(N²) per CF evaluation (N = 96 calibration / 192 evaluation), amortized per
expiry by the batch pricer. Rough calibration 68 s vs classical 9 s on the
same 192-quote set (~7×); full-chain evaluation ~1 s. 194 tests green.
