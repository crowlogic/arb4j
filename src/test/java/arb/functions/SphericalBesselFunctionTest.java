package arb.functions;

import arb.functions.real.SphericalBesselFunction;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class SphericalBesselFunctionTest extends
                                         TestCase
{
  public void testEval()
  {
    try ( SphericalBesselFunction f = new SphericalBesselFunction())
    {
      f.n.set(3);
      double x = f.eval(2.3);
//      System.out.format("f=%s\nf(2.3)=%s\n", f,x);
      assertEquals( 0.0856499630648839, x );
    }
                  
  }
}
