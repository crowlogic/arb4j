package arb.language;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.logic.Proposition;

/**
 * 
 * @param <S>
 * @param <P>
 * @param <W>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RegularTerm extends
                             Term<Sentence<Word>, Proposition<Word, Sentence<Word>>, Word>
{

}
