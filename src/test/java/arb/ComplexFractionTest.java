package arb;

import junit.framework.TestCase;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ComplexFractionTest
                                 extends
                                 TestCase
{
  @SuppressWarnings("resource")
  public void testSet()
  {
    ComplexFraction a = new ComplexFraction().set("7/8");
    ComplexFraction b = new ComplexFraction().set("1/4");
    assertFalse(a.equals(b));
    b.set(a);
    assertTrue(a.equals(b));
    assertTrue(b.getNumerator().equals(a.getNumerator()));
    assertTrue(b.getDenominator().equals(a.getDenominator()));

  }
}
