package arb.curves;

import arb.functions.complex.ComplexFunction;
import arb.functions.real.RealFunction;

/**
 * 
 * A plane curve is a curve that lies in a single plane. A plane curve may be
 * closed or open. Curves which are interesting for some reason and whose
 * properties have therefore been investigates are called "special" curves
 * (Lawrence 1972). Some of the most common open curves are the line, parabola,
 * and hyperbola, and some of the most common closed curves are the circle and
 * ellipse.
 * 
 * @see Weisstein, Eric W. "Plane Curve." From MathWorld--A Wolfram Web
 *      Resource. https://mathworld.wolfram.com/PlaneCurve.html
 */
public interface PlaneCurve extends
                            ComplexFunction
{

  /**
   * The arc-length function measures how far this particle travels as a function
   * of time. The formula for the arc-length function follows directly from the
   * formula for arc length:
   * 
   * s=∫(|this'(t)|,t=0..s)
   * 
   * @return the function whose value represents the distance traveled by a
   *         particle along this curve as a function of time
   */
  public default RealFunction getArcLengthFunction()
  {
    throw new UnsupportedOperationException(getClass() + " must implement this function");
  }

  /**
   * The curvature at the point t is the area of the rectangle which spans the
   * points this'(t) and this''(t)
   * 
   * @return
   */
  public default RealFunction getCurvatureFunction()
  {
    throw new UnsupportedOperationException(getClass() + " must implement this function");
  }
}
