package arb.functions.complex;

import static arb.ComplexConstants.π;
import static java.lang.Math.pow;

import arb.*;
import junit.framework.TestCase;

public class ComplexSineFunctionTest extends
                                     TestCase
{
  public void testEval()
  {
    ComplexSineFunction sin = new ComplexSineFunction();
    Complex             y   = sin.evaluate(ComplexConstants.complexOne, 1, 128, new Complex());
    y.printPrecision = true;
    assertEquals(0.841470984807896506652502321630298999620980106, y.getReal().doubleValue(), pow(10, -20));
    assertTrue(y.getImag().isZero());
  }

  @SuppressWarnings("resource")
  public void testIntegration() 
  {
    ComplexSineFunction sine                       = new ComplexSineFunction();
    Magnitude           absoluteErrorToleranceGoal = new Magnitude().set(Math.pow(2, -77));
    IntegrationOptions  options                    = new IntegrationOptions();
    int                 relativeAccuracyBitsGoal   = 80;
    int                 precisionBits              = 160;
    options.verbose = true;
    Complex two      = sine.integrate(ComplexConstants.ZERO,
                                      π,
                                      relativeAccuracyBitsGoal,
                                      absoluteErrorToleranceGoal,
                                      options,
                                      precisionBits,
                                      new Complex());
    Real    realPart = two.getReal();
    Real    imagPart = two.getImag();
    assertEquals(2, realPart.getMid().doubleValue(RoundingMode.Near), realPart.getRad().doubleValue());
    assertEquals(0, imagPart.getMid().doubleValue(), imagPart.getRad().doubleValue());

    two.printPrecision = true;
    // two.getReal().toString()
    System.out.println(two + " should equal 2");

  }
}
