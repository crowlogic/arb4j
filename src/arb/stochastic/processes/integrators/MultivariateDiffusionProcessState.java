package arb.stochastic.processes.integrators;

import arb.dynamical.systems.State;
import arb.stochastic.processes.ContinuousTimeState;
import arb.stochastic.processes.DiffusionProcessState;

public abstract class MultivariateDiffusionProcessState extends
                                                        ContinuousTimeState<DiffusionProcessState> implements
                                                        MultivariateState<DiffusionProcessState>
{

  @Override
  public abstract DiffusionProcessState getState(int i);

}
