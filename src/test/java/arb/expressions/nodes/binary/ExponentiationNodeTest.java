package arb.expressions.nodes.binary;

import arb.functions.real.RealFunction;
import junit.framework.TestCase;

public class ExponentiationNodeTest extends
                                    TestCase
{
  public static void testSimplifySquaredSquareRoots()
  {
    var f = RealFunction.parse("x^(1/2)*x^(1/2)");
    f.simplify();
    assertEquals( "x➔x", f.toString() );
  }
}
