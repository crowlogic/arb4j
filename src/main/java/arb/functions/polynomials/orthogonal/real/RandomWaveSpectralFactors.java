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
public class RandomWaveSpectralFactors extends
                                           RegularRealRecurrentlyGeneratedOrthogonalPolynomialSequence
{

  public static RealFunction orthoMeasure = RealFunction.express("√(1/√(1-y²))");

  public RandomWaveSpectralFactors(int bits)
  {
    super(bits,
          "0",
          "(Γ*(n+5/4)*Γ*(n+1/4))/(Γ*(n+1)*Γ*(n+1/2))",
          "n/(4*(2*n-1))");
    p0.set("1/2*2^(1/4)/Γ(3/4)*π^(1/4)");                  
    p1.set("1/8*(5*x^2-2)*3^(1/2)*π^(1/4)*2^(3/4)/Γ(3/4)");    
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
