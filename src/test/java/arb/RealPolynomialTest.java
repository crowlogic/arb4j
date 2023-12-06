package arb;

import static arb.RealConstants.*;
import static java.lang.System.out;

import junit.framework.TestCase;

public class RealPolynomialTest extends
                                TestCase
{
  public void testMul()
  {
    try ( RealPolynomial x = new RealPolynomial(1))
    {
      x.get(0).set(one);
      assertTrue(x.get(0).isExact());
      out.println( "x=" + x );
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
