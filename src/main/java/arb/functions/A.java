package arb.functions;

import arb.Initializable;
import arb.Real;
import arb.Typesettable;

//
// Decompiled by Procyon v0.6.0
//
public class A implements
               RealBivariateToComplexFunction,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public boolean isInitialized;
  public θ       θ;
  public diffθ   diffθ;

  @Override
  public Class<Real> domainType()
  {
    return Real.class;
  }

  @Override
  public Class<RealToComplexFunction> coDomainType()
  {
    return RealToComplexFunction.class;
  }

  @Override
  public RealToComplexFunction
         evaluate(final Real λ, final int order, final int bits, final RealToComplexFunction result)
  {
    if (!this.isInitialized)
    {
      this.initialize();
    }
    final Afunc afunc = new Afunc();
    afunc.λ = λ;
    afunc.θ = this.θ;
    afunc.initialize();
    return (RealToComplexFunction) afunc;
  }

  public Function<Real, Real> derivative()
  {
    return Function.express((Class) Real.class,
                            (Class) RealToComplexFunction.class,
                            (Class) Function.class,
                            "diff(exp(ⅈ*λ*(θ(t)-t))*√(θ̇(t)),λ)");
  }

  @Override
  public void initialize()
  {
    if (this.isInitialized)
    {
      throw new AssertionError((Object) "Already initialized");
    }
    if (this.θ == null)
    {
      this.θ = new θ();
    }
    this.isInitialized = true;
  }

  public void close()
  {
  }

  @Override
  public String toString()
  {
    return "λ➔(exp((ⅈ*λ)*((θ(t))-t)))*0";
  }

  @Override
  public String typeset()
  {
    return "\\left(\\exp(\\left(\\left(ⅈ \\cdot λ\\right) \\cdot \\left(θ(t)-t\\right)\\right)) \\cdot 0\\right)";
  }
}
