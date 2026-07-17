using ForwardDiff

@testset "fourier — Black-Scholes collapse (end-to-end gate)" begin
    # ξ ≈ 0, v0 = θ: Heston degenerates to BS with σ = √θ. This exercises the
    # whole chain: CF → quadrature → probabilities → price, against Stage 1.
    S, r, q, T = 100.0, 0.03, 0.01, 1.0
    p = HestonParams(1.0, 0.04, 1e-3, 0.0, 0.04)
    for K in (70.0, 90.0, 100.0, 110.0, 140.0), call in (true, false)
        @test heston_price(S, K, r, q, p, T; call) ≈
              bs_price(S, K, r, q, 0.2, T; call) rtol = 1e-4 atol = 1e-6
    end
    # v0 ≠ θ: effective BS variance is the time-average of the deterministic
    # variance path — exercises κ through the pricer.
    p2 = HestonParams(2.0, 0.04, 1e-3, 0.0, 0.09)
    w = 0.04 * T + (0.09 - 0.04) * (1 - exp(-2.0 * T)) / 2.0
    @test heston_price(S, 100.0, r, q, p2, T) ≈
          bs_price(S, 100.0, r, q, sqrt(w / T), T) rtol = 1e-4
end

@testset "fourier — structure of full Heston prices" begin
    S, r, q, T = 100.0, 0.03, 0.01, 0.5
    Ks = [70.0, 85.0, 100.0, 115.0, 130.0]            # equally spaced
    cs = [heston_price(S, K, r, q, P_STD, T) for K in Ks]
    @test all(diff(cs) .< 0)                          # decreasing in strike
    @test all(diff(diff(cs)) .> -1e-8)                # convex in strike
    for (K, c) in zip(Ks, cs)                         # no-arbitrage bounds
        @test max(S * exp(-q * T) - K * exp(-r * T), 0.0) ≤ c < S * exp(-q * T)
    end
end

@testset "fourier — implied-vol smile shows the ρ<0 skew" begin
    # Stage 1's inverter applied to Stage 3's prices: negative spot-vol
    # correlation must tilt the smile down in strike.
    S, r, q, T = 100.0, 0.03, 0.01, 0.5
    iv(K) = implied_vol(heston_price(S, K, r, q, P_STD, T), S, K, r, q, T)
    @test iv(85.0) > iv(100.0) > iv(115.0)
    @test 0.1 < iv(100.0) < 0.3                       # sane level near √v0 = 0.2
end

@testset "fourier — ForwardDiff gradient vs finite differences" begin
    # The differentiability contract, enforced from day one: Duals through the
    # CF, the quadrature, and the price, for all five parameters.
    S, K, r, q, T = 100.0, 110.0, 0.03, 0.01, 1.0
    f(x) = heston_price(S, K, r, q, HestonParams(x...), T)
    x0 = [2.0, 0.04, 0.5, -0.7, 0.04]
    g = ForwardDiff.gradient(f, x0)
    for i in 1:5
        h = 1e-5 * max(1.0, abs(x0[i]))
        xp = copy(x0); xp[i] += h
        xm = copy(x0); xm[i] -= h
        fd = (f(xp) - f(xm)) / (2h)
        @test g[i] ≈ fd rtol = 1e-4 atol = 1e-8
    end
end
