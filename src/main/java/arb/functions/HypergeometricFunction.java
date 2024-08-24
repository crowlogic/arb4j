package arb.functions;

import java.util.Comparator;
import java.util.Optional;
import java.util.stream.Stream;

import arb.Complex;
import arb.Fraction;
import arb.Integer;
import arb.NamedRing;
import arb.Real;
import arb.Verifiable;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.ArbException;
import arb.expressions.Context;
import arb.expressions.Expression;

/**
 * Represents a finite hypergeometric series as <br>
 * <br>
 * pFq:Σn➔zⁿ*∏k➔αₖ₍ₙ₎{k=1…p}/(n!*∏k➔βₖ₍ₙ₎{k=1…q}){n=0…N} <br>
 * <br>
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

  public Class<?>                 paramType;

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
    if (paramType.equals(Complex.class))
    {
      this.α = (P) Complex.newVector(alpha.dim());
      this.β = (P) Complex.newVector(beta.dim());
    }
    else if (paramType.equals(Real.class))

    {
      this.α = (P) Real.newVector(alpha.dim());
      this.β = (P) Real.newVector(beta.dim());
    }
    else
    {
      throw new UnsupportedOperationException("TODO: handle paramType="
                                              + paramType
                                              + " and setting values from "
                                              + alpha.getClass());
    }
    this.α.set(alpha);
    this.β.set(beta);

    initializeContext();

    compile(elementType, nullaryFunctionType, arg);
    assert paramType.equals(this.α.getClass()) : String.format("paramType=%s != alpha.class=%s\n",
                                                               paramType,
                                                               this.α.getClass());

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
    this.α         = (P) Complex.newVector(alpha.dim());
    this.β         = (P) Complex.newVector(beta.dim());
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
      Real         a            = (Real) this.α;

      Stream<Real> stream       = Stream.of(a.elements).filter(Real.isNegativeInteger);
      Optional<Real> min = stream.min(Comparator.naturalOrder());
      assert min.isPresent() : "no negative integers in " + a;
      Real         real         = min.get();

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
  public final C evaluate(Object nullary, int order, int bits, C res)
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
    assert paramType.equals(this.α.getClass()) : String.format("paramType=%s != alpha.class=%s\n",
                                                               paramType,
                                                               this.α.getClass());
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
