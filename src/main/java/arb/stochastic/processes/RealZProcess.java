package arb.stochastic.processes;

import arb.Real;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.RealBivariateFunction;
import arb.functions.RealBivariateToComplexFunction;
import arb.functions.RealToComplexFunction;
import arb.functions.real.RealFunction;
import arb.utensils.ShellFunctions;

public class RealZProcess implements
                          RealOscillatoryProcess
{
  public static void main(String args[])
  {
    Expression.trace = Expression.saveClasses = true;
    RealZProcess          Zprocess = new RealZProcess();
    RealToComplexFunction gain     = Zprocess.A.evaluate(Real.named("λ").one(), 128);
    ShellFunctions.plot(0, 200, 2000, gain.realPart(), gain.imagPart());

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
  public RealBivariateToComplexFunction gainFuction()
  {
    return A;
  }

  @Override
  public RealBivariateToComplexFunction oscillatoryFunction()
  {
    return ϕ;
  }

}
