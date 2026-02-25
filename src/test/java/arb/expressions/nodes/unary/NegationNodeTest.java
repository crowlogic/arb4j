package arb.expressions.nodes.unary;

import arb.Integer;
import arb.functions.real.RealFunction;
import arb.functions.real.RealNullaryFunction;
import junit.framework.TestCase;

public class NegationNodeTest extends
                              TestCase
{
  public static void testNegationNodeEvaluate()
  {
    var F = RealNullaryFunction.parse("-2.3");
    var f = F.instantiate();
    var x = F.rootNode;
    var y = x.ceil().evaluate(Integer.class, 128, new Integer());
    assertEquals("3", y.toString());
  }

  public void testDoubleNegative()
  {
    var expr1 = RealFunction.parse("-(-(1))");
    var expr2 = RealFunction.parse("1");

    assertEquals(expr1.toString(), expr2.toString());
  }
}
