# QuantJulia

[![CI](https://github.com/Yugam2508/QuantJulia/actions/workflows/ci.yml/badge.svg)](https://github.com/Yugam2508/QuantJulia/actions/workflows/ci.yml)

A differentiable option-pricing and volatility-calibration framework in Julia.

**Story (the destination):** a differentiable calibration engine, demonstrated on
classical Heston, extended to the rough-volatility frontier (rough Heston). The
same Fourier pricing / implied-vol / calibration machinery is written once and
reused across models — the only thing that changes between models is the
characteristic function.

> **Status: complete** (194 tests green). Classical and rough Heston are both
> calibrated to a real SPX chain (11,858 OTM quotes, 50 expiries, 2026-07-02
> close), with a hand-rolled implicit fractional Riccati solver, AD gradients
> through everything including the Hurst exponent, and a five-gate validation
> stack anchored by exact α→1 classical recovery.
>
> **Headline results (the honest version):** the market's own ATM-skew term
> structure follows the rough power law with **H ≈ 0.107** (model-free fit,
> squarely in the literature range) — but vega-weighted calibration on this
> weekend snapshot does **not** select roughness: rough ties classical
> (134 vs 134 bps full-chain) and H runs to its bound, because front-end
> calendar-time distortions (non-monotone skews across daily expiries)
> dominate the loss and leave H unidentified. Full reading in
> [docs/rough_heston.md](docs/rough_heston.md).

| | classical | rough |
|---|---|---|
| full-chain IV RMSE (11,858 quotes) | 133.6 bps | 134.1 bps |
| short-end IV RMSE (T ≤ 0.16) | 157.6 bps | 157.6 bps |
| calibrated H | — | 0.49 (at bound) |
| market skew power law | — | **H ≈ 0.107** (model-free) |
| calibration wall time (192 quotes) | 9 s | 68 s |

## Layout

```
src/
  QuantJulia.jl      # module
  blackscholes.jl    # Stage 1 — BSM price, Greeks, implied vol        ✅
  heston.jl          # Stage 2 — Heston CF, little-trap form           ✅
  fourier.jl         # Stage 3 — model-agnostic Gil-Pelaez pricer      ✅
  cboe.jl            # Stage 4 — CBOE parser, filters, parity forwards ✅
  calibration.jl     # Stage 4/8 — vega-weighted loss + LBFGS/AD       ✅
  fractional_riccati.jl # Stage 6 — implicit fractional solver         ✅
  rough_heston.jl    # Stage 7 — El Euch–Rosenbaum rough CF            ✅
scripts/
  01_prepare_data.jl # raw CBOE csv → filtered chain with implied vols
  02_calibrate.jl    # fit classical Heston, report per-expiry RMSE
  03_calibrate_rough.jl        # rough vs classical head-to-head
  04_short_end_and_powerlaw.jl # short-end duel + market skew power law
test/
  runtests.jl        # + per-stage test files (120 tests)
data/                # market data (not committed — see data/README.md)
results/             # committed fit results
docs/
  roadmap.md         # the full plan, grounded to where the code actually is
  rough_heston_spec.md   # committed destination spec (Stages 6–8)
  notes/             # per-stage theory notes: derivations + the "why"
```

## Running the tests

```julia
julia --project=.        # from the repo root
julia> ]                 # enter Pkg mode
(QuantJulia) pkg> test
```

or in one shot:

```
julia --project=. -e 'import Pkg; Pkg.test()'
```

The tests are written first; you implement `src/blackscholes.jl` until they pass.

## Reproducing everything

```
# 0. environment (Julia ≥ 1.10)
julia --project=. -e 'import Pkg; Pkg.instantiate()'

# 1. tests — 194 gates, ~6 min (includes a Monte Carlo cross-check)
julia --project=. -e 'import Pkg; Pkg.test()'

# 2. data — download the CBOE SPX chain per data/README.md, then:
julia --project=. scripts/01_prepare_data.jl          # parse, filter, implied vols
julia --project=. scripts/02_calibrate.jl             # classical Heston fit (~1 min)
julia --project=. scripts/03_calibrate_rough.jl       # rough vs classical duel (~2 min)
julia --project=. scripts/04_short_end_and_powerlaw.jl # short-end duel + market H (~6 min)
```

Outputs land in `results/*.csv` (committed, so the numbers in this README are
inspectable without rerunning). The market snapshot itself is not
redistributed; `data/README.md` documents the exact download.

## Design constraint carried from day one

Everything is written to stay **automatic-differentiation friendly** — functions
are generic in their numeric type so `ForwardDiff.Dual` can flow through prices
to yield Greeks and calibration gradients. This is why the eventual rough-Heston
fractional ODE solver will be hand-rolled rather than pulled from a package.

## Roadmap

See [docs/roadmap.md](docs/roadmap.md).

## Companion repo

[variance-risk-premium](https://github.com/Yugam2508/variance-risk-premium) —
this repo builds models *of* implied volatility; that one measures the premium
*inside* it: 36 years of VIX² vs realized variance, with honest accounting of
the crash months that pay for it.
