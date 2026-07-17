# Stage 4 notes — real data, and what the classical fit actually says

## Getting (F, r) from the market itself: the parity regression

Put-call parity for European options is C − P = e^{−rT}(F − K) — **linear in
K**. Regressing (C_mid − P_mid) on K across near-ATM strikes per expiry gives
slope −e^{−rT} and intercept e^{−rT}F, hence (r, F) with no external rates
data. The market tells you its own discount curve and forwards. Interview
phrasing: "I don't assume a rate; I read it off the box."

Two honest caveats found in the real data:

- **Front-end r is noisy.** At T = 0.02 the slope is −1 + rT with rT ~ 1e-3;
  you're estimating a 0.1% deviation from −1 out of noisy mids. Per-expiry r
  bounced between −4% and +7% inside the first two weeks, settling to a clean
  ~4.5% beyond a month. Fix if it ever matters: pool r across expiries
  (fit a smooth curve), keep per-expiry F.
- **The implied carry q looks insane at the front (−16%!) and that's not a
  bug.** SPX options trade to 4:15pm ET; the cash index "Last" prints at
  4:00pm. Any futures drift in those 15 minutes becomes a fixed percentage
  gap between S and every F, and log(F/S)/T *annualizes* it — a 0.25% gap is
  a monstrous carry at T = 4 days and invisible at T = 1y. Downstream this is
  harmless: pricing only ever consumes (F, discount) jointly, which parity
  pins exactly; q is a diagnostic display, not an input.

## Other conventions worth being able to defend

- **OTM side only** (calls above F, puts below): the liquid side, tighter
  spreads, and it dodges deep-ITM quote junk. Standard for surface fitting.
- **Valuation date = last trading session**, not the snapshot date. The file
  was downloaded Saturday July 4; the quotes are Thursday July 2's close
  (July 3 = holiday). For a 4-day option, using the wrong date halves T.
- **Calendar days / 365.** Consequence seen in the data: the Monday-after-a-
  holiday-weekend expiry shows 6% ATM vol — the market prices weekend +
  holiday time at near-zero variance, and calendar-time annualization
  deflates the number. It's a convention artifact, not an arbitrage.
- **Vega-weighted price loss ≈ IV loss:** dC = vega·dσ to first order, so
  minimizing ((C_model − mid)/vega_mkt)² is minimizing squared IV error
  without differentiating through the iterative inverter — the implicit-
  function theorem applied at the loss level. vega is frozen at market iv
  (it's a weight, not a variable).
- **Feller not enforced** (2κθ ≥ ξ² fails at the fitted params, hugely).
  Index surfaces routinely calibrate Feller-violating; the CF stays valid.
  Report it, don't clamp it.

## The result, read properly (fit of 2026-07-02 SPX chain)

Fitted: κ = 8.88, θ = 0.049 (22.1% long vol), ξ = 2.37, ρ = −0.675,
v0 = 0.0069 (8.3% spot vol). Full-chain IV RMSE 130 bps on 11,858 quotes.

The per-expiry error profile is the headline:

    T ≈ 4d–3w   : 150–515 bps   ← structural failure
    T ≈ 0.3–1.0y:  27–55 bps    ← the belly fits fine
    T ≈ 2–2.5y  :  90–107 bps   ← slow degradation

κ ≈ 9 with ξ ≈ 2.4 is the model contorting itself: enormous mean reversion
plus enormous vol-of-vol is classical Heston's only way to fake a steep
short-end skew that decays fast in maturity — and it still misses the front
by 150+ bps while the contortion damages the wings. **This error profile is
the empirical case for rough volatility**: the short-maturity ATM skew in
data behaves like T^(H−1/2) (explodes as T→0), while any classical
stochastic-vol model's skew flattens to a constant as T→0. Stage 6–8 exists
to show H ≈ 0.1 fixes precisely the rows that are red here, with fewer
gymnastics from the remaining parameters.

Caveat for the eventual comparison: the front-most expiry (T = 0.011, RMSE
515 bps) is contaminated by the calendar-time artifact above; rough Heston
should be judged on the T ≥ 1-week rows.
