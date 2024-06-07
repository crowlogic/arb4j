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
public interface LinearFunctional<F extends Field<F>,
              V extends VectorSpace<? extends F>,
              U extends VectorSpace<? extends F>> extends
                                 LinearOperator<F, V, U>
{

}
