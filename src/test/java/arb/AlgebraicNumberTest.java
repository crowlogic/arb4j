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
    var x = new AlgebraicNumber().set(3).sqrt();
    assertEquals("sqrt(3)", x.toString());
 }

}
