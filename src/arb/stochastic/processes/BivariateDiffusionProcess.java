package arb.stochastic.processes;

import arb.*;
import arb.dynamical.systems.State;

public class BivariateDiffusionProcess<S extends State> extends
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
