package arb.stochastic.processes;

import arb.*;

public class BivariateDiffusionProcess<S extends DiffusionProcessState> extends
                                      OrderedPair<DiffusionProcess<S>, DiffusionProcess<S>> implements
                                      StochasticProcess

{

  public BivariateDiffusionProcess()
  {
    super();
  }

  public BivariateDiffusionProcess(DiffusionProcess<S> a, DiffusionProcess<S> b)
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
