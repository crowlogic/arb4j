package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class MagnitudeTest extends
                           TestCase
{

  public void testDoubleSetter()
  {
    try ( Magnitude mag = new Magnitude())
    {
      arblib.mag_init(mag);
      mag.set(6.9);
    }

  }
}
