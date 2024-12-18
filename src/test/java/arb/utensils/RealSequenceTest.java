package arb.utensils;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.integer.RealSequence;
import junit.framework.TestCase;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealSequenceTest extends
                              TestCase
{

  public void testRealFactorialSequence() throws Exception
  {
    RealSequence f    = RealSequence.express("n!");
    Real         list = new Real(f.enumerate(0, 9));
    assertEquals("[1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880]", list.toString());
  }

}
