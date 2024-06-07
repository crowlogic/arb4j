package arb.documentation.concepts;

import java.util.stream.Stream;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Applicable extends
                            Concept
{
  public <C extends Concept> Stream<? extends C> applicableTo();
}
