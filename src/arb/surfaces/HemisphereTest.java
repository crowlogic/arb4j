package arb.surfaces;

import static java.lang.Math.*;

import arb.*;
import junit.framework.*;

public class HemisphereTest extends
                            TestCase
{
  public static void testCoordinates()
  {
    Hemisphere hemisphere = new Hemisphere(RealConstants.one,
                                           true);
    Complex    t          = new Complex();
    Real       w          = new Real();
    hemisphere.evaluate(t, 1, 300, w);
    assertEquals(1, w.doubleValue(), pow(10, -17));
  }
}
