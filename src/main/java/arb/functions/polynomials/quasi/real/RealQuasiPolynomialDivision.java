package arb.functions.polynomials.quasi.real;

import arb.Integer;
import arb.Real;
import arb.RealQuasiPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class RealQuasiPolynomialDivision implements RealFunction
{
  /**
   * 
   */
  private final RealQuasiPolynomial realQuasiPolynomial;
  private final RealQuasiPolynomial operand;

  public RealQuasiPolynomialDivision(RealQuasiPolynomial realQuasiPolynomial, RealQuasiPolynomial operand)
  {
    this.realQuasiPolynomial = realQuasiPolynomial;
    this.operand             = operand;
  }


  @Override
  public Real evaluate(Real t, int order, int rbits, Real res)
  {
    try ( Real left = new Real(); Real right = new Real();)
    {
      this.realQuasiPolynomial.evaluate(t, order, rbits, left);
      operand.evaluate(t, order, rbits, right);
      Real div = left.div(right, rbits, res);
      return div;
    }
  }

  @Override
  public String toString()
  {
    return String.format("%s/%s", this.realQuasiPolynomial, operand);
  }
}