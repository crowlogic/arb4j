package arb.functions;

import arb.Initializable;
import arb.Real;
import arb.Typesettable;

public class ϕ implements
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
  public RealToComplexFunction evaluate(Real λ, int order, int bits, RealToComplexFunction result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    ϕfunc var10000 = new ϕfunc();
    var10000.λ     = λ;
    var10000.diffθ = diffθ;
    var10000.θ     = θ;
    var10000.initialize();
    return var10000;
  }

  public Function<Real, RealToComplexFunction> derivative()
  {
    return Function.express(Real.class,
                            RealToComplexFunction.class,
                            Function.class,
                            "diff(exp(ⅈ*λ*θ(t))*√(θ̇(t)),λ)");
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
  }

  @Override
  public String toString()
  {
    return "λ➔exp((ⅈ*λ)*θ(t))*(diffθ(t)^½)";
  }

  @Override
  public String typeset()
  {
    return "\\left(\\exp(\\left(\\left(ⅈ \\cdot λ\\right) \\cdot \\θ(t)\\right)) \\cdot {\\diffθ(t)}^{\\frac{1}{2}}\\right)";
  }
}
