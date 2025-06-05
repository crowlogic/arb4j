package arb.expressions.nodes.unary;

import arb.functions.real.RealFunction;
import junit.framework.TestCase;

public class FunctionNodeTest extends
                              TestCase
{
  public static void testSquareRootSimplification()
  {
    var f = RealFunction.parse("sqrt(x)*sqrt(x)");
    f.simplify();
    assertEquals( "x➔x", f.toString() );
  }
}
