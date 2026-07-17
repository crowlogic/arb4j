# =============================================================================
# Model-agnostic Fourier pricer — Gil-Pelaez inversion  (Stage 3)
# =============================================================================
# This file prices from *a characteristic function*, not from a model. That is
# the one binding constraint the rough-Heston spec places on this stage: when
# rough Heston arrives, it plugs in as `u -> rough_heston_cf(u, T, p)` and this
# file does not change.
#
# Input convention (matches src/heston.jl): ψ(u) = E[e^{iuX}] with
# X = log(S_T/F) the de-drifted log return, ψ(−i) = 1 (martingale).
# With m = log(F/K):
#   P₂ = 1/2 + (1/π) ∫₀^∞ Re[ e^{ium} ψ(u)   / (iu) ] du   — P(S_T > K)
#   P₁ = 1/2 + (1/π) ∫₀^∞ Re[ e^{ium} ψ(u−i) / (iu) ] du   — same probability
#                                                             under the stock
#                                                             numeraire
#   call = e^{−rT} (F·P₁ − K·P₂)
# The u ↦ u−i shift is the same measure change that separates d₁ from d₂ in
# Black-Scholes, one abstraction level up.
#
# Both integrands have finite u→0 limits (the 1/(iu) pole is purely imaginary
# and Re[·] kills it); quadgk's Gauss-Kronrod nodes are interior, so u = 0 is
# never evaluated. Quadrature is adaptive over (0, ∞) — no manual truncation
# to tune, at the cost of adaptivity; if calibration profiling later shows the
# pricer dominating, swap in fixed Gauss-Legendre nodes (AD-safe either way,
# since ForwardDiff Duals ride through the integrand evaluations).
# =============================================================================

using QuadGK: quadgk

"""
    price_from_cf(ψ, S, K, r, q, T; call=true, rtol=1e-9)

European option price by Gil-Pelaez inversion of the characteristic function
`ψ(u) = E[e^{iuX}]`, X = log(S_T/F), ψ(−i) = 1. `ψ` must accept complex
arguments (it is evaluated at u − i). Model-independent by construction.

The put comes via parity, P = C − e^{−rT}(F − K), which is exact here because
both legs share the same two integrals.
"""
function price_from_cf(ψ, S, K, r, q, T; call::Bool = true, rtol = 1e-9)
    (S > 0 && K > 0 && T > 0) || throw(DomainError((S, K, T), "need S, K, T > 0"))
    F = S * exp((r - q) * T)
    m = log(F / K)
    disc = exp(-r * T)

    integrand2(u) = real(exp(im * u * m) * ψ(u) / (im * u))
    integrand1(u) = real(exp(im * u * m) * ψ(u - im) / (im * u))

    I1, _ = quadgk(integrand1, 0.0, Inf; rtol = rtol)
    I2, _ = quadgk(integrand2, 0.0, Inf; rtol = rtol)
    P1 = 1 / 2 + I1 / π
    P2 = 1 / 2 + I2 / π

    c = disc * (F * P1 - K * P2)
    return call ? c : c - disc * (F - K)
end

"""
    heston_price(S, K, r, q, p::HestonParams, T; call=true, rtol=1e-9)

Classical Heston price: `heston_cf` plugged into `price_from_cf`. The params
argument sits where σ sits in `bs_price` — same call shape, model swapped.
"""
heston_price(S, K, r, q, p::HestonParams, T; call::Bool = true, rtol = 1e-9) =
    price_from_cf(u -> heston_cf(u, T, p), S, K, r, q, T; call = call, rtol = rtol)

# -----------------------------------------------------------------------------
# Batch pricer on fixed Gauss-Legendre nodes.
#
# Key economics: ψ(u) does not depend on the strike, so ALL strikes of one
# expiry share the same 2n CF evaluations (at u and u−i). For rough Heston,
# where each CF evaluation is an O(N²) fractional-ODE solve, this converts
# "O(N²) per option" into "O(N²) per expiry" — the difference between an
# intractable and a minutes-scale calibration. Fixed nodes are also the
# AD-cleanest quadrature: the node set never depends on the parameters, so
# ForwardDiff differentiates a smooth deterministic sum.
#
# Node budget: u_max stretches with 1/(iv√T) (CF decay scale), node count with
# u_max·max|log-moneyness| (integrand oscillation e^{ium}). `iv_hint` should
# be a market-level vol for the expiry — it steers accuracy only, never the
# model value being differentiated.
# -----------------------------------------------------------------------------

using LinearAlgebra: SymTridiagonal, eigen

const _GL_CACHE = Dict{Int,NTuple{2,Vector{Float64}}}()
function _gauss_legendre(n::Int)
    get!(_GL_CACHE, n) do
        β = [j / sqrt(4.0 * j^2 - 1) for j in 1:n-1]
        E = eigen(SymTridiagonal(zeros(n), β))          # Golub-Welsch
        (E.values, 2 .* abs2.(E.vectors[1, :]))
    end
end

"""
    batch_call_prices(ψ, F, disc, Ks, T; iv_hint=0.2, reltail=12.0, osc_pts=8.0,
                      min_nodes=64, max_nodes=1024)

Gil-Pelaez call prices for ALL strikes `Ks` of one expiry from shared CF
evaluations on fixed Gauss-Legendre nodes. `ψ` is the de-drifted-log-return
CF (must accept complex arguments); `F` the forward, `disc = e^{−rT}`.
Puts follow from exact parity: `P = C − disc·(F − K)`.
"""
function batch_call_prices(ψ, F, disc, Ks, T; iv_hint = 0.2, reltail = 12.0,
                           osc_pts = 8.0, min_nodes = 96, max_nodes = 1024)
    mmax = max(maximum(K -> abs(log(F / K)), Ks), 0.05)
    u_max = max(150.0, reltail / max(iv_hint * sqrt(T), 1e-4))
    n = clamp(ceil(Int, osc_pts * u_max * mmax / (2π)) + 96, min_nodes, max_nodes)
    x, w = _gauss_legendre(n)
    us = @. 0.5 * u_max * (x + 1)
    ws = @. 0.5 * u_max * w
    ψ2 = [ψ(u) for u in us]
    ψ1 = [ψ(u - im) for u in us]
    R = typeof(real(ψ1[1]) * one(F))
    return map(Ks) do K
        m = log(F / K)
        s1 = zero(R); s2 = zero(R)
        @inbounds for i in eachindex(us)
            ph = exp(im * us[i] * m) / (im * us[i])
            s1 += ws[i] * real(ph * ψ1[i])
            s2 += ws[i] * real(ph * ψ2[i])
        end
        disc * (F * (1 / 2 + s1 / π) - K * (1 / 2 + s2 / π))
    end
end
