package arb.stochastic.processes;

import arb.dynamical.systems.State;

/**
 * {@link DiffusionCoeffecientFunction} represents a coefficient function for
 * diffusion processes. It is designed to work with states of continuous-time
 * dynamical systems.
 * 
 * @param <S> The type of the state for the continuous-time dynamical system.
 */
public interface DiffusionCoeffecientFunction<S extends State> extends
                                             CoeffecientFunction<S>
{
  default boolean dependsOnAbsoluteTime()
  {
    return false;
  }
}
