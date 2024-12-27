package arb.functions.polynomials;

import arb.Integer;
import arb.Polynomial;
import arb.Real;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.functions.HypergeometricFunction;

/**
 * Represents a hypergeometric {@link Real}-valued {@link Polynomial}, that is,
 * a {@link RealPolynomial}, defined by a finite hypergeometric series as <br>
 * <br>
 * pFq:Σn➔zⁿ*∏k➔αₖ₍ₙ₎{k=1…p}/(n!*∏k➔βₖ₍ₙ₎{k=1…q}){n=0…N} <br>
 * <br>
 * 
 * This class encapsulates the computation and representation of hypergeometric
 * polynomials, which are derived from the general hypergeometric series when
 * the existence of a negative integer in the numerator leads to its completion
 * after a finite number of terms.
 * <p>
 * A hypergeometric series is finite and simplifies into a {@link Polynomial}
 * when at least one of its upper parameters (α) is a negative {@link Integer}.
 * This condition ensures that the series has a finite number of non-zero terms,
 * making it possible to represent the series as a polynomial of finite degree.
 * </p>
 * <p>
 * The implementation uses parameters p and q, which are the dimensions of the
 * vectors α and β, respectively. These parameters, along with the vectors
 * themselves, define the hypergeometric series.<br>
 * <br>
 * 
 * The notation x₍n₎ represents the n-th
 * {@link Real#ascendingFactorial(long, int, Real)} of x. <br>
 * <br>
 * 
 * The series is evaluated up to a specific order N, determined by the smallest
 * non-positive integer in α, ensuring the series is finite. This class provides
 * methods to initialize the polynomial, verify the finiteness condition, and
 * evaluate the polynomial, encapsulating the complexity of handling
 * hypergeometric functions in a computational context.
 * </p>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealHypergeometricPolynomialFunction extends
                                                  HypergeometricFunction<Real, RealPolynomial,
                                                  RealPolynomialNullaryFunction>
{

  public RealHypergeometricPolynomialFunction
         init(Real alpha,
              Real beta,
              Expression<Object, RealPolynomial, RealPolynomialNullaryFunction> arg)
  {
    init(Real.class,
         RealPolynomial.class,
         RealPolynomialNullaryFunction.class,
         alpha,
         beta,
         arg);
    return this;
  }


}
