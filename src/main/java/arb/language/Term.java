package arb.language;

import java.util.Iterator;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.logic.Proposition;

/**
 * 5: one of the substantive phrases in a logical proposition; "the major term
 * of a syllogism must occur twice"
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Term<S extends Sentence<? extends W>,
              P extends Proposition<? extends W, ? extends S>,
              W extends Word> extends
                     Phrase<W>
{
  public String getDefinition();

  @Override
  public default Iterator<W> iterator()
  {
    assert false : "TODO: tokenization";
    return null;
//    return new StringTokenizer(getDefinition(),
//                                             " \t\n\r\f").asIterator();
  }
}
