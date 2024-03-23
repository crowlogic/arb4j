package arb.operators;

import arb.Field;
import arb.space.topological.VectorSpace;

public interface LinearOperator<F extends Field<? extends F>> extends
                               Operator<VectorSpace<? extends F>, VectorSpace<? extends F>>
{

}
