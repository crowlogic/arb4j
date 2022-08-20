package arb.functions;

import arb.Metric;
import arb.Set;
import arb.domains.Domain;
import arb.topological.Space;
import arb.topological.spaces.VectorSpace;

/**
 * A {@link FunctionSpace} is a {@link Set} of {@link Function} between two
 * fixed {@link Set}s. Often, the {@link Domain} and/or codomain will have
 * additional structure which is inherited by the function space. For example,
 * the set of functions from any set X into a {@link VectorSpace} has a natural
 * vector space structure given by pointwise addition and scalar multiplication.
 * In other scenarios, the function space might inherit a topological or
 * {@link Metric} structure, hence the name function space.
 * 
 * @param X domain
 * @param Y codomain
 * 
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Function_space">FunctionSpace@Wikipedia</a>
 */
public interface FunctionSpace<X, Y> extends
                              Space<Function<X, Y>>
{

}
