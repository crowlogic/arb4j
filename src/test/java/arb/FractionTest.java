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

  public void testOne()
  {
    try ( var a = new Fraction())
    {
      a.one();
      assertEquals("1", a.toString());
      assertTrue(a.isReduced());
    }
  }

  public void testZero()
  {
    try ( var a = new Fraction())
    {
      a.zero();
      assertEquals("0", a.toString());
      assertTrue(a.isReduced());
    }
  }

  public void testMultiplication()
  {
    try ( var a = new Fraction(); var b = new Fraction(); var c = new Fraction())
    {
      a.set("1/2");
      b.set("3/4");
      a.mul(b, c);
      assertEquals("3/8", c.toString());
    }
  }

  public void testDivision()
  {
    try ( var a = new Fraction(); var b = new Fraction(); var c = new Fraction())
    {
      a.set("1/2");
      b.set("3/4");
      a.div(b, c);
      assertEquals("2/3", c.toString());
    }
  }

  public void testSubtraction()
  {
    try ( var a = new Fraction(); var b = new Fraction(); var c = new Fraction())
    {
      a.set("3/4");
      b.set("1/2");
      a.sub(b, c);
      assertEquals("1/4", c.toString());
    }
  }

  public void testEqualityWithoutReduction()
  {
    try ( var a = new Fraction(); var b = new Fraction())
    {
      a.set("1/2");
      b.set("2/4");
      assertFalse(a.equals(b)); // They are not equal without reduction
    }
  }

  public void testEqualityWithReduction()
  {
    try ( var a = new Fraction(); var b = new Fraction())
    {
      a.set("1/2");
      b.set("2/4");
      b.reduce();
      assertTrue(a.equals(b)); // Now they are equal after reduction
    }
  }

  public void testEqualityDifferentValues()
  {
    try ( var a = new Fraction(); var b = new Fraction())
    {
      a.set("1/2");
      b.set("3/4");
      assertFalse(a.equals(b)); // Different values should not be equal
    }
  }

  public void testEqualityWithZero()
  {
    try ( var a = new Fraction(); var b = new Fraction())
    {
      a.set("0/1");
      b.set("0/5");
      b.reduce();
      assertTrue(a.equals(b)); // Both represent zero
    }
  }

  public void testNegativeFractions()
  {
    try ( var a = new Fraction(); var b = new Fraction(); var c = new Fraction())
    {
      a.set("-1/2");
      b.set("1/2");
      c.set("-2/4");

      assertFalse(a.equals(b)); // -1/2 != 1/2
      assertFalse(a.equals(c)); // -1/2 != -2/4 (without reduction)

      c.reduce();
      assertTrue(a.equals(c)); // -1/2 == -1/2 (after reduction)

      a.set("-3/4");
      b.set("3/4");
      assertFalse(a.equals(b)); // -3/4 != 3/4

      b.getNumerator().neg();
      assertTrue(a.equals(b)); // -3/4 == -3/4
    }
  }

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
      assertEquals("4/3", r.toString());
    }

  }
}
