package arb.stochastic.processes;

import arb.Real;
import arb.expressions.Context;
import arb.functions.Function;
import arb.functions.real.RealFunction;

public class RealZProcess implements
                          RealOscillatoryProcess
{
  final Context      context = new Context(Real.named("λ"));

  final RealFunction ϑ       =
                       RealFunction.express("ϑ:t->im(lnΓ(1/4+I*t/2))-(log(π)/2)*t", context);

  final RealFunction A       = RealFunction.express("A:t->exp(I*λ*(θ(t)-t))", context);

  @Override
  public Function<Real, Real> gainFuction()
  {
    return A;
  }

}
