package arb.stochastic.processes;

import arb.dynamical.systems.*;

public class BivariateDiffusionProcess<S extends State> implements
                                      MultivariateStochasticProcess<S>

{

  public DiffusionProcess<S> spotProcess;
  public DiffusionProcess<S> varianceProcess;

  public BivariateDiffusionProcess()
  {
    super();
  }

  public BivariateDiffusionProcess(DiffusionProcess<S> a, DiffusionProcess<S> b)
  {
    this.spotProcess     = a;
    this.varianceProcess = b;
  }

  @Override
  public int dim()
  {
    return 2;
  }

  @Override
  public DiffusionProcess<S> get(int i)
  {
    switch (i)
    {
    case 0:
      return spotProcess;
    case 1:
      return varianceProcess;
    }
    assert false : "impossible";
    return null;
  }

}
