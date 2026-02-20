package arb.expressions.nodes;

import arb.Real;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne for © terms
 */
public class FractionalDerivativeNodeTest extends
                                          TestCase
{
  public static void testFractionalDerivativeParsing()
  {
    var expr = RealFunction.parse("t➔Đ^(1/2)sin(t)");
    assertTrue("expr.rootNode="
               + expr.rootNode.getClass()
               + " should be a CaputoFractionalDerivativeNode",
               expr.rootNode instanceof CaputoFractionalDerivativeNode);
    CaputoFractionalDerivativeNode<Real, Real, RealFunction> fracDiffNode =
                                                                          (CaputoFractionalDerivativeNode<Real, Real, RealFunction>) expr.rootNode;

    assertEquals("1/2", fracDiffNode.exponent.toString());
    assertEquals("sin(t)", fracDiffNode.operand.toString());

  }

}
