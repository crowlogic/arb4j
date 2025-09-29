package arb.functions;

import arb.Complex;
import arb.Initializable;
import arb.Real;
import arb.RealConstants;
import arb.Typesettable;

public class A implements
               RealBivariateToComplexFunction,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public static void main(String args[])
  {
    /**
     * This is not going to work correctly into the monotonized theta function is used.. because presentyl 
     * it will return NaN when the derivative of theta is negative 
     */
    try ( A a = new A())
    {
      Real                  x  = RealConstants.half;
      RealToComplexFunction Ax = a.evaluate(x, 0, 128);

      double                z  = 14.3;
      var                   y  = Ax.eval(z, new Complex());
      y.printPrecision = false;
      System.out.format("Ax=A(x=%s)=%s\n", x.doubleValue(), Ax);      
      System.out.format("Ax(%s)=%s\n", z, y);
    }
  }

  public boolean isInitialized;
  public θ       θ;

  public diffθ   diffθ = new diffθ();

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

  public Function<Real, RealToComplexFunction> derivative()
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
