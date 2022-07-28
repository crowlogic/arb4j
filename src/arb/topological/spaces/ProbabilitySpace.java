package arb.topological.spaces;

import arb.Set;
import arb.stochastic.ProbabilityDistributionFunction;
import arb.topological.Space;

/**
 * A {@link ProbabilitySpace} or a probability triple (Ω,F,P) is a mathematical
 * structure consisting of three elements that provides a precise model of
 * random processes or "experiments".
 *
 * @param <Ω> the {@link SampleSpace} Ω which is the set of all possible
 *            outcomes
 * @param <F> An {@link EventSpace}, which is a set of outcomes in the
 *            {@link SampleSpace} Ω.
 * @param <P> A probability {@link ProbabilityDistributionFunction}, which assigns each
 *            event in the {@link EventSpace} a probability, which is a number
 *            between 0 and 1.
 */
public interface ProbabilitySpace<Ω extends SampleSpace, F extends EventSpace<Ω>, P extends ProbabilityDistributionFunction>
                                 extends
                                 Space<Ω>
{

}
