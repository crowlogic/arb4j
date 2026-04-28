package arb.functions.real;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;

/**
 * Strictly increasing modification of the Riemann–Siegel theta function on
 * [0, ∞) defined by additive linear shift
 *
 * <pre>
 *   Φ(t) := ϑ(t) + c·t
 * </pre>
 *
 * where
 *
 * <pre>
 *   ϑ(t) := im(lnΓ(¼ + ⅈ·t/2)) − (t·log(π)/2)
 * </pre>
 *
 * is the {@link RiemannSiegelThetaFunction}. The derivative is
 *
 * <pre>
 *   ϑ′(t) = ½·Re(ψ(¼ + ⅈ·t/2)) − ½·log(π),
 * </pre>
 *
 * which is strictly increasing on [0, ∞) (since ϑ is convex there) and attains
 * its infimum at t = 0:
 *
 * <pre>
 *   ϑ′(0) = ½·Re(ψ(¼)) − ½·log(π)
 *         = −½·(γ + π/2 + 3·log(2) + log(π))
 *         ≈ −2.6857...
 * </pre>
 *
 * (using the closed form ψ(¼) = −γ − π/2 − 3·log(2)). Therefore Φ′(t) ≥ 0 on
 * [0, ∞) iff c ≥ −ϑ′(0) ≈ 2.6857..., and Φ is strictly increasing iff c is
 * strictly greater than that threshold. The default value c = 3 satisfies this
 * with a comfortable margin.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class MonotonicRiemannSiegelThetaFunction implements
                                                 RealFunction
{
  Real           c       = Real.named("c").set(3.0);

  public Context context = new Context(c);

  /**
   * The slope constant c in Φ(t) = ϑ(t) + c·t.
   */
  public Real c()
  {
    return c;
  }

  @Override
  public String toString()
  {
    return monotoneϑ.toString();
  }

  RiemannSiegelThetaFunction ϑ             = new RiemannSiegelThetaFunction();

  RealFunction               monotoneϑ     = RealFunction.express("monotoneϑ:t->ϑ(t)+c*t", context);

  RealFunction               diffMonotoneϑ = RealFunction.express("diffmonotoneϑ:t->diff(ϑ(t),t)+c", context);

  @Override
  public RealFunction derivative()
  {
    return diffMonotoneϑ;
  }

  public MonotonicRiemannSiegelThetaFunction()
  {
  }

  /**
   * Evaluates the Taylor jet of Φ(t+x) = ϑ(t+x) + c·(t+x) in x to the requested
   * order. Coefficient 0 is Φ(t) = ϑ(t)+c·t; coefficient 1 is Φ′(t) = ϑ′(t)+c;
   * higher coefficients are inherited unchanged from ϑ, since c·(t+x) is linear
   * in x.
   */
  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    ϑ.evaluate(t, order, bits, res);
    if (order >= 1)
    {
      try ( Real ct = Real.valueOf(0.0))
      {
        c.mul(t, bits, ct);
        res.get(0).add(ct, bits, res.get(0));
      }
      if (order >= 2)
      {
        res.get(1).add(c, bits, res.get(1));
      }
    }
    return res;
  }

}
