package arb.stochastic.processes;

import arb.EvaluationSequence;
import arb.dynamical.systems.ContinuousTimeDynamicalSystem;
import arb.stochastic.processes.integrators.MultivariateState;

public interface MultivariateDiffusionProcess<D extends MultivariateState> extends
                                             ContinuousTimeDynamicalSystem<D>

{

  int dim();

  public DiffusionProcess get(int i);

  boolean verbose = false;

  DiffusionProcessState getState(int i);

}
