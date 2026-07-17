# Gates for the Heston characteristic function. No literature price values are
# pinned yet (that gate is required before Stage 6 per the rough-Heston spec);
# these are *structural* identities that a wrong CF cannot fake.

const P_STD = HestonParams(2.0, 0.04, 0.5, -0.7, 0.04)

@testset "heston_cf — normalization & martingale" begin
    for T in (0.1, 0.5, 1.0, 3.0)
        @test heston_cf(0.0, T, P_STD) ≈ 1
        # E[S_T]/F = 1 ⇔ ψ(−i) = 1: the discounted stock is a martingale.
        @test heston_cf(-1im, T, P_STD) ≈ 1 rtol = 1e-10
    end
end

@testset "heston_cf — CF properties on the real line" begin
    T = 1.0
    for u in (0.3, 1.0, 2.7, 5.0, 10.0)
        ψ = heston_cf(u, T, P_STD)
        @test abs(ψ) ≤ 1 + 1e-12                       # |E e^{iuX}| ≤ 1
        @test heston_cf(-u, T, P_STD) ≈ conj(ψ)        # X is real
    end
end

@testset "heston_cf — deterministic-variance collapse (ξ → 0)" begin
    # With ξ tiny and ρ = 0, v(t) = θ + (v0−θ)e^{−κt} is deterministic, so
    # X_T ~ N(−w/2, w) with w = θT + (v0−θ)(1−e^{−κT})/κ and
    # ψ(u) = exp(−(iu+u²)w/2). Exercises κ, θ, v0 handling in closed form —
    # the same role the α→1 gate will play for rough Heston.
    ξ = 1e-3
    for (κ, θ, v0, T) in ((1.0, 0.04, 0.04, 1.0),
                          (2.0, 0.04, 0.09, 0.5),
                          (0.5, 0.09, 0.02, 2.0))
        p = HestonParams(κ, θ, ξ, 0.0, v0)
        w = θ * T + (v0 - θ) * (1 - exp(-κ * T)) / κ
        for u in (0.5, 1.0, 2.0, 5.0)
            @test heston_cf(u, T, p) ≈ exp(-(im * u + u^2) * w / 2) rtol = 1e-4
        end
    end
end

@testset "heston_cf — independent Monte Carlo cross-check" begin
    # Substitute for literature-value pinning (no trusted table to hand; a
    # fabricated "published" number would be worse than none): simulate the
    # Heston SDE directly by full-truncation Euler and compare with the
    # Fourier price. Completely independent code path from the CF.
    using Random
    S, K, r, q, T = 100.0, 100.0, 0.02, 0.0, 0.5
    p = HestonParams(2.0, 0.04, 0.5, -0.7, 0.04)
    rng = MersenneTwister(20260704)
    npaths, nsteps = 120_000, 500
    Δ = T / nsteps
    sq1mρ² = sqrt(1 - p.ρ^2)
    payoff = zeros(npaths)
    for i in 1:npaths
        x = log(S); v = p.v0
        for _ in 1:nsteps
            vp = max(v, 0.0)
            z1 = randn(rng); z2 = randn(rng)
            x += (r - q - vp / 2) * Δ + sqrt(vp * Δ) * z1
            v += p.κ * (p.θ - vp) * Δ + p.ξ * sqrt(vp * Δ) * (p.ρ * z1 + sq1mρ² * z2)
        end
        payoff[i] = exp(-r * T) * max(exp(x) - K, 0.0)
    end
    mc = sum(payoff) / npaths
    se = sqrt(sum(abs2, payoff .- mc) / (npaths - 1)) / sqrt(npaths)
    fourier = heston_price(S, K, r, q, p, T)
    @test abs(fourier - mc) < 4 * se
end

@testset "heston_cf — long-maturity branch continuity (the little trap)" begin
    # The g₁ form of the CF develops 2πi phase jumps at long maturity when the
    # complex log crosses its branch cut; the g₂ form must sweep smoothly.
    T = 10.0
    us = range(0.01, 30.0, length = 2000)
    vals = [heston_cf(u, T, P_STD) for u in us]
    @test maximum(abs.(diff(vals))) < 0.05
end
