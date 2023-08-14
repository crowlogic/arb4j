package arb.operators;

import arb.Field;
import arb.space.topological.VectorSpace;

public interface LinearOperator<F extends Field<F>, VE> extends
                               Operator<VectorSpace<F, VE>, VectorSpace<F, VE>>
{

}
