package arb.topological;

import java.util.function.BinaryOperator;

import arb.groups.Group;
import arb.topological.spaces.VectorSpace;

/**
 * a homomorphism is a structure-preserving map between two algebraic structures
 * of the same type (such as two {@link Group}s, two rings, or two
 * {@link VectorSpace})
 * 
 *
 */
public interface Homomorphism<X> extends
                             BinaryOperator<X>
{

}
