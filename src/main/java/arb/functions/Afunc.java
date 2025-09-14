package arb.functions;

import arb.AlgebraicNumber;
import arb.Complex;
import arb.ComplexConstants;
import arb.FractionConstants;
import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.Typesettable;

public class Afunc implements
                   RealToComplexFunction,
                   Typesettable,
                   AutoCloseable,
                   Initializable
{
  public boolean         isInitialized;
  public final Integer   cℤ0000  = new Integer("0");
  public Complex         vℂ0005  = new Complex();
  public Complex         vℂ0006  = new Complex();
  public Complex         vℂ0007  = new Complex();
  public Real            vℝ0005  = new Real();
  public Real            vℝ0006  = new Real();
  public AlgebraicNumber v𝔸0001 = new AlgebraicNumber();
  public θ               θ;
  public Real            λ;

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
                             .mul(((Real) θ.evaluate(t, order, bits, vℝ0005)).sub(t, bits, vℝ0006),
                                  bits,
                                  vℂ0006)
                             .exp(bits, vℂ0007)
                             .mul(cℤ0000.pow(FractionConstants.oneHalf, bits, v𝔸0001),
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
      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    cℤ0000.close();
    vℂ0005.close();
    vℂ0006.close();
    vℂ0007.close();
    vℝ0005.close();
    vℝ0006.close();
    v𝔸0001.close();
    θ.close();
  }

  @Override
  public String toString()
  {
    return "t➔(exp((ⅈ*λ)*((θ(t))-t)))*(0^½)";
  }

  @Override
  public String typeset()
  {
    return "\\left(\\exp(\\left(\\left(ⅈ \\cdot λ\\right) \\cdot \\left(\\θ(t)-t\\right)\\right)) \\cdot {0}^{\\frac{1}{2}}\\right)";
  }
}