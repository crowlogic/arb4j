package arb.measure;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.space.topological.SampleSpace;
import arb.stochastic.ProbabilityDistributionFunction;

/**
 * A {@link ProbabilitySpace} or a probability triple (Ω,F,P) is a mathematical
 * structure consisting of three elements that provides a precise model of
 * random processes, experiments, or other situations where the possible set of
 * events is not completely known ahead of time, which is almost every natural
 * situation
 *
 * @param <Ω>     the {@link SampleSpace} Ω which is the set of all possible
 *                outcomes
 * @param <Σ>     An {@link EventSpace}, which is a set of outcomes in the
 *                {@link SampleSpace} Ω.
 * @param <Pfunc> A probability {@link ProbabilityDistributionFunction}, which
 *                assigns each event in the {@link EventSpace} a probability,
 *                which is a number between 0 and 1.
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface ProbabilitySpace<X, Σ extends σField<? extends X>, Ω extends SampleSpace<? extends X, Σ>, P extends ProbabilityDistributionFunction>
                                 extends
                                 MeasureSpace<X, Σ>
{

}
