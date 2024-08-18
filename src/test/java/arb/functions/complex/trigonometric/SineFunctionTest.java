package arb.functions.complex.trigonometric;

import static java.lang.Math.pow;

import arb.Complex;
import arb.ComplexConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("resource")
public class SineFunctionTest extends
                              TestCase
{
  public void testEval()
  {
    SineFunction sin = new SineFunction();
    Complex      y   = sin.evaluate(ComplexConstants.one, 1, 128, new Complex());
    y.printPrecision = true;
    assertEquals(0.8414709848078965, y.getReal().doubleValue(), pow(10, -20));
    assertTrue(y.getImag().isZero());
  }

}
