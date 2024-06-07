package arb.theory;

import java.util.Collection;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.language.Sentence;
import arb.language.Word;
import arb.logic.Proposition;

/**
 * A theory can be described as a collection of propositions or principles that
 * are considered true based on a substantial body of evidence, related to a
 * particular subject or phenomena, which it aims to explain and predict. A
 * scientific theory integrates and synthesizes knowledge across different
 * observations, experiments, and hypotheses to provide a comprehensive
 * understanding of a natural or physical phenomenon. It is characterized by its
 * broad applicability, allowing it to explain a wide range of occurrences and
 * predict new phenomena or the results of new experiments. The strength of a
 * theory lies in its ability to consistently and accurately describe
 * observations, withstand rigorous testing, and integrate new information
 * without being disproven.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Theory<W extends Word,
              S extends Sentence<? extends W>,
              P extends Proposition<? extends W, ? extends S>,
              O extends Observation<? extends W, ? extends S>,
              H extends Hypothesis<? extends W, ? extends S, ? extends P, O>>
{
  Collection<H> principles();

  /**
   * Affirm the tenents of this {@link Theory} by calling
   * {@link Hypothesis#test(Observation)} on each of the {@link Hypothesis} given
   * by this{@link #principles()}
   * 
   * @param observation
   * @return true if all of the {@link Hypothesis#test(Observation)} affirm the
   *         given observation
   */
  public default boolean test(O observation)
  {
    return principles().stream().allMatch(hypothesis ->
    {
      H hypothesis2 = hypothesis;
      return hypothesis2.test(observation);
    });
  }
}
