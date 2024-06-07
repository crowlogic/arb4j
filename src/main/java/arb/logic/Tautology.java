package arb.logic;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.language.Sentence;
import arb.language.Word;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Tautology<W extends Word, S extends Sentence<? extends W>> extends
                          Proposition<W, S>
{

}
