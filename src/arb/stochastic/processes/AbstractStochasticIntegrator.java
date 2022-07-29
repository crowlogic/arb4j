package arb.stochastic.processes;

import arb.RandomState;

public class AbstractStochasticIntegrator
{

  protected RandomState   randomState;
  public DiffusionProcess X;
  public boolean          verbose = false;

  public AbstractStochasticIntegrator()
  {
    super();
  }

}