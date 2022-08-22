package arb.stochastic.processes.integrators;

import arb.Real;
import arb.dynamical.systems.State;
import arb.stochastic.processes.DiffusionProcessState;

public interface MultivariateState<S extends State> extends
                                  State<S>
{
  int dim();

  public S getState(int i);
}
