package arb.functions.complex;

import java.io.File;

import arb.*;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.CompilerException;
import arb.expressions.Context;
import arb.functions.integer.ComplexFunctionSequence;
import arb.functions.real.RealNullaryFunction;
import arb.utensils.Utensils;
import junit.framework.TestCase;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ComplexFunctionTest extends
                                 TestCase
{
  public static void testComplexIntegralFunction()
  {
    ComplexFunction f       = ComplexFunction.express("x->int(t➔t^(5.3+x), t=-1..1)");
    Complex         correct = f.evaluate(ComplexConstants.zero, 0, 128, new Complex());
    assertEquals("0.0654309123345280747351260389461789256 +/- 3.37e-38 + i*-0.1284153959325313371590941932036220728 +/- 4.42e-38",
                 correct.toString());
  }

  public static void testRiemannZeroCountingFunction()
  {

    var N =
          ComplexFunction.express("N:(-((lnΓ(¼+t*I/2) - lnΓ(¼-t*I/2))*I)/2 -ln(π)*t/2)/π + 1 - I*((ln(ζ(½+I*t)) - ln(ζ(½-I*t))))/(2*π)");
    var n = N.re().realPart();
    assertEquals(0.0, n.eval(2.3), 10e-9);
    assertEquals(1.0, n.eval(14.4), 10e-9);
    assertEquals(2.0, n.eval(21.5), 10e-9);

  }

  public static void testSequence2()
  {
    boolean caughtEx = false;
    try
    {
      var context = new Context();

      var F       =
            ComplexFunctionSequence.express("F:m->-I*(pFq([1,m,-m],[1/2],-((1/2)*I)/y)*exp(I*(π*m+y))-pFq([1,m,-m],[1/2],((1/2)*I)/y)*exp(I*(2*π*m-y)))*(4*m^2-1)*(-1)^(-m)/((4*m^2-2)*y*π)",
                                            context);
      var x       = F.evaluate(3, 128);

      var hmm     = x.eval(2.3, new Complex());
      System.out.println( "Wrote " + Utensils.saveToYamlFormat(new File("x.yaml"), x) );
      assertEquals("-0.260039398565575",hmm.toString());

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
