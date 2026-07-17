# Spec gates for the rough Heston extension, in order. Gate 1 is the critical
# one: at H = 1/2 the whole rough pipeline (Adams solver → fractional
# integrals → CF assembly) must collapse onto the independently-implemented
# classical little-trap CF.

@testset "GATE 1 — α → 1 recovers classical Heston CF" begin
    for p in (HestonParams(2.0, 0.04, 0.5, -0.7, 0.04),
              HestonParams(1.0, 0.09, 0.3, -0.3, 0.02)),
        T in (0.5, 1.5), u in (0.5, 1.0, 2.0, 5.0)
        rp = RoughHestonParams(p.κ, p.θ, p.ξ, p.ρ, p.v0, 0.5)
        @test rough_heston_cf(u, T, rp; N = 1024) ≈ heston_cf(u, T, p) rtol = 1e-6
    end
end

@testset "rough CF — structural identities at H < 1/2" begin
    p = RoughHestonParams(2.0, 0.04, 0.5, -0.7, 0.04, 0.1)
    for T in (0.1, 1.0)
        @test rough_heston_cf(0.0, T, p; N = 64) ≈ 1
        # Martingale: at u = −i the Riccati source term vanishes ⇒ h ≡ 0 ⇒ ψ = 1,
        # exactly, for every H — a free consistency check on F's coefficients.
        @test rough_heston_cf(-1im, T, p; N = 64) ≈ 1 atol = 1e-12
        for u in (0.7, 3.0)
            ψ = rough_heston_cf(u, T, p; N = 256)
            @test abs(ψ) ≤ 1 + 1e-10
            @test rough_heston_cf(-u, T, p; N = 256) ≈ conj(ψ) rtol = 1e-10
        end
    end
end

@testset "GATE 2 — convergence in N at H = 0.1" begin
    p = RoughHestonParams(2.0, 0.04, 0.5, -0.7, 0.04, 0.1)
    T = 1.0
    for u in (1.0, 5.0)
        ref = rough_heston_cf(u, T, p; N = 4096)
        errs = [abs(rough_heston_cf(u, T, p; N = n) - ref) for n in (64, 128, 256, 512)]
        @test all(diff(errs) .< 0)                        # strictly shrinking
        orders = [log2(errs[i] / errs[i+1]) for i in 1:3]
        @info "Adams observed convergence order (u=$u)" orders
        @test minimum(orders) > 0.8                       # ≥ first order observed
    end
end

@testset "batch pricer matches adaptive quadrature (classical CF)" begin
    S, r, q = 100.0, 0.03, 0.01
    for T in (0.02, 0.25, 1.0)
        F = S * exp((r - q) * T)
        disc = exp(-r * T)
        band = 0.25 * max(sqrt(T), 0.3)
        Ks = F .* exp.((-band, -band / 2, 0.0, band / 2, band))
        cs = batch_call_prices(u -> heston_cf(u, T, P_STD), F, disc, Ks, T; iv_hint = 0.2)
        for (K, c) in zip(Ks, cs)
            @test c ≈ price_from_cf(u -> heston_cf(u, T, P_STD), S, K, r, q, T) rtol = 1e-5 atol = 1e-7
        end
    end
end

@testset "GATE 3 — pricing sanity at H = 0.1" begin
    # Strike range where prices are economically meaningful (≳ 0.1 on S=100).
    # The fractional solve's error grows ~u^1.5, leaving an ABSOLUTE price
    # noise floor ~1e-3·(S/100) at N=512 that would swamp microscopic
    # far-wing prices — documented in docs/rough_heston.md, not hidden by a
    # loose tolerance on a wider range.
    p = RoughHestonParams(2.0, 0.04, 0.5, -0.7, 0.04, 0.1)
    S, r, q, T = 100.0, 0.02, 0.0, 0.25
    F = S * exp((r - q) * T)
    disc = exp(-r * T)
    Ks = collect(80.0:5.0:115.0)                          # equally spaced
    cs = batch_call_prices(make_rough_cf(T, p; N = 512), F, disc, Ks, T; iv_hint = 0.2)
    @test all(diff(cs) .< 0)                              # decreasing in strike
    @test all(diff(diff(cs)) .> -1e-6)                    # convex in strike
    for (K, c) in zip(Ks, cs)
        @test max(disc * (F - K), 0.0) - 1e-6 ≤ c < disc * F
    end
    # ρ < 0 skew survives the fractional dynamics
    iv(K, c) = implied_vol(c, S, K, r, q, T)
    ivs = [iv(K, c) for (K, c) in zip(Ks, cs)]
    @test ivs[2] > ivs[5] > ivs[end-1]
end

@testset "GATE 4 — ForwardDiff gradient incl. H vs finite differences" begin
    S, r, q, T, K = 100.0, 0.02, 0.0, 0.25, 105.0
    F = S * exp((r - q) * T)
    disc = exp(-r * T)
    price6(x) = batch_call_prices(make_rough_cf(T, RoughHestonParams(x...); N = 64),
                                  F, disc, (K,), T; iv_hint = 0.2)[1]
    for H0 in (0.1, 0.3)
        x0 = [2.0, 0.04, 0.5, -0.7, 0.04, H0]
        g = ForwardDiff.gradient(price6, x0)
        for i in 1:6
            h = 1e-5 * max(1.0, abs(x0[i]))
            xp = copy(x0); xp[i] += h
            xm = copy(x0); xm[i] -= h
            fd = (price6(xp) - price6(xm)) / (2h)
            @test g[i] ≈ fd rtol = 1e-4 atol = 1e-8
        end
    end
end

@testset "GATE 5 — short-maturity ATM skew steeper for rough (H=0.1)" begin
    S, r, q = 100.0, 0.0, 0.0
    pc = HestonParams(2.0, 0.04, 0.5, -0.7, 0.04)
    pr = RoughHestonParams(2.0, 0.04, 0.5, -0.7, 0.04, 0.1)
    function atm_skew(cf, T)
        F = S; disc = 1.0
        Ks = (F * exp(-0.01), F * exp(0.01))
        cs = batch_call_prices(cf, F, disc, Ks, T; iv_hint = 0.2)
        (implied_vol(cs[2], S, Ks[2], r, q, T) - implied_vol(cs[1], S, Ks[1], r, q, T)) / 0.02
    end
    T = 0.02
    sk_c = atm_skew(u -> heston_cf(u, T, pc), T)
    sk_r = atm_skew(make_rough_cf(T, pr; N = 128), T)
    @test sk_r < 0 && sk_c < 0                            # both downward
    @test abs(sk_r) > 1.2 * abs(sk_c)                     # rough visibly steeper
    # ... and the gap widens as T shrinks (the T^{H-1/2} signature)
    T2 = 0.1
    ratio_short = abs(sk_r) / abs(sk_c)
    ratio_long = abs(atm_skew(make_rough_cf(T2, pr; N = 128), T2)) /
                 abs(atm_skew(u -> heston_cf(u, T2, pc), T2))
    @test ratio_short > ratio_long
end