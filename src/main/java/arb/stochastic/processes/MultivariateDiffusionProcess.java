package arb.stochastic.processes;

import arb.FloatInterval;
import arb.Verifiable;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.stochastic.processes.integrators.MultivariateState;

/**
 * MultivariateDiffusionProcess represents a multivariate stochastic diffusion
 * process modeled by a continuous-time dynamical system. It provides methods
 * for obtaining the dimension, individual diffusion processes, the state, and
 * integration of the process over a specified interval with a specified number
 * of points per unit time.
 * 
 * @param <D> The type of {@link MultivariateState} for the process
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface MultivariateDiffusionProcess<D extends MultivariateState<?>> extends
                                             Verifiable

{

  int dim();

  public <G extends DiffusionProcess<?>> G get(int i);

//  public DiffusionProcess<D> get(int i);

  boolean verbose = false;

  public D getState();

  public EvaluationSequence
         integrate(FloatInterval integrationInterval, int bits, int pointsPerUnitTime);

}
