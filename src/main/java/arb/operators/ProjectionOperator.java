package arb.operators;

import arb.Field;
import arb.annotations.SelfAdjoint;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.space.topological.VectorSpace;

/**
 * A projection is a {@link LinearOperator} P from a {@link VectorSpace} to
 * itself (an endomorphism) such that P ∘ P = P. That is, whenever P is applied
 * twice to any vector, it gives the same result as if it were applied once
 * (i.e. P is idempotent). It leaves its image unchanged.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SelfAdjoint
public interface ProjectionOperator<F extends Field<? extends F>, V extends VectorSpace<? extends F>> extends
                                   LinearOperator<F, V, V>
{
}
