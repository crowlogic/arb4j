package arb.stochastic.processes.continuoustime;

import arb.*;
import arb.dynamical.systems.DiscreteTimeDynamicalSystem;

public interface StochasticIntegrator extends
                                      DiscreteTimeDynamicalSystem
{

  /**
   * 
   * @param state       the {@link DiffusionProcessState} already configured with
   *                    initial values
   * @param interval    the interval over which to integrate
   * @param n           number of pieces to split the interval into
   * @param randomState the {@link RandomState} used to generate the
   *                    {@link WhiteNoise}
   * @param prec        the number of bits of precision to use for the
   *                    calculations
   * @return
   */
  public EvaluationSequence
         integrate(DiffusionProcessState state, FloatInterval interval, int n, RandomState randomState, int prec);
}
