package arb.operators;

import arb.Field;
import arb.space.topological.VectorSpace;

/**
 * Compact operators are a class of operators that map bounded sets into
 * relatively compact sets. Relative compactness is a generalization of
 * compactness suitable for non-closed sets.
 * 
 * The similarity of compact operators to finite-dimensional linear
 * transformations can be used to extend finite-dimensional intuition into
 * infinite-dimensional spaces.
 *
 * In particular, if the domain of the operator is a Banach space (or more
 * generally, a bounded linear space), boundedness of the operator is a
 * necessary condition for relative compactness of the image of a bounded set,
 * thus making all compact operators bounded.
 * 
 * So, compactness is a stronger condition than boundedness. Therefore, every
 * compact operator is a bounded operator, but not every bounded operator is a
 * compact operator.
 * 
 * @param <F>   Field over which the vector spaces are defined.
 * @param <VE1> The type of the elements in the domain vector space.
 * @param <V1>  The type of the domain vector space itself.
 * @param <VE2> The type of the elements in the codomain vector space.
 * @param <V2>  The type of the codomain vector space itself.
 */
public interface CompactOperator<F extends Field<F>,
              V1 extends VectorSpace<? extends F>,
              V2 extends VectorSpace<? extends F>> extends
                                BoundedLinearOperator<F, V1, V2>
{

}
