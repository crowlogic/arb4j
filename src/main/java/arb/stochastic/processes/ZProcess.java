package arb.stochastic.processes;

import arb.Real;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.RealBivariateToComplexFunction;
import arb.functions.RealToComplexFunction;
import arb.functions.real.RealFunction;
import arb.functions.real.RealIdentityFunction;
import arb.utensils.ShellFunctions;
import arb.viz.FunctionPlotter;
import javafx.application.Platform;

/**
 * @author Stephen Crowley
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */

public class ZProcess implements
                      RealOscillatoryProcess
{
  
  final Context                        context  = new Context();

  final RealFunction                   θ        =
                                         RealFunction.express("θ:im(lnΓ(¼+ⅈ*t/2))-(log(π)/2)*t",
                                                              context);

  final RealBivariateToComplexFunction ϕ        =
                                         RealBivariateToComplexFunction.express("ϕ:exp(ⅈ*λ*θ(t))*√(θ̇(t))",
                                                                                context);

  final RealBivariateToComplexFunction A        =
                                         RealBivariateToComplexFunction.express("A:exp(ⅈ*λ*θ(t))*√(θ̇(t))",
                                                                                context);

  public final RealToComplexFunction   z        =
                                         RealToComplexFunction.express("z:ζ(½+I*t)", context);

  private static final RealFunction    identity = new RealIdentityFunction();

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
