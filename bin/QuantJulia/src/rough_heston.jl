# =============================================================================
# Rough Heston characteristic function (El Euch–Rosenbaum)  (Stage 7)
# =============================================================================
# CONVENTION — matches src/heston.jl exactly: this returns ψ(u) = E[e^{iu·X_T}]
# for the de-drifted log return X_T = log(S_T/S_0) − (r−q)T, i.e. the El
# Euch–Rosenbaum L(a,T) at r = 0. Mapping to their notation: a = u, and
#
#   ψ(u) = exp( κθ · I¹h(u,T) + v0 · I^{1−α}h(u,T) ),   α = H + 1/2,
#   D^α h(u,·) = F(u, h),  h(u,0) = 0,
#   F(u, x) = −(u² + iu)/2 + (iuρξ − κ)x + (ξ²/2)x²
#
# — the SAME quadratic F as the classical Heston Riccati; only the time
# derivative is fractional. At α = 1 (H = 1/2): I¹h is C(T)/κθ and I⁰h = h(T),
# so ψ collapses to the classical little-trap CF exactly — the hard test gate.
# The martingale identity ψ(−i) = 1 holds EXACTLY here for every H: at u = −i
# the constant term of F vanishes and h ≡ 0.
#
# Cost: one O(N²) Adams solve per (u, T, params). The pricer needs ψ at both
# u and u − i across a quadrature grid; use `make_rough_cf` so the power
# tables and integral weights (which depend only on (α, T, N)) are built once
# and shared by every node.
# =============================================================================

"""
    RoughHestonParams(κ, θ, ξ, ρ, v0, H)

Classical Heston parameters plus the Hurst exponent H ∈ (0, 1/2).
H = 1/2 is classical Heston. Type-parametric for ForwardDiff.
"""
struct RoughHestonParams{T<:Real}
    κ::T
    θ::T
    ξ::T
    ρ::T
    v0::T
    H::T
end
RoughHestonParams(κ, θ, ξ, ρ, v0, H) = RoughHestonParams(promote(κ, θ, ξ, ρ, v0, H)...)

"""
    make_rough_cf(T, p::RoughHestonParams; N=128)

Return the characteristic function `u -> ψ(u)` with all (α, T, N)-dependent
tables precomputed — use this when evaluating many `u` for one (T, params),
e.g. across a quadrature grid.
"""
function make_rough_cf(T, p::RoughHestonParams; N::Int = 128)
    κ, θ, ξ, ρ, v0, H = p.κ, p.θ, p.ξ, p.ρ, p.v0, p.H
    α = H + one(H) / 2
    tbl = _adams_tables(α, T, N)
    cI1, wI1 = _frac_end_weights(one(α), tbl.Δ, N)     # I¹ quadrature (c, w)
    cIα, wIα = _frac_end_weights(1 - α, tbl.Δ, N)      # I^{1−α} quadrature
    c2 = ξ^2 / 2
    return function (u)
        a = u
        c0 = -(a^2 + im * a) / 2
        c1 = im * a * ρ * ξ - κ
        h = _riccati_solve(c0, c1, c2, tbl)
        I1 = zero(h[1]) ; Iα = zero(h[1])
        @inbounds for j in eachindex(h)
            I1 += wI1[j] * h[j]
            Iα += wIα[j] * h[j]
        end
        return exp(κ * θ * (cI1 * I1) + v0 * (cIα * Iα))
    end
end

"""
    rough_heston_cf(u, T, p::RoughHestonParams; N=128)

One-shot ψ(u). For many `u` at fixed (T, p) prefer `make_rough_cf`.
"""
rough_heston_cf(u, T, p::RoughHestonParams; N::Int = 128) = make_rough_cf(T, p; N)(u)
