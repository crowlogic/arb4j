# =============================================================================
# CBOE delayed-quotes chain: parsing and preparation  (Stage 4, data side)
# =============================================================================
# Input: the "download CSV" export from cboe.com delayed quotes. Layout:
#   line 1: blank
#   line 2: "S&P 500 INDEX,Last: <spot>,Change: ..."
#   line 3: '"Date: July 4, 2026 at 12:23 AM EDT",Bid: ...'   (quoted comma!)
#   line 4: header, calls and puts side by side per (expiry, strike)
#   rest  : data rows, 22 plain comma-separated fields
#
# Preparation pipeline (each step is a documented, counted filter — the
# rejection stats are part of the deliverable, not noise):
#   1. Drop expired / out-of-window expiries.
#   2. Per expiry, recover the forward F and discount rate r from put-call
#      parity: C − P = e^{−rT}(F − K) is LINEAR in K, so a least-squares fit
#      of (C−P) on K across near-ATM strikes gives slope −e^{−rT} and thus
#      (r, F) — no external rates data needed; the market tells us its own
#      carry. Implied dividend yield: q = r − log(F/S)/T.
#   3. Keep the OTM side per strike (calls above F, puts below) — the liquid
#      side, standard practice for surface fitting.
#   4. Quote-quality filters: bid > 0, not crossed, moneyness window.
#   5. Implied vol via Stage 1's inverter. Its DomainError on bound-violating
#      prices IS the arbitrage filter doing its job on stale quotes.
#
# Simplifications (documented, revisit if they ever bind): T in calendar
# days / 365 ignoring time-of-day; AM/PM settlement distinction (SPX vs SPXW
# roots) ignored.
# =============================================================================

using Dates

const _EXPIRY_DF = dateformat"e u dd yyyy"        # "Thu Jul 02 2026"
const _QUOTEDATE_RE = r"Date:\s*([A-Za-z]+ \d{1,2}, \d{4})"
const _SPOT_RE = r"Last:\s*([0-9]+\.?[0-9]*)"

"""
    read_cboe(path)

Parse a CBOE delayed-quotes CSV. Returns
`(spot, quote_date, rows)` where each row is
`(expiry, K, cbid, cask, pbid, pask)`. Purely structural — no filtering,
no judgment; that's `prepare_chain`'s job.
"""
function read_cboe(path::AbstractString)
    spot = nothing
    quote_date = nothing
    rows = @NamedTuple{expiry::Date, K::Float64, cbid::Float64, cask::Float64,
                       pbid::Float64, pask::Float64}[]
    for line in eachline(path)
        if spot === nothing && (m = match(_SPOT_RE, line)) !== nothing
            spot = parse(Float64, m.captures[1])
            continue
        end
        if quote_date === nothing && (m = match(_QUOTEDATE_RE, line)) !== nothing
            quote_date = Date(m.captures[1], dateformat"U d, yyyy")
            continue
        end
        f = split(line, ',')
        length(f) == 22 || continue
        expiry = try
            Date(f[1], _EXPIRY_DF)
        catch
            continue                                # header or malformed row
        end
        vals = tryparse.(Float64, (f[12], f[5], f[6], f[16], f[17]))
        any(isnothing, vals) && continue
        K, cbid, cask, pbid, pask = vals
        push!(rows, (; expiry, K, cbid, cask, pbid, pask))
    end
    spot === nothing && error("read_cboe: no spot ('Last:') line found in $path")
    quote_date === nothing && error("read_cboe: no 'Date:' line found in $path")
    return (spot = spot, quote_date = quote_date, rows = rows)
end

# Least-squares line y = a + b·x through the points; returns (a, b).
function _lsq_line(xs, ys)
    n = length(xs)
    sx, sy = sum(xs), sum(ys)
    sxx, sxy = sum(abs2, xs), sum(xs .* ys)
    b = (n * sxy - sx * sy) / (n * sxx - sx^2)
    a = (sy - b * sx) / n
    return a, b
end

"""
    prepare_chain(raw; valuation_date=raw.quote_date, min_days=2, max_years=2.5,
                  max_logm=0.40, min_quotes=5, atm_band=0.10)

Turn a parsed CBOE file into a calibration-ready chain. Returns
`(quotes, expiries, rejects, spot, valuation_date)`:

- `quotes`: one entry per surviving OTM quote —
  `(expiry, T, K, F, r, q, side, bid, ask, mid, iv, vega)`, with `iv` from
  Stage 1's inverter and `vega` evaluated at that iv (the calibration weight).
- `expiries`: per-expiry `(expiry, T, F, r, q, n)` from the parity regression.
- `rejects`: counted reasons for every discarded row — the data-quality report.

`valuation_date` matters: weekend/holiday snapshots carry the last session's
closing quotes, and for short-dated options the day count is a first-order
effect. Pass the last trading date explicitly when the snapshot date isn't it.
"""
function prepare_chain(raw; valuation_date::Date = raw.quote_date,
                       min_days::Int = 2, max_years::Real = 2.5,
                       max_logm::Real = 0.40, min_quotes::Int = 5,
                       atm_band::Real = 0.10)
    S = raw.spot
    rejects = Dict{Symbol,Int}()
    add!(k, n = 1) = rejects[k] = get(rejects, k, 0) + n

    byexp = Dict{Date,Vector{Int}}()
    for (i, row) in enumerate(raw.rows)
        push!(get!(byexp, row.expiry, Int[]), i)
    end

    QT = @NamedTuple{expiry::Date, T::Float64, K::Float64, F::Float64,
                     r::Float64, q::Float64, side::Symbol, bid::Float64,
                     ask::Float64, mid::Float64, iv::Float64, vega::Float64}
    quotes = QT[]
    expiries = @NamedTuple{expiry::Date, T::Float64, F::Float64, r::Float64,
                           q::Float64, n::Int}[]

    for expiry in sort!(collect(keys(byexp)))
        idx = byexp[expiry]
        days = Dates.value(expiry - valuation_date)
        if days <= 0
            add!(:expired, length(idx)); continue
        end
        T = days / 365
        if days < min_days || T > max_years
            add!(:out_of_window, length(idx)); continue
        end

        # -- forward & rate from put-call parity regression (near-ATM strikes)
        xs = Float64[]; ys = Float64[]
        for i in idx
            row = raw.rows[i]
            ok = row.cbid > 0 && row.pbid > 0 &&
                 row.cask >= row.cbid && row.pask >= row.pbid &&
                 abs(row.K / S - 1) <= atm_band
            ok || continue
            push!(xs, row.K)
            push!(ys, (row.cbid + row.cask) / 2 - (row.pbid + row.pask) / 2)
        end
        if length(xs) < 3
            add!(:no_forward, length(idx)); continue
        end
        a, b = _lsq_line(xs, ys)
        disc = -b
        if !(disc > 0)
            add!(:no_forward, length(idx)); continue
        end
        r = -log(disc) / T
        F = a / disc
        if !(-0.05 < r < 0.15) || !(0.5 < F / S < 2.0)
            add!(:no_forward, length(idx)); continue    # regression nonsense
        end
        q = r - log(F / S) / T

        # -- per-strike OTM quotes through the quality filters
        batch = QT[]
        for i in idx
            row = raw.rows[i]
            side = row.K >= F ? :call : :put
            bid, ask = side === :call ? (row.cbid, row.cask) : (row.pbid, row.pask)
            if !(bid > 0)
                add!(:zero_bid); continue
            elseif ask < bid
                add!(:crossed); continue
            elseif abs(log(row.K / F)) > max_logm
                add!(:moneyness); continue
            end
            mid = (bid + ask) / 2
            iv = try
                implied_vol(mid, S, row.K, r, q, T; call = side === :call, tol = 1e-8)
            catch e
                e isa DomainError ? add!(:arb_violation) : add!(:no_converge)
                continue
            end
            if iv <= 0
                add!(:arb_violation); continue          # σ = 0 boundary quote
            end
            vega = bs_vega(S, row.K, r, q, iv, T)
            if vega < 1e-8
                add!(:tiny_vega); continue
            end
            push!(batch, (; expiry, T, K = row.K, F, r, q, side, bid, ask, mid, iv, vega))
        end

        if length(batch) < min_quotes
            add!(:thin_expiry, length(batch)); continue
        end
        append!(quotes, batch)
        push!(expiries, (; expiry, T, F, r, q, n = length(batch)))
    end

    return (quotes = quotes, expiries = expiries, rejects = rejects,
            spot = S, valuation_date = valuation_date)
end
