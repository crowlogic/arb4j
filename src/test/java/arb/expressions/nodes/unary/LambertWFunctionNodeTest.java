package arb.expressions.nodes.unary;

import arb.expressions.Expression;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

public class LambertWFunctionNodeTest extends
                                      TestCase
{
  public static void testIt()
  {
    Expression.saveClasses = true;
    var expr = RealFunction.express("W(0,x)");
    assertEquals(0.9182235367998267, expr.eval(2.3));
  }
}
