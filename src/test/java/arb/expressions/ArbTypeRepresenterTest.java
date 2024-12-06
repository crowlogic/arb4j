package arb.expressions;

import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.polynomials.orthogonal.real.JacobiPolynomials;
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
    var j = new JacobiPolynomials(RealConstants.negHalf,
                                          RealConstants.negHalf);
    var P = j.P;

    var f = P.evaluate(3, 128);
    System.out.println("P(3)=" + f);
    ShellFunctions.inspect(P);
  }

}
