package arb.functions.polynomials.orthogonal.real;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.domains.Domain;
import arb.domains.ExtendedRealLine;
import arb.functions.real.RealFunction;

/**
 * H(n,x)=2*x*H(n-1,x)-2*n*H(n-2,x)
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class HermitePolynomials extends
                                RegularRealRecurrentlyGeneratedOrthogonalPolynomialSequence
{
  public HermitePolynomials(int bits)
  {
    super(bits,
          "2",
          "0",
          "2*n");
    p1.set(2).shiftLeft(1);
  }

  @Override
  public Domain<Real> domainOfOrthogonality()
  {
    return ExtendedRealLine.instance;
  }

  public final RealFunction w = RealFunction.express("exp(-x²)");

  @Override
  public RealFunction orthogonalityMeasure()
  {
    return w;
  }

}
