package arb.language;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.logic.Proposition;
import arb.logic.Statement;

/**
 * A {@link Question} is a {@link Proposition} specified as a {@link Sentence}
 * whose {@link Sentence#structure()} is such that it deduce to determine its
 * truth or falsity through a response.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Question<W extends Word> extends
                         Sentence<W>
{
  public <A extends Statement<? extends W>> A answer();
}
