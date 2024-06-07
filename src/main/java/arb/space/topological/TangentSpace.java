package arb.space.topological;

import arb.Field;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * 
 * @param <S>
 * @param <X>
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface TangentSpace<S extends Space<? extends X>, X extends Field<? extends X>> extends
                             TopologicalSpace<X>,
                             VectorSpace<X>
{
  public int getDimension();
}
