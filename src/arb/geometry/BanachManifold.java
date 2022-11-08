package arb.geometry;

import arb.OpenSet;
import arb.annotations.Homeomorphic;
import arb.topological.TopologicalSpace;
import arb.topological.spaces.BanachSpace;

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
