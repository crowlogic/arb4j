package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class AlgebraicNumberTest extends
                                 TestCase
{
  public static void testRationalNumberFromString()
  {
    var a = new AlgebraicNumber();
    a.set("377/32");
    assertEquals("377/32", a.toString());
  }

  public static void testIsReal()
  {
    try ( var a = new AlgebraicNumber())
    {
      a.set(-1);
      assertTrue(a.isReal());
      a.sqrt();
      assertFalse(a.isReal());
    }

  }

  public static void testIsInteger()
  {
    try ( var a = new AlgebraicNumber())
    {
      a.set(5);
      assertTrue(a.isInteger());
      a.sqrt();
      assertFalse(a.isInteger());
    }

  }

  public static void testTypesetFourthRoot()
  {
    try ( var x = new AlgebraicNumber())
    {
      x.set(3);
      var y = x.sqrt().sqrt();
      assertEquals("{3}^{1 / 4}", y.typeset());
    }
  }

  public static void testTypeset()
  {
    try ( var x = new AlgebraicNumber())
    {
      x.set(3);
      var y = x.sqrt();
      assertEquals("\\sqrt{3}", y.typeset());
    }
  }

  public static void testToStringSqrt()
  {
    try ( var x = new AlgebraicNumber())
    {
      x.set(3);
      var y = x.sqrt();
      assertEquals("sqrt(3)", y.toString().toLowerCase());
    }
  }

  public static void testToString()
  {
    try ( var x = new AlgebraicNumber())
    {
      x.set(3);
      var y = x.sqrt().sqrt();
      assertEquals("pow(3, div(1, 4))", y.toString().toLowerCase());
    }
  }

}
