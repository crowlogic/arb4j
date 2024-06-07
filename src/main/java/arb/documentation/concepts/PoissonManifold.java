package arb.documentation.concepts;

import java.util.stream.Stream;

import arb.Field;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.Referral;
import arb.documentation.TheArb4jLibrary;
import arb.geometry.SymplecticManifold;

/**
 * <pre>
 * ⊥
 * </pre>
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface PoissonManifold<X extends Field<X>> extends
                                SymplecticManifold<X>,
                                Concept
{

  @Override
  public default Stream<Referral> getReferences()
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

}
