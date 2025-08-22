package arb.expressions.nodes.unary;

import arb.Complex;
import arb.Real;
import arb.expressions.Expression;
import arb.functions.RealToComplexFunction;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

public class FunctionNodeTest extends
                              TestCase
{
  public static void testDerivativeOfImaginaryPartIsRealZero()
  {
    // Expression.trace=true;
    Expression<Real,
                  Complex,
                  RealToComplexFunction> fexpr =
                                               RealToComplexFunction.parse("diff(im(cos(I*t)),t)");
    assertEquals(Real.class, fexpr.rootNode.type());
    RealToComplexFunction f = fexpr.instantiate();

    var                   g = f.eval(2.3, new Complex());
    assertTrue(g.toString(), g.isZero());

    g = f.eval(3.4, g);
    assertTrue(g.toString(), g.isZero());
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
