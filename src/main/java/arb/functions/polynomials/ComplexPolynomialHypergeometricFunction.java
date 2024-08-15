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
public class ComplexPolynomialHypergeometricFunction extends
                                                     HypergeometricFunction<Complex,
                                                     ComplexPolynomial,
                                                     ComplexPolynomialNullaryFunction> implements
                                                     Verifiable
{

  public ComplexPolynomialHypergeometricFunction
         init(Complex alpha,
              Complex beta,
              Expression<Object, ComplexPolynomial, ComplexPolynomialNullaryFunction> arg)
  {
    init(Complex.class,
         ComplexPolynomial.class,
         ComplexPolynomialNullaryFunction.class,
         alpha.size(),
         beta.size(),
         arg);
    this.α.set(alpha);
    this.β.set(beta);
    return this;
  }

  public ComplexPolynomialHypergeometricFunction(int i,
                                                 int j,
                                                 Expression<Object, ComplexPolynomial,
                                                 ComplexPolynomialNullaryFunction> arg)
  {
    init(Complex.class,
         ComplexPolynomial.class,
         ComplexPolynomialNullaryFunction.class,
         i,
         j,
         arg);
  }

  public ComplexPolynomialHypergeometricFunction()
  {
  }

}