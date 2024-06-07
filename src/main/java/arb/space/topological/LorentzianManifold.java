package arb.space.topological;

import arb.Metric;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * A LorentzianManifold is a manifold equipped with a Lorentzian metric, which
 * has one time dimension and several space dimensions, characterized by a
 * signature of one negative and the rest positive. This interface defines the
 * fundamental operations that can be performed on a Lorentzian manifold,
 * including calculating the interval between two points using the Lorentzian
 * metric.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class LorentzianManifold implements
                                         MetricSpace
{

  /**
   * Calculates the interval or pseudo-distance between two points in the manifold
   * using the Lorentzian metric. This includes negating the contribution of the
   * time dimension and summing the squares of the spatial dimensions.
   *
   * @param bits Precision level for calculations.
   * @param x    First point in the manifold.
   * @param y    Second point in the manifold.
   * @param res  Result storage for computation.
   * @return The calculated interval stored in res.
   */
  public Real distance(int bits, Real x, Real y, Real res)
  {
    try ( Real diff = Real.newVector(intrinsicDimension()))
    {
      x.sub(y, bits, diff);
      diff.pow(2, bits);
      diff.get(0).neg();
      return diff.sum(bits, res);
    }
  }

  @Override
  public int[] signature()
  {
    int sig[] = new int[intrinsicDimension()];
    for (int i = 1; i < sig.length; i++)
    {
      sig[i] = 1;
    }
    sig[0] = -1;
    return sig;
  }

  @Override
  public Metric<Real> metric()
  {
    assert false : "todo";
    return null;
  }
}
