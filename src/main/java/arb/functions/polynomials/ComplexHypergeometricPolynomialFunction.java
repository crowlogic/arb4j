package arb.functions.polynomials;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Verifiable;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.functions.HypergeometricFunction;
import arb.functions.complex.ComplexPolynomialNullaryFunction;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ComplexHypergeometricPolynomialFunction extends
                                                     HypergeometricFunction<Complex,
                                                                   ComplexPolynomial,
                                                                   ComplexPolynomialNullaryFunction>
                                                     implements
                                                     Verifiable
{

  public ComplexHypergeometricPolynomialFunction
         init(Complex alpha,
              Complex beta,
              Expression<Object, ComplexPolynomial, ComplexPolynomialNullaryFunction> arg)
  {
    init(Complex.class,
         ComplexPolynomial.class,
         ComplexPolynomialNullaryFunction.class,
         alpha,
         beta,
         arg);
    return this;
  }

}