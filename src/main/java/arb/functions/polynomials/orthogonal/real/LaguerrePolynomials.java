package arb.functions.polynomials.orthogonal.real;

import arb.*;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class LaguerrePolynomials extends
                                 RegularRealRecurrentlyGeneratedOrthogonalPolynomialSequence
{

  public LaguerrePolynomials()
  {
    this(128);
  }

  public LaguerrePolynomials(int bits)
  {
    super(bits,
          "-1/(n+1)",
          "(2*n+1)/(n+1)",
          "n/(n+1)");
    p1.set("1-x");
  }

  @Override
  public Domain<Real> domainOfOrthogonality()
  {
    return RealConstants.posInf;
  }
}
