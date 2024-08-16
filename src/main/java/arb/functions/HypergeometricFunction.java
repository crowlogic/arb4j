package arb.functions;

import java.util.Comparator;
import java.util.stream.Stream;

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

  @Override
  public String toString()
  {
    return String.format("HypergeometricFunction [context=%s, f=%s, F=%s, initialized=%s, N=%s, p=%s, q=%s, α=%s, β=%s]",
                         context,
                         f,
                         F,
                         initialized,
                         N,
                         p,
                         q,
                         α,
                         β);
  }

  public Context                  context;

  public N                        f;

  public Expression<Object, C, N> F;

  boolean                         initialized = false;

  public Integer                  N;

  public Integer                  p, q;

  public P                        α, β;

  public HypergeometricFunction()
  {

  }

  public HypergeometricFunction<P, C, N> init(Class<P> paramType,
                                              Class<C> elementType,
                                              Class<N> nullaryFunctionType,
                                              Real alpha,
                                              Real beta,
                                              Expression<Object, C, N> arg)
  {
    this.α = (P) alpha;
    this.β = (P) beta;
    initializeContext();

    compile(elementType, nullaryFunctionType, arg);

    return this;
  }

  @SuppressWarnings("unchecked")
  public HypergeometricFunction<P, C, N> init(Class<P> paramType,
                                              Class<C> elementType,
                                              Class<N> nullaryFunctionType,
                                              Fraction alpha,
                                              Fraction beta,
                                              Expression<Object, C, N> arg)
  {
    // assert false : "damn";
    this.α = (P) Real.newVector(alpha.dim());
    this.β = (P) Real.newVector(beta.dim());
    this.α.set(alpha);
    this.β.set(beta);
    System.out.println("alpha=" + this.α + " beta=" + this.β);
    initializeContext();

    compile(elementType, nullaryFunctionType, arg);

    return this;
  }

  @SuppressWarnings("unchecked")
  public HypergeometricFunction<P, C, N> init(Class<P> paramType,
                                              Class<C> elementType,
                                              Class<N> nullaryFunctionType,
                                              Complex alpha,
                                              Complex beta,
                                              Expression<Object, C, N> arg)
  {
    this.α = (P) Complex.newVector(alpha.dim());
    this.β = (P) Complex.newVector(beta.dim());
    this.α.set(alpha);
    this.β.set(beta);
    initializeContext();

    compile(elementType, nullaryFunctionType, arg);

    return this;
  }

  public void
         compile(Class<C> elementType, Class<N> nullaryFunctionType, Expression<Object, C, N> arg)
  {
    F = NullaryFunction.parse(elementType,
                              nullaryFunctionType,
                              "F",
                              "Σn➔zⁿ⋅∏k➔αₖ₍ₙ₎{k=1…p}/(n!⋅∏k➔βₖ₍ₙ₎{k=1…q}){n=0…N}",
                              context);
    F = F.substitute("z", arg);
    f = F.instantiate();
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
    determineDegree();

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
    if (α instanceof Real)
    {
      assert false : "filter for negative integers in numerator";
      Real a    = (Real) this.α;
      Real real = Stream.of(a.elements).min(Comparator.naturalOrder()).get();
      System.out.println("min numerator=" + real);
      Integer integer = real.integerValue(N).neg().add(1);
      return integer;
    }
    else
    {
      throw new UnsupportedOperationException(" TODO: support parmeter type " + α.getClass());
    }
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
