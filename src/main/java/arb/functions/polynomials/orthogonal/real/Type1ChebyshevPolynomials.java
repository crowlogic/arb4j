package arb.functions.polynomials.orthogonal.real;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.domains.Domain;
import arb.functions.real.RealFunction;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Type1ChebyshevPolynomials extends
                                           RegularRealRecurrentlyGeneratedOrthogonalPolynomialSequence
{

  public static RealFunction orthoMeasure = RealFunction.express("1/√(1-y²)");

  public Type1ChebyshevPolynomials(int bits)
  {
    super(bits,
          "2",
          "0",
          "1");
    p1.set("x");
  }

  @Override
  public Domain<Real> domainOfOrthogonality()
  {
    return orthogonalityDomain;
  }

  public static final Real orthogonalityDomain = new Real("0+/-1",
                                                          128);

  @Override
  public RealFunction orthogonalityMeasure()
  {
    return orthoMeasure;
  }

}
