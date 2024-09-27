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
public class RealType1ChebyshevPolynomials extends
                                           RegularRealRecurrentlyGeneratedOrthogonalPolynomialSequence
{

  public static RealFunction orthoMeasure = RealFunction.express("1/√(1-y²)");

  public RealType1ChebyshevPolynomials(int bits)
  {
    super(bits,
          "2",
          "0",
          "1");
    p1.set(1).shiftLeft(1);
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
