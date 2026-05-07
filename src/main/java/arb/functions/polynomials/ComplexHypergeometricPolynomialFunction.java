package arb.functions.polynomials;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;
import arb.functions.HypergeometricFunction;
import arb.functions.complex.ComplexPolynomialNullaryFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ComplexHypergeometricPolynomialFunction extends
                                                     HypergeometricFunction<Complex, ComplexPolynomial, ComplexPolynomialNullaryFunction>
{

  // CHANGE: init for constant arg
  public ComplexHypergeometricPolynomialFunction init(Complex α, Complex β, ComplexPolynomialNullaryFunction constantArg)
  {
    super.init(Complex.class, ComplexPolynomial.class, ComplexPolynomialNullaryFunction.class, α, β, constantArg);
    return this;
  }

  // CHANGE: init for input-dependent arg
  public ComplexHypergeometricPolynomialFunction init(Complex α, Complex β, Function<ComplexPolynomial, ComplexPolynomial> inputDependentArg)
  {
    super.init(Complex.class, ComplexPolynomial.class, ComplexPolynomialNullaryFunction.class, α, β, inputDependentArg);
    return this;
  }

}
