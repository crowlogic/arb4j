package arb.functions.sequences;

import arb.RationalFunction;
import arb.Real;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class LommelPolynomialsTest
                                   extends
                                   TestCase
{
  public void testSequence()
  {
    try ( LommelPolynomials l = new LommelPolynomials(RealConstants.half))
    {
      RationalFunction func = l.evaluate(3, 128);
      Real             l3x  = func.evaluate(Real.valueOf(2.3), 0, 128, new Real());
      assertEquals(-1.3758527163639351505, l3x.doubleValue());
    }
  }
}
