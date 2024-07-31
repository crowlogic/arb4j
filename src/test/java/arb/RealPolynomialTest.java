package arb;

import static arb.RealConstants.zero;
import static arb.RealConstants.π;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealPolynomialTest
                                extends
                                TestCase
{
  public void testSetFraction()
  {
    try ( var r = new RealPolynomial(); var f = new Fraction();)
    {
      r.set(f.set("10/43"));
      assertEquals(0.23255813953488372093, r.get(0).doubleValue());
    }
  }

  public void testPower()
  {
    try ( var p = RealPolynomial.newIdentityPolynomial(); var r = new RealPolynomial())
    {
      var pSquared = p.pow(new Integer(2), 128, r);
      assertEquals("x²", pSquared.toString());
    }
  }

  /**
   * Assert that ∫5x + 10dx=2.5x² + 10x
   */
  public void testIntegral()
  {
    try ( RealPolynomial p = new RealPolynomial(2))
    {
      p.set(10);
      p.set(1, 5);
      RealPolynomial pIntegral = p.integrate(128, new RealPolynomial());

      assertEquals(2.5, pIntegral.get(2).doubleValue());
      assertEquals(10.0, pIntegral.get(1).doubleValue());

    }

  }

  /**
   * Assert that ∫5x + 10dx=2.5x² + 10x
   */
  public void testDifferentiateIntegral()
  {
    try ( RealPolynomial p = new RealPolynomial(2))
    {
      p.set(10);
      p.set(1, 5);
      RealPolynomial pIntegral = p.integrate(128, new RealPolynomial());
      RealPolynomial pToo      = pIntegral.differentiate(128, new RealPolynomial());

      assertEquals(5.0, pToo.get(1).doubleValue());
      assertEquals(10.0, pToo.get(0).doubleValue());
      assertEquals(2.5, pIntegral.get(2).doubleValue());
      assertEquals(10.0, pIntegral.get(1).doubleValue());

    }

  }

  public void testSetInt()
  {

    try ( RealPolynomial p = new RealPolynomial(1))
    {
      p.set(10);
      assertEquals(10.0, p.get(0).doubleValue());
    }

  }

  public static void testIdentity()
  {
    try ( RealPolynomial eye = new RealPolynomial())
    {
      eye.identity();
    }
  }

  public static void testLeftShift()
  {
    RealPolynomial p = new RealPolynomial(5);
    p.get(2).set(π);
    RealPolynomial leftShifted = p.shiftLeft(1, new RealPolynomial());
    assertEquals(π, p.get(2));
    assertEquals(π, leftShifted.get(3));
    assertEquals(zero, p.get(3));
    p.close();
    p = leftShifted;
    assertEquals(π, p.get(3));
    assertEquals(zero, p.get(2));
    p.close();
  }

  public static void testLeftShiftAliased()
  {
    RealPolynomial p = new RealPolynomial(5);
    p.get(2).set(π);
    assertEquals(π, p.get(2));

    RealPolynomial leftShifted = p.shiftLeft(1);
    assertEquals(π, p.get(3));
    assertEquals(zero, p.get(4));
    p.close();
    p = leftShifted;
    assertEquals(π, p.get(3));
    assertEquals(zero, p.get(2));
    p.close();
  }

}
