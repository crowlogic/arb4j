package arb.dynamical.systems;

import arb.*;
import arb.Float;

public interface State<X> extends
                      Set<X>,
                      AutoCloseable
{

  State<X> setTime(Real t);

  State<X> setTime(Float a);

  RandomState getRandomState();

  Real dt(Real result);

}
