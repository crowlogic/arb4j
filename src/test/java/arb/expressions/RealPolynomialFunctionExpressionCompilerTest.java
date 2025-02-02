package arb.expressions;

import static arb.RealConstants.*;
import static arb.functions.polynomials.RealPolynomialFunction.express;

import arb.RealConstants;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.polynomials.RealPolynomialFunction;
import arb.functions.polynomials.orthogonal.real.JacobiPolynomials;
import arb.functions.real.RealFunction;
import arb.functions.real.RealNullaryFunction;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealPolynomialFunctionExpressionCompilerTest extends
                                                          TestCase
{
  public static void testDerivativeOfPolynomial()
  {
    var context = new Context();
    var P = new JacobiPolynomials(RealConstants.negHalf, RealConstants.negHalf);
    var y = P.evaluate(4, 128);
    var ymapping = context.registerFunction("y",y);
    var yd = RealFunction.express("diff(y(x),x)",context);
    var f = RealNullaryFunction.express("yd(0.75)",context);
    var z = f.eval();
    System.out.format("P4(-1/2,-1/2,0.75)=%s\n", z );
    
  }
  
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
