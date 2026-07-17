# roughprix

European option pricing for rough stochastic volatility models via Fourier inversion. The current implementation focuses on the **rough Heston model**; further models will follow.

Pricing rests on the log-price characteristic function, which is expressed through a Riccati-type Volterra equation. `roughprix` provides several methods for solving that equation, ranging from direct numerical Volterra solvers to analytic approximations, and adds a **Taylor expansion in the Hurst exponent** $H$ (Hager & Kreher, working paper) that makes evaluating the characteristic function across a range of roughness values nearly free once the anchor solve is done. The numerical solvers are implemented in **JAX** for JIT-compiled, GPU-compatible execution.

### Methods implemented

| Method | `base_solution` | Description |
|--------|-----------------|-------------|
| Adams–PECE | `"direct_riccati"` | Fractional Adams predictor–corrector (El Euch & Rosenbaum 2019); high accuracy, $\mathcal{O}(J^2)$ in time steps |
| Implicit-$\pi$ | `"direct_riccati"` | Product-integration implicit solver; more stable than Adams for small $H$ or non-uniform grids |
| Padé $[m/m]$ | `"pade"` | Gatheral closed-form Padé approximant to the Riccati solution; fast, no ODE solve |
| Root-Padé $[m/(m+1)]$ | `"root_pade"` | Root-transformed Padé; avoids the branch-cut singularity of the plain Padé and is more accurate away from $H = \tfrac{1}{2}$ |
| $H$-expansion | any base | Taylor series $\sum_{n=0}^{N} \frac{(\Delta H)^n}{n!} f_n$ around an anchor $H_0$; coefficients $f_n$ obtained by recursive differentiation of the Riccati equation |

The Adams and implicit-$\pi$ solvers are selected automatically via `direct_riccati_solver="auto"` (implicit-$\pi$ is preferred for $H < 0$ or non-uniform time grids).

## Installation

```bash
pip install -e .
```

Requires Python ≥ 3.10, NumPy, SciPy, JAX, and Numba.

## Model

The spot $S$ and instantaneous variance $V$ satisfy

$$
\frac{dS_t}{S_t} = \sqrt{V_t}\, dW_t,
$$

$$
V_t = V_0 + \frac{1}{\Gamma(H+\tfrac{1}{2})} \int_0^t (t-s)^{H-\tfrac{1}{2}}
\Bigl[\lambda(\theta - V_s)\, ds + \nu\sqrt{V_s}\, dB_s\Bigr],
$$

$$
d\langle W, B\rangle_t = \rho\, dt,
$$

where $H \in (-\tfrac{1}{2}, \tfrac{1}{2}]$ is the Hurst exponent. $H = \tfrac{1}{2}$ recovers classical Heston.

## Quick start

```python
import numpy as np
from roughprix import RoughHeston, RoughHestonParam

param = RoughHestonParam(
    lam=0.3,        # mean-reversion speed λ
    theta=0.3*0.02, # long-run variance θ
    nu=0.3,         # vol-of-vol ν
    rho=-0.7,       # spot–vol correlation ρ
    V0=0.02,        # initial variance V₀
    H=0.1,          # Hurst exponent H
)

model = RoughHeston(param, riskfree=0.0)

K = np.array([0.8, 0.9, 1.0, 1.1, 1.2])
T = 1.0
```

## Pricing

The characteristic function is evaluated numerically at `param.H` and inverted via Fourier quadrature. The `base_solution` constructor argument selects the Riccati solver:

| `base_solution`   | When to use |
|--------------------|-------------|
| `"auto"` (default) | `"exact_heston"` if $H = \tfrac{1}{2}$, else `"root_pade"` |
| `"root_pade"`      | $H$ away from $\tfrac{1}{2}$; fast, accurate Padé-based solver |
| `"exact_heston"`   | $H = \tfrac{1}{2}$ exactly (classical Heston closed form) |
| `"pade"`           | Gatheral $[m/m]$ Padé; alternative to `root_pade` |
| `"direct_riccati"` | Full numerical Volterra solve; most general |

```python
ivs = model.eur_call_put(
    K=K,
    maturity=T,
    implied_vol=True,
    payoff_selection="otm",   # calls for K >= F, puts for K < F
    integration="panel",
    L=200.0,                  # Fourier truncation
    time_steps=500,           # time-grid nodes for Volterra solve
)
print(ivs)
```

```python
# Direct numerical Riccati solve
benchmark_model = RoughHeston(
    param, riskfree=0.0, base_solution="direct_riccati"
)
ivs_benchmark = benchmark_model.eur_call_put(
    K=K, maturity=T, implied_vol=True, L=200.0
)
```

### Adaptive Fourier truncation

Use `integration="adaptive_panel"` to let the pricer automatically select $L$:

```python
ivs = model.eur_call_put(
    K=K,
    maturity=T,
    implied_vol=True,
    expansion_order=0,
    integration="adaptive_panel",
    adaptive_tol=1e-4,        # stop when max IV change < 1e-4
    adaptive_verbose=True,
)
```

## Pricing with the H-expansion

The H-expansion approximates the log characteristic function as a Taylor series in $\Delta H = H - H_0$ around an anchor $H_0$:

$$
\log \varphi(u, T;\, H) \;\approx\; \sum_{n=0}^{N} \frac{(\Delta H)^n}{n!}\, f_n(u, T),
$$

where the coefficients $f_n$ are obtained by differentiating the Riccati–Volterra equation recursively. At order $N = 0$ the result equals the quasi-exact benchmark. Higher orders extend the valid range of $|\Delta H|$.

### Anchor at $H_0 = 0$ (`"root_pade"` base)

Useful when pricing across a range of small $H$ values.

```python
# Anchor at H₀ = 0, target H = 0.1
param_anchor0 = RoughHestonParam(
    lam=0.3, theta=0.3*0.02, nu=0.3, rho=-0.7, V0=0.02,
    H=0.0,              # anchor H₀ = 0
)
model_expansion = RoughHeston(
    param_anchor0, riskfree=0.0, base_solution="root_pade"
)

ivs_N4 = model_expansion.eur_call_put(
    K=K,
    maturity=T,
    implied_vol=True,
    expansion_order=4,  # 4th-order Taylor in H
    H=0.1,              # evaluate at this target H
    L=200.0,
)
```

### Anchor at $H_0 = \tfrac{1}{2}$ (`"exact_heston"` base)

Useful near the classical Heston regime.

```python
param_half = RoughHestonParam(
    lam=0.3, theta=0.3*0.02, nu=0.3, rho=-0.7, V0=0.02,
    H=0.5,              # anchor: classical Heston
)
model_half = RoughHeston(
    param_half, riskfree=0.0, base_solution="exact_heston"
)

ivs_N2 = model_half.eur_call_put(
    K=K,
    maturity=T,
    implied_vol=True,
    expansion_order=2,  # 2nd-order Taylor in H around ½
    H=0.4,              # evaluate at H = 0.4
    L=200.0,
)
```

### Pricing across multiple $H$ values

Pass an array to `H` to price all values simultaneously. The expensive Volterra fields are computed once and shared:

```python
H_values = np.array([0.05, 0.1, 0.15, 0.2])

# Returns shape (N_K, N_H)
ivs_grid = model_expansion.eur_call_put(
    K=K,
    maturity=T,
    implied_vol=True,
    expansion_order=4,
    H=H_values,
    L=200.0,
)
print(ivs_grid.shape)  # (5, 4)
```

### Choosing expansion order

| Order $N$ | Error | Cost |
|-----------|-------|------|
| 0 | Exact at anchor $H_0$ | baseline |
| 1 | $\mathcal{O}(\Delta H)$ | $+1$ Volterra solve |
| 2 | $\mathcal{O}(\Delta H^2)$ | $+2$ solves |
| 4 | $\mathcal{O}(\Delta H^4)$ | $+4$ solves |

For $|\Delta H| \lesssim 0.2$ and $T \lesssim 1$, order 4 with a `"root_pade"` anchor at $H_0 = 0$ typically achieves implied-vol errors below $10^{-3}$.

## API reference

### `RoughHestonParam`

| Field | Type | Description |
|-------|------|-------------|
| `lam` | `float` | Mean-reversion speed $\lambda$ |
| `theta` | `float` | Long-run variance $\theta$ |
| `nu` | `float` | Vol-of-vol $\nu$ |
| `rho` | `float` | Spot–vol correlation $\rho \in (-1, 1)$ |
| `V0` | `float` | Initial variance $V_0$ |
| `H` | `float` | Hurst exponent $H \in (-\tfrac{1}{2}, \tfrac{1}{2}]$; $H = \tfrac{1}{2}$ is classical Heston |

### `RoughHeston(param, riskfree, base_solution="auto", ...)`

| Argument | Description |
|----------|-------------|
| `param` | `RoughHestonParam` instance |
| `riskfree` | Continuously compounded risk-free rate $r$ |
| `base_solution` | Riccati solver: `"auto"`, `"root_pade"`, `"exact_heston"`, `"pade"`, `"direct_riccati"` |
| `pade_order` | `"22"`, `"33"`, or `"44"` (only for `"pade"`) |
| `root_pade_degree` | Padé numerator degree $m$ (default 7) |

### `model.eur_call_put(K, maturity, ...)`

| Argument | Default | Description |
|----------|---------|-------------|
| `K` | — | Strike(s), scalar or array |
| `maturity` | — | Option maturity $T > 0$ |
| `S_0` | `1.0` | Initial spot $S_0$ |
| `implied_vol` | `False` | Return Black–Scholes implied vols $\sigma_\text{BS}$ |
| `payoff_selection` | `"otm"` | `"otm"` (calls for $K \ge F$, puts otherwise) or `"as_requested"` |
| `expansion_order` | `0` | Taylor order $N$ in $H$ |
| `H` | `None` | Target $H$ (scalar or array; `None` uses `param.H`) |
| `L` | `None` | Fourier truncation $L$ (`None` → heuristic) |
| `integration` | `"panel"` | `"panel"` (fixed $L$) or `"adaptive_panel"` (auto-select $L$) |
| `time_steps` | `1000` | Time-grid nodes for the expansion Volterra solve |
| `R` | `1.2` | Fourier contour height ($R = 0.5$ selects the Lewis contour) |
| `m_cheb` | `16` | Chebyshev nodes per Fourier panel |
| `adaptive_tol` | `1e-4` | Max implied-vol change threshold for adaptive convergence |

## Roadmap

The following extensions are planned:

- **Further European payoffs** — digitals, spreads, variance swaps.
- **Path-dependent options** — barriers, Asians, and lookbacks.
- **Rough Bergomi model.**
- **American options.**

## References

- El Euch, O. & Rosenbaum, M. (2019). *The characteristic function of rough Heston models.* Mathematical Finance, 29(1), 3–38. [doi:10.1111/mafi.12173](https://doi.org/10.1111/mafi.12173)
- Gatheral, J., Jaisson, T. & Rosenbaum, M. (2018). *Volatility is rough.* Quantitative Finance, 18(6), 933–949. [doi:10.1080/14697688.2017.1393551](https://doi.org/10.1080/14697688.2017.1393551)
- Diethelm, K., Ford, N. J. & Freed, A. D. (2002). *A predictor-corrector approach for the numerical solution of fractional differential equations.* Nonlinear Dynamics, 29, 3–22. [doi:10.1023/A:1016592219341](https://doi.org/10.1023/A:1016592219341) — Adams–PECE solver.
- Garrappa, R. (2018). *Numerical solution of fractional differential equations: A survey and a software tutorial.* Mathematics, 6(2), 16. [doi:10.3390/math6020016](https://doi.org/10.3390/math6020016) — implicit trapezoidal product-integration rule.
- Gatheral, J. & Radoičić, R. (2019). *Rational approximation of the rough Heston solution.* International Journal of Theoretical and Applied Finance, 22(3), 1950010. [doi:10.1142/S0219024919500109](https://doi.org/10.1142/S0219024919500109)
- Gatheral, J. & Radoičić, R. (2024). *A generalization of the rational rough Heston approximation.* Quantitative Finance, 24(2), 329–335. [doi:10.1080/14697688.2024.2302055](https://doi.org/10.1080/14697688.2024.2302055)
- Hager, P. P. & Kreher, D. (2026). *Expanding the rough Heston model in $H$.* Working paper; preprint link forthcoming.