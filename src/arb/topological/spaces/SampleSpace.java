package arb.topological.spaces;

import arb.Set;
import arb.measures.MeasurableSpace;
import arb.topological.TopologicalSpace;

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
 */
public interface SampleSpace<E> extends
                            MeasurableSpace<E>
{

}
