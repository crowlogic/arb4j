package arb.language;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;

/**
 * phrase n 1: an {@link Expression} consisting of one or more {@link Word}s
 * forming a grammatical element of a {@link Sentence}
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Phrase<W extends Word> extends
                       Iterable<W>
{

}
