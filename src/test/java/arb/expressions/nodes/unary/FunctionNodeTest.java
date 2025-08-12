package arb.expressions.nodes.unary;

import arb.Real;
import arb.expressions.Expression;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

public class FunctionNodeTest extends
                              TestCase
{
  public static void testDerivativeOfImaginaryPartIsRealZero()
  {
    Expression.trace=true;
    Expression<Real, Real, RealFunction> fexpr = RealFunction.parse("diff(im(cos(I*t)),t)");
   // Expression<Real, Real, RealFunction> fexpr = RealFunction.parse("im(diff(cos(I*t),t))");
    
    assertEquals(Real.class, fexpr.rootNode.type());
    RealFunction f = fexpr.instantiate();
    assertEquals("0", f.toString());
  }

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
