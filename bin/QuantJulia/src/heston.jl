# =============================================================================
# Heston (1993) characteristic function — "little trap" form  (Stage 2)
# =============================================================================
# CONVENTION (the contract every later model must match):
#   heston_cf(u, T, p) returns ψ(u) = E[exp(iu·X_T)] where
#       X_T = log(S_T/S_0) − (r−q)T
#   is the de-drifted log return. Market inputs (S, r, q) never enter the model
#   CF; the Fourier pricer reattaches them via log S_T = log F + X_T with
#   F = S·e^{(r−q)T}. Two identities follow and are used as test gates:
#       ψ(0)  = 1                (normalization)
#       ψ(−i) = E[S_T]/F = 1     (martingale condition)
#   This matches El Euch–Rosenbaum's L(a,T) (CF of log(S_T/S_0) at r = 0), so
#   the rough extension will reuse the pricer unchanged.
#
# De-drifted risk-neutral dynamics:
#   dX = −(v/2) dt + √v dW₁,  dv = κ(θ−v) dt + ξ√v dW₂,  d⟨W₁,W₂⟩ = ρ dt
#
# WHY THE "LITTLE TRAP" FORM: Heston's original solution writes C(u,T) with
# log[(1−g₁e^{dT})/(1−g₁)], g₁ = (β+d)/(β−d). As T grows, that complex log's
# argument spirals across the negative real axis, the principal branch jumps by
# 2πi, and the CF develops spurious discontinuities in u — prices go silently
# wrong at long maturities. The algebraically identical rewrite below in terms
# of g₂ = 1/g₁ and e^{−dT} (Albrecher, Mayer, Schoutens & Tistaert 2007, "The
# Little Heston Trap") keeps the log's argument away from the cut, so the
# principal branch is continuous. Same function on paper; only one is
# float-safe. A continuity test at T = 10 guards this.
# =============================================================================

"""
    HestonParams(κ, θ, ξ, ρ, v0)

κ mean-reversion speed, θ long-run variance, ξ vol-of-vol, ρ spot-vol
correlation, v0 initial variance. Type-parametric (promoting constructor) so
`ForwardDiff.Dual` parameters flow through pricing and calibration.
"""
struct HestonParams{T<:Real}
    κ::T
    θ::T
    ξ::T
    ρ::T
    v0::T
end
HestonParams(κ, θ, ξ, ρ, v0) = HestonParams(promote(κ, θ, ξ, ρ, v0)...)

"""
    heston_cf(u, T, p::HestonParams)

ψ(u) = E[exp(iu·X_T)] for the de-drifted log return X_T (see the convention
block above). Accepts real or complex `u` (the pricer evaluates at u − i).

Requires ξ > 0; the ξ → 0 deterministic-variance limit is exercised in tests
at ξ = 1e-3 against its closed form rather than at ξ = 0 exactly.
"""
function heston_cf(u, T, p::HestonParams)
    κ, θ, ξ, ρ, v0 = p.κ, p.θ, p.ξ, p.ρ, p.v0
    β = κ - im * ρ * ξ * u
    d = sqrt(β^2 + ξ^2 * (im * u + u^2))
    rm = (β - d) / ξ^2                    # r₋: the decaying Riccati root
    g = (β - d) / (β + d)                 # g₂ of Albrecher et al. (not g₁!)
    e = exp(-d * T)
    D = rm * (1 - e) / (1 - g * e)
    C = κ * θ * (rm * T - (2 / ξ^2) * log((1 - g * e) / (1 - g)))
    return exp(C + v0 * D)
end
