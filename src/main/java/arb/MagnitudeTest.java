package arb;

import junit.framework.TestCase;

/**
 * TODO: find out whats causing https://github.com/crowlogic/arb4j/issues/270
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
