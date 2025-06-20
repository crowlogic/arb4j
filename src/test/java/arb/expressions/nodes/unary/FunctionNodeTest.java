package arb.expressions.nodes.unary;

import arb.functions.real.RealFunction;
import junit.framework.TestCase;

public class FunctionNodeTest extends
                              TestCase
{
  public static void testSquareRootSimplificationMulWithVar()
  {
    var f = RealFunction.express("sqrt(x)*sqrt(x)");
    assertEquals("x➔x", f.toString());
  }
  
  public static void testSquareRootSimplificationMulWithConstant()
  {
    var f = RealFunction.express("sqrt(2)*sqrt(2)");
    assertEquals("2", f.toString());
  }
  
  public static void testSquareRootSimplificationDivWithVar()
  {
    var f = RealFunction.express("sqrt(x)/sqrt(x)");
    assertEquals("x➔1", f.toString());
  }
  
  public static void testSquareRootSimplificationDivWithConstant()
  {
    var f = RealFunction.express("sqrt(2)/sqrt(2)");
    assertEquals("1", f.toString());
  }
}
