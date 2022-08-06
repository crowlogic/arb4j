package arb.dynamical.systems;

import arb.*;
import arb.Float;

public interface State<X> extends
                      Set<X>
{

  State<X> setTime(Real t);

  State<X> setTime(Float a);

  RandomState getRandomState();

  Real getδt(Real result);

  Real setδt(Real dt);

}
