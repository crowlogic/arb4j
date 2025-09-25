package arb.functions;

import arb.Complex;
import arb.Initializable;
import arb.Real;
import arb.RealConstants;
import arb.Typesettable;
import arb.utensils.Utensils;

//
// Decompiled by Procyon v0.6.0
//
public class A implements
               RealBivariateToComplexFunction,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public static void main(String args[])
  {
    try ( A a = new A())
    {
      RealToComplexFunction f = a.evaluate(RealConstants.sqrt2, 0, 128);

      var                   y = f.eval(2.3, new Complex());
      System.out.println("A(1)=" + Utensils.yamlString(f));

      System.out.println("A(1)(2.3)=" + y);
    }
  }

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
    return Function.express(Real.class,
                            RealToComplexFunction.class,
                            Function.class,
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
