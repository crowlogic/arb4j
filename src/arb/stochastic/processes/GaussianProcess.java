package arb.stochastic.processes;

import arb.stochastic.*;
import arb.theoretical.ProbabilityTheory;
import arb.topological.Space;

/**
 * In {@link ProbabilityTheory} and statistics, a {@link GaussianProcess} is a
 * {@link StochasticProcess} (a collection of random variables indexed by time
 * or {@link Space}), such that every finite collection of those random
 * variables has a multivariate normal distribution, i.e. every finite linear
 * combination of them is normally distributed. The distribution of a Gaussian
 * process is the joint distribution of all those (infinitely many) random
 * variables, and as such, it is a distribution over functions with a continuous
 * domain, e.g. time or space.
 * 
 * The concept of Gaussian processes is named after Carl Friedrich Gauss because
 * it is based on the notion of the Gaussian distribution (normal distribution).
 * Gaussian processes can be seen as an infinite-dimensional generalization of
 * multivariate normal distributions.
 * 
 * Gaussian processes are useful in statistical modelling, benefiting from
 * properties inherited from the normal distribution. For example, if a random
 * process is modelled as a Gaussian process, the distributions of various
 * derived quantities can be obtained explicitly. Such quantities include the
 * average value of the process over a range of times and the error in
 * estimating the average using sample values at a small set of times. While
 * exact models often scale poorly as the amount of data increases, multiple
 * approximation methods have been developed which often retain good accuracy
 * while drastically reducing computation time.
 * 
 * @author crow
 *
 * @param <P>
 * @param <F>
 * @param <C>
 */
public interface GaussianProcess<P extends ProbabilityDensityFunction, F extends ProbabilityDistributionFunction, C extends CharacteristicFunction>
                                extends
                                StochasticProcess<P, F, C>
{

}
