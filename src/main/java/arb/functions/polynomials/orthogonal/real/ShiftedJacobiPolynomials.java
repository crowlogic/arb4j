package arb.functions.polynomials.orthogonal.real;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.domains.Domain;
import arb.functions.real.RealFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ShiftedJacobiPolynomials extends
                                      JacobiPolynomials
{

  public static Real domain = new Real("0.5+/-0.5",
                                       128);

  @Override
  public RealPolynomial evaluate(Integer t, int order, int bits, RealPolynomial res)
  {
    return super.evaluate(t, order, bits, res).mul(2, bits,res).sub(1, bits, res);
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
      orthogonalityMeasure = RealFunction.express("w", "x➔(2-2*x)^α*(2*x)^β", context);
    }
    return orthogonalityMeasure;
  }

  public ShiftedJacobiPolynomials(Real a, Real b)
  {
    super(a,
          b);
  }

}
