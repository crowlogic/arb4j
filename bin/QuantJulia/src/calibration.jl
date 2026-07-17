# =============================================================================
# Heston calibration  (Stage 4/5)
# =============================================================================
# Loss: vega-weighted price residuals,
#     loss(p) = mean_i [ (C_model_i(p) − mid_i) / vega_i ]²
# Since dC = vega·dσ to first order, (ΔC)/vega ≈ Δσ — this IS the implied-vol
# RMSE, without pushing AD through the iterative inverter on every objective
# call (the implicit-function shortcut dσ/dC = 1/vega, applied at the loss
# level). vega_i is evaluated once at the MARKET iv and held constant.
#
# Bounds via smooth reparametrization, not box constraints:
#     κ, θ, ξ, v0 = exp(x)   (positive),   ρ = tanh(x)  (−1, 1)
# so the optimizer runs unconstrained LBFGS and ForwardDiff differentiates
# straight through the transform. This same shape gains H = 0.5·logistic(x)
# when rough Heston arrives.
#
# The Feller condition 2κθ ≥ ξ² is deliberately NOT enforced: index surfaces
# routinely calibrate to Feller-violating parameters; we report it instead.
# =============================================================================

using Optim
using ForwardDiff

_pack(p::HestonParams) = [log(p.κ), log(p.θ), log(p.ξ), atanh(p.ρ), log(p.v0)]
_unpack(x) = HestonParams(exp(x[1]), exp(x[2]), exp(x[3]), tanh(x[4]), exp(x[5]))

"""
    heston_loss(x, quotes, S; price_rtol=1e-7)

Mean squared vega-normalized price residual (≈ mean squared IV error) at
transformed parameter vector `x`. `quotes` need fields
`(T, K, r, q, side, mid, vega)` — `prepare_chain` output qualifies.
Type-generic in `x` so ForwardDiff Duals flow through.
"""
function heston_loss(x, quotes, S; price_rtol = 1e-7)
    p = _unpack(x)
    s = zero(eltype(x))
    for qt in quotes
        c = heston_price(S, qt.K, qt.r, qt.q, p, qt.T;
                         call = qt.side === :call, rtol = price_rtol)
        s += ((c - qt.mid) / qt.vega)^2
    end
    return s / length(quotes)
end

"""
    calibrate_heston(quotes, S; p0=HestonParams(2.0, 0.04, 0.5, -0.5, 0.04),
                     maxiter=300, price_rtol=1e-7)

Fit classical Heston to a prepared chain by LBFGS with ForwardDiff gradients.
Returns `(params, rmse, converged, iterations)`; `rmse` is in implied-vol
units (multiply by 1e4 for bps).
"""
function calibrate_heston(quotes, S;
                          p0::HestonParams = HestonParams(2.0, 0.04, 0.5, -0.5, 0.04),
                          maxiter::Int = 300, price_rtol = 1e-7)
    isempty(quotes) && throw(ArgumentError("calibrate_heston: empty quote set"))
    f(x) = heston_loss(x, quotes, S; price_rtol = price_rtol)
    x0 = _pack(p0)
    od = OnceDifferentiable(f, x0; autodiff = :forward)
    res = optimize(od, x0, LBFGS(),
                   Optim.Options(iterations = maxiter, g_tol = 1e-9))
    return (params = _unpack(Optim.minimizer(res)),
            rmse = sqrt(Optim.minimum(res)),
            converged = Optim.converged(res),
            iterations = Optim.iterations(res))
end

# ---------------------------------------------------------------------------
# Rough Heston calibration (Stage 8): same loss philosophy, batch pricing.
# H ∈ (0.01, 0.49) via a scaled logistic — same smooth-reparametrization
# pattern as the other bounds, AD flows straight through.
# ---------------------------------------------------------------------------

_logistic(z) = 1 / (1 + exp(-z))
_logit(p) = log(p / (1 - p))

_pack_rough(p::RoughHestonParams) =
    [log(p.κ), log(p.θ), log(p.ξ), atanh(p.ρ), log(p.v0), _logit((p.H - 0.01) / 0.48)]
_unpack_rough(x) = RoughHestonParams(exp(x[1]), exp(x[2]), exp(x[3]), tanh(x[4]),
                                     exp(x[5]), 0.01 + 0.48 * _logistic(x[6]))

"""
    group_quotes(quotes)

Group `prepare_chain`-style quotes by expiry for batch pricing. Put mids are
converted to call-equivalent mids via exact parity (`C = P + disc·(F − K)`;
vega is identical either side). Returns one NamedTuple per expiry with
`(T, F, r, q, disc, iv_atm, Ks, cmids, vegas)`.
"""
function group_quotes(quotes)
    byT = Dict{Float64,Vector{Int}}()
    for (i, qt) in enumerate(quotes)
        push!(get!(byT, qt.T, Int[]), i)
    end
    groups = @NamedTuple{T::Float64, F::Float64, r::Float64, q::Float64,
                         disc::Float64, iv_atm::Float64, Ks::Vector{Float64},
                         cmids::Vector{Float64}, vegas::Vector{Float64}}[]
    for T in sort!(collect(keys(byT)))
        idx = byT[T]
        q1 = quotes[idx[1]]
        disc = exp(-q1.r * T)
        Ks = Float64[]; cmids = Float64[]; vegas = Float64[]
        for i in idx
            qt = quotes[i]
            push!(Ks, qt.K)
            push!(cmids, qt.side === :call ? qt.mid : qt.mid + disc * (qt.F - qt.K))
            push!(vegas, qt.vega)
        end
        atm = quotes[idx[argmin([abs(log(quotes[i].K / q1.F)) for i in idx])]]
        push!(groups, (; T, F = q1.F, r = q1.r, q = q1.q, disc,
                       iv_atm = atm.iv, Ks, cmids, vegas))
    end
    return groups
end

"""
    rough_heston_loss(x, groups; N=96)

Mean squared vega-normalized residual for rough Heston at transformed
parameters `x`, batch-priced per expiry group.
"""
function rough_heston_loss(x, groups; N::Int = 96)
    p = _unpack_rough(x)
    s = zero(eltype(x)); n = 0
    for g in groups
        ψ = make_rough_cf(g.T, p; N = N)
        cs = batch_call_prices(ψ, g.F, g.disc, g.Ks, g.T; iv_hint = g.iv_atm)
        @inbounds for i in eachindex(cs)
            s += ((cs[i] - g.cmids[i]) / g.vegas[i])^2
            n += 1
        end
    end
    return s / n
end

"""
    calibrate_rough_heston(quotes; p0=RoughHestonParams(1.5,0.05,0.35,-0.65,0.011,0.12),
                           maxiter=60, N=96)

Fit rough Heston (6 parameters incl. H) to a prepared chain by LBFGS with
ForwardDiff gradients through the fractional solver. Same conventions and
return shape as `calibrate_heston`.
"""
function calibrate_rough_heston(quotes;
                                p0::RoughHestonParams = RoughHestonParams(1.5, 0.05, 0.35, -0.65, 0.011, 0.12),
                                maxiter::Int = 60, N::Int = 96)
    isempty(quotes) && throw(ArgumentError("calibrate_rough_heston: empty quote set"))
    groups = group_quotes(quotes)
    f(x) = rough_heston_loss(x, groups; N = N)
    x0 = _pack_rough(p0)
    od = OnceDifferentiable(f, x0; autodiff = :forward)
    res = optimize(od, x0, LBFGS(),
                   Optim.Options(iterations = maxiter, g_tol = 1e-8))
    return (params = _unpack_rough(Optim.minimizer(res)),
            rmse = sqrt(Optim.minimum(res)),
            converged = Optim.converged(res),
            iterations = Optim.iterations(res))
end
