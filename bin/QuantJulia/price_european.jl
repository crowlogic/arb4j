#!/home/crow/.julia/juliaup/julia-1.12.6+0.x64.linux.gnu/bin/julia
# Rough Heston pricer via Yugam2508/QuantJulia (implicit fractional Riccati).
# Usage: price_european.jl S0 K T H lambda theta nu rho r
# Prints: call_price put_price
push!(LOAD_PATH, joinpath(@__DIR__, "src"))
using QuantJulia

S0 = parse(Float64, ARGS[1])
K  = parse(Float64, ARGS[2])
T  = parse(Float64, ARGS[3])
H  = parse(Float64, ARGS[4])
κ  = parse(Float64, ARGS[5])
θ  = parse(Float64, ARGS[6])
ξ  = parse(Float64, ARGS[7])
ρ  = parse(Float64, ARGS[8])
r  = parse(Float64, ARGS[9])

v0 = θ
p = RoughHestonParams(κ, θ, ξ, ρ, v0, H)
q = 0.0
rtol = 1e-9
N = 256

ψ = make_rough_cf(T, p; N=N)
call = price_from_cf(u -> ψ(u), S0, K, r, q, T; call=true, rtol=rtol)
put  = price_from_cf(u -> ψ(u), S0, K, r, q, T; call=false, rtol=rtol)

println(round(call, digits=12), " ", round(put, digits=12))
