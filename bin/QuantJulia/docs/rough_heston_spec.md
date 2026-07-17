> **Do not implement until Stages 1–4 are complete and the classical Heston
> pricer passes its published-value tests. This document exists so that earlier
> stages are built with this destination in mind.**

---

## Repository adaptation note (read first)

This spec was written against a hypothetical `DifferentiableHeston.jl` layout. It
is filed here as the **destination** for [QuantJulia](../README.md). When the
time comes to implement it, map names as follows — the spec itself licenses this
("adapt to whatever is in the repo"):

| Spec reference (`DifferentiableHeston.jl`) | QuantJulia actual / planned |
|---|---|
| package `DifferentiableHeston` | `QuantJulia` |
| `src/pricer.jl` → `heston_cf`, `heston_price` | `src/heston.jl` (the CF) + `src/fourier.jl` (the pricer) |
| `src/implied_vol.jl` (BS + inversion) | `src/blackscholes.jl` |
| `src/calibration.jl` | `src/calibration.jl` (same) |
| `scripts/02_calibrate.jl` | `scripts/02_calibrate.jl` (classical, to be created) |
| `HestonParams(κ, θ, ξ, ρ, v0)` | struct to be defined in Stage 2; rough Heston adds `H` |

**The one architectural constraint this spec puts on earlier stages** (this is
*why* the doc is filed now, before it can run): `src/fourier.jl` must be written
**model-agnostic** — it takes *a characteristic function* as an argument and
prices from it. It must not hardcode Heston's CF. If Stage 3 bakes Heston into
the pricer, the rough extension in Stage 7 requires a rewrite instead of a
one-line CF swap. Likewise everything downstream must stay type-generic for
`ForwardDiff.Dual` (see the AD section), and the calibration loss in Stage 4 must
be factored so a second model can reuse it unchanged.

Reference-name correction to carry into implementation: the Adams-scheme paper is
Diethelm, Ford & **Freed** (2002) — not "Freeman," as it appeared in an earlier
draft of the plan.

---

# Implementation Spec: Differentiable Rough Heston Calibration (Julia)

You are extending an existing Julia package, `DifferentiableHeston.jl`, which already contains:

- A classical Heston characteristic-function pricer (Fourier/Carr-Madan or Lewis-style quadrature) in `src/pricer.jl`, exposed as something like `heston_cf(u, T, params)` and `heston_price(...)`.
- Black-Scholes pricing and implied-vol inversion in `src/implied_vol.jl`.
- A calibration loop over real SPX option-chain data in `src/calibration.jl`, using ForwardDiff-provided gradients and Optim.jl.
- Tests validating the classical pricer against published Heston (1993) values.

**Before writing any new code, read the existing source and adapt all names, parameter structs, and conventions in this spec to match what is actually in the repo.** Do not introduce a parallel parameter convention. If the existing code uses a struct like `HestonParams(κ, θ, ξ, ρ, v0)`, extend that pattern.

## Goal

Add a rough Heston pricer (El Euch & Rosenbaum characteristic function via numerical solution of a fractional Riccati ODE), make it differentiable with ForwardDiff (including w.r.t. the Hurst exponent H), calibrate it to the same SPX chain as classical Heston, and produce a side-by-side comparison. The deliverable is a working, tested, documented extension — not a sketch.

## Authoritative references

Verify every formula below against the primary sources before implementing. If any formula in this spec conflicts with the papers, **the papers win** — and flag the discrepancy in a comment.

1. El Euch & Rosenbaum, "The characteristic function of rough Heston models," arXiv:1609.02108. (Char function + fractional Riccati.)
2. Diethelm, Ford & Freed, "A predictor-corrector approach for the numerical solution of fractional differential equations," Nonlinear Dynamics 29 (2002). (Adams scheme + weights.)
3. Gatheral, Jaisson & Rosenbaum, "Volatility is rough," arXiv:1410.3394. (Background only; no formulas needed from it.)

## Mathematical specification

### Model

Rough Heston under the risk-neutral measure. Parameters: κ (mean reversion), θ (long-run variance), ξ (vol-of-vol), ρ (spot-vol correlation), v0 (initial variance), H ∈ (0, 1/2) (Hurst exponent). Define α = H + 1/2 ∈ (1/2, 1).

### Characteristic function

For log-price X_T = log(S_T/S_0) (adapt to however the existing classical pricer defines its log-price / forward conventions — match them exactly):

The characteristic function has the form

L(a, T) = exp( κθ · I¹h(a, T) + v0 · I^(1−α) h(a, T) )

where h(a, ·) solves the fractional Riccati equation

D^α h(a, t) = F(a, h(a, t)),   h(a, 0) = 0,

with Caputo fractional derivative D^α, Riemann–Liouville fractional integrals I^r, and

F(a, x) = ½(−a² − i a) + (i a ρ ξ − κ) x + (ξ²/2) x².

Sanity anchor: at α = 1 this is exactly the classical Heston Riccati ODE, and L must agree with the existing `heston_cf` to high precision. This is a hard test gate (see Tests).

**Important:** conventions for the sign of a, the drift term, and whether the char function is of X_T or of the forward log-moneyness vary between papers and between this spec and the existing repo. Reconcile them explicitly. Write a short comment block at the top of the new pricer file stating the exact convention used and how it maps to El Euch–Rosenbaum's notation.

### Numerical scheme: fractional Adams predictor-corrector

Uniform grid t_k = kΔ, Δ = T/N, k = 0..N. Let f_j = F(a, h_j).

Predictor:

h^P_{k+1} = (1/Γ(α)) Σ_{j=0}^{k} b_{j,k+1} f_j,
  b_{j,k+1} = (Δ^α / α) [ (k+1−j)^α − (k−j)^α ].

Corrector:

h_{k+1} = (Δ^α / Γ(α+2)) [ F(a, h^P_{k+1}) + Σ_{j=0}^{k} a_{j,k+1} f_j ],
  a_{0,k+1} = k^{α+1} − (k − α)(k+1)^α,
  a_{j,k+1} = (k−j+2)^{α+1} + (k−j)^{α+1} − 2(k−j+1)^{α+1},  for 1 ≤ j ≤ k.

Verify these weights against Diethelm–Ford–Freed before trusting them. An index error here produces plausible-looking wrong answers, which is why the α = 1 test gate exists.

The fractional integrals I¹h and I^(1−α)h needed for L(a,T) should be computed on the same grid using product-trapezoidal convolution quadrature with the kernel t^(r−1)/Γ(r) (r = 1 and r = 1−α respectively). Reuse the stored trajectory {h_k}; do not re-solve.

### Performance constraints (design in from the start, do not retrofit)

- The Adams scheme is O(N²) per characteristic-function evaluation, and calibration evaluates the char function thousands of times. Default N = 128; expose N as a keyword argument.
- Precompute everything that depends only on (α, N, Δ) — in particular the weight arrays — **once per solve**, outside the k-loop, and where possible hoist per-calibration-constant quantities out of the objective entirely.
- Note that the corrector weights a_{j,k+1} depend on k−j, so they can be built from a single vector of powers m^{α+1}, m = 0..N+1, rather than recomputed per step. Do this.

## AD requirements (this is the "differentiable" in the title — non-negotiable)

- The full pipeline `params → char function → Fourier price → implied vol error` must be differentiable with **ForwardDiff**, with gradients w.r.t. all of (κ, θ, ξ, ρ, v0, H). Note H enters through α, hence through the weights and Gamma functions — the weight precomputation must therefore be generic in the element type, not hardcoded Float64.
- Concretely: all internal arrays must have element types derived from the input parameter types, e.g. `T = promote_type(typeof(κ), typeof(H), ...)` and `h = zeros(Complex{T}, N+1)`. `ForwardDiff.Dual <: Real`, so `Complex{Dual}` arithmetic works, but only if nothing forces `ComplexF64`.
- Use `SpecialFunctions.gamma`, which has ForwardDiff rules. Do not implement your own Γ.
- Mutation of locally-allocated arrays is fine for ForwardDiff (unlike Zygote). Follow whatever mutation style the existing classical pricer uses; consistency with the repo beats purity.
- Add a gradient-correctness test: ForwardDiff gradient of a single option price w.r.t. all 6 parameters vs. central finite differences, agreement to rtol=1e-5. Include H in this check — it is the parameter most likely to be silently broken.

## Files to create / modify

1. `src/fractional_riccati.jl` — the Adams solver. Core function roughly:
   `solve_fractional_riccati(F, α, T, N) → (h::Vector{Complex{T}}, grid)` — but adapt the signature so that F's parameter dependence (a, and the Heston params) threads through in a ForwardDiff-friendly way.
2. `src/rough_pricer.jl` — `rough_heston_cf(u, T, params, H; N=128)` building L(a,T) from the solver output, plus `rough_heston_price(...)` that plugs into the **existing** Fourier pricing machinery (reuse it; do not write a second Fourier pricer).
3. `src/calibration.jl` — extend, don't rewrite: add a rough-Heston objective that reuses the existing loss (same weighting scheme as classical) with the extra parameter H, bounded H ∈ (0.01, 0.49). Use the same optimizer setup as the classical calibration for a fair comparison.
4. `test/test_fractional_riccati.jl`, `test/test_rough_pricer.jl` — see Tests.
5. `scripts/04_calibrate_rough.jl` — end-to-end: load the same processed SPX chain used by `02_calibrate.jl`, calibrate rough Heston, save fitted params + timings to `results/`.
6. `scripts/05_compare_models.jl` — produce the three deliverable plots (below).
7. `docs/rough_heston.md` — one page: model, char function, Adams scheme, conventions, and honest notes on numerical error sources (N-discretization, Fourier truncation) with the convergence evidence.
8. Update `README.md` with a "Rough Heston extension" section once results exist.

## Tests — hard gates, in order. Do not proceed past a failing gate.

1. **Classical recovery (the critical gate):** at H = 0.5 (α = 1), `rough_heston_cf(u, T, params; H=0.5, N=512)` must match the existing `heston_cf(u, T, params)` for u ∈ {0.5, 1.0, 2.0, 5.0} across at least two maturities and two parameter sets, to rtol ≤ 1e-6. If this fails, the bug is in the weights or the fractional integrals — fix before touching α < 1.
2. **Convergence in N:** for fixed (params, H=0.1, u, T), errors vs. an N=4096 reference must shrink at close to the expected rate as N doubles through 64→128→256→512. Record the observed order in the test output.
3. **Basic pricing sanity at H < 1/2:** prices monotone in strike appropriately, put-call parity holds through the pricer, price ≥ intrinsic.
4. **AD correctness:** ForwardDiff vs. central finite differences on all 6 parameters, rtol=1e-5, at H=0.1 and H=0.3.
5. **Behavioral check (test, not just plot):** ATM skew at short maturity is steeper (in magnitude) for rough Heston at H=0.1 than for classical Heston calibrated to comparable long-maturity levels. Loose tolerance; this is a direction check, not a precision check.

All existing tests must still pass. Run the full suite (`julia --project=. -e 'using Pkg; Pkg.test()'`) before declaring done.

## Deliverable plots (saved to `results/figures/`)

1. `fit_comparison.png` — market implied vols vs. classical-Heston fit vs. rough-Heston fit, faceted by maturity, with short maturities first. This is the headline figure.
2. `skew_term_structure.png` — ATM skew magnitude vs. maturity, log-log, both models + market, illustrating the ~T^(H−1/2) power law.
3. `convergence.png` — char-function error vs. N (from test gate 2).

Also save `results/benchmarks/rough_calibration.csv`: fitted parameters (including H), final RMSE for both models, iteration counts, wall time, and gradient-evaluation counts.

## Honesty requirements for the writeup

- Report the calibrated H and compare against the literature range (~0.05–0.15). If it lands outside, say so and discuss, don't tune it away.
- If rough Heston does **not** fit materially better than classical on the available chain (possible if the data lacks short maturities), report that plainly. The project's credibility rests on honest benchmarking.
- State the O(N²) cost and the resulting calibration-time penalty vs. classical Heston explicitly in the README table.

## Do NOT

- Do not pull in a black-box fractional-ODE package; the solver is hand-rolled (it is part of the point of the project).
- Do not write a second Fourier pricer or a second implied-vol inverter; reuse the existing ones.
- Do not weaken or delete a failing test gate to make progress. Stop and fix.
- Do not switch AD frameworks; ForwardDiff throughout, matching the existing calibration.
- Do not silently change classical-pricer conventions; if a genuine inconsistency in the existing repo blocks you, document it and make the minimal fix with its own test.

## Definition of done

- [ ] All 5 test gates pass; full existing suite still green
- [ ] `scripts/04` and `scripts/05` run end-to-end from a fresh clone (given the data step) with no manual edits
- [ ] Three figures + benchmark CSV generated
- [ ] `docs/rough_heston.md` written; README updated with results table
- [ ] Calibrated H reported and sanity-checked against literature
