package arb.stochastic.processes.integrators;

import arb.Float;
import arb.RandomState;
import arb.Real;
import arb.dynamical.systems.State;
import arb.stochastic.processes.DiffusionProcessState;

public class MultivariateDiffusionProcessState implements
                                               MultivariateState
{

  @Override
  public State setTime(Real t)
  {
    assert false : "implement me";
    return null;

  }

  @Override
  public State setTime(Float a)
  {
    assert false : "implement me";
    return null;

  }

  @Override
  public RandomState getRandomState()
  {
    assert false : "implement me";
    return null;

  }

  @Override
  public Real getdt(Real result)
  {
    assert false : "implement me";
    return null;

  }

  @Override
  public Real setdt(Real dt)
  {
    assert false : "implement me";
    return null;

  }

  @Override
  public int dim()
  {
    assert false : "implement me";
    return 2;

  }

  @Override
  public DiffusionProcessState get(int i)
  {
    assert false : "implement me";
    return null;

  }

}
