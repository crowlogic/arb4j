package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class FractionTest extends
                          TestCase
{
  public void testAdd()
  {
    try ( Fraction a = new Fraction(); Fraction b = new Fraction(); Fraction c = new Fraction())
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
    try ( Fraction r = new Fraction())
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
