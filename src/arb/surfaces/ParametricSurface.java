package arb.surfaces;

import arb.*;
import arb.functions.*;

/**
 * A parametric surface is a surface in the Euclidean space R^3 which is defined
 * by a parametric equation with two parameters (x,y) . Parametric
 * representation is a very general way to specify a surface, as well as
 * <b>implicit representation</b>. Surfaces that occur in two of the main
 * theorems of vector calculus, Stokes' theorem and the divergence theorem, are
 * frequently given in a parametric form. The <b>curvature</b> and arc length of
 * curves on the surface, surface area, differential geometric invariants such
 * as the first and second fundamental forms, Gaussian, mean, and principal
 * curvatures can all be computed from a given parametrization.
 * 
 * @author crow
 *
 */
public interface ParametricSurface extends
                                   Function<Complex, Real>,
                                   Surface
{

}
