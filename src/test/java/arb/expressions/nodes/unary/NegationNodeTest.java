package arb.expressions.nodes.unary;

import arb.functions.real.RealFunction;
import junit.framework.TestCase;

public class NegationNodeTest extends
                              TestCase
{
  public void testDoubleNegative()
  {
    var expr1 = RealFunction.parse("-(-(1))");
    var expr2 = RealFunction.parse("1");
    
    assertEquals(expr1.toString(), expr2.toString());
  }
}
