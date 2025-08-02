package arb.stochastic.processes;

import arb.Real;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.RealBivariateToComplexFunction;
import arb.functions.RealToComplexFunction;
import arb.functions.real.RealFunction;
import arb.utensils.ShellFunctions;
import arb.viz.FunctionPlotter;
import javafx.application.Platform;

/**
 * @author Stephen Crowley
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */

public class RealZProcess implements
                          RealOscillatoryProcess
{
  public static void main(String args[])
  {
    RealZProcess          Zprocess = new RealZProcess();
    RealToComplexFunction gain     =
                               Zprocess.gainFunction()
                                       .evaluate(Real.named("λ").set(RealConstants.half), 128);
    RealToComplexFunction ϕ        =
                            Zprocess.oscillatoryFunction().evaluate(Real.named("λ").one(), 128);

    FunctionPlotter       frame    = ShellFunctions.plot(0,
                                                         200,
                                                         20000,
                                                         gain.realPart(),
                                                         gain.imagPart(),
                                                         gain.realPart().sub(gain.imagPart()));

    Platform.setImplicitExit(true);

    Platform.runLater(() -> ShellFunctions.saveImage(frame.chart, "gain.png"));

  }

  final Context                        context = new Context();

  final RealFunction                   θ       =
                                         RealFunction.express("θ:im(lnΓ(1/4+I*t/2))-(log(π)/2)*t",
                                                              context);

  final RealBivariateToComplexFunction A       =
                                         RealBivariateToComplexFunction.express("A:exp(I*λ*(θ(t)-t))",
                                                                                context);

  final RealBivariateToComplexFunction ϕ       =
                                         RealBivariateToComplexFunction.express("ϕ:exp(I*λ*θ(t))",
                                                                                context);

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
