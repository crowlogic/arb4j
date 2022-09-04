package arb.topological.spaces;

import arb.functions.SurjectiveFunction;
import arb.topological.Space;

/**
 * A fiber bundle is a structure ( E , B , π , F ) , where E , B , and F are
 * topological spaces and π : E → B is a continuous surjection satisfying a
 * local triviality condition outlined below. <br>
 * 
 * We shall assume in what follows that the base space B is connected. We
 * require that for every x ∈ B, there is an (open) trivializing neighborhood U
 * ⊆ B of x such that there is a homeomorphism <br>
 * 
 * <pre>
 * φ : π^(−1)(U)→U×F
 * </pre>
 * 
 * where π^(−1)(U) is given the subspace topology, and U × F is the product
 * space in such a way that π agrees with the projection onto the first factor.
 * 
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Fiber_bundle">FiberBundle@Wikipedia</a>
 *
 * @param <E> total space
 * @param <B> base space
 * @param <F> fiber
 * @param <π> the projection map (also known as bundle projection)
 */
public interface FiberBundle<E extends Space, B extends Space, F extends Space, π extends SurjectiveFunction<E, B>>
{

}
