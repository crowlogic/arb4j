package arb.functions.sequences;

import arb.Fraction;
import arb.RationalFunction;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.rational.LommelPolynomial;
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
      Fraction         l3x  = func.evaluate(new Fraction(230,
                                                         100),
                                            0,
                                            128,
                                            new Fraction());
      assertEquals(-1.3758527163639351505, l3x.doubleValue());
    }
  }
}
