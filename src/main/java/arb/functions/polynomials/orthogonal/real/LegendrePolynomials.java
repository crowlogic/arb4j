package arb.functions.polynomials.orthogonal.real;

import arb.Real;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.domains.Domain;
import arb.functions.polynomials.RealPolynomialNullaryFunction;
import arb.functions.real.RealFunction;
import arb.functions.real.RealNullaryFunction;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class LegendrePolynomials extends
                                 RegularRealRecurrentlyGeneratedOrthogonalPolynomialSequence
{
  public LegendrePolynomials(int bits)
  {
    super(bits,
          "(2*n+1)/(n+1)",
          "0",
          "n/(n+1)");
    RealPolynomialNullaryFunction.express("x").evaluate(bits, p1);
  }

  public static Real domain = new Real("0+/-1",
                                       128);

  @Override
  public Domain<Real> domainOfOrthogonality()
  {
    return domain;
  }

  @Override
  public RealFunction orthogonalityMeasure()
  {
    return (x, order, bits, result) -> result.set(RealConstants.one);
  }

}
