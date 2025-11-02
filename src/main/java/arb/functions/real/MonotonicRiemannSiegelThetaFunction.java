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
public class MonotonicRiemannSiegelThetaFunction implements
                                                 RealFunction
{
  Context context = new Context(Real.named("a").set(6.289835988836898));

  @Override
  public String toString()
  {
    return monotoneθ.toString();
  }

  RealFunction θ         = RealFunction.express("θ:t->im(lnΓ(¼+ⅈ*t/2))-(t*log(π)/2)", context);

  RealFunction monotoneθ = RealFunction.express("monotoneθ:t->θ(a)+(θ(t)-θ(a))*sign(t-a)", context);

  RealFunction diffMonotoneθ;

  @Override
  public RealFunction derivative()
  {
    if (diffMonotoneθ == null)
    {
      diffMonotoneθ = RealFunction.express("diffmonotoneθ:t->diff(monotoneθ(t),t)", context);
    }
    return diffMonotoneθ;
  }

  public MonotonicRiemannSiegelThetaFunction()
  {
    context.registerFunction("H", new HeavisideStepFunction());
  }

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    return monotoneθ.evaluate(t, order, bits, res);
  }

}
