package arb.functions.real;

import arb.Complex;
import arb.ComplexConstants;
import arb.FractionConstants;
import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.Typesettable;
import arb.functions.Function;

public class θ implements
               RealFunction,
               Typesettable,
               AutoCloseable,
               Initializable
{
  @Override
  public Function<Real, Real> derivative()
  {
    // TODO Auto-generated method stub
    return RealFunction.super.derivative();
  }

  public boolean       isInitialized;
  public final Integer cℤ0000 = new Integer("2");
  public Complex       vℂ0001 = new Complex();
  public Complex       vℂ0002 = new Complex();
  public Complex       vℂ0003 = new Complex();
  public Complex       vℂ0004 = new Complex();
  public Real          vℝ0001 = new Real();
  public Real          vℝ0002 = new Real();
  public Real          vℝ0003 = new Real();
  public Real          vℝ0004 = new Real();

  @Override
  public Class<Real> domainType()
  {
    return Real.class;
  }

  @Override
  public Class<Real> coDomainType()
  {
    return Real.class;
  }

  @Override
  public Real evaluate(Real t, int order, int bits, Real result)
  {
    return FractionConstants.oneQuarter.add(ComplexConstants.ⅈ.mul(t, bits, vℂ0001)
                                                              .div(cℤ0000, bits, vℂ0002),
                                            bits,
                                            vℂ0003)
                                       .lnΓ(bits, vℂ0004)
                                       .im(bits, vℝ0001)
                                       .sub(vℝ0002.π(bits)
                                                  .div(cℤ0000, bits, vℝ0003)
                                                  .mul(t, bits, vℝ0004),
                                            bits,
                                            result);
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
    vℂ0001.close();
    vℂ0002.close();
    vℂ0003.close();
    vℂ0004.close();
    vℝ0001.close();
    vℝ0002.close();
    vℝ0003.close();
    vℝ0004.close();
  }

  @Override
  public String toString()
  {
    return "θ:t➔(im(lnΓ(¼+((ⅈ*t)/2))))-(((log(π))/2)*t)";
  }

  @Override
  public String typeset()
  {
    return "\\left(\\im(\\lnΓ(\\left(\\frac{1}{4} + \\frac{\\left(ⅈ \\cdot t\\right)}{2}\\right)))-\\left(\\frac{\\log(\\pi)}{2} \\cdot t\\right)\\right)";
  }
}
