package arb.functions;

import arb.Complex;
import arb.ComplexConstants;
import arb.FractionConstants;
import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.Typesettable;

// 
// Decompiled by Procyon v0.6.0
// 
public class diffθ implements
                   Function<Real, Real>,
                   Typesettable,
                   AutoCloseable,
                   Initializable
{
  public boolean       isInitialized;
  public final Integer cⅈ0000;
  public final Integer cⅈ0001;
  public final Integer cⅈ0002;
  public final Integer cⅈ0003;
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
    return FractionConstants.oneQuarter.add(ComplexConstants.ⅈ.mul((Real) t, bits, this.vℂ0001)
                                                              .div(this.cⅈ0000, bits, this.vℂ0002),
                                            bits,
                                            this.vℂ0003)
                                       .digamma(bits, this.vℂ0004)
                                       .mul(ComplexConstants.ⅈ.mul(this.cⅈ0000, bits, this.vℂ0005)
                                                              .div(this.cⅈ0003, bits, this.vℂ0006),
                                            bits,
                                            this.vℂ0007)
                                       .im(bits, this.vℝ0001)
                                       .sub(RealConstants.π.log(bits, this.vℝ0002)
                                                           .div(this.cⅈ0000, bits, this.vℝ0003),
                                            bits,
                                            (Real) result);
  }

  public Function derivative()
  {
    return Function.express((Class) Real.class,
                            (Class) Real.class,
                            (Class) Function.class,
                            "diff(diff(im(lnΓ(¼+ⅈ*t/2))-(log(π)/2)*t,t),t)");
  }

  @Override
  public void initialize()
  {
    if (this.isInitialized)
    {
      throw new AssertionError((Object) "Already initialized");
    }
    this.isInitialized = true;
  }

  public diffθ()
  {
    this.cⅈ0000 = new Integer("2");
    this.cⅈ0001 = new Integer("0");
    this.cⅈ0002 = new Integer("1");
    this.cⅈ0003 = new Integer("4");
    this.vℂ0001 = new Complex();
    this.vℂ0002 = new Complex();
    this.vℂ0003 = new Complex();
    this.vℂ0004 = new Complex();
    this.vℂ0005 = new Complex();
    this.vℂ0006 = new Complex();
    this.vℂ0007 = new Complex();
    this.vℝ0001 = new Real();
    this.vℝ0002 = new Real();
    this.vℝ0003 = new Real();
  }

  public void close()
  {
    this.cⅈ0000.close();
    this.cⅈ0001.close();
    this.cⅈ0002.close();
    this.cⅈ0003.close();
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
    return "t→(im((digamma(¼+((ⅈ*t)/2)))*((ⅈ*2)/4)))-((log(π))/2)";
  }

  @Override
  public String typeset()
  {
    return "\\left(\\im\\left(\\left(\\digamma\\left(\\left(\\frac{1}{4} + \\frac{\\left(ⅈ \\cdot t\\right)}{2}\\right)\\right) \\cdot \\frac{\\left(ⅈ \\cdot 2\\right)}{4}\\right)\\right)-\\frac{\\log(\\pi)}{2}\\right)";
  }
}
