# Calibrate classical Heston to the prepared SPX chain and save the fit.
# Run from the repo root (after scripts/01_prepare_data.jl's data exists):
#     julia --project=. scripts/02_calibrate.jl

using QuantJulia
using Dates, Printf

const ROOT = joinpath(@__DIR__, "..")

raw = read_cboe(joinpath(ROOT, "data", "spx_quotedata.csv"))
chain = prepare_chain(raw; valuation_date = Date(2026, 7, 2))
S = chain.spot

# --- Thin the surface for calibration -----------------------------------
# The full chain is thousands of quotes; the classical-Heston information in
# it is carried by a modest spread of maturities and strikes. Pick expiries
# nearest a target ladder and at most `max_k` evenly-spaced strikes each.
# (The FULL processed chain remains the evaluation set for honest reporting.)
targets = [7, 14, 30, 45, 60, 90, 120, 180, 270, 365, 545, 730] ./ 365
picked = unique(map(t -> argmin(e -> abs(e.T - t), chain.expiries), targets))
max_k = 15
cal = eltype(chain.quotes)[]
for e in picked
    qs = sort!(filter(q -> q.expiry == e.expiry, chain.quotes); by = q -> q.K)
    step = max(1, length(qs) ÷ max_k)
    append!(cal, qs[1:step:end])
end
@printf("Calibration set: %d quotes over %d expiries (T = %.3f … %.3f)\n",
        length(cal), length(picked), minimum(q -> q.T, cal), maximum(q -> q.T, cal))

# --- Fit ------------------------------------------------------------------
t0 = time()
res = calibrate_heston(cal, S; p0 = HestonParams(2.0, 0.04, 1.0, -0.7, 0.04))
wall = time() - t0
p = res.params

@printf("\nConverged: %s in %d LBFGS iterations, %.1f s\n", res.converged, res.iterations, wall)
@printf("Calibration-set IV RMSE: %.1f bps\n", 1e4 * res.rmse)
println("\nFitted parameters:")
@printf("  κ  = %8.4f\n  θ  = %8.4f   (long-run vol %.1f%%)\n", p.κ, p.θ, 100sqrt(p.θ))
@printf("  ξ  = %8.4f\n  ρ  = %8.4f\n  v0 = %8.4f   (spot vol %.1f%%)\n", p.ξ, p.ρ, p.v0, 100sqrt(p.v0))
feller = 2p.κ * p.θ - p.ξ^2
@printf("  Feller 2κθ−ξ² = %.4f  (%s)\n", feller, feller >= 0 ? "satisfied" : "violated — common for index fits")

# --- Honest evaluation: IV RMSE per expiry on the FULL chain --------------
println("\nFull-chain fit by expiry (model vs market IV):")
@printf("  %-12s %7s %5s %10s %10s\n", "expiry", "T(yr)", "n", "rmse(bps)", "max|err|(bps)")
tot_se, tot_n = 0.0, 0
for e in chain.expiries
    qs = filter(q -> q.expiry == e.expiry, chain.quotes)
    errs = Float64[]
    for qt in qs
        c = heston_price(S, qt.K, qt.r, qt.q, p, qt.T; call = qt.side === :call)
        push!(errs, (c - qt.mid) / qt.vega)        # ≈ iv error
    end
    global tot_se += sum(abs2, errs); global tot_n += length(errs)
    @printf("  %-12s %7.4f %5d %10.1f %10.1f\n",
            e.expiry, e.T, length(qs), 1e4 * sqrt(sum(abs2, errs) / length(errs)),
            1e4 * maximum(abs, errs))
end
@printf("  %-12s %7s %5d %10.1f\n", "ALL", "", tot_n, 1e4 * sqrt(tot_se / tot_n))

# --- Save -----------------------------------------------------------------
mkpath(joinpath(ROOT, "results"))
open(joinpath(ROOT, "results", "classical_fit.csv"), "w") do io
    println(io, "key,value")
    for (k, v) in ("kappa" => p.κ, "theta" => p.θ, "xi" => p.ξ, "rho" => p.ρ,
                   "v0" => p.v0, "rmse_iv_calset" => res.rmse,
                   "rmse_iv_fullchain" => sqrt(tot_se / tot_n),
                   "n_calibration" => length(cal), "n_fullchain" => tot_n,
                   "lbfgs_iterations" => res.iterations, "wall_seconds" => wall,
                   "valuation_date" => Date(2026, 7, 2), "spot" => S)
        println(io, k, ",", v)
    end
end
println("\nSaved → results/classical_fit.csv")
