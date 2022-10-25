package arb.geometry.differential;

import arb.functions.SurjectiveFunction;
import arb.theoretical.physics.GaugeTheory;
import arb.topological.TopologicalSpace;
import arb.topological.spaces.FiberBundle;
import arb.topological.spaces.VectorSpace;

/**
 * @param <E> total space
 * @param <B> base space
 * @param <c> the {@link Connection}
 * @param <π> the projection map from E to B (also known as bundle projection)
 * 
 * @see {@link GaugeTheory}
 * 
 * @see <a href="https://en.wikipedia.org/wiki/Vector_bundle">Wikipedia</a>
 * @see Shiing-Shen Chern, 1987. Vector bundles with a connection. Mathematical
 *      Sciences Research Institute
 */
public interface VectorBundle<E extends TopologicalSpace, B extends TopologicalSpace, C extends Connection, π extends SurjectiveFunction<E, B>>
                             extends
                             FiberBundle<E, B, VectorSpace<C>, π>
{

}
