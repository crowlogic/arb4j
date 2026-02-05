package arb.functions;

import java.util.Comparator;
import java.util.stream.Stream;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.*;
import arb.Integer;
import arb.exceptions.ArbException;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.utensils.Utensils;

public abstract class HypergeometricFunction<P extends NamedRing<P>,
              C extends NamedRing<C>,
              N extends NullaryFunction<C>> implements
                                            NullaryFunction<C>,
                                            Verifiable
{

  @Override
  public String toString()
  {
    return String.format("pFq(%s,%s;arg)", α, β);
  }

  public Context                  context;
  public N                        f;
  public Expression<Object, C, N> F;
  boolean                         initialized = false;
  public Integer                  N;
  public Integer                  p, q;
  public P                        α, β;
  public Class<?>                 paramType;

  protected N                     constantArgFunc;
  protected Function<C, C>        inputDependentArgFunc;
  protected boolean               argIsConstant;
  protected C                     z;

  public HypergeometricFunction()
  {
  }

  static final Logger logger = LoggerFactory.getLogger(HypergeometricFunction.class);

//NEW: init for Real alpha/beta, constant arg
  @SuppressWarnings("unchecked")
  public HypergeometricFunction<P, C, N> init(Class<P> paramType,
                                              Class<C> elementType,
                                              Class<N> nullaryFunctionType,
                                              Real alpha,
                                              Real beta,
                                              N constantArg)
  {
    Fraction af = new Fraction();
    Fraction bf = new Fraction();
    af.set(alpha);
    bf.set(beta);
    return init(paramType, elementType, nullaryFunctionType, af, bf, constantArg);
  }

//NEW: init for Real alpha/beta, input-dependent arg
  @SuppressWarnings("unchecked")
  public HypergeometricFunction<P, C, N> init(Class<P> paramType,
                                              Class<C> elementType,
                                              Class<N> nullaryFunctionType,
                                              Real alpha,
                                              Real beta,
                                              Function<C, C> inputDependentArg)
  {
    Fraction af = new Fraction();
    Fraction bf = new Fraction();
    af.set(alpha);
    bf.set(beta);
    return init(paramType, elementType, nullaryFunctionType, af, bf, inputDependentArg);
  }

  @SuppressWarnings("unchecked")
  public HypergeometricFunction<P, C, N> init(Class<P> paramType,
                                              Class<C> elementType,
                                              Class<N> nullaryFunctionType,
                                              Fraction alpha,
                                              Fraction beta,
                                              N constantArg)
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
      throw new UnsupportedOperationException("TODO: handle paramType=" + paramType);
    }
    this.α.set(alpha);
    this.β.set(beta);
    this.constantArgFunc = constantArg;
    this.argIsConstant   = true;

    initializeContext(elementType);
    compile(elementType, nullaryFunctionType);
    return this;
  }

  @SuppressWarnings("unchecked")
  public HypergeometricFunction<P, C, N> init(Class<P> paramType,
                                              Class<C> elementType,
                                              Class<N> nullaryFunctionType,
                                              Fraction alpha,
                                              Fraction beta,
                                              Function<C, C> inputDependentArg)
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
      throw new UnsupportedOperationException("TODO: handle paramType=" + paramType);
    }
    this.α.set(alpha);
    this.β.set(beta);
    this.inputDependentArgFunc = inputDependentArg;
    this.argIsConstant         = false;

    initializeContext(elementType);
    compile(elementType, nullaryFunctionType);
    return this;
  }

  @SuppressWarnings("unchecked")
  public HypergeometricFunction<P, C, N> init(Class<P> paramType,
                                              Class<C> elementType,
                                              Class<N> nullaryFunctionType,
                                              Complex alpha,
                                              Complex beta,
                                              N constantArg)
  {
    this.paramType = paramType;
    this.α         = (P) Complex.newVector(alpha.dim());
    this.β         = (P) Complex.newVector(beta.dim());
    this.α.set(alpha);
    this.β.set(beta);
    this.constantArgFunc = constantArg;
    this.argIsConstant   = true;

    initializeContext(elementType);
    compile(elementType, nullaryFunctionType);
    return this;
  }

  @SuppressWarnings("unchecked")
  public HypergeometricFunction<P, C, N> init(Class<P> paramType,
                                              Class<C> elementType,
                                              Class<N> nullaryFunctionType,
                                              Complex alpha,
                                              Complex beta,
                                              Function<C, C> inputDependentArg)
  {
    this.paramType = paramType;
    this.α         = (P) Complex.newVector(alpha.dim());
    this.β         = (P) Complex.newVector(beta.dim());
    this.α.set(alpha);
    this.β.set(beta);
    this.inputDependentArgFunc = inputDependentArg;
    this.argIsConstant         = false;

    initializeContext(elementType);
    compile(elementType, nullaryFunctionType);
    return this;
  }

  public void compile(Class<C> elementType, Class<N> nullaryFunctionType)
  {
    F = NullaryFunction.parse(elementType,
                              nullaryFunctionType,
                              "F",
                              "Σn➔zⁿ⋅∏k➔αₖ₍ₙ₎{k=1…p}/(n!⋅∏k➔βₖ₍ₙ₎{k=1…q}){n=0…N}",
                              context);
    f = F.instantiate();
  }

  @SuppressWarnings("unchecked")
  public void initializeContext(Class<C> elementType)
  {
    context = new Context(p = new Integer(α.dim(),
                                          "p"),
                          q = new Integer(β.dim(),
                                          "q"),
                          α.setName("α"),
                          β.setName("β"));
    context.registerVariable("N", N = new Integer());

    // Create z and register it - f will have z injected as a field
    try
    {
      z = elementType.getDeclaredConstructor().newInstance();
      z.setName("z");
      context.registerVariable("z", (Named) z);
    }
    catch (Exception e)
    {
      throw new ArbException("Failed to create z: " + e.getMessage(),
                             e);
    }

    determineDegree();
  }

  @Override
  public void close()
  {
    p = Utensils.close(p);
    q = Utensils.close(q);
    N = Utensils.close(N);
    α = Utensils.close(α);
    β = Utensils.close(β);
    z = Utensils.close(z);
  }

  public Integer determineDegree()
  {
    if (α instanceof Real a)
    {
      var min = Stream.of(a.elements).filter(Real.isNegativeInteger).min(Comparator.naturalOrder());
      if (!min.isPresent())
      {
        throw new IllegalArgumentException("no negative integers in " + a);
      }
      return min.get().integerValue(N).neg().add(1);
    }
    else if (α instanceof Complex a)
    {
      var min = Stream.of(a.elements)
                      .filter(Complex.isNegativeInteger)
                      .min(Comparator.naturalOrder());
      if (!min.isPresent())
      {
        throw new IllegalArgumentException("no negative integers in " + a);
      }
      return min.get().re().integerValue(N).neg().add(1);
    }
    else
    {
      throw new UnsupportedOperationException("TODO: support parameter type " + α.getClass());
    }
  }

  @Override
  public final C evaluate(Object input, int order, int bits, C res)
  {
    if (!initialized)
    {
      initialize();
    }

    if (!(N.sign() > 0))
    {
      throw new IllegalArgumentException(N + " should be a positive integer");
    }

    // Evaluate arg into z (mutates z directly)
    if (!argIsConstant)
    {
      inputDependentArgFunc.evaluate((C) input, order, bits, z);
    }
    // If constant, z was already set in initialize()

    // f has z as injected field, reads it directly
    return f.evaluate(null, order, bits, res);
  }

  public void initialize()
  {
    if (!verify())
    {
      throw new ArbException("at least one of the upper parameters must be a non-negative integer");
    }

    f = F.instantiate();
    determineDegree();

    // Evaluate constant arg once into z
    if (argIsConstant)
    {
      constantArgFunc.evaluate(null, 1, 128, z);
    }

    initialized = true;
  }

  @Override
  public boolean verify()
  {
    int p = this.p.getSignedValue();
    if (Real.class.equals(paramType))
    {
      for (int i = 0; i < p; i++)
      {
        if (Real.isNegativeInteger.test(α.get(i)))
        {
          return true;
        }
      }
    }
    else if (Complex.class.equals(paramType))
    {
      for (int i = 0; i < p; i++)
      {
        if (Complex.isNegativeInteger.test(α.get(i)))
        {
          return true;
        }
      }
    }
    else
    {
      throw new ArbException("TODO: handle paramType=" + paramType);
    }
    return false;
  }

}
