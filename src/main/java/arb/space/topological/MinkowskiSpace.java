package arb.space.topological;

import arb.Metric;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * MinkowskiSpace represents the four-dimensional spacetime used in the theory
 * of special relativity. It is a specific type of Lorentzian manifold with a
 * fixed dimension of 4 and a signature of (-1,1,1,1).
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class MinkowskiSpace extends
                            LorentzianManifold

{
  /**
   * Minkowski space is always four-dimensional. Overrides the `dim` method to
   * provide the specific dimensionality of Minkowski space.
   */
  @Override
  public int intrinsicDimension()
  {
    return 4; // Minkowski space is specifically 4-dimensional
  }

  @Override
  public int[] signature()
  {
    return new int[]
    { -1, 1, 1, 1 };
  }

  @Override
  public Metric<Real> metric()
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

}
