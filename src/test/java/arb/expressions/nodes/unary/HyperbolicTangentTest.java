package arb.expressions.nodes.unary;

import static arb.functions.real.RealFunction.express;

import arb.Real;
import arb.RoundingMode;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Tests for the symbolic differentiation and integration of tanh(x) via the
 * expression compiler / {@link FunctionNode}.
 *
 * <pre>
 *   d/dx tanh(x) = 1 - tanh(x)²          (sech²(x))
 *   ∫ tanh(x) dx = log(cosh(x))
 * </pre>
 *
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class HyperbolicTangentTest extends
                                   TestCase
{
  private static final int    BITS = 128;

  /**
   * d/dx tanh(x) at x=1.
   * Expected: sech²(1) = 1 - tanh(1)² ≈ 0.41997434161402614
   */
  public void testTanhDerivative()
  {
    RealFunction f    = express("tanh(t)");
    RealFunction dfdx = f.derivative();

    Real result = dfdx.evaluate(new Real("1", BITS), 1, BITS, new Real());
    assertEquals(0.41997434161402614, result.doubleValue(RoundingMode.Near));
  }

  /**
   * d/dx tanh(2x) at x=1 — chain-rule: 2·sech²(2).
   * Expected: 2 * (1 - tanh(2)²) ≈ 0.14130164970632886
   */
  public void testTanhDerivativeWithLinearArg()
  {
    RealFunction f    = express("tanh(2*t)");
    RealFunction dfdx = f.derivative();

    Real result = dfdx.evaluate(new Real("1", BITS), 1, BITS, new Real());
    assertEquals(0.14130164970632886, result.doubleValue(RoundingMode.Near));
  }

  /**
   * ∫ tanh(x) dx = log(cosh(x)) + C.
   * Verify at x=1: log(cosh(1)) ≈ 0.4337808304830271
   */
  public void testTanhIntegral()
  {
    RealFunction f        = express("tanh(t)");
    RealFunction integral = f.integral();

    Real result = integral.evaluate(new Real("1", BITS), 1, BITS, new Real());
    assertEquals(0.4337808304830271, result.doubleValue(RoundingMode.Near));
  }

  /**
   * ∫ tanh(x) dx at x=0 must be log(cosh(0)) = log(1) = 0.
   */
  public void testTanhIntegralAtZero()
  {
    RealFunction f        = express("tanh(t)");
    RealFunction integral = f.integral();

    Real result = integral.evaluate(new Real("0", BITS), 1, BITS, new Real());
    assertTrue("integral of tanh at 0 should be zero", result.isZero());
  }

  /**
   * Round-trip consistency: the derivative of the integral of tanh should
   * reproduce tanh itself (fundamental theorem of calculus).
   * Test at x = 0.7.
   */
  public void testTanhIntegralDerivativeRoundTrip()
  {
    RealFunction f              = express("tanh(t)");
    RealFunction integral       = f.integral();
    RealFunction roundTrip      = integral.derivative();

    Real         x              = new Real("0.7", BITS);
    Real         tanhDirect     = f.evaluate(x, 1, BITS, new Real());
    Real         tanhRoundTrip  = roundTrip.evaluate(x, 1, BITS, new Real());

    assertEquals(tanhDirect.doubleValue(RoundingMode.Near),
                 tanhRoundTrip.doubleValue(RoundingMode.Near),
                 1e-12);
  }
}
