package arb.stochastic.processes;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.stochastic.ProbabilityDensityFunction;
import arb.stochastic.processes.integrators.State;

/**
 * Markov process is a stochastic model describing a sequence of possible events
 * in which the probability of each event depends only on the state attained in
 * the previous event and not any further back in the history of the process. A
 * Markov process lives in the moment
 * 
 * @author crow
 *
 * @param <Pfunc>
 * @param <F>
 * @param <C>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface MarkovProcess<S extends State> extends
                              StochasticProcess<S>
{
  public ProbabilityDensityFunction getTransitionProbabilityDensity();
}
