package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealQuasiPolynomialTest
                                     extends
                                     TestCase
{

  public void testQuasi()
  {

    var expr = RealQuasiPolynomial.parseSequence("Ψ", "n➔½*√(2*(4*n+1)/y)*(-1)ⁿ*J(2*n+½,y)");
    System.out.println(expr.syntaxTextTree());
    var                 f = expr.instantiate();
    RealQuasiPolynomial g = f.evaluate(0, 128);
  }
}
