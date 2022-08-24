package arb.stochastic.processes;

import arb.Real;
import arb.RealConstants;
import arb.Verifiable;
import arb.dynamical.systems.ContinuousTimeDynamicalSystem;
import arb.stochastic.processes.integrators.MultivariateState;

public interface MultivariateDiffusionProcess<D extends MultivariateState> extends
                                             ContinuousTimeDynamicalSystem<D>,
                                             Verifiable

{

  int dim();

  public DiffusionProcess get(int i);

  boolean verbose = false;

  /**
   * This must be symmetric.. corr(i,j) must equal corr(j,i). When i=j the
   * correlation is always implicitly {@link RealConstants#one}
   * 
   * @param i
   * @param j
   * @return
   */
  Real getCorrelation(int i, int j);

}
