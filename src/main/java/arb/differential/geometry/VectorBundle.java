package arb.differential.geometry;

import arb.Field;
import arb.documentation.Bibliography;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.SurjectiveFunction;
import arb.space.topological.FiberBundle;
import arb.space.topological.TopologicalSpace;
import arb.space.topological.TopologicalVectorSpace;
import arb.space.topological.VectorSpace;

/**
 * A VectorBundle is a special type of {@link FiberBundle} where the fiber over
 * each point in the base space is a {@link VectorSpace}.
 *
 * @param <X> the type of {@link Field} over which the {@link VectorSpace} is
 *            defined
 * @param <E> the total space (a {@link TopologicalSpace})
 * @param <B> the base space (a {@link TopologicalSpace})
 * @param <C> the {@link Connection} defined on the base space
 * @param <π> the projection map from the total space E to the base space B
 *            (also known as bundle projection)
 * 
 * @see Bibliography#chernSelectedPapersIV Vector bundles with a connection.
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface VectorBundle<X extends Field<? extends X>, E extends TopologicalSpace<X>, B extends TopologicalSpace<X>, C extends Connection<X, B>, π extends SurjectiveFunction<E, B>>
                             extends
                             FiberBundle<X, E, B, TopologicalVectorSpace<X>, π>
{
  /**
   * Retrieves the {@link Connection} associated with this {@link VectorBundle}.
   * The Connection provides a way of transporting data along a curve in the base
   * space in a way that is parallel, or more precisely, orthogonal to the
   * {@link VectorBundle}'s structure.
   *
   * @return the {@link Connection} associated with this {@link VectorBundle}
   */
  C connection();
}
