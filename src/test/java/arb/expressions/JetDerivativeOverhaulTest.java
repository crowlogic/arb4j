package arb.expressions;

import arb.Real;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Tests for the jet derivative overhaul:
 * <ol>
 * <li>Multi-order Taylor series bytecode path for non-jet expressions</li>
 * <li>JetNode memoization — shared series computation across consumers</li>
 * <li>DerivativeCache correctness — factorial division at higher orders</li>
 * </ol>
 * 
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class JetDerivativeOverhaulTest extends
                                        TestCase
{

  /**
   * Test the Taylor series bytecode path on a non-jet expression.
   * 
   * f(t) = t^3 + 2*t^2 + 3*t + 4
   * 
   * At t = 1:
   *   f(1)   = 1 + 2 + 3 + 4 = 10
   *   f'(t)  = 3*t^2 + 4*t + 3, f'(1) = 10
   *   f''(t) = 6*t + 4,         f''(1) = 10
   * 
   * Taylor coefficients: c_k = f^(k)(1) / k!
   *   c_0 = 10
   *   c_1 = 10
   *   c_2 = 10/2 = 5
   */
  public void testTaylorSeriesPathPolynomial()
  {
    int precision = 128;
    int order     = 3;

    var f = RealFunction.express("t^3+2*t^2+3*t+4");

    try ( Real point = Real.valueOf(1); Real result = Real.newVector(order))
    {
      f.evaluate(point, order, precision, result);

      assertEquals("c_0 = f(1) = 10", 10.0, result.get(0).doubleValue());
      assertEquals("c_1 = f'(1)/1! = 10", 10.0, result.get(1).doubleValue());
      assertEquals("c_2 = f''(1)/2! = 5", 5.0, result.get(2).doubleValue());
    }
  }

  /**
   * Test Taylor path at a non-unity evaluation point.
   * 
   * f(t) = t^4 at t = 2:
   *   f(2)    = 16
   *   f'(t)   = 4*t^3,     f'(2)   = 32
   *   f''(t)  = 12*t^2,    f''(2)  = 48
   *   f'''(t) = 24*t,      f'''(2) = 48
   *   f''''(t)= 24,        f''''(2)= 24
   * 
   * Taylor coefficients:
   *   c_0 = 16
   *   c_1 = 32
   *   c_2 = 48/2 = 24
   *   c_3 = 48/6 = 8
   *   c_4 = 24/24 = 1
   */
  public void testTaylorSeriesPathHigherOrder()
  {
    int precision = 128;
    int order     = 5;

    var f = RealFunction.express("t^4");

    try ( Real point = Real.valueOf(2); Real result = Real.newVector(order))
    {
      f.evaluate(point, order, precision, result);

      assertEquals("c_0 = f(2) = 16", 16.0, result.get(0).doubleValue());
      assertEquals("c_1 = f'(2)/1! = 32", 32.0, result.get(1).doubleValue());
      assertEquals("c_2 = f''(2)/2! = 24", 24.0, result.get(2).doubleValue());
      assertEquals("c_3 = f'''(2)/3! = 8", 8.0, result.get(3).doubleValue());
      assertEquals("c_4 = f''''(2)/4! = 1", 1.0, result.get(4).doubleValue());
    }
  }

  /**
   * Test that JetNode memoization works: evaluating a jet-bearing expression
   * with order > 1 should produce correct results (the JetNode computes the
   * series once per evaluate() call via the evalStamp mechanism).
   * 
   * Uses ϑ(t) (Riemann-Siegel theta) at t = 50, order = 3. Verifies that
   * the result has non-trivial values in all coefficient slots.
   */
  public void testJetNodeMemoization()
  {
    int precision = 128;
    int order     = 3;

    var theta = RealFunction.express("ϑ(t)");

    try ( Real point = Real.valueOf(50); Real result = Real.newVector(order))
    {
      theta.evaluate(point, order, precision, result);

      // c_0 = ϑ(50)
      double c0 = result.get(0).doubleValue();
      assertTrue("ϑ(50) should be near 26.46, got " + c0, Math.abs(c0 - 26.46) < 0.1);

      // c_1 = ϑ'(50) / 1! — should be nonzero
      double c1 = result.get(1).doubleValue();
      assertTrue("ϑ'(50)/1! should be nonzero, got " + c1, Math.abs(c1) > 1e-10);

      // c_2 = ϑ''(50) / 2! — should be nonzero
      double c2 = result.get(2).doubleValue();
      assertTrue("ϑ''(50)/2! should be nonzero, got " + c2, Math.abs(c2) > 1e-10);
    }
  }

  /**
   * Test that the derivativeCache is populated correctly across repeated calls
   * with increasing order. After calling with order=2 then order=4, the cache
   * should have grown to hold derivatives 0..3 without recompiling earlier ones.
   */
  public void testDerivativeCacheGrowth()
  {
    int precision = 128;

    var f = RealFunction.express("t^3+t");

    try ( Real point = Real.valueOf(1); Real result2 = Real.newVector(2); Real result4 = Real.newVector(4))
    {
      // f(t) = t^3 + t at t=1
      // f(1) = 2, f'(1) = 4, f''(1) = 6, f'''(1) = 6
      // c_0=2, c_1=4, c_2=3, c_3=1

      // First call with order=2
      f.evaluate(point, 2, precision, result2);
      assertEquals("c_0 = 2", 2.0, result2.get(0).doubleValue());
      assertEquals("c_1 = 4", 4.0, result2.get(1).doubleValue());

      // Second call with order=4 — cache should grow, not fail
      f.evaluate(point, 4, precision, result4);
      assertEquals("c_0 = 2", 2.0, result4.get(0).doubleValue());
      assertEquals("c_1 = 4", 4.0, result4.get(1).doubleValue());
      assertEquals("c_2 = f''(1)/2! = 6/2 = 3", 3.0, result4.get(2).doubleValue());
      assertEquals("c_3 = f'''(1)/3! = 6/6 = 1", 1.0, result4.get(3).doubleValue());
    }
  }

  /**
   * Verify that the order=1 path still works unchanged (no regression).
   */
  public void testOrder1Unchanged()
  {
    int precision = 128;

    var f = RealFunction.express("t^2+1");

    try ( Real point = Real.valueOf(3); Real result = new Real())
    {
      f.evaluate(point, 1, precision, result);
      assertEquals("f(3) = 10", 10.0, result.doubleValue());
    }
  }
}
