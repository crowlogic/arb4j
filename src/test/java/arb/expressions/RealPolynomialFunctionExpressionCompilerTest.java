package arb.expressions;

import static arb.RealConstants.oneQuarter;
import static arb.RealConstants.two;
import static arb.RealConstants.π;
import static arb.functions.polynomials.RealPolynomialFunction.express;

import arb.RealConstants;
import arb.RealPolynomial;
import arb.functions.polynomials.RealPolynomialFunction;
import junit.framework.TestCase;

public class RealPolynomialFunctionExpressionCompilerTest extends
                                                          TestCase
{
  public static void testBasic()
  {
    RealPolynomialContext context = new RealPolynomialContext();
    RealPolynomial        x       = new RealPolynomial(1);
    x.set(0, RealConstants.two);
    RealPolynomial y = new RealPolynomial(3);
    context.registerVariable("y", y);
    y.set(1, oneQuarter);
    y.set(2, π);
    RealPolynomialFunction f        = express("x+y", context, false);
    RealPolynomial         z        = f.evaluate(x, 1, RealConstants.prec, new RealPolynomial());
    RealPolynomial         correctZ = new RealPolynomial(3);
    correctZ.set(two, oneQuarter, π);
    System.out.format("x + y = z\n");
    System.out.println("x=" + x);
    System.out.println("y=" + y);
    System.out.println("z=" + z);
    assertEquals(correctZ, z);
  }
}
