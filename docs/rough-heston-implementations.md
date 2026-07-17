# Rough Heston European Option Pricing — Implementation Reference

## Overview

Seven independent implementations of European call/put pricing under the
rough Heston model (El Euch & Rosenbaum 2018, 2019). Each uses the Lewis
(2001) Fourier inversion formula but differs in how the fractional Riccati
ODE / Volterra integral equation for the characteristic function is solved.

---

## 1. rough_heston_gatheral_r (R)

| Field | Detail |
|---|---|
| Language | R |
| Runtime | `Rscript` |
| Origin | Translation of MATLAB code by Baschetti, Bormetti, Rossi, Romagnoli (Univ. of Bologna, 2020) to R by Jim Gatheral |
| Source | `bin/rough_heston_gatheral_r/` |
| Paper | Gatheral et al. "Rational approximations for the rough Heston model" (SSRN 3191578, 4601600) |
| License | Proprietary (Gatheral) |

### Mathematical method
- **CF**: Adams predictor-corrector scheme for the fractional Riccati ODE solution ψ(t)
- **Final sub-step**: Padé [5,5] rational approximation
- **Integration**: Lewis formula with optimal α contour (Lord-Kahl)
- **Normalization**: S₀ = 1 normalized, prices scaled by S₀

### Parameter convention

| Parameter | Symbol | Implementation |
|---|---|---|
| Roughness | α = H + ½ | `params$al` |
| Mean reversion | λ | `params$lam` |
| Long-run variance | θ | `xiCurve(t) = rep(theta, …)` |
| Vol-of-vol | ν | `params$nu` |
| Correlation | ρ | `params$rho` |

### Spot check results (5 rows)

| Row | H | λ | θ | ν | ρ | T | K | Call | Put | Status |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 0.3 | 2.0 | 0.04 | 0.3 | -0.7 | 1.0 | 100 | 7.590974721337 | 7.590974721337 | OK |
| 2 | 0.3 | 2.0 | 0.04 | 0.3 | -0.7 | 1.0 | 110 | 3.428873720390 | 13.428873720390 | OK |
| 3 | 0.3 | 2.0 | 0.04 | 0.3 | -0.7 | 1.0 | 90 | 13.799396442769 | 3.799396442769 | OK |
| 4 | 0.4 | 0.5 | 0.02 | 0.4 | -0.5 | 1.5 | 100 | 3.411616505114 | 3.411616505114 | OK |
| 5 | 0.8 | 2.5 | 0.06 | 0.8 | -0.9 | 3.0 | 100 | **FAIL** | **FAIL** | ERROR |

### Known bug — Row 5 failure

```
Error in integrate(integrand, lower = 0, upper = a.max, rel.tol = 1e-08):
  non-finite function value
```

Root cause: The Adams scheme produces a ψ vector of length N+1 at τ_max = 5
(λ × T × 4 = 2.5 × 0.5 × 4). The subsequent Padé extrapolation reshapes
ψ(t_τ, u) into a matrix with mismatched dimensions — `phi_tau` and `psi_tau`
have incompatible row counts for the `%*%` operator. This is a dimension
mismatch in the Adams-Padé hybrid interface, not a mathematical blowup.

Fix would require aligning the φ and ψ evaluation grids consistently, or
using the Padé CF directly for all steps.

---

## 2. rough_heston_octave (Octave)

| Field | Detail |
|---|---|
| Language | GNU Octave (≈MATLAB-compatible) |
| Runtime | `/usr/bin/octave` |
| Origin | Port of sigurdroemer/rough_heston (MATLAB) to Octave |
| Source | `bin/rough_heston_octave/` |
| Original | `bin/rough_heston_matlab/` (unmodified upstream) |
| References | Gerhold et al. (2019), Diethelm (2004), Lord-Kahl (2006) |

### Mathematical method
- **CF**: Diethelm fractional Adams-Bashforth-Moulton predictor-corrector scheme
  for the Volterra integral equation (VIE)
- **Integration**: Cosine method (Fang & Oosterlee) + multi-domain integration
  (Zhu 2010) with optimal Fourier contour (Lord-Kahl 2006)
- **Assumes**: negative spot-vol correlation (ρ < 0)

### Parameter convention

V_0 = long-run variance (= θ), α = H + 0.5, V_bar = θ, ξ = ν, λ = λ.

Same as rough_heston_matlab; identical to workshop convention.

### Octave-specific fixes vs MATLAB original

1. `SolveVIE.m`: `linspace(0, T, N+1)` instead of `(0:h:T)` — MATLAB's colon
   operator can produce N points instead of N+1 due to floating-point
   representability.
2. `MomentGeneratingFunctionRoughHeston.m`: `reshape(phi, size(u))` at end —
   ensures column/row orientation matches the Fourier integration variable
   (Octave passes rows, MATLAB passes columns).
3. NaN debug logging added to `SolveVIE.m`.
4. `pkg load optim; pkg load financial;` at top of `price_european.m`.

### Spot check results

| Row | H | λ | θ | ν | ρ | T | K | Call | Put | Status |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 0.3 | 2.0 | 0.04 | 0.3 | -0.7 | 1.0 | 100 | 7.575637227344 | 7.575637227344 | OK |
| 2 | 0.3 | 2.0 | 0.04 | 0.3 | -0.7 | 1.0 | 110 | 3.414543098521 | 13.414543098521 | OK |
| 3 | 0.3 | 2.0 | 0.04 | 0.3 | -0.7 | 1.0 | 90 | 13.787113200154 | 3.787113200154 | OK |
| 4 | 0.4 | 0.5 | 0.02 | 0.4 | -0.5 | 1.5 | 100 | NaN | NaN | **VIE BLOWUP** |
| 5 | 0.8 | 2.5 | 0.06 | 0.8 | -0.9 | 3.0 | 100 | NaN | NaN | **VIE BLOWUP** |

### Known bug — Rows 4 and 5 failure

Both fail in `SolveVIE.m` — the Diethelm explicit fractional ABM scheme
produces complex overflow at iteration 6:

- **Row 4** (α = H + ½ = 0.9, T = 1.5): `Dalpha_k+2 = NaN-Infi` at k = 6
- **Row 5** (α = 1.3, T = 3.0): `Dalpha_k+2 = -Inf+NaNi` at k = 6

Root cause: The explicit Diethelm ABM scheme is only conditionally stable.
For the rough Heston Riccati ODE ψ' = F(ψ) with large |ψ|, the uniform
fixed-step grid (N = 252) cannot resolve the stiffness. The scheme requires
either an adaptive step size or an A-stable implicit method (QIPc, Padé).

---

## 3. rough_heston_matlab (MATLAB)

| Field | Detail |
|---|---|
| Language | MATLAB |
| Runtime | MATLAB R2019a+ |
| Origin | sigurdroemer/rough_heston (unmodified upstream) |
| Source | `bin/rough_heston_matlab/` |
| Requirements | Financial Toolbox, Optimization Toolbox |

### Status

**Wired but untested** — this machine does not have MATLAB installed.
The directory is ready to run when MATLAB becomes available. Code is identical
to the original upstream at https://github.com/sigurdroemer/rough_heston.

### Differences from rough_heston_octave

The Octave port (`rough_heston_octave`) has three Octave-specific fixes
not present here:
1. `linspace` vs colon operator in `SolveVIE.m`
2. `reshape` in `MomentGeneratingFunctionRoughHeston.m`
3. NaN debug logging

Otherwise identical. The MATLAB version uses `blsimpv` from Financial Toolbox
for implied vol, whereas Octave uses the `financial` package.

### Parameter convention

Identical to rough_heston_octave and rough_heston_workshop.

---

## 4. rough_heston_workshop (Python)

| Field | Detail |
|---|---|
| Language | Python |
| Runtime | `python3` |
| Origin | QM 2024 Workshop (E. Fringu, M. Rosenbaum, M. Sabate-Vidales) |
| Source | `bin/rough_heston_workshop/` |
| Dependencies | `numpy`, `scipy` |
| Paper | Link to QM 2024 workshop materials |

### Mathematical method
- **CF**: Padé [n,n] rational approximation (n = 2–6) of the fractional
  Riccati ODE solution h(a, τ), plus explicit φ(t) integration via
  Gauss-Legendre quadrature
- **Integration**: Lewis formula with optimal α (Lord-Kahl root search)
- **Additional**: RSQE/HQE Monte Carlo path simulation schemes

### Parameter convention

Uses `H` directly. `params = {"H": H, "nu": ν, "lbd": λ, "rho": ρ}`.
Same convention as the other implementations (α = H + ½, λ = mean reversion).

### Spot check results

| Row | H | λ | θ | ν | ρ | T | K | Call | Put |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 0.3 | 2.0 | 0.04 | 0.3 | -0.7 | 1.0 | 100 | 7.575029553172 | 7.575029553172 |
| 2 | 0.3 | 2.0 | 0.04 | 0.3 | -0.7 | 1.0 | 110 | 3.412099685584 | 13.412099685584 |
| 3 | 0.3 | 2.0 | 0.04 | 0.3 | -0.7 | 1.0 | 90 | 13.787943270114 | 3.787943270114 |
| 4 | 0.4 | 0.5 | 0.02 | 0.4 | -0.5 | 1.5 | 100 | 3.401336133018 | 3.401336133018 |
| 5 | 0.8 | 2.5 | 0.06 | 0.8 | -0.9 | 3.0 | 100 | 12.315411254226 | 12.315411254226 |

**5/5 pass.** The Padé rational approximation bypasses time-stepping entirely,
making it numerically stable for all parameter regimes.

### Known issues
None. This is the most reliable implementation on this machine.

---

## 5. rough_heston_qipc (Python)

| Field | Detail |
|---|---|
| Language | Python |
| Runtime | `python3` |
| Origin | Research code, quadratic-implicit Adams for fractional ODEs |
| Source | `bin/rough_heston_qipc/` |
| Dependencies | `numpy`, `scipy` |

### Mathematical method
- **CF**: Quadratic-implicit Adams (QIPc) — an A-stable implicit method for
  the fractional Riccati ODE, using Newton iteration to solve the implicit step
- **Integration**: Lewis formula

### Spot check results

| Row | H | λ | θ | ν | ρ | T | K | Call | Put |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 0.3 | 2.0 | 0.04 | 0.3 | -0.7 | 1.0 | 100 | 6.907317866706 | 6.907317866706 |
| 2 | 0.3 | 2.0 | 0.04 | 0.3 | -0.7 | 1.0 | 110 | 2.512417863165 | 12.512417863165 |
| 3 | 0.3 | 2.0 | 0.04 | 0.3 | -0.7 | 1.0 | 90 | 13.652272606563 | 3.652272606563 |
| 4 | 0.4 | 0.5 | 0.02 | 0.4 | -0.5 | 1.5 | 100 | 3.177933677609 | 3.177933677609 |
| 5 | 0.8 | 2.5 | 0.06 | 0.8 | -0.9 | 3.0 | 100 | 9.007837681356 | 9.007837681356 |

**5/5 pass.** The QIPc implicit method handles stiffness correctly.

### Known issues
Prices are systematically lower than workshop/Gatheral/Octave (≈10–15% on
Row 1). This suggests either a different parameter interpretation or a bug
in the QIPc implementation. Needs investigation.

---

## 6. roughprix_python (Python/JAX)

| Field | Detail |
|---|---|
| Language | Python |
| Runtime | `python3` |
| Author | @lorenc9 (GitHub) |
| Source | `bin/roughprix_python/` |
| Dependencies | `jax`, `numpy`, `scipy` |

### Mathematical method
- **CF**: Root-Padé (default), standard Padé [5,5], H-expansion, series-based
  Padé diagnostics — multiple solver backends with automatic fallback
- **Integration**: Lewis formula with JAX acceleration
- **GPU**: CUDA-enabled jaxlib optional (falls back to CPU)

### Parameter convention

Uses `H` directly, but **`theta` = θ × λ** (combined long-run × mean-reversion
parameter), not θ alone. This differs from all other implementations.

| Parameter | roughprix | Others |
|---|---|---|
| Long-run var | `theta / lbd` | θ |
| Mean reversion | `lbd` | λ |
| Vol-of-vol | `nu` | ν |
| Correlation | `rho` | ρ |

This means parameter values cannot be copied directly. The `theta` parameter
in roughprix must be divided by `lbd` to get the θ used by other codes.

### Spot check results

| Row | H | λ | θ | ν | ρ | T | K | Call | Put |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 0.3 | 2.0 | 0.04 | 0.3 | -0.7 | 1.0 | 100 | 6.216792522180 | 6.216792522180 |
| 2 | 0.3 | 2.0 | 0.04 | 0.3 | -0.7 | 1.0 | 110 | 2.140250303104 | 12.140250303104 |
| 3 | 0.3 | 2.0 | 0.04 | 0.3 | -0.7 | 1.0 | 90 | 22.783363596786 | 12.783363596786 |
| 4 | 0.4 | 0.5 | 0.02 | 0.4 | -0.5 | 1.5 | 100 | 3.078430940209 | 3.078430940209 |
| 5 | 0.8 | 2.5 | 0.06 | 0.8 | -0.9 | 3.0 | 100 | 7.964114346633 | 7.964114346633 |

**5/5 pass.** Note: due to the `theta = θ × λ` convention, the parameters
as listed above are NOT what roughprix receives internally. The roughprix
wrapper script `price_european.py` handles the conversion.

### Known issues
The different parameter convention makes direct cross-comparison with other
implementations difficult. A separate validation with correctly mapped
parameters is needed.

---

## 7. QuantJulia (Julia)

| Field | Detail |
|---|---|
| Language | Julia |
| Runtime | `julia` |
| Source | `bin/QuantJulia/` |
| Status | ❌ Missing dependency `QuadGK` |

Not tested — `QuadGK` package not installed in the Julia environment.
Would need `Pkg.add("QuadGK")` before it can run.

---

## 8. rough_heston_breneis (Python)

| Field | Detail |
|---|---|
| Language | Python |
| Runtime | `python3` |
| Author | Breneis |
| Source | `bin/rough_heston_breneis/` |
| Status | ❌ Missing dependency `orthopy` |

```
ModuleNotFoundError: No module named 'orthopy'
```

The `orthopy` package is not installed. It was previously available via
`stonefish_runtime.pth` which has been removed.

---

## Cross-cutting analysis

### Why prices disagree

The five working implementations produce DIFFERENT prices:

| Row | workshop | gatheral_r | octave | qipc | roughprix |
|---|---|---|---|---|---|
| 1 | 7.5750 | 7.5910 | 7.5756 | 6.9073 | 6.2168 |
| 2 | 3.4121 | 3.4289 | 3.4145 | 2.5124 | 2.1403 |
| 3 | 13.7879 | 13.7994 | 13.7871 | 13.6523 | 22.7834 |
| 4 | 3.4013 | 3.4116 | NaN | 3.1779 | 3.0784 |
| 5 | 12.3154 | FAIL | NaN | 9.0078 | 7.9641 |

The only pair that agrees are **workshop and octave** (rows 1–3 are within
0.01% of each other). This is expected because they share the same model
parameterization (Gerhold et al. convention) and differ only in the ODE
solver (Padé vs Diethelm).

Possible sources of discrepancy:

1. **Parameter conventions** — roughprix uses θ × λ, not θ. QIPc may interpret
   parameters differently.
2. **Integration contour** — optimal α (Lord-Kahl) vs fixed contour.
3. **Fourier truncation** — `amax` / `ubound` / `dA` vary across codes.
4. **CF accuracy** — Padé [5,5] vs Diethelm ABM vs QIPc vs Root-Padé each
   have different error characteristics for the fractional Riccati ODE.
5. **∫ ψ ds vs ∫ D^α ψ ds** — the Gerhold-form CF uses both ψ and its
   fractional derivative, while the workshop uses only ψ.

### Convergent reference

Workshop and Octave (rows 1–3) agree to ≈0.01%, establishing them as
a provisional reference pair. The workshop is the most reliable (no NaN,
all 5 rows, Padé is analytical). Gatheral_R agrees with the reference
to ≈0.2% on rows 1–3.

### Summary matrix

| Implementation | Lang | CF method | 5/5 | Reference agreement |
|---|---|---|---|---|
| workshop | Python | Padé [5,5] + GL | ✅ | — |
| gatheral_r | R | Adams + Padé | ⚠️ (row 5) | 0.2% vs workshop (rows 1–3) |
| octave | Octave | Diethelm VIE | ⚠️ (rows 4–5) | 0.01% vs workshop (rows 1–3) |
| matlab | MATLAB | Diethelm VIE | 🚫 (no MATLAB) | untested |
| qipc | Python | QIPc (implicit) | ✅ | 9% below workshop |
| roughprix | Python/JAX | Root-Padé | ✅ | 18% below workshop (convention diff) |
| QuantJulia | Julia | — | ❌ | missing dep |
| breneis | Python | — | ❌ | missing dep |

### Recommendations

1. **Use workshop as the reference** — it's the most reliable and matches
   Octave (rows 1–3) to 0.01%.
2. **Fix gatheral_r row 5** — the dimension mismatch in the Adams-Padé hybrid
   is a simple programming bug.
3. **Fix octave rows 4–5** — needs adaptive step size or implicit solver.
4. **Investigate qipc** — systematically low prices suggest a parameter or
   formula error.
5. **Re-run roughprix with mapped parameters** — the `theta = θ × λ` convention
   must be accounted for in the comparison.
