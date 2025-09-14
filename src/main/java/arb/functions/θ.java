package arb.functions;

import arb.Complex;
import arb.ComplexConstants;
import arb.FractionConstants;
import arb.Initializable;
import arb.Real;
import arb.Typesettable;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;
import arb.functions.real.RealRiemannSiegelThetaFunction;

/**
 * Decompiled form of the {@link RealRiemannSiegelThetaFunction}
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class θ implements
               RealFunction,
               Typesettable,
               AutoCloseable,
               Initializable
{
  @Override
  public RealFunction derivative()
  {
    return RealFunction.express("diff((im(lnΓ(¼+((ⅈ*t)/2))))-((t*(log(π)))/2),t)");
  }

  public boolean isInitialized;
  public Complex vℂ0001 = new Complex();
  public Complex vℂ0002 = new Complex();
  public Complex vℂ0003 = new Complex();
  public Complex vℂ0004 = new Complex();
  public Real    vℝ0001 = new Real();
  public Real    vℝ0002 = new Real();
  public Real    vℝ0003 = new Real();
  public Real    vℝ0004 = new Real();

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
                                                              .div(2, bits, vℂ0002),
                                            bits,
                                            vℂ0003)
                                       .lnΓ(bits, vℂ0004)
                                       .im(bits, vℝ0001)
                                       .sub(vℝ0002.π(bits)
                                                  .div(2, bits, vℝ0003)
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
