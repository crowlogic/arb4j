package arb.theory;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.language.Sentence;
import arb.language.Word;
import arb.logic.Proposition;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Prediction<W extends Word,
              S extends Sentence<? extends W>,
              P extends Proposition<W, S>,
              O extends Observation<? extends W, ? extends S>> extends
                           Hypothesis<W, S, P, O>
{

}
