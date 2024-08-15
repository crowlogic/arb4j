package arb.functions;

import java.util.Comparator;

import arb.*;
import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.ArbException;
import arb.expressions.Context;
import arb.expressions.Expression;

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
 * @param <P> the type of the numerator and denominator parameters
 * @param <C> the type of the codomain of this {@link NullaryFunction}
 * @param <N> the type of NullaryFunction
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class HypergeometricFunction<P extends NamedRing<P>,
              C extends NamedRing<C>,
              N extends NullaryFunction<C>> implements
                                            NullaryFunction<C>,
                                            Verifiable
{

  public Context                  context;

  public N                       f;

  public Expression<Object, C, N> F;

  boolean                         initialized = false;

  public Integer                 N;

  public Integer                  p, q;

  public P                        α, β;

  public HypergeometricFunction()
  {

  }

  public HypergeometricFunction<P, C, N> init(Class<P> paramType,
                                              Class<C> elementType,
                                              Class<N> nullaryFunctionType,
                                              int p,
                                              int q,
                                              Expression<Object, C, N> arg)
  {
    Real alpha = Real.newVector(p);
    Real beta  = Real.newVector(q);

    init(paramType, elementType, nullaryFunctionType, alpha, beta, arg);

    return this;
  }

  public HypergeometricFunction<P, C, N> init(Class<P> paramType,
                                              Class<C> elementType,
                                              Class<N> nullaryFunctionType,
                                              Real alpha,
                                              Real beta,
                                              Expression<Object, C, N> arg)
  {
    assignParameters(paramType, alpha, beta);

    initializeContext();

    F = NullaryFunction.parse(elementType,
                              nullaryFunctionType,
                              "F",
                              "Σn➔zⁿ⋅∏k➔αₖ₍ₙ₎{k=1…p}/(n!⋅∏k➔βₖ₍ₙ₎{k=1…q}){n=0…N}",
                              context);
    F = F.substitute("z", arg);
    F.compile();
    
    return this;
  }

  public void initializeContext()
  {
    context = new Context(p = new Integer(α.dim(),
                                          "p"),
                          q = new Integer(β.dim(),
                                          "q"),
                          α.setName("α"),
                          β.setName("β"));

    context.registerVariable("N", N = new Integer());
  }

  @SuppressWarnings("unchecked")
  public void assignParameters(Class<P> paramType, Real alpha, Real beta)
  {
    if (Real.class.equals(paramType))
    {
      this.α = (P) alpha;
      this.β = (P) beta;
    }
    else if (Fraction.class.equals(paramType))
    {
      this.α = (P) Real.newVector(alpha.size());
      this.β = (P) Real.newVector(beta.size());
      this.α.set(alpha);
      this.β.set(beta);
    }
    else
    {

      throw new IllegalArgumentException("unhandled elementType " + paramType);
    }
  }

  @Override
  public void close()
  {
    if (p != null)
    {
      p.close();
      p = null;
    }
    if (q != null)
    {
      q.close();
      q = null;
    }
    if (α != null)
    {
      α.close();
      α = null;
    }
    if (β != null)
    {
      β.close();
      β = null;
    }
    if (N != null)
    {
      N.close();
      N = null;
    }
  }

  public Integer determineDegree()
  {
    return α.stream()
            .filter(Real.isNegativeInteger)
            .map(a -> (Real) α)
            .min(Comparator.naturalOrder())
            .get()
            .integerValue(N)
            .neg()
            .add(1);
  }

  @Override
  public C evaluate(Object nullary, int order, int bits, C res)
  {
    if (!initialized)
    {
      initialize();
    }

    return f.evaluate(nullary, order, bits, res);
  }

  public void initialize()
  {
    if (!verify())
    {
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
    for (int i = 0; i < p.getSignedValue(); i++)
    {
      if (Real.isNegativeInteger.test(this.α.get(i)))
      {
        return true;
      }
    }
    return false;
  }

}
