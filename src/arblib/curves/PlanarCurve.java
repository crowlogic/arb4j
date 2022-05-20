package arblib.curves;

import arblib.*;

/**
 * A vector-valued function that represents the position of a particle which
 * follows the trajectory of some curve in space as a function of time.
 * 
 *
 */
public interface PlanarCurve extends
                             ComplexFunction
{

  /**
   * The arc-length function measures how far this particle travels as a function
   * of time. The formula for the arc-length function follows directly from the
   * formula for arc length:
   * 
   * s=∫ta√(f′(u))2+(g′(u))2+(h′(u))2du
   * 
   * @return the function whose value represents the distance traveled by a
   *         particle along this curve as a function of time
   */
  public default RealFunction getArcLengthFunction()
  {
    throw new UnsupportedOperationException(getClass() + " must implement this function");
  }

  /**
   * The curvature of a curve is, roughly speaking, the rate at which that curve
   * is turning.
   * 
   * @return
   */
  public default RealFunction getCurvatureFunction()
  {
    throw new UnsupportedOperationException(getClass() + " must implement this function");
  }
}
