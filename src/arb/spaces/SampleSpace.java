package arb.spaces;

/**
 * the sample space (also called sample description space or possibility space)
 * of an experiment or random trial is the set of all possible outcomes or
 * results of that experiment. A sample space is usually denoted using set
 * notation, and the possible ordered outcomes, or sample points, are listed as
 * elements in the set. It is common to refer to a sample space by the labels S,
 * Ω, or U (for "universal set"). The elements of a sample space may be numbers,
 * words, letters, or symbols. They can also be finite, countably infinite, or
 * uncountably infinite.
 * 
 * A subset of the sample space is an event, denoted by E . If the outcome of an
 * experiment is included in E, then event E has occurred.
 *
 * @see <a href="https://en.wikipedia.org/wiki/Sample_space">Wikipedia</a>
 * 
 * @param <X>
 */
public interface SampleSpace<X> extends
                            Space<X>
{

}
