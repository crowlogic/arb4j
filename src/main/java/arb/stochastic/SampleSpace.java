package arb.stochastic;

import java.util.Set;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.measure.MeasurableSpace;
import arb.measure.σField;
import arb.space.topological.TopologicalSpace;

/**
 * The sample space (or <b>possibility</b> space) of an experiment or random
 * trial is the set of all possible outcomes or results of that experiment. A
 * sample space is usually denoted using {@link Set} notation, and the possible
 * ordered outcomes, or sample points, are listed as elements in the set. It is
 * common to refer to a sample space by the labels S, Ω, or U (for "universal
 * set").
 * 
 * Elements in the sample space finite, countably infinite, or uncountably
 * infinite.
 * 
 * A subset of the sample space is an event, denoted by E . If the outcome of an
 * experiment is included in E, then event E has occurred.
 *
 * @see <a href="https://en.wikipedia.org/wiki/Sample_space">Wikipedia</a>
 * 
 * @param <E> the type of events that occur in the {@link TopologicalSpace}
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link TheArb4jLibrary}
 */
public interface SampleSpace<E, Σ extends σField<? extends E>> extends
                            MeasurableSpace<E,Σ>
{

}
