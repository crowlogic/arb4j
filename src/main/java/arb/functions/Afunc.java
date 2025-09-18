package arb.functions;

import arb.Complex;
import arb.ComplexConstants;
import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.Typesettable;
import arb.functions.real.RealFunction;

// 
// Decompiled by Procyon v0.6.0
// 
public class Afunc implements
                   RealToComplexFunction,
                   Typesettable,
                   AutoCloseable,
                   Initializable
{
  public boolean       isInitialized;
  public final Integer cℤ0000;
  public Complex       vℂ0005;
  public Complex       vℂ0006;
  public Complex       vℂ0007;
  public Real          vℝ0005;
  public Real          vℝ0006;
  public θ             θ;
  public Real          λ;

  @Override
  public Class<Real> domainType()
  {
    return Real.class;
  }

  @Override
  public Class<Complex> coDomainType()
  {
    return Complex.class;
  }

  @Override
  public Complex evaluate(final Real t, final int order, final int bits, final Complex result)
  {
    if (!isInitialized)
    {
      initialize();
    }
    return ComplexConstants.ⅈ.mul(λ, bits, vℂ0005)
                             .mul(((Real) ((RealFunction) θ).evaluate(t,
                                                                      order,
                                                                      bits,
                                                                      vℝ0005)).sub((Real) t,
                                                                                   bits,
                                                                                   vℝ0006),
                                  bits,
                                  vℂ0006)
                             .exp(bits, vℂ0007)
                             .mul(cℤ0000, bits, (Complex) result);
  }

  public Function<Real, Real> derivative()
  {
    return Function.express(Real.class, Complex.class, Function.class, "diff(null,t)");
  }

  @Override
  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError((Object) "Already initialized");
    }
    if (θ == null)
    {
      θ = new θ();
    }
    isInitialized = true;
  }

  public Afunc()
  {
    cℤ0000 = new Integer("0");
    vℂ0005 = new Complex();
    vℂ0006 = new Complex();
    vℂ0007 = new Complex();
    vℝ0005 = new Real();
    vℝ0006 = new Real();
  }

  public void close()
  {
    cℤ0000.close();
    vℂ0005.close();
    vℂ0006.close();
    vℂ0007.close();
    vℝ0005.close();
    vℝ0006.close();
    θ.close();
  }

  @Override
  public String toString()
  {
    return "t➔(exp((ⅈ*λ)*((θ(t))-t)))*0";
  }

  @Override
  public String typeset()
  {
    return "\\left(\\exp(\\left(\\left(ⅈ \\cdot λ\\right) \\cdot \\left(θ(t)-t\\right)\\right)) \\cdot 0\\right)";
  }
}
