package arb;

import junit.framework.TestCase;

public class RationalTest extends
                          TestCase
{
  public static void testAdd()
  {
    try ( Rational a = new Rational(); Rational b = new Rational(); Rational c = new Rational())
    {
      long ld = a.getLongDenominator();

      a.getDenominator().set(10);
      a.getNumerator().set(5);

      a.getDenominator().set(4);
      a.getNumerator().set(1);

      a.add(b, c);
      assertEquals(1, c.getNumerator().getSignedValue());
      assertEquals(4, c.getDenominator().getSignedValue());
    }

  }
}
