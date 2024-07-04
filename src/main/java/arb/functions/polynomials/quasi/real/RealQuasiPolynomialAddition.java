package arb.functions.polynomials.quasi.real;

import arb.Real;
import arb.RealQuasiPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class RealQuasiPolynomialAddition implements RealFunction
{
  /**
   * 
   */
  private final RealQuasiPolynomial realQuasiPolynomial;
  private final RealQuasiPolynomial operand;
  private String opStr;
  private String rhsstr;

  public RealQuasiPolynomialAddition(RealQuasiPolynomial realQuasiPolynomial, RealQuasiPolynomial operand)
  {
    this.realQuasiPolynomial = realQuasiPolynomial;
    this.operand             = operand;
    opStr                    = realQuasiPolynomial.toString();
    rhsstr                   = operand.toString();
  }

  @Override
  public Real evaluate(Real t, int order, int rbits, Real res)
  {
    try ( Real left = new Real(); Real right = new Real();)
    {
      this.realQuasiPolynomial.evaluate(t, order, rbits, left);
      operand.evaluate(t, order, rbits, right);
      Real add = left.add(right, rbits, res);
      return add;
    }
  }

  @Override
  public String toString()
  {
    return String.format("%s+%s", opStr, rhsstr);
  }
}