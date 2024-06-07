package arb.theorems;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.language.Sentence;
import arb.language.Word;
import arb.logic.Proposition;

/**
 * A {@link Theorem} is a {@link Proposition} deducible from basic postulates
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Theorem<W extends Word, S extends Sentence<? extends W>> extends
                        Proposition<W, S>
{

}
