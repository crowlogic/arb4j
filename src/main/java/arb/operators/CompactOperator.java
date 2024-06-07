package arb.operators;

import arb.Field;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
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
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface CompactOperator<F extends Field<? extends F>,
              V extends VectorSpace<? extends F>,
              U extends VectorSpace<? extends F>> extends
                                BoundedLinearOperator<F, V, U>
{

}
