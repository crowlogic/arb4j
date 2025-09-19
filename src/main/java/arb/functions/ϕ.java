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
    if (!this.isInitialized)
    {
      this.initialize();
    }

    ϕfunc var10000 = new ϕfunc();
    var10000.λ = λ;
    var10000.θ = this.θ;
    var10000.initialize();
    return var10000;
  }

  public Function derivative()
  {
    return Function.express(Real.class,
                            RealToComplexFunction.class,
                            Function.class,
                            "diff(exp(ⅈ*λ*θ(t))*√(θ̇(t)),λ)");
  }

  @Override
  public void initialize()
  {
    if (this.isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else
    {
      if (this.θ == null)
      {
        this.θ = new θ();
      }

      this.isInitialized = true;
    }
  }

  @Override
  public void close()
  {
  }

  @Override
  public String toString()
  {
    return "λ➔(exp((ⅈ*λ)*(θ(t))))*0";
  }

  @Override
  public String typeset()
  {
    return "\\left(\\exp(\\left(\\left(ⅈ \\cdot λ\\right) \\cdot \\θ(t)\\right)) \\cdot 0\\right)";
  }
}
