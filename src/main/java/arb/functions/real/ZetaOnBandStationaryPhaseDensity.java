package arb.functions.real;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;

/**
 * On-band spectral density evaluator derived from the stationary-phase /
 * frequency-matching formula of Theorem "On-band density" (Block C) of
 * {@code docs/RiemannHypothesisProof.tex}.
 *
 * <p>
 * For every warped frequency ν ∈ (-1,1)\{0} and every saddle time t for which
 * the frequency-matching condition
 *
 * <pre>
 *   ∂_t Φ_{n,σ}(t)/ϑ'(t) = ν,   σ = sgn(ν)
 * </pre>
 *
 * is solved by the saddle mode
 *
 * <pre>
 *   n₀(t, ν) = exp((1 - |ν|) · ϑ'(t))
 * </pre>
 *
 * (equation (eq:n0) of the cited document), the on-band density at (ν, t) is
 *
 * <pre>
 *   K_∞(ν; t) = (1/(2π)) · Σ_{σ ∈ {+,-}} (2π/|ϑ''(t)|)^{1/2}
 *                             · n₀^{-1/2} · cos(Φ_{n₀,σ}(t) - ν·ϑ(t) ± π/4)
 * </pre>
 *
 * with Φ_{n,σ}(t) := σ·ϑ(t) - σ·t·log n. Using cos(-x) = cos(x) the two
 * branches combine into
 *
 * <pre>
 *   K_∞(ν; t) = (1/(2π)) · √(2π/|ϑ''(t)|) · exp(-(1-|ν|)·ϑ'(t)/2)
 *                    · [ cos(ϑ(t) - t·(1-|ν|)·ϑ'(t) - ν·ϑ(t) + π/4)
 *                      + cos(ϑ(t) - t·(1-|ν|)·ϑ'(t) + ν·ϑ(t) + π/4) ].
 * </pre>
 *
 * <p>
 * This evaluator expresses the formula declaratively through the arb4j
 * {@link arb.expressions Expression Compiler}: ν is registered as a named
 * {@link Context} variable and the density, saddle mode and frequency-matching
 * identities are compiled to {@link RealFunction} instances over the time
 * variable t. The evaluator performs no numerical integration — only the
 * closed-form stationary-phase value is used.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ZetaOnBandStationaryPhaseDensity implements
                                             AutoCloseable
{
  private final Real         ν                = Real.named("ν");

  public final Context       context          = new Context(ν);

  /**
   * Saddle mode n₀(t, ν) = exp((1-|ν|)·ϑ'(t)), compiled from the same
   * closed-form expression used in the density.
   */
  public final RealFunction  n0               = RealFunction.express("saddleMode:t➔exp((1-|ν|)·diff(ϑ(t),t))",
                                                                     context);

  /**
   * Instantaneous x-frequency σ·(1 − log(n)/ϑ'(t)) evaluated at n = n₀(t);
   * by the saddle identity this equals ν. ν is bound in context.
   */
  public final RealFunction  matchedFrequency = RealFunction.express("matchedFrequency:t➔sgn(ν)·(1-log(saddleMode(t))/diff(ϑ(t),t))",
                                                                     context);

  /**
   * On-band stationary-phase density K_∞(ν; t) as a declarative
   * {@link RealFunction} of t with ν in context.
   */
  public final RealFunction  density          =
                                     RealFunction.express("K_∞:t➔(1/(2·π))·√(2·π/|diff(ϑ(t),t²)|)"
                                                          + "·exp(-(1-|ν|)·diff(ϑ(t),t)/2)"
                                                          + "·(cos(ϑ(t)-t·(1-|ν|)·diff(ϑ(t),t)-ν·ϑ(t)+π/4)"
                                                          + "+cos(ϑ(t)-t·(1-|ν|)·diff(ϑ(t),t)+ν·ϑ(t)+π/4))",
                                                          context);

  private void bindν(Real ν0)
  {
    double νd = ν0.doubleValue();
    if (νd <= -1.0 || νd >= 1.0)
    {
      throw new IllegalArgumentException("ν must lie in the open interval (-1, 1); got " + νd);
    }
    if (νd == 0.0)
    {
      throw new IllegalArgumentException("ν = 0 is the boundary atom case; evaluator is defined on (-1,1)\\{0}");
    }
    ν.set(ν0);
  }

  /**
   * Evaluate the on-band stationary-phase density K_∞(ν; t).
   */
  public Real evaluate(Real ν0, Real t0, int bits, Real result)
  {
    bindν(ν0);
    return density.evaluate(t0, 1, bits, result);
  }

  /**
   * Saddle mode n₀(t, ν) = exp((1-|ν|)·ϑ'(t)), via the Expression Compiler.
   */
  public Real saddleMode(Real ν0, Real t0, int bits, Real result)
  {
    bindν(ν0);
    return n0.evaluate(t0, 1, bits, result);
  }

  /**
   * Instantaneous x-frequency σ·(1 − log(n₀(t))/ϑ'(t)) with ν bound in
   * context; by the saddle identity this equals ν.
   */
  public Real instantaneousFrequency(Real ν0, Real t0, int bits, Real result)
  {
    bindν(ν0);
    return matchedFrequency.evaluate(t0, 1, bits, result);
  }

  @Override
  public void close()
  {
    n0.close();
    matchedFrequency.close();
    density.close();
  }
}
