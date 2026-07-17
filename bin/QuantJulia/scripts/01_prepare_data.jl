# Parse the raw CBOE SPX chain, run the quality filters, invert implied vols,
# and write data/processed_spx.csv. Run from the repo root:
#     julia --project=. scripts/01_prepare_data.jl

using QuantJulia
using Dates, Printf

const ROOT = joinpath(@__DIR__, "..")
const RAW = joinpath(ROOT, "data", "spx_quotedata.csv")
const OUT = joinpath(ROOT, "data", "processed_spx.csv")

raw = read_cboe(RAW)

# The snapshot is Sat 2026-07-04 00:23 EDT: markets closed Fri Jul 3
# (Independence Day observed), so these are Thu 2026-07-02 closing quotes.
# Day counts for short-dated options are first-order, so value as of Jul 2.
valuation = Date(2026, 7, 2)

chain = prepare_chain(raw; valuation_date = valuation)

println("Raw file        : $(length(raw.rows)) strike rows, spot = $(raw.spot)")
println("Snapshot date   : $(raw.quote_date)  →  valuation date used: $valuation")
println("Surviving quotes: $(length(chain.quotes)) across $(length(chain.expiries)) expiries")
println("\nRejection report:")
for (k, v) in sort!(collect(chain.rejects); by = last, rev = true)
    @printf("  %-14s %6d\n", k, v)
end

println("\nPer-expiry summary (parity-implied forward, rate, carry):")
@printf("  %-12s %7s %10s %8s %8s %5s %8s\n",
        "expiry", "T(yr)", "F", "r", "q", "n", "iv_atm")
for e in chain.expiries
    atm = argmin(q -> abs(log(q.K / e.F)), filter(q -> q.expiry == e.expiry, chain.quotes))
    @printf("  %-12s %7.4f %10.2f %8.4f %8.4f %5d %8.4f\n",
            e.expiry, e.T, e.F, e.r, e.q, e.n, atm.iv)
end

open(OUT, "w") do io
    println(io, "expiry,T,K,F,r,q,side,bid,ask,mid,iv,vega")
    for qt in chain.quotes
        println(io, join((qt.expiry, qt.T, qt.K, qt.F, qt.r, qt.q, qt.side,
                          qt.bid, qt.ask, qt.mid, qt.iv, qt.vega), ","))
    end
end
println("\nWrote $(length(chain.quotes)) quotes → $OUT")
