package arb.differential.geometry;

import arb.Field;
import arb.functions.SurjectiveFunction;
import arb.space.topological.FiberBundle;
import arb.space.topological.TopologicalSpace;
import arb.space.topological.TopologicalVectorSpace;

/**
 * A VectorBundle is a special type of FiberBundle where the fiber over each
 * point in the base space is a VectorSpace. The mathematical structure of
 * vector bundles is used in many areas including differential geometry, quantum
 * physics, and algebraic geometry.
 *
 * @param <X> the type of Field over which the VectorSpace is defined
 * @param <E> the total space (a TopologicalSpace)
 * @param <B> the base space (a TopologicalSpace)
 * @param <C> the Connection defined on the base space
 * @param <π> the projection map from the total space E to the base space B
 *            (also known as bundle projection)
 * 
 * @see <a href="https://en.wikipedia.org/wiki/Vector_bundle">Wikipedia: Vector
 *      Bundle</a>
 * @see Shiing-Shen Chern, 1987. Vector bundles with a connection. Mathematical
 *      Sciences Research Institute
 */
public interface VectorBundle<X extends Field<X>, E extends TopologicalSpace<X>, B extends TopologicalSpace<X>, C extends Connection<X, B>, π extends SurjectiveFunction<E, B>>
                             extends
                             FiberBundle<X, E, B, TopologicalVectorSpace<X, X>, π>
{
  /**
   * Retrieves the Connection associated with this VectorBundle. The Connection
   * provides a way of transporting data along a curve in the base space in a way
   * that is parallel with respect to the VectorBundle's structure.
   *
   * @return the Connection associated with this VectorBundle
   */
  C connection();
}
