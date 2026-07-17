# Data

Raw and processed market data live here but are **not committed** (CBOE quote
data is redistributed under their terms; the repo stays lean and clean-room).

## To reproduce

1. Go to the CBOE delayed quotes page for SPX
   (cboe.com → Markets → Delayed Quotes → search "SPX"), open the Options tab,
   select "All" expirations, and click **Download CSV**.
2. Save it as `data/spx_quotedata.csv`.
3. Run `julia --project=. scripts/01_prepare_data.jl` — this parses the file,
   runs the documented quality filters, inverts implied vols, and writes
   `data/processed_spx.csv`.

The snapshot used for the committed results in `results/` was taken
2026-07-04 00:23 EDT (Thursday 2026-07-02 closing quotes; July 3 was the
Independence Day observance), spot 7483.24, ~14,900 strike rows across ~55
expiries from daily SPXW out to Dec 2031 LEAPS.

## processed_spx.csv schema

One row per surviving OTM quote:

| column | meaning |
|---|---|
| expiry | expiration date |
| T | years to expiry, calendar days / 365 from the valuation date |
| K | strike |
| F | forward for this expiry, from the put-call-parity regression |
| r | discount rate for this expiry, same regression |
| q | implied carry, q = r − log(F/S)/T (diagnostic; pricing uses (F, r)) |
| side | `call` (K ≥ F) or `put` (K < F) — the OTM side |
| bid, ask, mid | the quotes used |
| iv | Black-Scholes implied vol of `mid` via the Stage-1 inverter |
| vega | BS vega at `iv` — the calibration weight |
