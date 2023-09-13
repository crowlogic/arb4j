package arb.geometry;

import arb.Field;
import arb.differential.geometry.TangentBundle;

/**
 * Also called a smooth {@link Manifold}
 */
public interface DifferentiableManifold<X extends Field<X>> extends
                                       Manifold<X>
{

  /**
   * a manifold M M is parallelizable if and only if the tangent bundle is
   * trivial.
   * 
   * @return a {@link TangentBundle} or null if this manifold is not
   *         parallelizable
   */
  TangentBundle<X, DifferentiableManifold<X>> tangentBundle();

}
