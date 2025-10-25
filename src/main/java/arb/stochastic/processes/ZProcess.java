package arb.stochastic.processes;

import arb.expressions.Context;
import arb.functions.RealBivariateToComplexFunction;
import arb.functions.RealToComplexFunction;
import arb.functions.real.RealFunction;

/**
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class ZProcess implements
                      RealOscillatoryProcess
{

  final Context                        context = new Context();

  final RealFunction                   θ       =
                                         RealFunction.express("θ:im(lnΓ(¼+ⅈ*t/2))-(log(π)/2)*t",
                                                              context);

  final RealBivariateToComplexFunction ϕ       =
                                         RealBivariateToComplexFunction.express("ϕ:exp(ⅈ*λ*θ(t))*√(θ̇(t))",
                                                                                context);

  final RealBivariateToComplexFunction A       =
                                         RealBivariateToComplexFunction.express("A:exp(ⅈ*λ*(θ(t)-t))*√(θ̇(t))",
                                                                                context);

  public final RealToComplexFunction   z       =
                                         RealToComplexFunction.express("z:ζ(½+I*t)", context);

  @Override
  public RealBivariateToComplexFunction gainFunction()
  {
    return A;
  }

  @Override
  public RealBivariateToComplexFunction oscillatoryFunction()
  {
    return ϕ;
  }

}
