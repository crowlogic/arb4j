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
   * Verify that the derivativeCache grows correctly across calls with
   * increasing order. After order=2 then order=4, the cache must have expanded
   * without recompiling earlier derivatives, and the coefficients must be
   * correct.
   */
  public void testDerivativeCacheGrowth()
  {
    var f = RealFunction.express("t^3+t");

    // f(t) = t^3+t at t=1: f(1)=2, f'(1)=4, f''(1)=6, f'''(1)=6
    // c_0=2, c_1=4, c_2=6/2=3, c_3=6/6=1
    try ( Real point = Real.valueOf(1); Real result2 = Real.newVector(2); Real result4 = Real.newVector(4))
    {
      f.evaluate(point, 2, bits, result2);
      assertEquals("order=2: c_0 = 2", 2.0, result2.get(0).doubleValue(), tol);
      assertEquals("order=2: c_1 = 4", 4.0, result2.get(1).doubleValue(), tol);

      f.evaluate(point, 4, bits, result4);
      assertEquals("order=4: c_0 = 2", 2.0, result4.get(0).doubleValue(), tol);
      assertEquals("order=4: c_1 = 4", 4.0, result4.get(1).doubleValue(), tol);
      assertEquals("order=4: c_2 = 3", 3.0, result4.get(2).doubleValue(), tol);
      assertEquals("order=4: c_3 = 1", 1.0, result4.get(3).doubleValue(), tol);
    }
  }
}
