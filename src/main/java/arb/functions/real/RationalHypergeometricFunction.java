package arb.functions.real;

import java.lang.foreign.Arena;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */

import java.util.Comparator;
import java.util.function.Predicate;

import arb.Fraction;
import arb.Integer;
import arb.RationalFunction;
import arb.Real;
import arb.Verifiable;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.ArbException;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.RationalNullaryExpression;

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
public class RationalHypergeometricFunction implements RationalNullaryFunction, Verifiable
{

  public static final String                  pFq                      = "Σn➔zⁿ*∏k➔α[k]₍ₙ₎{k=1…p}/(n!*∏k➔β[k]₍ₙ₎{k=1…q}){n=0…N}";

  public Context                              context;

  public RationalNullaryFunction              f;

  public RationalNullaryExpression            F;

  boolean                                     initialized              = false;

  private Integer                             N;

  public Integer                              p, q;

  public Real                                 α, β;

  public final Arena                          arena                    = Arena.ofShared();

  public static final Predicate<? super Real> negativeIntegerPredicate = z -> Real.isNegativeInteger.test(z)
                || z.isZero();

  public void init(Fraction α, Fraction β, Expression<Object, RationalFunction, RationalNullaryFunction> arg)
  {
    this.α = Real.newVector(α.dim);
    for (int i = 0; i < α.dim; i++)
    {
      this.α.get(i).set(α.get(i));
    }
    this.β = Real.newVector(β.dim);
    for (int i = 0; i < β.dim; i++)
    {
      this.β.get(i).set(β.get(i));
    }

    context = new Context(p = new Integer(α.dim,
                                          "p"),
                          q = new Integer(β.dim,
                                          "q"),
                          this.α.setName("α"),
                          this.β.setName("β"));

    context.registerVariable("N", N = new Integer());

    F = RationalNullaryFunction.parse("F", RationalHypergeometricFunction.pFq, context).substitute("z", arg);
  }


  public RationalHypergeometricFunction()
  {

  }

  public RationalHypergeometricFunction(Fraction α,
                                        Fraction β,
                                        Expression<Object, RationalFunction, RationalNullaryFunction> arg)
  {
    init(α, β, arg);
  }

  @Override
  public void close()
  {
    p.close();
    q.close();
    α.close();
    β.close();
    N.close();
    arena.close();
  }

  public Integer determineDegree()
  {
    return α.stream()
            .filter(negativeIntegerPredicate)
            .min(Comparator.naturalOrder())
            .get()
            .integerValue(N)
            .neg()
            .add(1);
  }

  @Override
  public RationalFunction evaluate(Object nullary, int order, int bits, RationalFunction res)
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
    assert !initialized : "already initialized";
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
    return α.stream().anyMatch(negativeIntegerPredicate);
  }

}