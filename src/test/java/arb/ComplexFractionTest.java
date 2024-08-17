package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ComplexFractionTest extends
                                 TestCase
{
  @SuppressWarnings("resource")
  public void testSet()
  {
    ComplexFraction a = new ComplexFraction().set("7/8");
    ComplexFraction b = new ComplexFraction().set("1/4");
    assertFalse(a.equals(b));
    b.set(a);
    assertTrue(a + "!=" + b, a.equals(b));
    assertTrue(a.getNumerator() + " != " + b.getNumerator(),
               b.getNumerator().equals(a.getNumerator()));
    assertTrue(b.getDenominator().equals(a.getDenominator()));

  }

  @SuppressWarnings("resource")
  public void testDiv()
  {
    ComplexFraction a      = new ComplexFraction("7/8+2*ⅈ");
    ComplexFraction b      = new ComplexFraction("1/4+ⅈ");
    ComplexFraction aOverB = a.div(b, new ComplexFraction());
    assertEquals("(71/34)+(-6/17)i", aOverB.toString());
  }

}
