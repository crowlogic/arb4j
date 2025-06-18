package arb.expressions.nodes.unary;

import arb.functions.real.RealFunction;
import junit.framework.TestCase;

public class FunctionNodeTest extends
                              TestCase
{
  public static void testSquareRootSimplification()
  {
    var f = RealFunction.express("sqrt(x)*sqrt(x)");
    assertEquals("x➔x", f.toString());
  }
}
