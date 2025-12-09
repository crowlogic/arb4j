package arb.space.topological;

import arb.Field;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface BilinearForm<K extends Field<? extends K>, V extends VectorSpace<K>> extends
                             Function<CartesianProduct<V, V>, K>
{

}
