package arb.logic;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.language.Sentence;
import arb.language.Word;

/**
 * postulate n 1: (logic) a {@link Proposition} that is accepted as true in
 * order to provide a basis for logical reasoning [syn: {postulate}, {posit}]
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Postulate<W extends Word, S extends Sentence<? extends W>> extends
                          Proposition<W, S>
{

}
