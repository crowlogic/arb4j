package arb.functions;

import arb.Complex;
import arb.ComplexConstants;
import arb.FractionConstants;
import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.Typesettable;
import arb.functions.real.RealFunction;

// 
// Decompiled by Procyon v0.6.0
// 
public class diffθ implements
                   RealFunction,
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
    return FractionConstants.oneQuarter.add(ComplexConstants.ⅈ.mul((Real) t, bits, vℂ0001)
                                                              .div(cⅈ0000, bits, vℂ0002),
                                            bits,
                                            vℂ0003)
                                       .digamma(bits, vℂ0004)
                                       .mul(ComplexConstants.ⅈ.mul(cⅈ0000, bits, vℂ0005)
                                                              .div(cⅈ0003, bits, vℂ0006),
                                            bits,
                                            vℂ0007)
                                       .im(bits, vℝ0001)
                                       .sub(RealConstants.π.log(bits, vℝ0002)
                                                           .div(cⅈ0000, bits, vℝ0003),
                                            bits,
                                            (Real) result);
  }

  public RealFunction derivative()
  {
    return Function.express(Real.class,
                            Real.class,
                            RealFunction.class,
                            "diff(diff(im(lnΓ(¼+ⅈ*t/2))-(log(π)/2)*t,t),t)");
  }

  @Override
  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError((Object) "Already initialized");
    }
    isInitialized = true;
  }

  public diffθ()
  {
    cⅈ0000 = new Integer("2");
    cⅈ0001 = new Integer("0");
    cⅈ0002 = new Integer("1");
    cⅈ0003 = new Integer("4");
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
    cⅈ0000.close();
    cⅈ0001.close();
    cⅈ0002.close();
    cⅈ0003.close();
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
    return "t→(im((digamma(¼+((ⅈ*t)/2)))*((ⅈ*2)/4)))-((log(π))/2)";
  }

  @Override
  public String typeset()
  {
    return "\\left(\\im\\left(\\left(\\digamma\\left(\\left(\\frac{1}{4} + \\frac{\\left(ⅈ \\cdot t\\right)}{2}\\right)\\right) \\cdot \\frac{\\left(ⅈ \\cdot 2\\right)}{4}\\right)\\right)-\\frac{\\log(\\pi)}{2}\\right)";
  }
}
