package arb.functions;

import static arb.ComplexConstants.π;
import static arb.Constants.ZERO;
import static java.lang.Math.pow;
import static java.lang.System.out;

import arb.Complex;
import arb.Constants;
import arb.ComplexFunction.ConvergenceStatus;
import junit.framework.TestCase;

public class ComplexSineFunctionTest extends
                                     TestCase
{
  public void testEval()
  {
    ComplexSineFunction sin = new ComplexSineFunction();
    Complex             y   = sin.evaluate(Constants.COMPLEX_ONE, 1, 128, new Complex());
    y.printPrecision = true;
    assertEquals(0.841470984807896506652502321630298999620980106, y.getReal().doubleValue(), pow(10, -20));
    assertTrue( y.getImag().isZero() );
  }

  public void testIntegration()
  {
    ComplexSineFunction sin = new ComplexSineFunction();
    ConvergenceStatus integral = sin.integrate(ZERO, π, 0, null, null, 0, new Complex() );
  }
}
