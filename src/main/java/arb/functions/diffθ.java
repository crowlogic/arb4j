package arb.functions;

import arb.Complex;
import arb.ComplexConstants;
import arb.FractionConstants;
import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.Typesettable;

public class diffθ implements
                   Function<Real, Real>,
                   Typesettable,
                   AutoCloseable,
                   Initializable
{

  public boolean       isInitialized;
  public final Integer cℤ0000 = new Integer("2");
  public final Integer cℤ0001 = new Integer("0");
  public final Integer cℤ0002 = new Integer("1");
  public final Integer cℤ0003 = new Integer("4");
  public Complex       vℂ0001 = new Complex();
  public Complex       vℂ0002 = new Complex();
  public Complex       vℂ0003 = new Complex();
  public Complex       vℂ0004 = new Complex();
  public Complex       vℂ0005 = new Complex();
  public Complex       vℂ0006 = new Complex();
  public Complex       vℂ0007 = new Complex();
  public Real          vℝ0001 = new Real();
  public Real          vℝ0002 = new Real();
  public Real          vℝ0003 = new Real();

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
                                       .digamma(bits, vℂ0004)
                                       .mul(ComplexConstants.ⅈ.mul(cℤ0000, bits, vℂ0005)
                                                              .div(cℤ0003, bits, vℂ0006),
                                            bits,
                                            vℂ0007)
                                       .im(bits, vℝ0001)
                                       .sub(RealConstants.π.log(bits, vℝ0002)
                                                           .div(cℤ0000, bits, vℝ0003),
                                            bits,
                                            result);
  }

  public Function<Real, Real> derivative()
  {
    return Function.express(Real.class,
                            Real.class,
                            Function.class,
                            "diff(diff(im(lnΓ(¼+ⅈ*t/2))-(log(π)/2)*t,t),t)");
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
    cℤ0001.close();
    cℤ0002.close();
    cℤ0003.close();
    vℂ0001.close();
    vℂ0002.close();
    vℂ0003.close();
    vℂ0004.close();
    vℂ0005.close();
    vℂ0006.close();
    vℂ0007.close();
    vℝ0001.close();
    vℝ0002.close();
    vℝ0003.close();
  }

  @Override
  public String toString()
  {
    return "t➔im(digamma(¼+((ⅈ*t)/2))*((ⅈ*2)/4))-(log(π)/2)";
  }

  @Override
  public String typeset()
  {
    return "\\left(\\im(\\left(\\digamma(\\left(\\frac{1}{4} + \\frac{\\left(ⅈ \\cdot t\\right)}{2}\\right)) \\cdot \\frac{\\left(ⅈ \\cdot 2\\right)}{4}\\right))-\\frac{\\log(\\pi)}{2}\\right)";
  }
}
