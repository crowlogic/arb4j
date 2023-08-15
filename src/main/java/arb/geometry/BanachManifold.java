package arb.geometry;

import arb.OpenSet;
import arb.space.topological.BanachSpace;
import arb.space.topological.TopologicalSpace;

/**
 * a Banach manifold is a manifold modeled on {@link BanachSpace}s. Thus it is a
 * {@link TopologicalSpace} in which each point has a neighbourhood
 * {@link Homeomorphic} to an {@link OpenSet} in a {@link BanachSpace}
 *
 * Banach manifolds are one possibility of extending {@link Manifold}s to an
 * infinite number of dimensions.
 * 
 * @param <X>
 */
public interface BanachManifold<X> extends
                               Manifold<X>
{

}
