package arb.operators;

import arb.Field;
import arb.space.topological.VectorSpace;

/**
 * Trace class operators, or nuclear operators, are certain bounded linear
 * operators on Hilbert space that generalize matrices of finite rank. These
 * operators can be described in terms of trace and provide a natural
 * generalization of Hilbert-Schmidt operators.
 *
 * @param <F>   The type of the field over which the vector spaces are defined.
 * @param <VE1> The type of the elements in the domain vector space.
 * @param <V1>  The type of the domain vector space itself.
 * @param <VE2> The type of the elements in the codomain vector space.
 * @param <V2>  The type of the codomain vector space itself.
 */
public interface NuclearOperator<F extends Field<F>,
              V1 extends VectorSpace<? extends F>,
              V2 extends VectorSpace<? extends F>> extends
                                CompactOperator<F>
{

}
