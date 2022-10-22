package arb.geometry;

import arb.geometry.differential.TangentBundle;

/**
 * Also called a smooth {@link Manifold}
 */
public interface DifferentiableManifold extends
                                        Manifold
{

  
  /**
   * a manifold M M is parallelizable if and only if the tangent bundle is
   * trivial.
   * 
   * @return a {@link TangentBundle} or null if this manifold is not
   *         parallelizable
   */
  TangentBundle tangentBundle();
 
}
