package arb.functions.complex;

import arb.*;
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

  public static void testUncaughtUndefinedReference()
  {
    boolean caughtException = false;
    try
    {
      
      // should generated undefined reference because m isnt defined in the context nor is it an input variable
      var context = new Context();
      ComplexFunction.express("p:y->pFq([1,3,-3],[1/2],-((1/2)*I)/y)*exp(I*(π*3+y))", context);
      ComplexFunction.express("q:y->pFq([1,3,-3],[1/2],1/2*I/y)*exp(I*(2*π*m-y))", context);
      ComplexFunction g3 =
                         ComplexFunction.express("g3:y->-I*(p(y)-q(y))*(4*3^2-1)*(-1)^(-m)/((4*3^2-2)*y*π)",
                                                 context);
      Complex         y  = g3.eval(2.3, new Complex());
      // System.out.println("y=" + y);
      testComplexHypergeometricFunctionResult(g3);
    }
    catch (CompilerException ce)
    {
      caughtException = true;
      ce.printStackTrace();
    }
    assertTrue("the undefined m reference was not caught when it should have been", caughtException);

  }

  public static void testComplexHypergeometricFunctionSequence2()
  {
    boolean caughtEx = false;
    try
    {
      var context = new Context();
      ComplexFunction.parse("p:y->pFq([1,3,-3],[1/2],-1/2*I/y)*exp(I*(π*3+y))", context);
      ComplexFunction.express("q:y->pFq([1,3,-3],[1/2],1/2*I/y)*exp(I*(2*π*3-y))", context);
      ComplexFunction g3 =
                         ComplexFunction.express("g3:y->-I*(p(y)-q(y))*(4*3^2-1)*(-1)^(-3)/((4*3^2-2)*y*π)",
                                                 context);
      testComplexHypergeometricFunctionResult(g3);

      ComplexFunctionSequence G  =
                                ComplexFunctionSequence.express("G:m->-I*(pFq([1,m,-m],[1/2],-((1/2)*I)/y)*exp(I*(π*m+y))-pFq([1,m,-m],[1/2],((1/2)*I)/y)*exp(I*(2*π*m-y)))*(4*m^2-1)*(-1)^(-m)/((4*m^2-2)*y*π)");
      ComplexFunction         G3 = G.evaluate(3, 128);

      testComplexHypergeometricFunctionResult(G3);
    }
    catch (CompilerException ce)
    {
      caughtEx = true;
      ce.printStackTrace();
    }
    assertFalse(caughtEx);
  }

  protected static void testComplexHypergeometricFunctionResult(ComplexFunction g3)
  {
    testComplexHypergeometricFunctionResult(g3.eval(2.3, new Complex()));
  }

  protected static void testComplexHypergeometricFunctionResult(Complex hmm)
  {
    final double TOL = 1e-15;
    assertEquals(0.0, hmm.re().doubleValue(), TOL);
    assertEquals(-0.2591427090909923, hmm.im().doubleValue(), TOL);
    assertEquals(-0.259142709090993, hmm.im().doubleValue(), TOL);
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
