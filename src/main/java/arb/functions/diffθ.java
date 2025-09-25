package arb.functions;

import arb.Complex;
import arb.ComplexConstants;
import arb.FractionConstants;
import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.Typesettable;

// Decompiled by Procyon v0.6.0
public class diffθ implements
                   Function<Real, Real>,
                   Typesettable,
                   AutoCloseable,
                   Initializable
{
  public boolean       isInitialized;
  public final Integer cℤ0000;
  public final Integer cℤ0001;
  public final Integer cℤ0002;
  public final Integer cℤ0003;
  public Complex       vℂ0001;
  public Complex       vℂ0002;
  public Complex       vℂ0003;
  public Complex       vℂ0004;
  public Complex       vℂ0005;
  public Complex       vℂ0006;
  public Complex       vℂ0007;
  public Real          vℝ0001;
  public Real          vℝ0002;
  public Real          vℝ0003;

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
  public Real evaluate(final Real t, final int order, final int bits, final Real result)
  {
    return FractionConstants.oneQuarter.add(ComplexConstants.ⅈ.mul((Real) t, bits, vℂ0001)
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
                                            (Real) result);
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
    isInitialized = true;
  }

  public diffθ()
  {
    cℤ0000 = new Integer("2");
    cℤ0001 = new Integer("0");
    cℤ0002 = new Integer("1");
    cℤ0003 = new Integer("4");
    vℂ0001 = new Complex();
    vℂ0002 = new Complex();
    vℂ0003 = new Complex();
    vℂ0004 = new Complex();
    vℂ0005 = new Complex();
    vℂ0006 = new Complex();
    vℂ0007 = new Complex();
    vℝ0001 = new Real();
    vℝ0002 = new Real();
    vℝ0003 = new Real();
  }

  public void close()
  {
    this.cℤ0000.close();
    this.cℤ0001.close();
    this.cℤ0002.close();
    this.cℤ0003.close();
    this.vℂ0001.close();
    this.vℂ0002.close();
    this.vℂ0003.close();
    this.vℂ0004.close();
    this.vℂ0005.close();
    this.vℂ0006.close();
    this.vℂ0007.close();
    this.vℝ0001.close();
    this.vℝ0002.close();
    this.vℝ0003.close();
  }

  @Override
  public String toString()
  {
    return "t↦(im((digamma(¼+((ⅈ*t)/2)))*((ⅈ*2)/4)))-((log(π))/2)";
  }

  @Override
  public String typeset()
  {
    return "\\left(\\im(\\left(\\digamma(\\left(\\frac{1}{4} + \\frac{\\left(ⅈ \\cdot t\\right)}{2}\\right)) \\cdot \\frac{\\left(ⅈ \\cdot 2\\right)}{4}\\right))-\\frac{\\log(\\pi)}{2}\\right)";
  }
}