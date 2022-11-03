package arb.algebra;

import arb.Field;
import arb.topological.spaces.VectorSpace;

/**
 * an algebra is an algebraic structure that is a vector space over a field or a
 * module over a commutative ring.
 * 
 * TODO: Ring and CommutativeRing
 * 
 * @param <X>
 */
public interface Algebra<X extends Field> extends
                        AlgebraicStructure<X>,
                        VectorSpace<X>
{

}
