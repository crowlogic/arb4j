package arb.mechanics.classical;

import arb.Real;
import arb.dynamical.systems.State;
import arb.functions.Function;

public interface Observable extends
                            Function<State, Real>,
                            arb.physics.Observable
{

}
