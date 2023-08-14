package arb.dynamical.systems;

import arb.*;
import arb.Float;

public interface State<X> extends
                      Set<X>
{

  State<X> setTime(Real t);

  State<X> setTime(Float a);

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
