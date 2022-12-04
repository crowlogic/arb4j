package arb.stochastic.processes.integrators;

import arb.dynamical.systems.State;

public interface MultivariateState<S extends State> extends
                                  State<S>
{
  int dim();

  public S getState(int i);
}
