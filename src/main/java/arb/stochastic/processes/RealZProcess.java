package arb.stochastic.processes;

import arb.expressions.Context;
import arb.functions.RealBivariateFunction;
import arb.functions.real.RealFunction;

public class RealZProcess implements
                          RealOscillatoryProcess
{
  final Context               context = new Context();

  final RealFunction          ϑ       = RealFunction.express("ϑ:t->im(lnΓ(1/4+I*t/2))-(log(π)/2)*t",
                                                             context);

  final RealBivariateFunction A       =
                                RealBivariateFunction.express("A:t->exp(I*λ*(θ(t)-t))", context);

  final RealBivariateFunction ϕ       =
                                RealBivariateFunction.express("ϕ:t->exp(I*λ*θ(t))", context);

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
