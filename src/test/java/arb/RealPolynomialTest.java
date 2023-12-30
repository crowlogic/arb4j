package arb;

import static arb.RealConstants.zero;
import static arb.RealConstants.π;

import junit.framework.TestCase;

public class RealPolynomialTest extends
                                TestCase
{
  public static void testIdentity()
  {
     RealPolynomial eye = new RealPolynomial();
     System.out.println( "eye=" + eye );
     eye.init();
     System.out.println( "eye=" + eye );
     eye.identity();
     System.out.println( "eye=" + eye );
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
