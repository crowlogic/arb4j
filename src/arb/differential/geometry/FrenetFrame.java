package arb.differential.geometry;

import arb.Complex;
import arb.geometry.CoordinateSystem;
import arb.geometry.curves.Curve;
import arb.topological.spaces.TangentSpace;

/**
 * The Frenet frame (also called the moving trihedron or Frenet trihedron) along
 * a {@link Curve} in R^3 is a moving (right-handed) {@link CoordinateSystem}
 * determined by the tangent line( living in a {@link TangentSpace} ) and
 * curvature. The frame, which locally describes one point on a {@link Curve},
 * changes orientation along the length of the curve.
 *
 */
public interface FrenetFrame
{
  /**
   * 
   * @return the tangent vector
   */
  public Complex tangentVector();

  /**
   * 
   * @return the normal vector
   */
  public Complex normalVector();

  /**
   * 
   * @return the {@link Complex#innerProduct(Complex, int, Complex)} of
   *         this{@link #tangentVector()} and this{@link #normalVector()}
   */
  public default Complex binormalVector(int prec, Complex res)
  {
    return tangentVector().innerProduct(normalVector(), prec, res);
  }
}
