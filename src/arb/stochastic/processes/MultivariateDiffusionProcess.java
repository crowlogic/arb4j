package arb.stochastic.processes;

import arb.dynamical.systems.State;

public class MultivariateDiffusionProcess implements
                                          MultivariateStochasticProcess

{

  public MultivariateDiffusionProcess()
  {
    super();
  }

  public MultivariateDiffusionProcess(DiffusionProcess x, DiffusionProcess x2)
  {
    assert false : "...";
  }

  @Override
  public int dim()
  {
    return 2;
  }

}
