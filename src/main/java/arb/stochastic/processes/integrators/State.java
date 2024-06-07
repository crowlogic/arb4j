package arb.stochastic.processes.integrators;

import arb.Float;
import arb.RandomState;
import arb.Real;

public interface State
{

  State setTime(Real t);

  State setTime(Float a);

  Real getdt(Real dt);

  /**
   * Sets the infinitesimal constant time delta
   * 
   * @param dt
   * @return dt for chaining function invocations together in a single expression
   */
  Real setdt(Real dt);

  RandomState getRandomState();

}
