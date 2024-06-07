package arb.language;

import java.util.stream.Stream;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.logic.Clause;
import arb.logic.Proposition;

/**
 * A collection of {@link Clause}es
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Sentence<W extends Word>
{
  public default <C extends Clause<W, Sentence<W>, Proposition<W, Sentence<W>>>>
         Stream<? extends C>
         structure()
  {
    assert false : "parse";
    return null;
  }
}
