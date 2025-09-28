package arb.functions;

import arb.Complex;
import arb.Initializable;
import arb.Real;
import arb.RealConstants;
import arb.Typesettable;
import arb.utensils.Utensils;

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

      System.out.println("A(1)(2.3)=" + Utensils.yamlString(f));
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
  public RealToComplexFunction evaluate(Real λ, int order, int bits, RealToComplexFunction result)
  {
    if (!this.isInitialized)
    {
      this.initialize();
    }

    Afunc var10000 = new Afunc();
    var10000.λ     = λ;
    var10000.diffθ = this.diffθ;
    var10000.θ     = this.θ;
    var10000.initialize();
    return var10000;
  }

  public Function derivative()
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
    return "λ➔exp((ⅈ*λ)*(θ(t)-t))*(diffθ(t)^½)";
  }

  @Override
  public String typeset()
  {
    return "\\left(\\exp(\\left(\\left(ⅈ \\cdot λ\\right) \\cdot \\left(\\θ(t)-t\\right)\\right)) \\cdot {\\diffθ(t)}^{\\frac{1}{2}}\\right)";
  }
}
