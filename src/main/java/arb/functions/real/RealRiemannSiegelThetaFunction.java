package arb.functions.real;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;

/**
 * <pre>
 * The Riemann-Siegel θ function is defined by 
 * 
 * θ(t) = arg(Γ(¼ + it/2)) - t*log(π)/2
 * 
 * </pre>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealRiemannSiegelThetaFunction implements
                                            RealFunction
{

  @Override
  public RealFunction derivative()
  {
    return RealFunction.express("θ:t->diff(im(lnΓ(¼+ⅈ*t/2))-(t*log(π)/2),t)");
  }

  static
  {
    // Expression.saveClasses = true;
  }
  public static final RealFunction θ = RealFunction.express("θ:t->im(lnΓ(¼+ⅈ*t/2))-(t*log(π)/2)");

  public RealRiemannSiegelThetaFunction()
  {
  }

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {

    return θ.evaluate(t, order, bits, res);
  }

}
