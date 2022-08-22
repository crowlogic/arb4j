package arb.dynamical.systems;

import arb.*;
import arb.Float;

public interface State<X> extends
                      Set<X>
{

  State<X> setTime(Real t);

  State<X> setTime(Float a);

  Real getdt(Real dt);

  State<X> setdt(Real dt);

  RandomState getRandomState();

}
