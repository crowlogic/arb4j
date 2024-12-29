package arb.documentation.concepts;

import java.util.stream.Stream;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Applicable extends
                            Concept
{
  public <C extends Concept> Stream<? extends C> applicableTo();
}
