package arb.stochastic.processes.integrators;

import arb.*;
import arb.Float;
import arb.dynamical.systems.*;
import arb.stochastic.processes.DiffusionProcessState;

public interface StochasticIntegrator<S extends State> extends 
                                      DiscreteTimeDynamicalSystem<S>
{

  /**
   * 
   * @param state       the {@link DiffusionProcessState} already configured with
   *                    initial values
   * @param interval    the interval over which to integrate
   * @param n           number of pieces to split the interval into
   * @param prec        the number of bits of precision to use for the
   *                    calculations
   * @return
   */
  public EvaluationSequence
         integrate(DiffusionProcessState state, FloatInterval interval, int n, int prec);

  public Float weakConvergenceOrder();

  public Float strongConvergenceOrder();
}
