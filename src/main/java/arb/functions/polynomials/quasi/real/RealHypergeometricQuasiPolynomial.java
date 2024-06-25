package arb.functions.polynomials.quasi.real;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */

import java.util.Comparator;
import java.util.function.Predicate;

import arb.Integer;
import arb.Real;
import arb.RealQuasiPolynomial;
import arb.Verifiable;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.ArbException;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.real.RealQuasiPolynomialNullaryFunction;

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
public class RealHypergeometricQuasiPolynomial implements RealQuasiPolynomialNullaryFunction, Verifiable
{

  public static final String                                                         pFq                             = "Σn➔zⁿ*∏k➔α[k]₍ₙ₎{k=1…p}/(n!*∏k➔β[k]₍ₙ₎{k=1…q}){n=0…N}";

  public final Context                                                               context;

  private RealQuasiPolynomialNullaryFunction                                         f;

  public Expression<Object, RealQuasiPolynomial, RealQuasiPolynomialNullaryFunction> F;

  boolean                                                                            initialized                     = false;

  private Integer                                                                    N;

  public final Integer                                                               p, q;

  public final Real                                                                  α, β;

  public static final Predicate<? super Real>                                        complexNegativeIntegerPredicate = z -> Real.isNegativeInteger.test(z)
                && z.isZero();

  public RealHypergeometricQuasiPolynomial(int p,
                                           int q,
                                           Expression<Object, RealQuasiPolynomial, RealQuasiPolynomialNullaryFunction> arg)
  {
    this(Real.newVector(p),
         Real.newVector(q),
         arg);
  }

  public RealHypergeometricQuasiPolynomial(Real α,
                                           Real β,
                                           Expression<Object, RealQuasiPolynomial, RealQuasiPolynomialNullaryFunction> arg)
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

    F = RealQuasiPolynomialNullaryFunction.parse("F", RealHypergeometricQuasiPolynomial.pFq, context)
                                          .substitute("z", arg);
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
            .min(Comparator.naturalOrder())
            .get()
            .integerValue(N)
            .neg()
            .add(1);
  }

  @Override
  public RealQuasiPolynomial evaluate(Object nullary, int order, int bits, RealQuasiPolynomial res)
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