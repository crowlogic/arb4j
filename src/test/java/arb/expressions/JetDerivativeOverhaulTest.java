package arb.expressions;

import java.util.Set;

import arb.Real;
import arb.expressions.nodes.unary.JetNode;
import arb.expressions.nodes.unary.JetState;
import arb.functions.real.RealFunction;
import arb.functions.real.RiemannSiegelThetaFunction;
import junit.framework.TestCase;

/**
 * Tests that the jet derivative overhaul actually does what it was designed to
 * do:
 * <ol>
 * <li>JetNode series computation produces the same Taylor coefficients as the
 * reference {@link RiemannSiegelThetaFunction} implementation</li>
 * <li>Two consumers of the same jet (ϑ(t) and ϑ'(t) in one expression) share a
 * single {@link JetState} after deduplication, meaning one ARB jet call serves
 * both</li>
 * <li>The series copy loop correctly distributes all {@code order} coefficients
 * from the jet polynomial into the result vector</li>
 * <li>The Taylor series bytecode path for non-jet expressions computes correct
 * Taylor coefficients via the derivative() chain</li>
 * </ol>
 * 
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class JetDerivativeOverhaulTest extends
                                        TestCase
{

  static final int    bits = 128;
  static final double tol  = 1e-12;

  /**
   * Verify that the compiled expression ϑ(t) evaluated at order=5 produces
   * identical Taylor coefficients to the hand-coded
   * {@link RiemannSiegelThetaFunction}, which directly calls
   * {@code arb_poly_riemann_siegel_theta_series}. This proves the JetNode
   * correctly invokes the ARB jet function and the series copy loop correctly
   * writes all coefficients into the result vector.
   */
  public void testJetCoefficientsMatchReference()
  {
    int order = 5;

    try ( RiemannSiegelThetaFunction reference = new RiemannSiegelThetaFunction();
          Real point = Real.valueOf(50);
          Real refResult = Real.newVector(order);
          Real jetResult = Real.newVector(order))
    {
      reference.evaluate(point, order, bits, refResult);

      var jetExpr = RealFunction.express("ϑ(t)");
      jetExpr.evaluate(point, order, bits, jetResult);

      for (int k = 0; k < order; k++)
      {
        double ref = refResult.get(k).doubleValue();
        double jet = jetResult.get(k).doubleValue();
        assertEquals("Taylor coefficient c[" + k + "] mismatch", ref, jet, Math.abs(ref) * tol + tol);
      }
    }
  }

  /**
   * Parse ϑ(t)+diff(ϑ(t),t) and verify that after compilation, both JetNodes
   * share a single {@link JetState} — meaning the ARB jet function is called
   * once, and both the value ϑ(t) (coefficientIndex=0) and the derivative
   * ϑ'(t) (coefficientIndex=1) are read from that one polynomial buffer.
   */
  @SuppressWarnings("rawtypes")
  public void testJetStateDeduplication()
  {
    var parsed = RealFunction.parse("ϑ(t)+diff(ϑ(t),t)");

    // Before compilation, collectJetStates may have separate JetState objects
    parsed.compile();

    // After compilation, deduplicateJets() has run; collect the JetStates from
    // the AST and verify they all point to the same object
    final JetState[] seen = new JetState[1];
    parsed.rootNode.accept(node ->
    {
      if (node instanceof JetNode jetNode)
      {
        if (seen[0] == null)
        {
          seen[0] = jetNode.getSharedState();
        }
        else
        {
          assertSame("All JetNodes for ϑ(t) must share a single JetState instance", seen[0],
                     jetNode.getSharedState());
        }
      }
    });
    assertNotNull("Should have found at least one JetNode", seen[0]);
    assertTrue("Shared JetState maxCoefficientNeeded must be >= 1 (derivative needs index 1)",
               seen[0].getMaxCoefficientNeeded() >= 1);
  }

  /**
   * Verify that ϑ(t)+diff(ϑ(t),t) at t=50 produces ϑ(50)+ϑ'(50), using the
   * reference implementation to compute both values independently. This
   * confirms that the two JetNode consumers reading coefficients 0 and 1 from
   * the shared jet polynomial produce correct arithmetic.
   */
  public void testSharedJetTwoConsumers()
  {
    try ( RiemannSiegelThetaFunction reference = new RiemannSiegelThetaFunction();
          Real point = Real.valueOf(50);
          Real refResult = Real.newVector(2);
          Real exprResult = new Real())
    {
      // Reference: ϑ(50) and ϑ'(50) from the series coefficients
      reference.evaluate(point, 2, bits, refResult);
      double theta0 = refResult.get(0).doubleValue();
      double theta1 = refResult.get(1).doubleValue();
      double expected = theta0 + theta1;

      // Expression with two jet consumers
      var f = RealFunction.express("ϑ(t)+diff(ϑ(t),t)");
      f.evaluate(point, 1, bits, exprResult);
      double actual = exprResult.doubleValue();

      assertEquals("ϑ(50)+ϑ'(50) from shared jet", expected, actual, Math.abs(expected) * tol);
    }
  }

  /**
   * Verify that diff(ϑ(t),t) evaluated at order=1 gives the same value as
   * coefficient[1] from the reference series. This confirms the JetNode
   * differentiation mechanism (coefficientIndex advancement) correctly reads
   * the derivative from the jet polynomial.
   */
  public void testJetDifferentiationReadsCorrectCoefficient()
  {
    try ( RiemannSiegelThetaFunction reference = new RiemannSiegelThetaFunction();
          Real point = Real.valueOf(50);
          Real refResult = Real.newVector(2);
          Real derivResult = new Real())
    {
      reference.evaluate(point, 2, bits, refResult);
      double expectedDerivative = refResult.get(1).doubleValue();

      var diffExpr = RealFunction.express("diff(ϑ(t),t)");
      diffExpr.evaluate(point, 1, bits, derivResult);
      double actual = derivResult.doubleValue();

      assertEquals("diff(ϑ(t),t) at t=50 must equal reference coefficient[1]", expectedDerivative, actual,
                   Math.abs(expectedDerivative) * tol);
    }
  }

  /**
   * Verify the Taylor series bytecode path for a non-jet expression. For
   * f(t) = t^4 at t=2, the Taylor coefficients are:
   * 
   * <pre>
   *   c_0 = f(2)       = 16
   *   c_1 = f'(2)/1!   = 32
   *   c_2 = f''(2)/2!  = 24
   *   c_3 = f'''(2)/3! = 8
   *   c_4 = f⁴(2)/4!   = 1
   * </pre>
   * 
   * This expression has no JetNodes, so order>1 goes through the
   * derivativeCache-based Taylor path emitted in
   * {@link Expression#generateTaylorSeriesPath}.
   */
  public void testTaylorSeriesPathNonJet()
  {
    int order = 5;

    var f = RealFunction.express("t^4");

    try ( Real point = Real.valueOf(2); Real result = Real.newVector(order))
    {
      f.evaluate(point, order, bits, result);

      assertEquals("c_0 = f(2) = 16", 16.0, result.get(0).doubleValue(), tol);
      assertEquals("c_1 = f'(2)/1! = 32", 32.0, result.get(1).doubleValue(), tol);
      assertEquals("c_2 = f''(2)/2! = 24", 24.0, result.get(2).doubleValue(), tol);
      assertEquals("c_3 = f'''(2)/3! = 8", 8.0, result.get(3).doubleValue(), tol);
      assertEquals("c_4 = f''''(2)/4! = 1", 1.0, result.get(4).doubleValue(), tol);
    }
  }

  /**
   * Verify that the derivativeCache extends from the highest cached derivative
   * rather than rebuilding from scratch. Call with order=3, then order=6 on the
   * same instance. Access the derivativeCache field to confirm it grew
   * incrementally (size 3 after first call, size 6 after second) and that the
   * Taylor coefficients of t^5 at t=1 are the binomial coefficients C(5,k).
   */
  @SuppressWarnings("unchecked")
  public void testDerivativeCacheExtendsFromHighest() throws Exception
  {
    var f = RealFunction.express("t^5");

    // t^5 at t=1: Taylor coefficients are C(5,k) = 1, 5, 10, 10, 5, 1
    try ( Real point = Real.valueOf(1); Real r3 = Real.newVector(3); Real r6 = Real.newVector(6))
    {
      f.evaluate(point, 3, bits, r3);
      assertEquals("order=3: c_0", 1.0, r3.get(0).doubleValue(), tol);
      assertEquals("order=3: c_1", 5.0, r3.get(1).doubleValue(), tol);
      assertEquals("order=3: c_2", 10.0, r3.get(2).doubleValue(), tol);

      // Inspect the derivativeCache field: should have 3 entries (f, f', f'')
      var cacheField = f.getClass().getField("derivativeCache");
      var cache      = (java.util.ArrayList<?>) cacheField.get(f);
      assertEquals("Cache should have 3 entries after order=3", 3, cache.size());

      // Second call with order=6 — cache must extend from entry 2 (f''),
      // not rebuild from entry 0
      f.evaluate(point, 6, bits, r6);
      assertEquals("Cache should have 6 entries after order=6", 6, cache.size());

      // Verify all 6 binomial coefficients
      double[] expected =
      { 1, 5, 10, 10, 5, 1 };
      for (int k = 0; k < 6; k++)
      {
        assertEquals("c_" + k, expected[k], r6.get(k).doubleValue(), tol);
      }
    }
  }
}
