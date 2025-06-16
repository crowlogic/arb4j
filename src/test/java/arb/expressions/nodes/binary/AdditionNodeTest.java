package arb.expressions.nodes.binary;

import arb.functions.real.RealFunction;
import junit.framework.TestCase;

public class AdditionNodeTest extends
                              TestCase
{
  public static void testAddFractions()
  {
    var f = RealFunction.parse("(1/2)+(1/2)");
    var g = f.simplify();
    System.out.println( "g=" + g );
    assertEquals( "1", f.toString() );
    
  }
}
