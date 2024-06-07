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
public interface RegularPrediction extends
                                   Prediction<Word,
                                                 Sentence<Word>,
                                                 RegularProposition,
                                                 RegularObservation>
{

}
