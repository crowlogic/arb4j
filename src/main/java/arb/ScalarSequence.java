package arb;

import arb.space.topological.VectorSpace;

/**
 * A scalar in physics is also a scalar in mathematics, as an element of a
 * mathematical {@link Field} used to define a {@link VectorSpace}
 * 
 * @param <X>
 */
public interface ScalarSequence<X extends Field<X>> extends
                               Sequence<X>
{

}
