# =============================================================================
# Black-Scholes-Merton warm-up  (Stage 1) — price, Greeks, implied vol.
# =============================================================================
# Provenance: bodies handed off (mentor) under a Stage-1 override of the
# "user hand-writes the math" division of labor. Reconciled here against the
# test contract in test/test_blackscholes.jl. Two changes from the handed-off
# version, both to match the agreed convention:
#   1. keyword `is_call` -> `call`
#   2. added the continuous dividend/carry yield `q` (positional, after `r`)
#      and threaded it through every formula: d1 uses (r - q), the stock leg
#      and vega/delta carry e^{-qT}, and the no-arb bounds use S·e^{-qT}.
#
# Design constraint honored throughout: type-generic (no Float64 forcing) so a
# ForwardDiff.Dual flows through every function — hence `zero(...)`/`one(...)`
# neutral elements built from the promoted argument type, not `0.0` literals.
#
# `erf` is imported by the QuantJulia module (see QuantJulia.jl).
#
# Convention: S spot, K strike, r risk-free (cont. comp.), q dividend/carry
# yield, σ vol (annualized), T maturity (years), call::Bool.
# =============================================================================

# ---------------------------------------------------------------------------
# Standard normal CDF and PDF
# ---------------------------------------------------------------------------

"""
    normal_cdf(x)

Φ(x), via the error function: Φ(x) = (1 + erf(x/√2)) / 2.
`erf` has ForwardDiff rules, so Duals flow through.
"""
normal_cdf(x) = (1 + erf(x / sqrt(2 * one(x)))) / 2

"""
    normal_pdf(x)

φ(x) = exp(−x²/2) / √(2π).
"""
normal_pdf(x) = exp(-x^2 / 2) / sqrt(2 * one(x) * π)

# ---------------------------------------------------------------------------
# Black-Scholes-Merton price
# ---------------------------------------------------------------------------

"""
    bs_price(S, K, r, q, σ, T; call=true)

European option price under BSM with continuous carry yield q.

    d₁ = (log(S/K) + (r − q + σ²/2)·T) / (σ·√T),   d₂ = d₁ − σ·√T
    call = S·e^{−qT}·Φ(d₁) − K·e^{−rT}·Φ(d₂)

Degenerate limits are handled explicitly rather than letting d₁ hit 0/0:
  * T ≤ 0  → immediate intrinsic: max(S−K, 0) or max(K−S, 0).
  * σ ≤ 0  → deterministic world: discounted intrinsic on the forward
             F = S·e^{(r−q)T}, i.e. call = e^{−rT}·max(F − K, 0).
"""
function bs_price(S, K, r, q, σ, T; call::Bool = true)
    z = zero(S * K * r * q * σ * T)      # promoted-type zero (Dual-safe)

    if T <= 0
        return call ? max(S - K, z) : max(K - S, z)
    end
    if σ <= 0
        F = S * exp((r - q) * T)         # forward
        payoff = call ? max(F - K, z) : max(K - F, z)
        return exp(-r * T) * payoff
    end

    sqrtT = sqrt(T)
    d1 = (log(S / K) + (r - q + σ^2 / 2) * T) / (σ * sqrtT)
    d2 = d1 - σ * sqrtT
    Sq = S * exp(-q * T)
    Kr = K * exp(-r * T)

    if call
        return Sq * normal_cdf(d1) - Kr * normal_cdf(d2)
    else
        return Kr * normal_cdf(-d2) - Sq * normal_cdf(-d1)
    end
end

# ---------------------------------------------------------------------------
# Greeks (analytic)
# ---------------------------------------------------------------------------

"""
    bs_vega(S, K, r, q, σ, T)

∂Price/∂σ = S·e^{−qT}·φ(d₁)·√T.  Same for calls and puts: by parity C − P has
no σ-dependence, so ∂C/∂σ = ∂P/∂σ.

Vega → 0 both deep ITM and deep OTM (φ(d₁) → 0 as |d₁| → ∞) and as T → 0.
That decay is exactly what breaks naive Newton in `implied_vol`.
"""
function bs_vega(S, K, r, q, σ, T)
    z = zero(S * K * r * q * σ * T)
    (T <= 0 || σ <= 0) && return z
    d1 = (log(S / K) + (r - q + σ^2 / 2) * T) / (σ * sqrt(T))
    return S * exp(-q * T) * normal_pdf(d1) * sqrt(T)
end

"""
    bs_delta(S, K, r, q, σ, T; call=true)

∂Price/∂S.  Call: e^{−qT}·Φ(d₁).  Put: e^{−qT}·(Φ(d₁) − 1)  (by parity
∂C/∂S − ∂P/∂S = e^{−qT}).

Degenerate limits return the delta of the intrinsic payoff; the exact-ATM
boundary is assigned to the in-the-money side by convention here.
"""
function bs_delta(S, K, r, q, σ, T; call::Bool = true)
    o = one(S * K * r * q * σ * T)
    if T <= 0 || σ <= 0
        F = T <= 0 ? S : S * exp((r - q) * T)
        if call
            return F >= K ? o * exp(-q * T) : zero(o)
        else
            return F >= K ? zero(o) : -o * exp(-q * T)
        end
    end
    d1 = (log(S / K) + (r - q + σ^2 / 2) * T) / (σ * sqrt(T))
    disc_q = exp(-q * T)
    return call ? disc_q * normal_cdf(d1) : disc_q * (normal_cdf(d1) - 1)
end

# ---------------------------------------------------------------------------
# Implied volatility: safeguarded Newton (Newton inside a bisection bracket)
# ---------------------------------------------------------------------------

"""
    implied_vol(price, S, K, r, q, T; call=true, tol=1e-10, maxiter=200)

Invert BSM for σ given an observed `price`.

Method: Newton's method using the analytic vega, safeguarded by a maintained
bisection bracket [lo, hi]. Rationale:

  * Price is strictly increasing in σ (vega > 0 for σ, T > 0), so a valid
    bracket exists and bisection alone would already converge — slowly.
  * Newton is quadratically fast near the root but diverges where vega ≈ 0
    (deep OTM/ITM, short T): the objective is nearly flat there, so the
    Newton step  Δσ = (model − market)/vega  explodes.
  * Hybrid: take the Newton step only if it lands strictly inside the
    current bracket; otherwise bisect. Every iteration shrinks the bracket
    or Newton-converges, so the method is globally convergent and locally
    quadratic. (Same philosophy as Brent's method.)

Bounds (with carry yield q):
    call:  max(S·e^{−qT} − K·e^{−rT}, 0) ≤ C < S·e^{−qT}
    put:   max(K·e^{−rT} − S·e^{−qT}, 0) ≤ P < K·e^{−rT}
Prices outside these bounds have NO implied vol — that's an input error, not a
convergence failure, so we throw a DomainError. (At Stage 4 this becomes the
first data-quality filter: stale SPX quotes that violate these bounds land
here.) A price at (within `tol` of) the lower bound corresponds to σ = 0.
"""
function implied_vol(price, S, K, r, q, T;
                     call::Bool = true, tol = 1e-10, maxiter::Int = 200)
    T > 0 || throw(DomainError(T, "implied vol requires T > 0"))

    disc_r = exp(-r * T)
    disc_q = exp(-q * T)
    z = zero(price * S * K * disc_r * disc_q)
    Sq = S * disc_q
    Kr = K * disc_r
    lower = call ? max(Sq - Kr, z) : max(Kr - Sq, z)
    upper = call ? Sq : Kr

    if price < lower - tol || price >= upper
        throw(DomainError(price, "price violates no-arbitrage bounds " *
                                 "[$(lower), $(upper)) — no implied vol exists"))
    end
    price <= lower + tol && return z   # at the σ → 0 boundary

    # Bracket. σ = 1e-8 prices ≈ at the lower bound; hi grows until it
    # over-prices (5.0 ≡ 500% vol covers anything sane; expand defensively).
    lo = 1e-8 * one(z)
    hi = 5 * one(z)
    while bs_price(S, K, r, q, hi, T; call) < price && hi < 100
        hi *= 2
    end

    # Initial guess: Brenner–Subrahmanyam ATM approximation,
    # σ₀ ≈ √(2π/T) · price / (S·e^{−qT}), clamped into the bracket.
    σ = clamp(sqrt(2π / T) * price / Sq, lo, hi)

    for _ in 1:maxiter
        p = bs_price(S, K, r, q, σ, T; call)
        diff = p - price
        abs(diff) < tol && return σ

        # Maintain the bracket using monotonicity in σ.
        if diff > 0
            hi = σ
        else
            lo = σ
        end

        v = bs_vega(S, K, r, q, σ, T)
        if v > 1e-12
            σ_newton = σ - diff / v
            σ = (lo < σ_newton < hi) ? σ_newton : (lo + hi) / 2
        else
            σ = (lo + hi) / 2          # vega too flat: bisect
        end
    end

    error("implied_vol: no convergence after $maxiter iterations " *
          "(S=$S, K=$K, r=$r, q=$q, T=$T, price=$price)")
end
