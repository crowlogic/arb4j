package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RationalTest extends
                          TestCase
{
  public void testAdd()
  {
    try ( Rational a = new Rational(); Rational b = new Rational(); Rational c = new Rational())
    {

      a.getDenominator().set(10);
      a.getNumerator().set(5);

      a.getDenominator().set(4);
      a.getNumerator().set(1);

      a.add(b, c);
      assertEquals(1, c.getNumerator().getSignedValue());
      assertEquals(4, c.getDenominator().getSignedValue());
    }

  }

  public void testToAndFromStringAndAddingIntegersToNumeratorAndDenominator()
  {
    try ( Rational r = new Rational())
    {
      r.set("34/23");
      assertEquals(34, r.getNumerator().getSignedValue());
      assertEquals(23, r.getDenominator().getSignedValue());
      r.getNumerator().add(6);
      r.getDenominator().add(7);
      assertEquals("40/30", r.toString());
    }

  }
}
