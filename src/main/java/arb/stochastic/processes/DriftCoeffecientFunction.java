package arb.stochastic.processes;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.stochastic.processes.integrators.State;

/**
 * {@link DriftCoeffecientFunction} represents a coefficient function for the
 * drift component of a stochastic process. It is designed to work with states
 * of continuous-time dynamical systems.
 * 
 * @param <S>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface DriftCoeffecientFunction<S extends State> extends
                                         CoeffecientFunction<S>
{

}
