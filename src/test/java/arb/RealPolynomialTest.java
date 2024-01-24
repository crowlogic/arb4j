package arb;

import static arb.RealConstants.zero;
import static arb.RealConstants.π;

import junit.framework.TestCase;

public class RealPolynomialTest extends
                                TestCase
{
  /**
   * Assert that ∫5x + 10dx=2.5x² + 10x
   */
  public void testIntegral()
  {
    try ( RealPolynomial p = new RealPolynomial(2))
    {
      p.set(10);
      p.set(1, 5);
      RealPolynomial pIntegral = p.integrate(128);

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
      eye.zero();
      eye.identity();
    }
  }

  public static void testLeftShift()
  {
    RealPolynomial p = new RealPolynomial(5);
    p.get(2).set(π);
    RealPolynomial leftShifted = p.shiftLeft(1, new RealPolynomial());
    assertEquals(π, p.get(2));
    assertEquals(zero, p.get(3));
    p.close();
    p = leftShifted;
    assertEquals(π, p.get(3));
    assertEquals(zero, p.get(2));
    p.close();
  }

  public static void testSubtraction()
  {

  }
}
