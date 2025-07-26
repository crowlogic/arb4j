package arb.stochastic.processes;

import arb.Field;
import arb.Real;
import arb.functions.Function;
import arb.functions.RealSquareIntegrableFunctions;

public interface OscillatoryProcess<R extends Field<? extends R>> extends
                                   GaussianProcess<Real,
                                                 R,
                                                 Function<Real, R>,
                                                 RealSquareIntegrableFunctions>
{
  public Function<Real, R> gainFuction();

}
