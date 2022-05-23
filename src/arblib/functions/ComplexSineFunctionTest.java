package arblib.functions;

import static java.lang.Math.pow;
import static java.lang.System.out;

import arblib.Complex;
import arblib.Constants;
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

  }
}
