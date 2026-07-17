# Roadmap

The destination is a **differentiable rough-Heston calibration**. The path there
builds one reusable pricing/calibration spine, then swaps in progressively
harder characteristic functions. Rough Heston is not a rewrite — it's the last
function swap.

## Where the code actually is

**All eight stages are complete** (194 tests): Black-Scholes + safeguarded
implied-vol inversion, the Heston CF in little-trap form, the model-agnostic
Fourier pricer with AD verified against finite differences, the CBOE data
pipeline + classical calibration, the hand-rolled implicit fractional Riccati
solver, the rough Heston CF (all five spec gates green, including exact α→1
classical recovery), and the rough-vs-classical comparison on the real SPX
chain. The spec's literature-value gate was substituted by an independent
Monte Carlo cross-check of the Heston CF (no trusted published table to
hand; a fabricated one would be worse). Results live in `results/*.csv`;
the reading of them — including the honest surprise about H — in
`docs/rough_heston.md`. Per-stage derivation notes in `docs/notes/`.

## Stages

| Stage | Weeks | Deliverable | Reuses |
|------|-------|-------------|--------|
| 1. Black-Scholes warm-up | 1 | price, Greeks, implied-vol inversion | — |
| 2. Heston characteristic function | 2 | `heston_cf(u, T, params)` | implied-vol |
| 3. Fourier pricer | 2–3 | Carr-Madan / Gil-Pelaez pricing from any CF | BS implied-vol |
| 4. SPX data + calibration | 4–5 | fit classical Heston to a real SPX chain | pricer, IV |
| 5. Differentiate the loss | 5 | ForwardDiff gradients w.r.t. (κ,θ,ξ,ρ,v₀) | all above |
| 6. Fractional Riccati solver | 6 | hand-rolled Adams predictor-corrector | — (new) |
| 7. Rough-Heston CF + pricing | 7 | `rough_heston_cf`, AD through the solver | pricer, solver |
| 8. Rough calibration + writeup | 8 | rough vs classical on same SPX surface | everything |

Stages 6–8 have a full, committed spec: [rough_heston_spec.md](rough_heston_spec.md).
It is filed early **on purpose** — its one binding constraint on the stages
above is that the Stage-3 Fourier pricer must be model-agnostic (take a
characteristic function as an argument, not hardcode Heston's). Build it that way
now so the rough extension is a CF swap, not a rewrite.

## The gates that catch silent errors

- **Stage 3:** BS implied-vol round-trip (already in the test suite) — a wrong
  pricer shows up as an implied vol that doesn't match what you put in.
- **Stage 7:** `rough_heston_cf(u,T,params; H=0.5) ≈ heston_cf(u,T,params)` to
  ~1e-6. Necessary but **not sufficient** — it only exercises the fractional
  solver at its α=1 limit. Add a second check at α<1 (a published rough-Heston
  price, or a Monte-Carlo reference) before trusting any calibrated H.

## Technical notes to not forget

- **α = H + 1/2.** H ∈ (0, 1/2) ⇒ α ∈ (1/2, 1); α = 1 ⇔ classical Heston.
- The rough CF is built from **fractional integrals of the Riccati solution h**
  (I¹h and I^{1-α}h), not from h(T) alone. That's a second numerical object to
  get right, and a common convention trap.
- **Verify signs/normalizations of the El Euch–Rosenbaum CF against the paper.**
  Conventions vary across sources (ξ vs ν for vol-of-vol, sign of ρ term).
- The Adams scheme is **O(N²) per CF evaluation**, and calibration calls the CF
  thousands of times. Keep N ~ 100–200; precompute the power-law kernel weights
  once outside the solve; profile before optimizing further.
- Keep every array's element type **driven by the parameter types** (not
  hard-coded `Float64`) so `Complex{Dual}` flows through for AD gradients —
  including ∂price/∂H.

## Reading (start now, in parallel with Stage 1)

1. Gatheral, Jaisson & Rosenbaum, *Volatility is Rough* (2018), §1–3 — the
   empirical story (~15 pp, very readable). Skip the estimation technicalities.
2. El Euch & Rosenbaum, *The characteristic function of rough Heston models*
   (2019) — abstract + intro now, full CF derivation at Stage 6.
3. Diethelm, Ford & Freeman — the fractional Adams predictor-corrector scheme.
   This is the Stage-6 solver; read it carefully when you get there.
