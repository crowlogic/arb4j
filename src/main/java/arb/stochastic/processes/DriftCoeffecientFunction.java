package arb.stochastic.processes;

import arb.dynamical.systems.State;

/**
 * {@link DriftCoeffecientFunction} represents a coefficient function for the
 * drift component of a stochastic process. It is designed to work with states
 * of continuous-time dynamical systems.
 * 
 * @param <S>
 */
public interface DriftCoeffecientFunction<S extends State> extends
                                         CoeffecientFunction<S>
{

}
