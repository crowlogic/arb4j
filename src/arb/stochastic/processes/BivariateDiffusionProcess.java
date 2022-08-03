package arb.stochastic.processes;

import arb.OrderedPair;

public class BivariateDiffusionProcess<S extends DiffusionProcessState, D extends DiffusionProcess<S>>
                                      extends
                                      OrderedPair<D, D> implements
                                      StochasticProcess

{

  public BivariateDiffusionProcess()
  {
    super();
  }

  public BivariateDiffusionProcess(D a, D b)
  {
    super(a,
          b);
  }

  @Override
  public int dim()
  {
    return 2;
  }

}
