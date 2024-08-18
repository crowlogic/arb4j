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
import arb.expressions.nodes.unary.HypergeometricFunctionNode;

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
 * Note regarding parameters: hypergeometric functions can indeed have
 * complex-valued parameters and parameters that depend on the argument.
 * 
 * 1. Complex-valued parameters: Hypergeometric functions can absolutely have
 * complex-valued parameters. In fact, this is quite common in various
 * applications in physics and mathematics. For example, the general
 * hypergeometric function ₂F₁(a,b;c;z) can have complex values for a, b, and c.
 * 
 * 2. Parameters depending on the argument: This is a bit more nuanced. In the
 * classical definition of hypergeometric functions, the parameters are
 * typically constant. However, there are generalizations and related functions
 * where the parameters can depend on the argument:
 * 
 * a) Generalized hypergeometric functions: These can sometimes be defined with
 * parameters that are functions of the argument.
 * 
 * b) q-Hypergeometric functions: These are q-analogs of hypergeometric
 * functions where q can sometimes be a function of the argument.
 * 
 * c) Meijer G-functions and Fox H-functions: These are generalizations of
 * hypergeometric functions that can have more flexible parameter structures.
 * 
 * d) Differential equations: When hypergeometric functions are considered as
 * solutions to differential equations, the coefficients of the equation (which
 * relate to the parameters of the function) can sometimes depend on the
 * independent variable.
 * 
 * However, it's important to note that when we allow parameters to depend on
 * the argument, we're often moving beyond the classical definition of
 * hypergeometric functions and into more general classes of special functions.
 * 
 * In computational implementations, allowing parameters to depend on the
 * argument would require careful consideration of how this dependency is
 * expressed and evaluated, as it could significantly complicate the algorithms
 * for computing these functions.
 * 
 * For most standard libraries and implementations, hypergeometric functions are
 * typically defined with constant (though possibly complex) parameters. If you
 * need functions with argument-dependent parameters, you might need to
 * construct these as composite functions or use more general frameworks for
 * special functions.
 * 
 * All that being said, for now, just throw an exception if
 * {@link HypergeometricFunctionNode#dependsOnInput}
 * 
 * @param <P> the type of the numerator and denominator parameters
 * @param <C> the type of the codomain of this {@link NullaryFunction}
 * @param <N> the type of NullaryFunction
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class HypergeometricFunction<P extends NamedRing<? extends P>,
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

  public Class<?>                paramType;

  public HypergeometricFunction()
  {

  }

  @SuppressWarnings("unchecked")
  public HypergeometricFunction<P, C, N> init(Class<P> paramType,
                                              Class<C> elementType,
                                              Class<N> nullaryFunctionType,
                                              Real alpha,
                                              Real beta,
                                              Expression<Object, C, N> arg)
  {
    this.paramType = paramType;
    this.α         = (P) alpha;
    this.β         = (P) beta;
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
    this.paramType = paramType;
    this.α         = (P) Real.newVector(alpha.dim());
    this.β         = (P) Real.newVector(beta.dim());
    this.α.set(alpha);
    this.β.set(beta);
    System.out.format("α=%s\nβ=%s\nalpha=%s\nbeta=%s\n",α,β,alpha,beta);

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
    this.paramType = paramType;
    this.α = (P) Complex.newVector(alpha.dim());
    this.β = (P) Complex.newVector(beta.dim());
    this.α.set(alpha);
    this.β.set(beta);
    System.out.format("α=%s\nβ=%s\n",α,β);
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
      Real         a            = (Real) this.α;

      Stream<Real> stream       = Stream.of(a.elements).filter(Real.isNegativeInteger);
      Real         real         = stream.min(Comparator.naturalOrder()).get();

      Integer      integerValue = real.integerValue(N);
      Integer      integer      = integerValue.neg().add(1);
      return integer;
    }
    else if (α instanceof Complex)
    {
      Complex         a            = (Complex) this.α;
      Stream<Complex> stream       = Stream.of(a.elements).filter(Complex.isNegativeInteger);
      Complex         x            = stream.min(Comparator.naturalOrder()).get();
      Integer         integerValue = x.getReal().integerValue(N);
      Integer         integer      = integerValue.neg().add(1);
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

    // assert false : N + " dammit";
    assert N.sign()
                  > 0 : N
                        + " should be a positive integer equal to one plus the negative of the least integer parameter in the numerator";
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
    int p = this.p.getSignedValue();
    if (Real.class.equals(paramType))
    {
      for (int i = 0; i < p; i++)
      {
        if (Real.isNegativeInteger.test(this.α.get(i)))
        {
          return true;
        }
      }
    }
    else if (Complex.class.equals(paramType))
    {
      for (int i = 0; i < p; i++)
      {
        if (Complex.isNegativeInteger.test(this.α.get(i)))
        {
          return true;
        }
      }
    }
    else
    {
      throw new ArbException("TOOD: handle paramType=" + paramType);
    }
    return false;
  }

}
