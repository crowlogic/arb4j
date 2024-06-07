package arb.operators;

import arb.Field;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.space.topological.VectorSpace;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface NuclearOperator<F extends Field<? extends F>, V extends VectorSpace<? extends F>, U extends VectorSpace<? extends F>>
                                extends
                                CompactOperator<F, V, U>
{

}
