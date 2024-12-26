package arb.documentation.concepts;

import java.util.stream.Stream;

import arb.documentation.TheArb4jLibrary;
import arb.documentation.references.Reference;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface HasReferences
{
  public Stream<? extends Reference> getReferences();

}