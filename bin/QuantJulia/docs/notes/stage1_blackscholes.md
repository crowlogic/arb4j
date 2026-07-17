# Stage 1 notes — Black-Scholes: the four things to be able to say

These are the four questions `src/blackscholes.jl` maps to in a quant-research
interview, with the reasoning. Each ends with a one-line whiteboard version.

## 1. What is Φ(d₂)? Why is d₁ = d₂ + σ√T?

Under the risk-neutral measure, log S_T is normal with mean
log S + (r − q − σ²/2)T and standard deviation σ√T. The call pays off when
S_T > K; standardizing that event gives

P(S_T > K) = Φ(d₂),  d₂ = [log(S/K) + (r − q − σ²/2)T] / (σ√T).

So **Φ(d₂) is the risk-neutral probability the call finishes in the money**,
and the strike leg K·e^{−rT}·Φ(d₂) reads as "discounted strike × probability
you pay it."

The stock leg is different: it needs E[S_T · 1{S_T>K}] — the indicator
*weighted by S_T*. Doing the Gaussian integral, the e^{x} factor tilts the
distribution: completing the square shifts the mean of log S_T up by exactly
σ²T. Equivalently (the measure-theoretic phrasing): switch numeraire from the
bond to the stock; Girsanov adds σ to the Brownian drift. Under that tilted
measure the same exercise event has probability Φ(d₁) with d₁ = d₂ + σ√T.

**Whiteboard line:** d₂ and d₁ are the exercise probability of the *same event*
under two measures — bond numeraire and stock numeraire — and the σ√T gap is
the Girsanov drift shift from switching between them.

## 2. Why is vega = S·e^{−qT}·φ(d₁)·√T, and why the same for calls and puts?

Differentiate C = S e^{−qT} Φ(d₁) − K e^{−rT} Φ(d₂) in σ. Chain rule leaves
two φ terms. The key identity (plug d₂ = d₁ − σ√T into φ and simplify — the
exponential cross-terms rebuild exactly the forward/strike ratio):

S e^{−qT} φ(d₁) = K e^{−rT} φ(d₂).

Given that, the two terms collapse to
S e^{−qT} φ(d₁) · ∂(d₁ − d₂)/∂σ = S e^{−qT} φ(d₁) √T, since d₁ − d₂ = σ√T.

Calls vs puts is one line of parity: C − P = S e^{−qT} − K e^{−rT} contains no
σ, so ∂C/∂σ = ∂P/∂σ.

**Shape intuition:** φ(d₁) peaks near the (forward) money and dies in both
wings — volatility only has value while the option's fate is genuinely
undecided.

## 3. Why does naive Newton diverge for deep-OTM implied vol? What does the hybrid do?

Newton's step is Δσ = (model price − market price) / vega. Deep OTM (or very
short T), the price-vs-σ curve is nearly flat — vega ≈ 0 — until σ gets large.
Dividing a finite pricing error by a near-zero slope produces a huge step:
geometrically, Newton follows the tangent line to its root, and a nearly
horizontal tangent crosses zero miles away. The iterate lands somewhere absurd
(possibly negative σ), where the curve is *also* flat, and it never recovers.

The fix in `implied_vol` exploits monotonicity: price is strictly increasing in
σ, so every evaluation tells you which side of the root you're on, and a
bracket [lo, hi] containing the root can always be maintained and shrunk.
Accept the Newton step only if it lands strictly inside the bracket; otherwise
bisect. Worst case you inherit bisection's guaranteed convergence; near the
root, where vega is healthy, Newton takes over at quadratic speed. Same
philosophy as Brent's method.

**Whiteboard line:** flat objective ⇒ vega ≈ 0 ⇒ error/vega explodes; the
bracket makes divergence impossible while keeping Newton's speed where Newton
works.

## 4. Where do the no-arbitrage bounds come from, and why is a violating price a *data* error?

With carry q: max(S e^{−qT} − K e^{−rT}, 0) ≤ C < S e^{−qT}.

- **Lower:** a call dominates a forward struck at K. The forward's value today
  is S e^{−qT} − K e^{−rT}; the call is that contract *plus* the right to walk
  away, so it can't be worth less (nor less than zero).
- **Upper:** exercising a call delivers at most the stock (without the
  dividends paid before T), worth S e^{−qT} today. A call priced at or above
  that is dominated by just buying the stock.

Why "no implied vol exists" rather than "solver failed": BS(σ) is a strictly
increasing function of σ that maps (0, ∞) onto exactly (lower bound, upper
bound) — σ→0 gives the lower bound, σ→∞ approaches the upper. A quote outside
that interval has no preimage. The root you'd be searching for is not hard to
find; it does not exist.

**Forward pointer:** real SPX chains contain stale/crossed quotes that violate
these bounds. `implied_vol` throwing `DomainError` on them is the calibration
pipeline's first data-quality filter working as intended (Stage 4).
