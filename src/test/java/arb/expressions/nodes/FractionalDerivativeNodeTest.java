package arb.expressions.nodes;

import arb.RealConstants;
import arb.functions.RealFunctional;
import arb.functions.integer.RealFunctionSequence;
import arb.functions.integer.RealFunctionalSequence;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne for © terms
 */
public class FractionalDerivativeNodeTest extends
                                          TestCase
{
  public void testRealFunctionSequenceOfFixedFractionalMonomialDerivative()
  {
    var          seq      = RealFunctionSequence.express("n->t->fracdiff(t^n,t^½)");
    RealFunction function = seq.apply(3);
    double       value    = function.eval(2.3);
    assertEquals(14.484203969691649, value, 1e-6);
  }

  public static void testRealFunctionalSequenceOfFractionalMonomialDerivatives()
  {
    var            f      = RealFunctionalSequence.express("f:n->q->t->fracdiff(t^n,t^q)");
    RealFunctional f3     = f.apply(3);
    RealFunction   f3half = f3.evaluate(RealConstants.half, 128);
    double         y      = f3half.eval(2.3);
    assertEquals(14.484203969691649, y, 1e-6);
  }

  public static void testRealFunctionalSequenceOfFractionalMonomialDerivatives2()
  {
    var            f      = RealFunctionalSequence.express("f:n->t->q->fracdiff(t^n,t^q)");
    RealFunctional f3     = f.apply(3);
    RealFunction   f3half = f3.evaluate(RealConstants.half, 128);
    double         y      = f3half.eval(2.3);
    assertEquals(4.064798369795109, y, 1e-6);
  }

  public static void testMittagLefflerDirect()
  {
    // E_{2,1}(-1) = cos(1) ≈ 0.5403
    var    e21 = RealFunction.express("t➔ℰ(2,1,-t^2)");
    double v21 = e21.eval(1.0);
    assertEquals(Math.cos(1.0), v21, 1e-6);

    // E_{2,3/2}(-1)
    var    e232 = RealFunction.express("t➔ℰ(2,3/2,-t^2)");
    double v232 = e232.eval(1.0);
    assertTrue("E(2,3/2,-1) should be positive and finite, got " + v232, v232 > 0 && Double.isFinite(v232));

    // t^(1/2) * E(2, 3/2, -t^2) at t=1 should equal Đ^(1/2)sin(1)
    var    combined = RealFunction.express("t➔t^(1/2)*ℰ(2,3/2,-t^2)");
    double vc       = combined.eval(1.0);
    assertTrue("Combined should be positive and finite, got " + vc, vc > 0 && Double.isFinite(vc));
  }

  public static void testFractionalDerivativeParsing()
  {
    // Đ^(1/2)sin(t) = t^(1/2) · E_{2, 3/2}(-t²) via Mittag-Leffler closed form
    var    f      = RealFunction.express("t➔Đ^(1/2)sin(t)");
    var    g      = RealFunction.express("t➔t^(1/2)*ℰ(2,3/2,-t^2)");
    double value  = f.eval(1.0);
    double direct = g.eval(1.0);
    assertEquals(direct, value, 1e-10);
    assertEquals(0.8460567867240202, value, 1e-6);
  }

}
