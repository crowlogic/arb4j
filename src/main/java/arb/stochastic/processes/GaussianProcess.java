package arb.stochastic.processes;

import java.util.stream.Stream;

import arb.documentation.Bibliography;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.Referral;
import arb.documentation.TheArb4jLibrary;
import arb.documentation.concepts.Concept;
import arb.space.topological.TopologicalSpace;
import arb.stochastic.GaussianDistribution;

/**
 * In {@link ProbabilityTheory} and statistics, a {@link GaussianProcess} is a
 * {@link StochasticProcess} (a collection of random variables indexed by time
 * or {@link TopologicalSpace}), such that every finite collection of those
 * random variables has a multivariate normal distribution, i.e. every finite
 * linear combination of them is normally distributed. The distribution of a
 * Gaussian process is the joint distribution of all those (infinitely many)
 * random variables, and as such, it is a distribution over functions with a
 * continuous domain, e.g. time or space.
 * 
 * The concept of Gaussian processes is named after Carl Friedrich Gauss because
 * it is based on the notion of the Gaussian distribution (normal distribution).
 * Gaussian processes can be seen as an infinite-dimensional generalization of
 * multivariate normal distributions.
 * 
 * Gaussian processes are useful in statistical modelling, benefiting from
 * properties inherited from the normal {@link GaussianDistribution}
 * distribution. For example, if a {@link StochasticProcess} is modelled as a
 * {@link GaussianProcess}, the distributions of various derived quantities can
 * be obtained explicitly. Such quantities include <i>the average value of the
 * process over a range of times</i> and <i>the error in estimating the average
 * using sample values at a small set of times</a>.
 * 
 *
 * @param <Pfunc>
 * @param <F>
 * @param <C>
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface GaussianProcess extends
                                 LévyProcess,
                                 Concept
{

  @Override
  default Stream<Referral> getReferences()
  {
    return Stream.of(Bibliography.stationaryAndRelatedStochasticProcesses.referToChapters("2.10"));
  }

}
