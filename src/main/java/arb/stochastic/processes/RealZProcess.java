package arb.stochastic.processes;

import arb.Real;
import arb.expressions.Context;
import arb.functions.RealBivariateFunction;
import arb.functions.real.RealFunction;
import arb.utensils.ShellFunctions;

public class RealZProcess implements
                          RealOscillatoryProcess
{
  public static void main(String args[])
  {
    RealZProcess Zprocess = new RealZProcess();
    RealFunction gain     = Zprocess.A.evaluate(Real.named("λ").one(), 128);
    ShellFunctions.plot(0, 200, 2000, gain);

  }

  final Context               context = new Context();

  final RealFunction          ϑ       = RealFunction.express("ϑ:t->im(lnΓ(1/4+I*t/2))-(log(π)/2)*t",
                                                             context);

  final RealBivariateFunction A       =
                                RealBivariateFunction.express("A:exp(I*λ*(θ(t)-t))", context);

  final RealBivariateFunction ϕ       =
                                RealBivariateFunction.express("ϕ:exp(I*λ*θ(t))", context);

  @Override
  public RealBivariateFunction gainFuction()
  {
    return A;
  }

  @Override
  public RealBivariateFunction oscillatoryFunction()
  {
    return ϕ;
  }

}
