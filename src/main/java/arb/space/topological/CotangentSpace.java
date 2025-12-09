package arb.space.topological;

import arb.Field;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.space.Space;

/**
 * 
 * @param <S>
 * @param <X>
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface CotangentSpace<S extends Space<? extends X>, X extends Field<? extends X>> extends
                               TangentSpace<S, X>
{

}
