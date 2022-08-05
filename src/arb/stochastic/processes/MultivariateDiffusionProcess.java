package arb.stochastic.processes;

import arb.dynamical.systems.State;

public class MultivariateDiffusionProcess<S extends State> implements
                                         MultivariateStochasticProcess

{

  public MultivariateDiffusionProcess()
  {
    super();
  }

  public MultivariateDiffusionProcess(DiffusionProcess<S> x, DiffusionProcess<S> x2)
  {
    assert false : "...";
  }

  @Override
  public int dim()
  {
    return 2;
  }

}
