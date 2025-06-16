package arb.functions.complex;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.real.RealNullaryFunction;
import junit.framework.TestCase;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ComplexFunctionTest extends
                                 TestCase
{

  public static void testComplexNullaryFunctionSquareRootOfNegativeOne()
  {
    var context = new Context(RealNullaryFunction.express("1/2").evaluate(128, Real.named("v")));
    var f       = ComplexNullaryFunction.express("sqrt(-1)", context);
    var x       = f.evaluate(128);

    System.out.println( "x="+x);
    assertTrue(x.im().isOne());
    assertTrue(x.re().isZero());

  }

}
