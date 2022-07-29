package arb.stochastic.processes.continuoustime;

import arb.functions.real.ErrorFunction;
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
 * properties inherited from the normal {@link GaussianProbabilityDistribution}
 * distribution. For example, if a {@link StochasticProcess} is modelled as a
 * {@link GaussianProcess}, the distributions of various derived quantities can
 * be obtained explicitly. Such quantities include <i>the average value of the
 * process over a range of times</i> and <i>the error in estimating the average
 * using sample values at a small set of times</a>.
 * 
 * @author crow
 * @see the related {@link ErrorFunction}
 *
 * @param <P>
 * @param <F>
 * @param <C>
 */
public interface GaussianProcess<P extends ProbabilityDensityFunction, F extends ProbabilityDistributionFunction, C extends CharacteristicFunction>
                                extends
                                LévyProcess<P, F, C>
{

}
