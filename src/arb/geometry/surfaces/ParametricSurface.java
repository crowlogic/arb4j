package arb.geometry.surfaces;

import arb.Complex;
import arb.Real;
import arb.functions.Function;
import arb.geometry.curves.ArcLengthFunction;
import arb.topological.spaces.EuclideanSpace;

/**
 * A {@link ParametricSurface} is a {@link Surface} in the 3-dimensional
 * {@link EuclideanSpace} which is defined by the
 * {@link ParametricSurface}{@link #evaluate(Complex, int, int, Real)} method.
 * <br>
 * 
 * The <b>curvature</b> and {@link ArcLengthFunction}s of curves on the surface,
 * surface area, and differential geometric invariants such as the <b>first and
 * second fundamental forms</b>, <b>Gaussian, mean, and principal curvatures can
 * all be computed from a given parameterization supplied by the
 * {@link ParametricSurface}{@link #evaluate(Complex, int, int, Real)} method
 */
public interface ParametricSurface extends
                                   Function<Complex, Real>,
                                   Surface
{

}
