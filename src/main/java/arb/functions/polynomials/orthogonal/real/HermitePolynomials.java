package arb.functions.polynomials.orthogonal.real;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
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
  boolean normalized = false;

  @Override
  public RealPolynomial evaluate(Integer n, int order, int bits, RealPolynomial res)
  {
    try ( var fact = new Real())
    {
      super.evaluate(n, order, bits, res);
      return normalized ? res.div(n.factorial(bits, fact), bits) : res;
    }
  }

  public HermitePolynomials(int bits, boolean normalize )
  {
    this(bits);
    normalized = normalize;
  }
  
  public HermitePolynomials(int bits)
  {
    super(bits,
          "2",
          "0",
          "2*n");
    p1.set("2*x");
  }

  @Override
  public Domain<Real> domainOfOrthogonality()
  {
    return ExtendedRealLine.instance;
  }

  public static final RealFunction w = RealFunction.express("exp(-x²)");

  @Override
  public RealFunction orthogonalityMeasure()
  {
    return w;
  }

}
