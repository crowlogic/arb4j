package arb.functions.polynomials.orthogonal.real;

import arb.Real;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.polynomials.orthogonal.RecurrentlyGeneratedOrthogonalPolynomialSequence;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class RealRecurrentlyGeneratedOrthogonalPolynomialSequence extends
                                                                           RecurrentlyGeneratedOrthogonalPolynomialSequence<Real, RealPolynomial>
{

  @Override
  public Class<RealPolynomial> coDomainType()
  {
    return RealPolynomial.class;
  }

  public RealRecurrentlyGeneratedOrthogonalPolynomialSequence(int bits)
  {
    super(bits, RealPolynomial.class);
    p0.set(1);
  }

}