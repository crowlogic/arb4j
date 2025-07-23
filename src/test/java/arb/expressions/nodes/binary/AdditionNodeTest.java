package arb.expressions.nodes.binary;

import arb.functions.real.RealFunction;
import junit.framework.TestCase;

public class AdditionNodeTest extends
                              TestCase
{
  public static void testAddFractions()
  {
    var f = RealFunction.express("(1/2)+(1/2)");
    assertEquals( "1", f.toString() );
    
  }
  
  public static void testNegationNodeAdditionIsSubstraction()
  {
    var f = RealFunction.express("t+(-1)");
    assertEquals( "t➔t-1", f.toString() );
    
  }
}
