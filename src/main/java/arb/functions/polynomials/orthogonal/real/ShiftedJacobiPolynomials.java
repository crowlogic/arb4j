package arb.functions.polynomials.orthogonal.real;

import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.domains.Domain;
import arb.functions.real.RealFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ShiftedJacobiPolynomials extends
                                      JacobiPolynomials
{

  /**
   * Default to alpha=beta=-1/2 which coincides with the (shifted) Type-1 Chebyshev Polynomials
   */
  public ShiftedJacobiPolynomials()
  {
    this(RealConstants.negHalf,
         RealConstants.negHalf);
  }

  @Override
  public String toString()
  {
    return String.format("ShiftedJacobiPolynomials[α=%s, β=%s]", α, β);
  }

  public static Real domain = new Real("0.5+/-0.5",
                                       128);

  @Override
  public RealPolynomial evaluate(Integer t, int order, int bits, RealPolynomial res)
  {
    return super.evaluate(t, order, bits, res).mul(2, bits).sub(1, bits);
  }

  @Override
  public Domain<Real> domainOfOrthogonality()
  {
    return domain;
  }

  public RealFunction orthogonalityMeasure()
  {
    if (orthogonalityMeasure == null)
    {
      orthogonalityMeasure = RealFunction.express("w", "x➔((1-x)*2)^α*(2*x)^β", context);
    }
    return orthogonalityMeasure;
  }

  public ShiftedJacobiPolynomials(Real a, Real b)
  {
    super(a,
          b);
  }

}
