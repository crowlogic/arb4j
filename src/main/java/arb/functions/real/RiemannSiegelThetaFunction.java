package arb.functions.real;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;

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
public class RiemannSiegelThetaFunction implements
                                        RealFunction
{
  Context context = new Context();

  @Override
  public String toString()
  {
    return θ.toString();
  }

  RealFunction θ          = RealFunction.express("θ:t->im(lnΓ(¼+ⅈ*t/2))-(t*log(π)/2)", context);

  RealFunction derivative = RealFunction.express("diffθ:t->diff(θ(t),t)", context);

  @Override
  public RealFunction derivative()
  {
    return derivative;
  }

  static
  {
    // Expression.saveClasses = true;
  }

  public RiemannSiegelThetaFunction()
  {
  }

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {

    return θ.evaluate(t, order, bits, res);
  }

}
