package arb.stochastic.processes;

import arb.stochastic.*;

/**
 * Markov process is a stochastic model describing a sequence of possible events
 * in which the probability of each event depends only on the state attained in
 * the previous event and not any further back in the history of the process. A
 * Markov process lives in the moment
 * 
 * @author crow
 *
 * @param <P>
 * @param <F>
 * @param <C>
 */
public interface MarkovProcess<X> extends
                              StochasticProcess
{
  public ProbabiltiyDensityFunction<X> getTransitionProbabilityDensity();
}
