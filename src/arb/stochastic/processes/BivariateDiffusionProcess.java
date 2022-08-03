package arb.stochastic.processes;

import arb.*;

public class BivariateDiffusionProcess<S extends DiffusionProcessState> extends
                                      OrderedPair<DiffusionProcess<S>, DiffusionProcess<S>> implements
                                      StochasticProcess, DiffusionProcess<S>

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

  @Override
  public <F extends DriftCoeffecientFunction<S>> F μ(int i)
  {
    return a.μ(i);
  }

  @Override
  public <F extends DiffusionCoeffecientFunction<S>> F σ(int i)
  {
    return a.σ(i);
  }

  

}
