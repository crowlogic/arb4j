package arb;

import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class AlgebraicNumberTest extends
                                 TestCase
{

  public static void testToStringSqrt()
  {
    try ( var x = new AlgebraicNumber())
    {
      x.set(3);
      var y = x.sqrt();
      System.out.println(y);
      assertEquals("sqrt(3)", y.toString().toLowerCase() );
    }
  }
  
  public static void testToString()
  {
    try ( var x = new AlgebraicNumber())
    {
      x.set(3);
      var y = x.sqrt().sqrt();
      System.out.println(y);
      assertEquals("pow(3, div(1, 4))", y.toString().toLowerCase() );
    }
  }

}
