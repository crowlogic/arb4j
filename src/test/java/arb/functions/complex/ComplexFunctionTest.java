package arb.functions.complex;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.CompilerException;
import arb.expressions.Context;
import arb.functions.integer.ComplexFunctionSequence;
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

  public static void testSequence2()
  {
    boolean caughtEx = false;
    try
    {
      var context = new Context();

      var F       =
            ComplexFunctionSequence.express("m->-I*(pFq([1,m,-m],[1/2],-((1/2)*I)/y)*exp(I*(π*m+y))-pFq([1,m,-m],[1/2],((1/2)*I)/y)*exp(I*(2*π*m-y)))*(4*m^2-1)*(-1)^(-m)/((4*m^2-2)*y*π)",
                                            context);
      var x       = F.evaluate(3, 128);

      var hmm     = x.eval(2.3, new Complex());
      assertTrue(hmm.toString().startsWith("-0.260039398565575"));

    }
    catch (CompilerException ce)
    {
      caughtEx = true;
      ce.printStackTrace();
    }
    assertFalse(caughtEx);
  }

  public static void testComplexNullaryFunctionSquareRootOfNegativeOne()
  {
    var context = new Context(RealNullaryFunction.express("1/2").evaluate(128, Real.named("v")));
    var f       = ComplexNullaryFunction.express("sqrt(-1)", context);
    var x       = f.evaluate(128);

    assertTrue(x.im().isOne());
    assertTrue(x.re().isZero());

  }

}
