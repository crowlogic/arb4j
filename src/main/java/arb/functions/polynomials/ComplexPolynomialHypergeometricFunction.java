package arb.functions.polynomials;

import java.util.Comparator;
import java.util.function.Predicate;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Integer;
import arb.Real;
import arb.Verifiable;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.ArbException;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.complex.ComplexPolynomialNullaryFunction;

/**
 * Represents a hypergeometric polynomial, defined by a finite hypergeometric
 * series as <br>
 * <br>
 * pFq:Σn➔zⁿ*∏k➔α[k]₍ₙ₎{k=1…p}/(n!*∏k➔β[k]₍ₙ₎{k=1…q}){n=0…N} <br>
 * <br>
 * 
 * This class encapsulates the computation and representation of hypergeometric
 * polynomials, which are derived from the general hypergeometric series when
 * the existence of a negative integer in the numerator leads to its completion
 * after a finite number of terms.
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
 * {@link Complex#ascendingFactorial(long, int, Complex)} of x. <br>
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
public class ComplexPolynomialHypergeometricFunction implements
                                             ComplexPolynomialNullaryFunction,
                                             Verifiable
{

  public final Context                                                           context;

  private ComplexPolynomialNullaryFunction                                       f;

  public Expression<Object, ComplexPolynomial, ComplexPolynomialNullaryFunction> F;

  boolean                                                                        initialized                     = false;

  private Integer                                                                N;

  public final Integer                                                           p, q;

  public final Complex                                                           α, β;

  public static final Predicate<? super Complex>                                 complexNegativeIntegerPredicate = z -> Real.isNegativeInteger.test(z.re())
                && z.im().isZero();

  public ComplexPolynomialHypergeometricFunction(int p,
                                         int q,
                                         Expression<Object, ComplexPolynomial, ComplexPolynomialNullaryFunction> arg)
  {
    this(Complex.newVector(p),
         Complex.newVector(q),
         arg);
  }

  public ComplexPolynomialHypergeometricFunction(Complex α,
                                         Complex β,
                                         Expression<Object, ComplexPolynomial, ComplexPolynomialNullaryFunction> arg)
  {
    this.α  = α;
    this.β  = β;
    context = new Context(p = new Integer(α.dim,
                                          "p"),
                          q = new Integer(β.dim,
                                          "q"),
                          α.setName("α"),
                          β.setName("β"));

    context.registerVariable("N", N = new Integer());

    F = ComplexPolynomialNullaryFunction.parse("F", RealPolynomialHypergeometricFunction.pFq, context).substitute("z", arg);
  }

  @Override
  public void close()
  {
    p.close();
    q.close();
    α.close();
    β.close();
    N.close();
  }

  @SuppressWarnings("resource")
  public Integer determineDegree()
  {
    return α.stream()
            .filter(complexNegativeIntegerPredicate)
            .map(q -> q.re())
            .min(Comparator.naturalOrder())
            .get()
            .integerValue(N)
            .neg()
            .add(1);
  }

  @Override
  public ComplexPolynomial evaluate(Object nullary, int order, int bits, ComplexPolynomial res)
  {
    if (!initialized)
    {
      initialize();
    }

    f.evaluate(nullary, order, bits, res);
    return res;
  }

  public void initialize()
  {
    if (!verify())
    {
      α.printPrecision = true;
      throw new ArbException("at least one of the upper parameters must be a non-negative integer but there is none among "
                    + α);
    }

    f = F.instantiate();

    determineDegree();

    initialized = true;
  }

  /**
   * @return true if there is at least one strictly nonnegative integer in the
   *         numerator (the condition ensuring the finite number of non-zero terms
   *         in the hypergeometric series this function generates) and there are
   *         no negative integers or zero in the denominator
   */
  @Override
  public boolean verify()
  {
    return α.stream().anyMatch(complexNegativeIntegerPredicate);
  }

}