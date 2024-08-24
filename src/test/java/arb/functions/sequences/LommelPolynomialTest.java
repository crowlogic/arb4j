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
public class LommelPolynomialTest extends
                                          TestCase
{
  public void testLommelPolynomial()
  {
    try ( LommelPolynomial l = new LommelPolynomial())
    {
      l.v.set(RealConstants.half);
      l.n.set(3);
      RationalFunction func = l.evaluate(128);
      Real             l3x  = func.evaluate(Real.of("2.3",128), 0, 128, new Real());
      assertEquals(-1.3758527163639351505, l3x.doubleValue());
    }
  }
}
