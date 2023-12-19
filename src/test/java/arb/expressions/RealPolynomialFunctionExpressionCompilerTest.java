package arb.expressions;

import static arb.RealConstants.*;
import static arb.functions.polynomials.RealPolynomialFunction.express;
import static java.lang.System.out;

import arb.RealConstants;
import arb.RealPolynomial;
import arb.functions.polynomials.RealPolynomialFunction;
import junit.framework.TestCase;

public class RealPolynomialFunctionExpressionCompilerTest extends
                                                          TestCase
{
  public static void testAdd()
  {
    RealPolynomialContext context = new RealPolynomialContext();
    try ( var x = new RealPolynomial(1); var y = new RealPolynomial(3); var z = new RealPolynomial();
          var correctZ = new RealPolynomial(3))
    {
      correctZ.set(two, oneQuarter, π);
      context.registerVariable("y", y);
      var f = express("x+y", context, false);

      x.set(0, two);
      y.set(1, oneQuarter);
      y.set(2, π);
      f.evaluate(x, 1, RealConstants.prec, z);

      out.format("x + y = z\n");
      out.println("x=" + x);
      out.println("y=" + y);
      out.println("z=" + z);
      out.flush();

      assertEquals(correctZ, z);
    }
  }

  public static void testSub()
  {
    RealPolynomialContext context = new RealPolynomialContext();
    RealPolynomial        x       = new RealPolynomial(1);
    x.set(0, RealConstants.two);
    RealPolynomial y = new RealPolynomial(3);
    context.registerVariable("y", y);
    y.set(1, oneQuarter);
    y.set(2, π);
    RealPolynomialFunction f        = express("x-y", context, false);
    RealPolynomial         z        = f.evaluate(x, 1, RealConstants.prec, new RealPolynomial());
    RealPolynomial         correctZ = new RealPolynomial(3);
    correctZ.set(two, oneQuarter, π).neg().get(0).neg();
    out.format("x - y = z\n");
    out.println("x=" + x);
    out.println("y=" + y);
    out.println("z=" + z);
    out.flush();
    assertEquals(correctZ, z);
  }

  public static void testMul()
  {
    RealPolynomialContext context = new RealPolynomialContext();
    try ( var x = new RealPolynomial(1); var y = new RealPolynomial(3); var z = new RealPolynomial();
          var correctZ = new RealPolynomial(3))
    {
      correctZ.set(zero, half, twoπ);
      context.registerVariable("y", y);
      var f = express("x*y", context, false);

      x.set(0, two);
      y.set(1, oneQuarter);
      y.set(2, π);
      f.evaluate(x, 1, RealConstants.prec, z);

      out.format("x * y = z\n");
      out.println("x=" + x);
      out.println("y=" + y);
      out.println("z=" + z);
      out.flush();

      assertEquals(correctZ, z);
    }
  }

  public static void testDivisionWithRemainder()
  {
    RealPolynomialContext context = new RealPolynomialContext();
    try ( var x = new RealPolynomial(1); var y = new RealPolynomial(3); var z = new RealPolynomial();)
    {
      context.registerVariable("y", y);
      var f = express("x/y", context, false);

      x.set(0, two);
      y.set(0, RealConstants.πsquared);
      y.set(1, oneQuarter);
      y.set(2, π);
      f.evaluate(x, 1, RealConstants.prec, z);

      out.format("x / y = z\n");
      out.println("x=" + x);
      out.println("y=" + y);
      out.println("z=" + z);
      out.flush();

      assertTrue(z.isZero());
      assertEquals(x, z.remainder);
    }
  }
}
