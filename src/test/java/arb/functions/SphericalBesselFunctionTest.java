package arb.functions;

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
    try ( SphericalBesselFunction f = new SphericalBesselFunction(3))
    {
      double x = f.eval(2.3);
      System.out.format("f=%s\ns=%s\n", x);
    }
                  
  }
}
