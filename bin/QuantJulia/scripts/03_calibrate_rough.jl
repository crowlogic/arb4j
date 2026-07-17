# Rough vs classical Heston on the same SPX chain — the head-to-head.
# Both models are calibrated on the IDENTICAL quote set with the identical
# vega-weighted loss and LBFGS/ForwardDiff, then evaluated on the full chain.
#     julia --project=. scripts/03_calibrate_rough.jl

using QuantJulia
using Dates, Printf

const ROOT = joinpath(@__DIR__, "..")

function build_calibration_set(chain)
    # Same maturity ladder as scripts/02; strikes additionally windowed to
    # |log(K/F)| ≤ 5·iv_atm·√T (numerically meaningful moneyness — far-wing
    # microprices carry ~no vega and strain the Fourier quadrature).
    targets = [7, 14, 30, 45, 60, 90, 120, 180, 270, 365, 545, 730] ./ 365
    picked = unique(map(t -> argmin(e -> abs(e.T - t), chain.expiries), targets))
    cal = eltype(chain.quotes)[]
    for e in picked
        qs = filter(q -> q.expiry == e.expiry, chain.quotes)
        atm = qs[argmin([abs(log(q.K / e.F)) for q in qs])]
        win = 5 * atm.iv * sqrt(e.T)
        qs = sort!(filter(q -> abs(log(q.K / e.F)) <= win, qs); by = q -> q.K)
        step = max(1, length(qs) ÷ 15)
        append!(cal, qs[1:step:end])
    end
    return cal
end

# Per-expiry IV RMSE of a model over the full chain. `pricer(g)` returns call
# prices for group g (call-equivalent mids are compared, vega-normalized).
function full_chain_table(groups, pricer)
    rows = NamedTuple[]
    tot_se = 0.0; tot_n = 0
    for g in groups
        cs = pricer(g)
        errs = (cs .- g.cmids) ./ g.vegas
        tot_se += sum(abs2, errs); tot_n += length(errs)
        push!(rows, (T = g.T, n = length(errs),
                     rmse = sqrt(sum(abs2, errs) / length(errs)),
                     maxerr = maximum(abs, errs)))
    end
    return rows, sqrt(tot_se / tot_n)
end

function main()
    raw = read_cboe(joinpath(ROOT, "data", "spx_quotedata.csv"))
    chain = prepare_chain(raw; valuation_date = Date(2026, 7, 2))
    S = chain.spot
    cal = build_calibration_set(chain)
    groups_all = group_quotes(chain.quotes)
    @printf("Calibration set: %d quotes; evaluation set: %d quotes / %d expiries\n\n",
            length(cal), length(chain.quotes), length(groups_all))

    # --- classical, same set --------------------------------------------------
    t0 = time()
    resc = calibrate_heston(cal, S; p0 = HestonParams(2.0, 0.04, 1.0, -0.7, 0.04))
    tc = time() - t0
    pc = resc.params
    @printf("CLASSICAL  converged=%s iters=%d wall=%.0fs  cal-RMSE=%.1f bps\n",
            resc.converged, resc.iterations, tc, 1e4 * resc.rmse)
    @printf("  κ=%.4f θ=%.4f ξ=%.4f ρ=%.4f v0=%.4f\n\n", pc.κ, pc.θ, pc.ξ, pc.ρ, pc.v0)

    # --- rough, same set ------------------------------------------------------
    t0 = time()
    resr = calibrate_rough_heston(cal;
        p0 = RoughHestonParams(1.5, 0.04, 0.35, -0.65, 0.010, 0.12), maxiter = 80, N = 96)
    tr = time() - t0
    pr = resr.params
    @printf("ROUGH      converged=%s iters=%d wall=%.0fs  cal-RMSE=%.1f bps\n",
            resr.converged, resr.iterations, tr, 1e4 * resr.rmse)
    @printf("  κ=%.4f θ=%.4f ξ=%.4f ρ=%.4f v0=%.4f  H=%.4f  (α=%.4f)\n\n",
            pr.κ, pr.θ, pr.ξ, pr.ρ, pr.v0, pr.H, pr.H + 0.5)

    # --- full-chain evaluation, same protocol for both ------------------------
    Neval = 192
    rows_c, all_c = full_chain_table(groups_all,
        g -> batch_call_prices(u -> heston_cf(u, g.T, pc), g.F, g.disc, g.Ks, g.T;
                               iv_hint = g.iv_atm))
    t0 = time()
    rows_r, all_r = full_chain_table(groups_all,
        g -> batch_call_prices(make_rough_cf(g.T, pr; N = Neval), g.F, g.disc, g.Ks, g.T;
                               iv_hint = g.iv_atm))
    teval = time() - t0

    println("Full-chain IV RMSE by expiry (bps):")
    @printf("  %7s %5s %10s %10s %9s\n", "T(yr)", "n", "classical", "rough", "Δ")
    for (rc, rr) in zip(rows_c, rows_r)
        @printf("  %7.4f %5d %10.1f %10.1f %+9.1f\n",
                rc.T, rc.n, 1e4 * rc.rmse, 1e4 * rr.rmse, 1e4 * (rr.rmse - rc.rmse))
    end
    @printf("  %7s %5d %10.1f %10.1f\n\n", "ALL", sum(r -> r.n, rows_c), 1e4 * all_c, 1e4 * all_r)

    # --- ATM skew term structure ----------------------------------------------
    skews = NamedTuple[]
    for g in groups_all
        win = max(0.02, 1.5 * g.iv_atm * sqrt(g.T))
        sel = [i for i in eachindex(g.Ks) if abs(log(g.Ks[i] / g.F)) <= win]
        length(sel) < 4 && continue
        ms = [log(g.Ks[i] / g.F) for i in sel]
        # market ivs from call-equivalent mids
        ivm = [implied_vol(g.cmids[i], S, g.Ks[i], g.r, g.q, g.T) for i in sel]
        _, b_mkt = QuantJulia._lsq_line(ms, ivm)
        function modskew(pricer)
            Ks2 = (g.F * exp(-0.01), g.F * exp(0.01))
            cs = pricer(Ks2)
            (implied_vol(cs[2], S, Ks2[2], g.r, g.q, g.T) -
             implied_vol(cs[1], S, Ks2[1], g.r, g.q, g.T)) / 0.02
        end
        sk_c = modskew(Ks2 -> batch_call_prices(u -> heston_cf(u, g.T, pc), g.F, g.disc, Ks2, g.T; iv_hint = g.iv_atm))
        sk_r = modskew(Ks2 -> batch_call_prices(make_rough_cf(g.T, pr; N = Neval), g.F, g.disc, Ks2, g.T; iv_hint = g.iv_atm))
        push!(skews, (T = g.T, mkt = b_mkt, classical = sk_c, rough = sk_r))
    end

    # --- solver convergence record (for the writeup) ---------------------------
    conv = NamedTuple[]
    let p = RoughHestonParams(pr.κ, pr.θ, pr.ξ, pr.ρ, pr.v0, pr.H), T = 1.0, u = 5.0
        ref = rough_heston_cf(u, T, p; N = 4096)
        for n in (64, 128, 256, 512, 1024)
            push!(conv, (N = n, abserr = abs(rough_heston_cf(u, T, p; N = n) - ref)))
        end
    end

    # --- save -------------------------------------------------------------------
    open(joinpath(ROOT, "results", "rough_fit.csv"), "w") do io
        println(io, "key,value")
        for (k, v) in ("kappa" => pr.κ, "theta" => pr.θ, "xi" => pr.ξ, "rho" => pr.ρ,
                       "v0" => pr.v0, "H" => pr.H,
                       "rmse_iv_calset" => resr.rmse, "rmse_iv_fullchain" => all_r,
                       "classical_same_set_kappa" => pc.κ, "classical_same_set_theta" => pc.θ,
                       "classical_same_set_xi" => pc.ξ, "classical_same_set_rho" => pc.ρ,
                       "classical_same_set_v0" => pc.v0,
                       "classical_rmse_calset" => resc.rmse, "classical_rmse_fullchain" => all_c,
                       "n_calibration" => length(cal), "n_fullchain" => sum(r -> r.n, rows_c),
                       "rough_iterations" => resr.iterations, "rough_wall_seconds" => tr,
                       "classical_wall_seconds" => tc, "eval_wall_seconds" => teval,
                       "N_solver_calibration" => 96, "N_solver_evaluation" => Neval)
            println(io, k, ",", v)
        end
    end
    open(joinpath(ROOT, "results", "model_comparison.csv"), "w") do io
        println(io, "T,n,rmse_classical,rmse_rough,maxerr_classical,maxerr_rough")
        for (rc, rr) in zip(rows_c, rows_r)
            println(io, join((rc.T, rc.n, rc.rmse, rr.rmse, rc.maxerr, rr.maxerr), ","))
        end
    end
    open(joinpath(ROOT, "results", "skew_term_structure.csv"), "w") do io
        println(io, "T,skew_market,skew_classical,skew_rough")
        for s in skews
            println(io, join((s.T, s.mkt, s.classical, s.rough), ","))
        end
    end
    open(joinpath(ROOT, "results", "convergence.csv"), "w") do io
        println(io, "N,abserr")
        for c in conv
            println(io, c.N, ",", c.abserr)
        end
    end
    println("Saved results/{rough_fit,model_comparison,skew_term_structure,convergence}.csv")
end

main()
