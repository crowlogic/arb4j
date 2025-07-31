package arb.stochastic.processes;

import arb.Field;
import arb.functions.BivariateFunction;
import arb.functions.Function;
import arb.functions.SquareInterableFunctions;

public interface OscillatoryProcess<D extends Field<? extends D>, R extends Field<? extends R>>
                                   extends
                                   GaussianProcess<D,
                                                 R,
                                                 Function<D, R>,
                                                 SquareInterableFunctions<D>>
{
  public <B extends BivariateFunction<R, Function<R, R>>> B gainFuction();

  public <B extends BivariateFunction<R, Function<R, R>>> B oscillatoryFunction();
}
