package arb.functions;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.SphericalBesselFunction;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class SphericalBesselFunctionSequenceTest extends
                                                 TestCase
{
  public static void testThree()
  {
    try ( SphericalBesselFunction sbf = new SphericalBesselFunction())
    {
      sbf.n.set(3);
      var                     f   = sbf.eval(2.3);
      assertEquals( 0.0856499630648839, f );
    }
  }
}
