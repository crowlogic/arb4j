package arb;

import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class IntegerPolynomialTest
                                   extends
                                   TestCase
{
  public void testAdd()
  { 

    try ( IntegerPolynomial p = new IntegerPolynomial(); Integer three = new Integer(3); )
    {
      p.setCoeffsNative(three.swigCPtr);
      assertEquals("3", three.toString());
      //p.add(p, p);
    }
  }
}
