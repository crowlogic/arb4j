package arb.surfaces;

/**
 * A Riemann surface is a connected 1-dimensional complex manifold which can be
 * thought of as a deformed version of the complex plane: locally near every
 * point they look like patches of the complex plane, but the global topology
 * can be quite different. <br>
 * 
 * Every Riemann surface is a two-dimensional real analytic manifold (i.e., a
 * surface), but it contains more structure (specifically a complex structure)
 * which is needed for the unambiguous definition of holomorphic functions. <br>
 * 
 * A two-dimensional real manifold can usually be turned into a Riemann surface
 * in several inequivalent ways if and only if it is orientable and metrizable.
 * 
 */
public interface RiemannSurface extends
                                Surface
{
  public int getNumberOfSheets();

  public ParametricSurface getSheet(int sheet);
}
