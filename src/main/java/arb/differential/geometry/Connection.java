package arb.differential.geometry;

import arb.*;
import arb.functions.Function;
import arb.geometry.curves.Curve;
import arb.space.topological.TopologicalSpace;

/**
 * @see Chern, S.S., 1987. Vector bundles with a connection. Mathematical
 *      Sciences Research Institute.
 */
public interface Connection<X extends Field<X>, B extends TopologicalSpace<X>>
{
  // Methods related to connections in vector bundles

  /**
   * Computes the parallel transport of a vector along a curve in the base space.
   *
   * @param vector the vector to be parallel transported
   * @param curve  the curve along which the vector is parallel transported
   * @return the parallel transported vector
   */
  X parallelTransport(X vector, Curve curve);

  /**
   * Computes the curvature matrix at a point in the base space.
   *
   * @param point the point in the base space
   * @return the curvature matrix at the given point
   */
  RealMatrix curvatureMatrix(X point, RealMatrix curvature);

  /**
   * Computes the curvature matrix at a point in the base space.
   *
   * @param point the point in the base space
   * @return the curvature matrix at the given point
   */
  ComplexMatrix curvatureMatrix(X point, ComplexMatrix curvature);

  /**
   * Computes the covariant derivative of a vector field.
   *
   * @param vectorField the vector field on which to compute the covariant
   *                    derivative
   * @return the covariant derivative of the vector field
   */
  Function<X, X> covariantDerivative(Function<X, X> vectorField);

  // Other methods related to connections in vector bundles
}
