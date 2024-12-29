package arb.expressions;

import static arb.RealConstants.*;
import static arb.functions.polynomials.RealPolynomialFunction.express;

import arb.RealConstants;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.polynomials.RealPolynomialFunction;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealPolynomialFunctionExpressionCompilerTest extends
                                                          TestCase
{
  public static void testAdd()
  {
    Context context = new Context();
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

      assertEquals(correctZ, z);
    }
  }

  public static void testSub()
  {
    Context        context = new Context();
    RealPolynomial x       = new RealPolynomial(1);
    x.set(0, RealConstants.two);
    RealPolynomial y = new RealPolynomial(3);
    context.registerVariable("y", y);
    y.set(1, oneQuarter);
    y.set(2, π);
    RealPolynomialFunction f        = express("x-y", context, false);
    RealPolynomial         z        = f.evaluate(x, 1, RealConstants.prec, new RealPolynomial());
    RealPolynomial         correctZ = new RealPolynomial(3);
    correctZ.set(two, oneQuarter, π).neg().get(0).neg();

    assertEquals(correctZ, z);
  }

  public static void testMul()
  {
    Context context = new Context();
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

      assertEquals(correctZ, z);
    }
  }

}
