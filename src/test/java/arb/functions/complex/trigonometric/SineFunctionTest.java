package arb.functions.complex.trigonometric;

import static arb.ComplexConstants.π;
import static java.lang.Math.pow;

import arb.Complex;
import arb.ComplexConstants;
import arb.IntegrationOptions;
import arb.Magnitude;
import arb.Real;
import arb.RealConstants;
import arb.RoundingMode;
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

  public synchronized void testIntegration()
  {
    SineFunction       sine                       = new SineFunction();
    Magnitude          absoluteErrorToleranceGoal = new Magnitude().set(Math.pow(2, -77));
    IntegrationOptions options                    = new IntegrationOptions();
    int                relativeAccuracyBitsGoal   = 80;
    int                precisionBits              = 160;
    options.verbose = true;
    assertEquals(3.14, π.getReal().doubleValue(), 0.01);
    Complex res = new Complex();
    res.printPrecision           = true;
    res.getReal().printPrecision = true;
    Complex two      = sine.realPart()
                           .integrate(RealConstants.zero, RealConstants.π, relativeAccuracyBitsGoal,
                                      absoluteErrorToleranceGoal, options, precisionBits, res);
    Real    realPart = two.getReal();
    Real    imagPart = two.getImag();
    assertEquals(2, realPart.getMid().doubleValue(RoundingMode.Near), realPart.getRad().doubleValue());
    assertEquals(0, imagPart.getMid().doubleValue(), imagPart.getRad().doubleValue());

    two.printPrecision = true;
    // two.getReal().toString()

  }
}
