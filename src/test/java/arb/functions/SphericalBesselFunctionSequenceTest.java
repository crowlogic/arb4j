package arb.functions;

import arb.RationalFunction;
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
    SphericalBesselFunctionSequence sbf = new SphericalBesselFunctionSequence();
    RationalFunction f = sbf.evaluate(3, 128);
    System.out.println("j(3,x)=" + f );
  }
}
