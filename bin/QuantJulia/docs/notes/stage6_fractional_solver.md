# Stage 6–7 notes — the fractional solver and the rough CF

## Why fractional calculus shows up at all

Rough Heston's variance is driven by a fractional kernel: v(t) depends on the
whole past of the vol shocks, weighted by (t−s)^{α−1} with α = H + 1/2. That
power-law memory is exactly a Riemann–Liouville fractional integral — physics
readers know it as anomalous diffusion / non-Markovian response. The price of
that memory is that the Riccati ODE in the characteristic function becomes
*fractional*: D^α h = F(h), same quadratic F as classical Heston.

## The Volterra view (how you actually solve it)

D^α h = F(h), h(0)=0 is equivalent to the Volterra integral equation

    h(t) = (1/Γ(α)) ∫₀ᵗ (t−s)^{α−1} F(h(s)) ds.

Discretize F(h(s)) piecewise-linearly on a uniform grid and integrate against
the kernel exactly → product-trapezoidal weights (the Diethelm–Ford–Freed
corrector). Every step needs the WHOLE history — the O(N²) cost per solve *is*
the non-Markovianity, paid in flops.

## Why our scheme is implicit (a war story with a moral)

The textbook Adams predictor-corrector (explicit predictor) worked perfectly at
small Fourier arguments — and produced NaNs at u ~ 150 with coarse N. Reason:
the Riccati's linear coefficient is c1 = iuρξ − κ, so |c1| grows with u, and an
explicit scheme's stability constraint |c1|·Δ^α ≲ 1 forces N to explode exactly
where the pricer needs the CF (short-dated options need u up to ~10³).

Fix: treat the step fully implicitly. Because F is a *quadratic*, the implicit
equation each step,

    x = cc·(F(x) + history),   cc = Δ^α/Γ(α+2),

is a scalar complex quadratic — solvable in closed form, no Newton. Root
selection by continuity (nearest to h_k), with the small root computed
cancellation-free. Unconditionally stable in the linear part, no predictor
(half the flops), same product-trapezoidal accuracy: observed convergence
order ≈ 1 + α, the theoretical rate for solutions with the t^α starting
singularity.

**The moral (interview-grade):** stability and accuracy are different failure
modes. The α → 1 recovery gate caught both a divergence *and* a one-character
variable-shadowing bug in the CF assembly within minutes, because classical
Heston provides exact ground truth at the boundary of the parameter space.
Build the boundary check before the new physics.

## The CF assembly

    ψ(u) = exp( κθ·I¹h(u,T) + v0·I^{1−α}h(u,T) )

Both fractional integrals are evaluated from the stored trajectory with the
same product-trapezoidal weights (r = 1 reduces to the trapezoid rule; r = 0
reduces to h(T) — which is why α = 1 recovery is exact end-to-end, not just
approximate). Two exact identities hold for every H and are tested:
ψ(0) = 1 and ψ(−i) = 1 (at u = −i the Riccati source term vanishes, h ≡ 0).

## AD notes specific to this stage

- H is a calibration parameter, so α = H + 1/2 is a `ForwardDiff.Dual` during
  gradient evaluation — the weight tables m^α, m^{α+1} are Dual-valued.
- Landmine: `0^α` has a NaN partial in α (0·log 0). The m = 0 table entries
  are pinned to zero explicitly (mathematically exact on α > 0).
- Gradient correctness is gated: AD vs central finite differences on all six
  parameters including H, at H = 0.1 and 0.3, agreeing to ~1e-9 relative.

## Numerical noise floor (honest accounting)

Solver error grows ~u^{3/2} at fixed N, so the CF is least accurate exactly
where it is smallest. Integrated over the Fourier line this leaves an ABSOLUTE
price noise floor ~1e-3·(spot/100) at N ≈ 512 — irrelevant after vega
normalization (≪ 1 bp of implied vol on SPX scales), but visible if you stare
at microscopic far-wing option prices. The pricing-sanity gate therefore runs
on economically meaningful strikes and this floor is stated rather than hidden.
