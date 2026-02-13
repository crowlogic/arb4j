package arb.functions;

import arb.Real;
import arb.expressions.Context;
import arb.expressions.nodes.unary.InverseFunctionNode;
import arb.functions.real.RealFunction;
import arb.functions.real.RealNullaryFunction;
import junit.framework.TestCase;

public class InverseFunctionNodeTest extends
                                     TestCase
{

  /**
   * a⁻¹ with a as a context variable should parse as multiplicative inverse
   * (a^(-1)), not compositional inverse.
   */
  public void testMultiplicativeInverse()
  {
    var context = new Context(Real.named("a").set(4));
    var f       = RealNullaryFunction.express("a⁻¹", context);
    assertEquals(0.25, f.evaluate(128).doubleValue());
  }

  /**
   * f⁻¹(x) where f is a registered function in the context should parse as the
   * compositional inverse, producing an InverseFunctionNode in the AST.
   */
  public void testCompositionalInverseParsesToInverseFunctionNode()
  {
    var context = new Context();
    RealFunction.express("f:x->x²", context);
    var expr = RealFunction.parse("f⁻¹(x)", context);
    var root = expr.rootNode;
    assertTrue("Root node should be an InverseFunctionNode but was "
               + root.getClass().getSimpleName(),
               root instanceof InverseFunctionNode);
    assertEquals("f", ((InverseFunctionNode<?, ?, ?>) root).forwardFunctionName);
  }
}
