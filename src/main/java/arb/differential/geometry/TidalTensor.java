package arb.differential.geometry;

import arb.Field;
import arb.space.topological.VectorSpace;

public interface TidalTensor<X extends Field<X>, Y, V extends VectorSpace<X, Y>> extends
                            Tensor<X, Y, V>
{

}
