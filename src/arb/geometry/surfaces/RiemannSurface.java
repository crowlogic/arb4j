package arb.geometry.surfaces;

import arb.Complex;
import arb.Real;
import arb.domains.ComplexPlane;
import arb.functions.complex.HolomorphicFunction;
import arb.geometry.Manifold;
import arb.topological.spaces.MetrizableSpace;

/**
 * A {@link RiemannSurface} is a connected 1-dimensional {@link Complex}
 * {@link Manifold} which can be thought of as a deformed version of the
 * {@link ComplexPlane}: locally near every point they look like patches of the
 * {@link ComplexPlane}, but the global topology can be quite different. <br>
 * 
 * Every {@link RiemannSurface} is a two-dimensional Real analytic {@link Manifold}
 * (i.e., a {@link Surface}), but it contains more structure (specifically a
 * complex structure) which is needed for the unambiguous definition of
 * {@link HolomorphicFunction}s. <br>
 * 
 * A two-dimensional {@link Real} {@link Manifold} can usually be turned into a
 * {@link RiemannSurface} in several inequivalent ways if and only if it is
 * orientable and a {@link MetrizableSpace}.
 * 
 */
public interface RiemannSurface extends
                                Surface
{
  public int getNumberOfSheets();

  public ParametricSurface getSheet(int sheet);
}
