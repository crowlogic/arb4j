package arb.functions.rational;

import arb.Complex;
import arb.ComplexFraction;
import arb.ComplexRationalFunction;
import arb.Fraction;
import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.functions.Function;
import arb.functions.HypergeometricFunction;

/**
 * Represents a finite hypergeometric series as <br>
 * <br>
 * pFq:Σn➔zⁿ*∏k➔α[k]₍ₙ₎{k=1…p}/(n!*∏k➔β[k]₍ₙ₎{k=1…q}){n=0…N} <br>
 * <br>
 * 
 * This class encapsulates the computation and representation of hypergeometric
 * polynomials, which are derived from the general hypergeometric series when
 * the existence of a negative integer in the numerator leads to its completion
 * after a finite number of terms in the sense that all of the terms after a
 * certain index are equal to 0.
 * <p>
 * A hypergeometric series is finite and simplifies into a polynomial when at
 * least one of its upper parameters (α) is a negative integer. This condition
 * ensures that the series has a finite number of non-zero terms, making it
 * possible to represent the series as a polynomial of finite degree.
 * </p>
 * <p>
 * The implementation uses parameters p and q, which are the dimensions of
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
public class ComplexRationalHypergeometricFunction extends
                                                   HypergeometricFunction<Complex,
                                                                 ComplexRationalFunction,
                                                                 ComplexRationalNullaryFunction>
{

  @Override
  public ComplexRationalFunction
         evaluate(Object nullary, int order, int bits, ComplexRationalFunction res)
  {
    return super.evaluate(nullary, order, bits, res);
  }

  public ComplexRationalHypergeometricFunction
         init(Fraction α,
              Fraction β,
              Expression<Object, ComplexRationalFunction, ComplexRationalNullaryFunction> arg)
  {
    super.init(Complex.class,
               ComplexRationalFunction.class,
               ComplexRationalNullaryFunction.class,
               α,
               β,
               arg);
    return this;
  }



  public ComplexRationalHypergeometricFunction
         init(ComplexFraction numerator,
              ComplexFraction denominator,
              Expression<Object, ComplexRationalFunction, ComplexRationalNullaryFunction> arg)
  {
    assert numerator.imaginaryPart.isZero();
    assert denominator.imaginaryPart.isZero();
    System.out.format("init(numer=%s,denom=%s)\n", numerator,denominator);
    return init(numerator.realPart,denominator.realPart,arg);
  }

}
