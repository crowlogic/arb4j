package arb.theory;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.language.Sentence;
import arb.language.Word;
import arb.logic.Proposition;

/**
 * A hypothesis is a proposition that expresses a testable statement about the
 * relationship between variables or {@link Observation}s of phenomena.
 * 
 * @param <W>
 * @param <S>
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Hypothesis<W extends Word,
              S extends Sentence<? extends W>,
              P extends Proposition<? extends W, ? extends S>,
              O extends Observation<? extends W, ? extends S>>
{

  /**
   * Returns the logical statement of the hypothesis.
   * 
   * @return Proposition - A formal logical statement.
   */
  P proposition();

  /**
   * Tests the hypothesis against the given {@link Observation}
   * 
   * @param evidence - The evidence against which the hypothesis is to be tested.
   * @return boolean - True if the evidence supports the hypothesis, False
   *         otherwise.
   */
  public boolean test(O observation);


}
