package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RationalPolynomialTest extends
                                    TestCase
{

  public void testRationalPolynomialsSetFromStringAndGetString()
  {
    String str = "3  2 5 3/8";
    try ( RationalPolynomial f = new RationalPolynomial(str))
    {
      assertEquals(str, f.toString());
    }
  }

  public void testAddRationalPolynomials()
  {
    try ( var f = new RationalPolynomial(); var g = new RationalPolynomial(); var h = new RationalPolynomial())
    {
      f.set("3  2 5 3/8");
      g.set("1  6/7");
      f.add(g, 0, h);
      assertEquals("3  20/7 5 3/8", h.toString());
    }
  }
  
  public void testSubtractRationalPolynomials()
  {
    try ( var f = new RationalPolynomial(); var g = new RationalPolynomial(); var h = new RationalPolynomial())
    {
      f.set("3  2 5 3/8");
      g.set("1  6/7");
      f.sub(g, 0, h);
      assertEquals("3  8/7 5 3/8", h.toString());
    }
  }

}
