package arb.functions.real;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;

/**
 * <pre>
 * The Strictly Increasing Piecewise Reflected Riemann-Siegel θ function is defined by
 * 
 * Let Δ:2*(ϑ(a) - ϑ(-a)) then
 * 
 * where ϑ'(a)=0 and θ''(a)
 * 
 * monotoneϑ:t->ϑ(t)+(ϑ(a)-ϑ(t))·(1+sgn(a-|t|))+Δ()·θ(-t-a)
 * 
 * where
 * 
 * ϑ:t->im(lnΓ(¼+ⅈ*t/2))-(t*log(π)/2)
 * 
 * is the {@link RiemannSiegelThetaFunction}
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link TheArb4jLibrary}
 */
public class MonotonicRiemannSiegelThetaFunction
                                                 implements
                                                 RealFunction
{
  Real a = Real.named("a").set(6.289835988836898);
  
  public Context context = new Context(a);

  public Real a()
  {
    return a;
  }
  
  @Override
  public String toString()
  {
    return monotoneθ.toString();
  }

  public RealFunction        ϑ         = RealFunction.express("ϑ:t->im(lnΓ(¼+ⅈ*t/2))-(t*log(π)/2)",
                                                              context);

  public RealNullaryFunction Δ         = RealNullaryFunction.express("Δ:2*(ϑ(a) - ϑ(-a))",
                                                                     context);

  RealFunction               monotoneθ = RealFunction.express("monotoneϑ:t->ϑ(t)+(ϑ(a)-ϑ(t))·(1+sgn(a-|t|))+Δ()·θ(-t-a)",
                                                              context);

  RealFunction               diffMonotoneθ;

  @Override
  public RealFunction derivative()
  {
    if (diffMonotoneθ == null)
    {
      diffMonotoneθ = RealFunction.express("diffmonotoneθ:t->diff(monotoneθ(t),t)",
                                           context);
    }
    return diffMonotoneθ;
  }

  public MonotonicRiemannSiegelThetaFunction()
  {
    context.registerFunction("H",
                             new HeavisideStepFunction());
  }

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    return monotoneθ.evaluate(t,
                              order,
                              bits,
                              res);
  }

}
