package arb.functions;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Two closed-form integrands whose antiderivatives are known exactly, used to
 * verify {@link NumericallyIntegratedRealFunction}.
 *
 * Test 1: f(t) = 1 → F(x) = x - a (exact: linear) Test 2: f(t) = t → F(x) =
 * (x²- a²)/2 (exact: quadratic)
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class NumericalRealFunctionIntegralTest extends
                                                   TestCase
{
  static final int    BITS = 128;
  static final double TOL  = 1e-6;

  /** F(x) = ∫_0^x 1 dt = x */
  public void testConstantIntegrand()
  {
    RealFunction one = RealFunction.express("t", "1", null);

    try ( NumericalRealFunctionIntegral F = new NumericalRealFunctionIntegral(one,
                                                                              0.0,
                                                                              0.001,
                                                                              BITS);
          Real x = new Real(); Real result = new Real())
    {
      for (double xd : new double[]
      { 0.0, 0.25, 0.5, 0.75, 1.0 })
      {
        x.set(xd);
        F.evaluate(x, 1, BITS, result);
        assertEquals("F(" + xd + ")", xd, result.doubleValue(), TOL);
      }
    }
  }

  /** F(x) = ∫_0^x t dt = x²/2 */
  public void testLinearIntegrand()
  {
    RealFunction identity = RealFunction.express("t", "t", null);

    try ( NumericalRealFunctionIntegral F = new NumericalRealFunctionIntegral(identity,
                                                                              0.0,
                                                                              0.001,
                                                                              BITS);
          Real x = new Real(); Real result = new Real())
    {
      for (double xd : new double[]
      { 0.0, 0.5, 1.0, 1.5, 2.0 })
      {
        x.set(xd);
        F.evaluate(x, 1, BITS, result);
        assertEquals("F(" + xd + ")", xd * xd / 2.0, result.doubleValue(), TOL);
      }
    }
  }
}