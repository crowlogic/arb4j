package arb;

import static arb.RealConstants.zero;
import static arb.RealConstants.π;

import junit.framework.TestCase;

public class RealPolynomialTest extends
                                TestCase
{
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
