package arb.operators;

import arb.*;
import arb.functions.*;

/**
 * the Laplace transform is an integral transform that converts a function of a
 * real variable t to a function of a complex variable s (in the complex
 * frequency domain, also known as s-domain, or s-plane) and also transforms
 * ordinary differential equations into algebraic equations and convolution into
 * multiplication.[1][2] For suitable functions f, the Laplace transform is the
 * integral ∫f(t)*e^(-t*s)dt=0..∞)
 * 
 * @param <F>
 */
public class LaplaceTransform<F extends RealToComplexFunction> implements
                             IntegralTransform
{
  private static final int       relativeAccuracyBitsGoal     = 128;
  private static final Magnitude absoluteUncertaintyTolerance = new Magnitude().set(Math.pow(10, -20));
  private static final Real      right                        = new Real().set("1000", 1024);
  private static final Real      left                         = Constants.ZERO.getReal();

  public LaplaceTransform(F f)
  {
    this.f = f;
  }

  F f;

  @Override
  public Complex evaluate(Real ξ, int order, int prec, Complex res)
  {
    order = Math.max(1, order);
    assert order < 2;

    /**
     * f(x)e^(-i2πξx)
     */
    RealToComplexFunction integrand = (x, integrandOrder, integrandPrec, result) ->
                                    {
                                      try ( Complex exponent = new Complex(); Complex y = new Complex())
                                      {
                                        Real expr = exponent.getReal().one();
                                        expr.negate(expr).mul(ξ, integrandPrec, expr).mul(x, integrandPrec, expr);
                                        expr.exp(integrandPrec, expr);
                                        exponent.mul(f.evaluate(x, integrandOrder, integrandPrec, y),
                                                     integrandPrec,
                                                     result);
                                        return result;
                                      }
                                    };

    IntegrationOptions    opts      = new IntegrationOptions();
    return integrand.integrate(left, right, relativeAccuracyBitsGoal, absoluteUncertaintyTolerance, opts, prec, res);
  }

}
