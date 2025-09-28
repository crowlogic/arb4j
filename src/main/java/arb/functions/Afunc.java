package arb.functions;

import arb.Complex;
import arb.ComplexConstants;
import arb.FractionConstants;
import arb.Initializable;
import arb.Real;
import arb.Typesettable;

public class Afunc implements
                   RealToComplexFunction,
                   Typesettable,
                   AutoCloseable,
                   Initializable
{
  public boolean isInitialized;
  public Complex vℂ0005 = new Complex();
  public Complex vℂ0006 = new Complex();
  public Complex vℂ0007 = new Complex();
  public Real    vℝ0005 = new Real();
  public Real    vℝ0006 = new Real();
  public Real    vℝ0007 = new Real();
  public Real    vℝ0008 = new Real();
  public θ       θ;

  public diffθ   diffθ;

  public Real    λ;

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
  public Complex evaluate(Real t, int order, int bits, Complex result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    return ComplexConstants.ⅈ.mul(λ, bits, vℂ0005)
                             .mul((θ.evaluate(t, order, bits, vℝ0005)).sub(t, bits, vℝ0006),
                                  bits,
                                  vℂ0006)
                             .exp(bits, vℂ0007)
                             .mul((diffθ.evaluate(t,
                                                  order,
                                                  bits,
                                                  vℝ0007)).pow(FractionConstants.oneHalf,
                                                               bits,
                                                               vℝ0008),
                                  bits,
                                  result);
  }

  public Function<Real, Complex> derivative()
  {
    return Function.express(Real.class, Complex.class, Function.class, "diff(null,t)");
  }

  @Override
  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else
    {
      if (θ == null)
      {
        θ = new θ();
      }

      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    vℂ0005.close();
    vℂ0006.close();
    vℂ0007.close();
    vℝ0005.close();
    vℝ0006.close();
    vℝ0007.close();
    vℝ0008.close();
    diffθ.close();
    θ.close();
  }

  @Override
  public String toString()
  {
    return "t➔exp((ⅈ*λ)*(θ(t)-t))*(diffθ(t)^½)";
  }

  @Override
  public String typeset()
  {
    return "\\left(\\exp(\\left(\\left(ⅈ \\cdot λ\\right) \\cdot \\left(\\θ(t)-t\\right)\\right)) \\cdot {\\diffθ(t)}^{\\frac{1}{2}}\\right)";
  }
}
