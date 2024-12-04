package arb.functions.polynomials.orthogonal.real;

import arb.OrthonormalBasis;
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
                                         JacobiPolynomials implements
                                         OrthonormalBasis<Real, RealPolynomial>
{

  public NormalizedJacobiPolynomials(Real a, Real b)
  {
    super(a,
          b);
  }

}
