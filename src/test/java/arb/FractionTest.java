package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class FractionTest
                          extends
                          TestCase
{
  public void testAdd()
  {
    try ( var a = new Fraction(); var b = new Fraction(); var c = new Fraction())
    {

      a.getDenominator().set(10);
      a.getNumerator().set(5);

      b.getDenominator().set(4);
      b.getNumerator().set(1);

      assertFalse(a.isReduced());
      assertTrue(b.isReduced());

      a.reduce();
      b.reduce();

      assertTrue(a.isReduced());
      assertTrue(b.isReduced());

      a.add(b, c);
      assertEquals(3, c.getNumerator().getSignedValue());
      assertEquals(4, c.getDenominator().getSignedValue());
    }

  }

  public void testToAndFromStringAndAddingIntegersToNumeratorAndDenominator()
  {
    try ( var r = new Fraction())
    {
      r.set("34/23");
      assertEquals(34, r.getNumerator().getSignedValue());
      assertEquals(23, r.getDenominator().getSignedValue());
      r.getNumerator().add(6);
      r.getDenominator().add(7);
      assertEquals("40/30", r.toString());
      assertFalse(r.isReduced());
      assertTrue(r.reduce().isReduced());
    }

  }
}
