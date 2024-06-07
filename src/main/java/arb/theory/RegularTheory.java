package arb.theory;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.language.Sentence;
import arb.language.Word;
import arb.logic.RegularProposition;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RegularTheory extends
                               Theory<Word,
                                             Sentence<Word>,
                                             RegularProposition,
                                             RegularObservation,
                                             RegularHypothesis>
{

}
