package arb.expressions.nodes.binary;

import arb.functions.real.RealFunction;
import junit.framework.TestCase;

public class SubtractionNodeTest extends
                                 TestCase
{
  public static void testNegationNodeSubtractionIsAddition()
  {
    var f = RealFunction.express("t-(-1)");
    assertEquals( "t➔t+1", f.toString() );   
  }
}
