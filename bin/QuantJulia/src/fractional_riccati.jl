# =============================================================================
# Fractional Riccati solver: implicit product-trapezoidal method   (Stage 6)
# =============================================================================
# Solves the Caputo fractional Riccati ODE
#     D^α h(t) = c0 + c1·h(t) + c2·h(t)²,   h(0) = 0,   α ∈ (0, 1],
# on the uniform grid t_k = kΔ, Δ = T/N, by product-trapezoidal (fractional
# Adams-Moulton) quadrature of the equivalent Volterra equation
#     h(t) = (1/Γ(α)) ∫₀ᵗ (t−s)^{α−1} F(h(s)) ds,
# treated FULLY IMPLICITLY:
#     h_{k+1} = (Δ^α/Γ(α+2)) [ F(h_{k+1}) + Σ_{j≤k} a_{j,k+1} F(h_j) ],
#       a_{0,k+1} = k^{α+1} − (k−α)(k+1)^α
#       a_{j,k+1} = (k−j+2)^{α+1} + (k−j)^{α+1} − 2(k−j+1)^{α+1}
# (the weights of Diethelm–Ford–Freed's corrector).
#
# WHY IMPLICIT, NOT THE CLASSIC PREDICTOR-CORRECTOR: the pricer needs the CF
# at Fourier arguments up to u ~ 10³ for short-dated options, where the
# Riccati's linear coefficient |c1| ~ ξu makes the problem stiff. The explicit
# predictor's stability constraint |c1|·Δ^α ≲ 1 then forces N to explode
# (observed: NaN blow-ups at N = 64, α = 0.6, u ~ 150). The implicit scheme is
# unconditionally stable in the linear part — and because F is a QUADRATIC,
# the implicit equation each step is a scalar complex quadratic, solved in
# closed form. No predictor, no Newton, half the flops of PECE.
#
# Branch selection: of the two quadratic roots, the physical one is chosen by
# continuity — nearest to h_k. (In the stiff regime the spurious root is
# O(1/(Δ^α ξ²)) away; in the smooth regime the roots are separated by the
# Riccati root gap. Both regimes make "nearest" unambiguous.) The small root
# is computed cancellation-free via the q-formula.
#
# All weights depend only on k−j: two power tables m^α, m^{α+1} are built once
# per solve and shared. AD landmine, handled: 0^α has a NaN partial w.r.t. α
# (0·log 0); m = 0 entries are pinned to zero (correct: 0^α ≡ 0 on α > 0).
# ForwardDiff Duals flow through everything, including α = H + 1/2 itself.
#
# The same product-trapezoidal weights evaluate the fractional INTEGRAL
# I^r g(t_N) (used by the rough CF for I¹h, I^{1−α}h). Sanity anchors: r = 1
# reduces exactly to the trapezoid rule; r = 0 reduces exactly to g(t_N) —
# which is what makes the α → 1 classical-recovery gate exact end-to-end.
# =============================================================================

# m^p with a well-defined p-derivative at m = 0.
_intpow(m::Integer, p) = m == 0 ? zero(one(p)) : m^p

function _adams_tables(α, T, N::Int)
    N ≥ 1 || throw(ArgumentError("need N ≥ 1"))
    Δ = T / N
    P1 = [_intpow(m, α) for m in 0:N+1]           # P1[i] = (i−1)^α
    P2 = [_intpow(m, α + 1) for m in 0:N+1]       # P2[i] = (i−1)^{α+1}
    cc = Δ^α / gamma(α + 2)
    return (; α, Δ, N, P1, P2, cc)
end

function _riccati_solve(c0, c1, c2, tbl)
    (; α, N, P1, P2, cc) = tbl
    C = typeof((c0 + c1 + c2) * cc * complex(one(α)))
    h = zeros(C, N + 1)                            # h[1] = h(0) = 0
    fs = zeros(C, N + 1)
    fs[1] = c0
    A = cc * c2
    B = cc * c1 - 1
    for k in 0:N-1
        hist = (P2[k+1] - (k - α) * P1[k+2]) * fs[1]
        @inbounds for j in 1:k
            m = k - j
            hist += (P2[m+3] + P2[m+1] - 2 * P2[m+2]) * fs[j+1]
        end
        # Solve x = cc(F(x) + hist):  A x² + B x + Cq = 0
        Cq = cc * (c0 + hist)
        sq = sqrt(B^2 - 4 * A * Cq)
        s = real(conj(B) * sq) ≥ 0 ? one(real(sq)) : -one(real(sq))
        qq = -(B + s * sq) / 2                     # cancellation-free
        x1 = qq / A
        x2 = Cq / qq                               # the regular root as A → 0
        x = abs2(x1 - h[k+1]) < abs2(x2 - h[k+1]) ? x1 : x2
        h[k+2] = x
        fs[k+2] = c0 + (c1 + c2 * x) * x
    end
    return h
end

"""
    solve_fractional_riccati(c0, c1, c2, α, T, N)

Solve `D^α h = c0 + c1 h + c2 h²`, `h(0) = 0` on `t_k = kT/N, k = 0..N` by the
implicit fractional product-trapezoidal method (exact per-step quadratic
solve). Returns the trajectory `h::Vector` (length N+1). Fully generic:
coefficients and/or `α` may be `ForwardDiff.Dual`s.
"""
solve_fractional_riccati(c0, c1, c2, α, T, N::Int) =
    _riccati_solve(c0, c1, c2, _adams_tables(α, T, N))

# Product-trapezoidal end-point weights for I^r g(t_N):
#   I^r g(t_N) ≈ c · Σ w[j] g[j],  c = Δ^r/Γ(r+2), w[N+1] = 1, interior from
#   the same Adams-Moulton family (piecewise-linear g vs the power kernel).
function _frac_end_weights(r, Δ, N::Int)
    c = Δ^r / gamma(r + 2)
    w = Vector{typeof(one(r))}(undef, N + 1)
    w[N+1] = one(r)
    w[1] = _intpow(N - 1, r + 1) - (N - 1 - r) * _intpow(N, r)
    for j in 1:N-1
        m = N - 1 - j
        w[j+1] = _intpow(m + 2, r + 1) + _intpow(m, r + 1) - 2 * _intpow(m + 1, r + 1)
    end
    return c, w
end

"""
    frac_integral_end(h, r, Δ)

Riemann–Liouville fractional integral `I^r h` evaluated at the END of the
uniform grid carrying `h` (spacing `Δ`), by product-trapezoidal quadrature.
`r = 1` is the trapezoid rule; `r → 0` is the identity (returns `h[end]`).
"""
function frac_integral_end(h::AbstractVector, r, Δ)
    N = length(h) - 1
    c, w = _frac_end_weights(r, Δ, N)
    s = w[1] * h[1]
    @inbounds for j in 2:N+1
        s += w[j] * h[j]
    end
    return c * s
end
