package arb.expressions.nodes;

import arb.Real;
import arb.RealConstants;
import arb.functions.RealFunctional;
import arb.functions.integer.RealFunctionSequence;
import arb.functions.integer.RealFunctionalSequence;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * @author Stephen Crowley ©2024-2025
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
    assertEquals(6.9, value);
  }

  public static void testRealFunctionalSequenceOfFractionalMonomialDerivatives()
  {
    var            f      = RealFunctionalSequence.express("f:n->q->t->fracdiff(t^n,t^q)");
    RealFunctional f3     = f.apply(3);
    RealFunction   f3half = f3.evaluate(RealConstants.half, 128);
    double         y      = f3half.eval(2.3);
    assertEquals(5.6, y);
  }

  public static void testRealFunctionalSequenceOfFractionalMonomialDerivatives2()
  {
    var            f      = RealFunctionalSequence.express("f:n->t->q->fracdiff(t^n,t^q)");
    RealFunctional f3     = f.apply(3);
    RealFunction   f3half = f3.evaluate(RealConstants.half, 128);
    double         y      = f3half.eval(2.3);
    assertEquals(5.6, y);
  }

  public static void testFractionalDerivativeParsing()
  {
    var expr = RealFunction.parse("t➔Đ^(1/2)sin(t)");
    assertTrue("expr.rootNode="
               + expr.rootNode.getClass()
               + " should be a CaputoFractionalDerivativeNode",
               expr.rootNode instanceof CaputoFractionalDerivativeNode);
    CaputoFractionalDerivativeNode<Real, Real, RealFunction> fracDiffNode =
                                                                          (CaputoFractionalDerivativeNode<Real, Real, RealFunction>) expr.rootNode;

    assertEquals("1/2", fracDiffNode.order.toString());
    assertEquals("sin(t)", fracDiffNode.operand.toString());

  }

}
