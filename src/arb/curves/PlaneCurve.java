package arb.curves;

import arb.Real;
import arb.functions.RealToComplexFunction;
import arb.functions.complex.HolomorphicFunction;
import arb.functions.real.RealFunction;
import arb.geometry.surfaces.Plane;

/**
 * 
 * A plane curve is a {@link Curve} that lies in a single {@link Plane}. A plane
 * curve may be closed or open. This function maps a real number representing
 * distance along the curve to a complex number whose real and imaginary parts
 * represent points in the Euclidean {@link Plane}
 * 
 */
public interface PlaneCurve extends
                            RealToComplexFunction
{

  /**
   * The 1st derivative of the coordinate vector (function) of a
   * {@link PlaneCurve} is the tangent vector
   * 
   * @return
   */
  public default RealToComplexFunction getTangentVector()
  {
    return differential();
  }

  public default HolomorphicFunction getUnitSpeedCurve()
  {
    assert false : "TODO: invert the arc-length to normalize this curve so that it goes from [0,1] instead of [0,getArchLength(2π)]";
    return null;
  }

  /**
   * a synonym for this{@link #evaluate(Real, int, int, arb.Complex)}
   * 
   * @return this
   */
  public default RealToComplexFunction getRadiusVector()
  {
    return this;
  }

  /**
   * a synonym for this{@link #evaluate(Real, int, int, arb.Complex)}
   * 
   * @return this
   */
  public default RealToComplexFunction getPositionVector()
  {
    return this;
  }

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
  public default RealFunction getArcLength()
  {
    return new ArcLengthFunction(this);
  }

  /**
   * 
   * @param t
   * @param prec
   * @param w
   * @return this{@link #getArcLength()}.{@link #evaluate(arb.Complex, int, int, arb.Complex)}
   */
  public default Real getArcLength(Real t, int prec, Real w)
  {
    return getArcLength().evaluate(t, 1, prec, w);
  }

  /**
   * The curvature at the point t is the area of the rectangle which spans the
   * points this'(t) and this''(t)
   * 
   * @return
   */
  public default RealFunction getCurvature()
  {
    throw new UnsupportedOperationException(getClass() + " must implement this function");
  }

  /**
   * 
   * @param t
   * @param prec
   * @param w
   * @return this{@link #getCurvature()}.{@link #evaluate(arb.Complex, int, int, arb.Complex)}
   */
  public default Real getCurvature(Real t, int prec, Real w)
  {
    return getCurvature().evaluate(t, 1, prec, w);
  }
}
