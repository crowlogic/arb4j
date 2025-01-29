package arb;

import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class AlgebraicNumberTest extends
                                 TestCase
{

  public static void testToString()
  {
    try ( var x = new AlgebraicNumber())
    {
      var y = x.set(3).sqrt(new AlgebraicNumber());
      assertEquals("sqrt(3)", y.toString().toLowerCase() );
    }
  }

}
