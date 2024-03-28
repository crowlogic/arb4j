package arb.language;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.logic.Clause;
import arb.logic.Proposition;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RegularClause extends
                               Clause<Word, Sentence<Word>, Proposition<Word, Sentence<Word>>>
{

}