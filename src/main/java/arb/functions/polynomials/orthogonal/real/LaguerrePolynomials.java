package arb.functions.polynomials.orthogonal.real;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.domains.Domain;
import arb.domains.UpperExtendedHalfLine;
import arb.functions.polynomials.RealPolynomialNullaryFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class LaguerrePolynomials extends
                                 RegularRealRecurrentlyGeneratedOrthogonalPolynomialSequence
{
  public static int bits = 128;

  public LaguerrePolynomials()
  {
    super(bits,
          "-1/(n+1)",
          "(2*n+1)/(n+1)",
          "n/(n+1)");
    RealPolynomialNullaryFunction.express("1-x").evaluate(bits, p1);
  }

  @Override
  public Domain<Real> domainOfOrthogonality()
  {
    return UpperExtendedHalfLine.instance;
  }
}
