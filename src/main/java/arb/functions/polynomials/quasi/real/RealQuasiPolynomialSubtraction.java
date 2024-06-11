package arb.functions.polynomials.quasi.real;

import arb.Real;
import arb.RealQuasiPolynomial;
import arb.functions.real.RealFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class RealQuasiPolynomialSubtraction implements RealFunction
{
  /**
   * 
   */
  private final RealQuasiPolynomial realQuasiPolynomial;
  private final RealQuasiPolynomial operand;

  public RealQuasiPolynomialSubtraction(RealQuasiPolynomial realQuasiPolynomial, RealQuasiPolynomial operand)
  {
    this.realQuasiPolynomial = realQuasiPolynomial;
    this.operand = operand;
  }

  @Override
  public Real evaluate(Real t, int order, int rbits, Real res)
  {
    try ( Real left = new Real(); Real right = new Real();)
    {
      this.realQuasiPolynomial.evaluate(t, order, rbits, left);
      operand.evaluate(t, order, rbits, right);
      Real sub = left.sub(right, rbits, res);
      return sub;
    }
  }

  @Override
  public String toString()
  {
    return String.format("%s-%s", this.realQuasiPolynomial, operand);
  }
}