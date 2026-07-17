# Two follow-up experiments after the whole-surface result (H → upper bound):
#   1. Model-free: fit |ATM skew| ~ c·T^(H−1/2) to the MARKET skew term
#      structure — what the data itself says about roughness, no model.
#   2. Short-end duel: calibrate BOTH models on T ≤ 0.16 only (where the
#      rough claim lives) and evaluate on all short-end quotes.
#     julia --project=. scripts/04_short_end_and_powerlaw.jl

using QuantJulia
using Dates, Printf

const ROOT = joinpath(@__DIR__, "..")

function powerlaw_H(rows; lo = 0.0, hi = Inf)
    sel = [r for r in rows if lo <= r.T <= hi]
    xs = [log(r.T) for r in sel]
    ys = [log(abs(r.skew)) for r in sel]
    _, b = QuantJulia._lsq_line(xs, ys)
    return b + 0.5, length(sel)
end

function main()
    raw = read_cboe(joinpath(ROOT, "data", "spx_quotedata.csv"))
    chain = prepare_chain(raw; valuation_date = Date(2026, 7, 2))
    S = chain.spot

    # ---- 1. market skew power law --------------------------------------------
    skewrows = NamedTuple[]
    open(joinpath(ROOT, "results", "skew_term_structure.csv")) do io
        readline(io)
        for line in eachline(io)
            f = split(line, ',')
            push!(skewrows, (T = parse(Float64, f[1]), skew = parse(Float64, f[2])))
        end
    end
    println("Market ATM-skew power law  |skew| ~ c·T^(H−1/2):")
    fits = NamedTuple[]
    for (name, lo, hi) in (("full 0.01–2.5y", 0.0, Inf), ("front T≤0.16", 0.0, 0.16),
                           ("belly 0.03–1.04", 0.03, 1.04), ("back T≥0.5", 0.5, Inf))
        H, npts = powerlaw_H(skewrows; lo, hi)
        @printf("  %-16s  H = %6.3f   (%d expiries)\n", name, H, npts)
        push!(fits, (window = name, H = H, n = npts))
    end

    # ---- 2. short-end calibration duel ----------------------------------------
    short_exp = [e for e in chain.expiries if e.T <= 0.16]
    cal = eltype(chain.quotes)[]
    for e in short_exp
        qs = filter(q -> q.expiry == e.expiry, chain.quotes)
        atm = qs[argmin([abs(log(q.K / e.F)) for q in qs])]
        win = 5 * atm.iv * sqrt(e.T)
        qs = sort!(filter(q -> abs(log(q.K / e.F)) <= win, qs); by = q -> q.K)
        step = max(1, length(qs) ÷ 12)
        append!(cal, qs[1:step:end])
    end
    @printf("\nShort-end set: %d expiries (T = %.3f…%.3f), %d calibration quotes\n",
            length(short_exp), short_exp[1].T, short_exp[end].T, length(cal))

    t0 = time()
    resc = calibrate_heston(cal, S; p0 = HestonParams(3.0, 0.03, 1.0, -0.7, 0.01))
    tc = time() - t0
    pc = resc.params
    @printf("CLASSICAL  converged=%s iters=%d wall=%.0fs cal-RMSE=%.1f bps\n",
            resc.converged, resc.iterations, tc, 1e4 * resc.rmse)
    @printf("  κ=%.4f θ=%.4f ξ=%.4f ρ=%.4f v0=%.4f\n", pc.κ, pc.θ, pc.ξ, pc.ρ, pc.v0)

    t0 = time()
    resr = calibrate_rough_heston(cal;
        p0 = RoughHestonParams(1.0, 0.03, 0.4, -0.65, 0.009, 0.12), maxiter = 80, N = 96)
    tr = time() - t0
    pr = resr.params
    @printf("ROUGH      converged=%s iters=%d wall=%.0fs cal-RMSE=%.1f bps\n",
            resr.converged, resr.iterations, tr, 1e4 * resr.rmse)
    @printf("  κ=%.4f θ=%.4f ξ=%.4f ρ=%.4f v0=%.4f  H=%.4f\n\n",
            pr.κ, pr.θ, pr.ξ, pr.ρ, pr.v0, pr.H)

    # evaluate on ALL short-end quotes
    groups = group_quotes(filter(q -> q.T <= 0.16, chain.quotes))
    println("Short-end full evaluation, IV RMSE by expiry (bps):")
    @printf("  %7s %5s %10s %10s\n", "T(yr)", "n", "classical", "rough")
    tot = zeros(2); totn = 0
    rows = NamedTuple[]
    for g in groups
        cs_c = batch_call_prices(u -> heston_cf(u, g.T, pc), g.F, g.disc, g.Ks, g.T; iv_hint = g.iv_atm)
        cs_r = batch_call_prices(make_rough_cf(g.T, pr; N = 192), g.F, g.disc, g.Ks, g.T; iv_hint = g.iv_atm)
        e_c = (cs_c .- g.cmids) ./ g.vegas
        e_r = (cs_r .- g.cmids) ./ g.vegas
        tot[1] += sum(abs2, e_c); tot[2] += sum(abs2, e_r); totn += length(e_c)
        rmse_c = sqrt(sum(abs2, e_c) / length(e_c)); rmse_r = sqrt(sum(abs2, e_r) / length(e_r))
        @printf("  %7.4f %5d %10.1f %10.1f\n", g.T, length(e_c), 1e4 * rmse_c, 1e4 * rmse_r)
        push!(rows, (T = g.T, n = length(e_c), rmse_classical = rmse_c, rmse_rough = rmse_r))
    end
    @printf("  %7s %5d %10.1f %10.1f\n", "ALL", totn, 1e4 * sqrt(tot[1] / totn), 1e4 * sqrt(tot[2] / totn))

    # ---- save ------------------------------------------------------------------
    open(joinpath(ROOT, "results", "skew_powerlaw.csv"), "w") do io
        println(io, "window,H,n_expiries")
        for f in fits
            println(io, f.window, ",", f.H, ",", f.n)
        end
    end
    open(joinpath(ROOT, "results", "short_end_fit.csv"), "w") do io
        println(io, "key,value")
        for (k, v) in ("classical_kappa" => pc.κ, "classical_theta" => pc.θ,
                       "classical_xi" => pc.ξ, "classical_rho" => pc.ρ, "classical_v0" => pc.v0,
                       "classical_rmse_cal" => resc.rmse,
                       "rough_kappa" => pr.κ, "rough_theta" => pr.θ, "rough_xi" => pr.ξ,
                       "rough_rho" => pr.ρ, "rough_v0" => pr.v0, "rough_H" => pr.H,
                       "rough_rmse_cal" => resr.rmse,
                       "rmse_eval_classical" => sqrt(tot[1] / totn),
                       "rmse_eval_rough" => sqrt(tot[2] / totn),
                       "n_cal" => length(cal), "n_eval" => totn,
                       "wall_classical" => tc, "wall_rough" => tr)
            println(io, k, ",", v)
        end
    end
    open(joinpath(ROOT, "results", "short_end_by_expiry.csv"), "w") do io
        println(io, "T,n,rmse_classical,rmse_rough")
        for r in rows
            println(io, join((r.T, r.n, r.rmse_classical, r.rmse_rough), ","))
        end
    end
    println("\nSaved results/{skew_powerlaw,short_end_fit,short_end_by_expiry}.csv")
end

main()
