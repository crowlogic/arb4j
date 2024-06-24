package arb.functions.polynomials.quasi.complex;

import arb.Complex;
import arb.ComplexQuasiPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.complex.ComplexFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class ComplexQuasiPolynomialMultiplication implements ComplexFunction
{

  private final ComplexQuasiPolynomial realQuasiPolynomial;
  private final ComplexQuasiPolynomial operand;

  public ComplexQuasiPolynomialMultiplication(ComplexQuasiPolynomial realQuasiPolynomial,
                                              ComplexQuasiPolynomial operand)
  {
    this.realQuasiPolynomial = realQuasiPolynomial;
    this.operand             = operand;
  }

  @Override
  public Complex evaluate(Complex t, int order, int rbits, Complex res)
  {
    try ( Complex left = new Complex(); Complex right = new Complex();)
    {
      this.realQuasiPolynomial.evaluate(t, order, rbits, left);
      operand.evaluate(t, order, rbits, right);
      Complex mul = left.mul(right, rbits, res);
      return mul;
    }
  }

  @Override
  public String toString()
  {
    return String.format("%s*%s", this.realQuasiPolynomial, operand);
  }
}