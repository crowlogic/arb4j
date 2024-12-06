package arb.expressions;

import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.P;
import arb.utensils.ShellFunctions;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ArbTypeRepresenterTest extends
                                    TestCase
{
  public void testRepresenter()
  {
    var P = new P();// new RationalJacobiPolynomials(RealConstants.negHalf,RealConstants.negHalf);
    P.α = P.β = RealConstants.negHalf;
    var f = P.evaluate(3, 128);
    ShellFunctions.inspect(P);
  }

}
