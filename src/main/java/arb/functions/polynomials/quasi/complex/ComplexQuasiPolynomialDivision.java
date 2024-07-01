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
public final class ComplexQuasiPolynomialDivision implements ComplexFunction
{

  private final ComplexQuasiPolynomial complexQuasiPolynomial;
  private final ComplexQuasiPolynomial operand;

  public ComplexQuasiPolynomialDivision(ComplexQuasiPolynomial realQuasiPolynomial, ComplexQuasiPolynomial operand)
  {
    this.complexQuasiPolynomial = realQuasiPolynomial;
    this.operand                = operand;
  }

  @Override
  public Complex evaluate(Complex t, int order, int rbits, Complex res)
  {
    try ( Complex left = new Complex(); Complex right = new Complex();)
    {
      this.complexQuasiPolynomial.evaluate(t, order, rbits, left);
      operand.evaluate(t, order, rbits, right);
      Complex mul = left.mul(right, rbits, res);
      return mul;
    }
  }

  @Override
  public String toString()
  {
    return String.format("%s*%s", this.complexQuasiPolynomial, operand);
  }
}