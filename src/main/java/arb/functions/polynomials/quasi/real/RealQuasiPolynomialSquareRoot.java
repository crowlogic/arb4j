package arb.functions.polynomials.quasi.real;

import arb.Real;
import arb.RealQuasiPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;

/**
 * this is almost surely not the best way to implement this, but its a decent
 * save-point
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class RealQuasiPolynomialSquareRoot implements RealFunction
{
  /**
   * 
   */
  private final RealQuasiPolynomial realQuasiPolynomial;

  /**
   * @param realQuasiPolynomial
   */
  public RealQuasiPolynomialSquareRoot(RealQuasiPolynomial realQuasiPolynomial)
  {
    this.realQuasiPolynomial = realQuasiPolynomial;
  }

  @Override
  public Real evaluate(Real t, int order, int rbits, Real res)
  {
    this.realQuasiPolynomial.evaluate(t, order, rbits, res);
    return res.sqrt(rbits);

  }

  @Override
  public String toString()
  {
    return String.format("√(%s)", this.realQuasiPolynomial);
  }
}