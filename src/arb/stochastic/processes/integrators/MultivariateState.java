package arb.stochastic.processes.integrators;

import arb.Real;
import arb.dynamical.systems.State;
import arb.stochastic.processes.DiffusionProcessState;

public interface MultivariateState extends
                                   State<Real>
{
  int dim();

  public DiffusionProcessState get(int i);
}
