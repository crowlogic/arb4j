package arb.geometry;

import arb.Field;
import arb.differential.geometry.TangentBundle;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * Also called a smooth {@link Manifold}
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface DifferentiableManifold<X extends Field<? extends X>> extends
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
