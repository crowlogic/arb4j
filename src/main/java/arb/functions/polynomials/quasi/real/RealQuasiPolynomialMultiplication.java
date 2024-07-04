package arb.functions.polynomials.quasi.real;

import arb.Real;
import arb.RealQuasiPolynomial;
import arb.functions.real.RealFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class RealQuasiPolynomialMultiplication implements RealFunction
{
  /**
   * 
   */
  private final RealQuasiPolynomial realQuasiPolynomial;
  private final RealQuasiPolynomial operand;
  private final String opstr;
  private String rhsstr;
  
  public RealQuasiPolynomialMultiplication(RealQuasiPolynomial realQuasiPolynomial, RealQuasiPolynomial operand)
  {
    this.realQuasiPolynomial = realQuasiPolynomial;
    this.operand = operand;
    opstr = realQuasiPolynomial.toString();
    rhsstr = operand.toString();
  }

  @Override
  public Real evaluate(Real t, int order, int rbits, Real res)
  {
    try ( Real left = new Real(); Real right = new Real();)
    {
      this.realQuasiPolynomial.evaluate(t, order, rbits, left);
      operand.evaluate(t, order, rbits, right);
      Real mul = left.mul(right, rbits, res);
      return mul;
    }
  }

  @Override
  public String toString()
  {
    return opstr + "*" + rhsstr;
  }
}