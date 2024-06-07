package arb.stochastic.processes;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.stochastic.processes.integrators.State;

/**
 * A stationary process (or a strict/strictly stationary process or
 * strong/strongly stationary process) is a stochastic process whose
 * unconditional joint probability distribution does not change when shifted in
 * time.[1] Consequently, parameters such as mean and variance also do not
 * change over time
 * 
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface StationaryProcess<S extends State> extends
                                  StochasticProcess<S>
{

}
