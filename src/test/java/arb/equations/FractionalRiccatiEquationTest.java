package arb.equations;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class FractionalRiccatiEquationTest extends
                                           TestCase
{

  public static void testFractionalRiccati()
  {
    FractionalRiccatiEquation fractionalRiccatiEquation = new FractionalRiccatiEquation(Real.of("0.8", 128),
                                                                                        "0",
                                                                                        "-1",
                                                                                        "1");
    System.out.println(fractionalRiccatiEquation);
  }

}
