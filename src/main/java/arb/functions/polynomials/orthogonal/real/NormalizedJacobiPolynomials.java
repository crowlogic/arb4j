package arb.functions.polynomials.orthogonal.real;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class NormalizedJacobiPolynomials extends
                                         JacobiPolynomials
{

  public NormalizedJacobiPolynomials(Real a, Real b)
  {
    super(a,
          b);
  }

  @Override
  public RealPolynomial evaluate(Integer t, int order, int bits, RealPolynomial res)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

}
